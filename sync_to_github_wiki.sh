#!/usr/bin/env bash
set -e

WIKI_DIR="wiki"
REPO_OWNER="snowd-zk"
REPO_NAME="zkrypton_vs"
WIKI_REMOTE="https://github.com/${REPO_OWNER}/${REPO_NAME}.wiki.git"

echo "=========================================================="
echo "🚀 GitHub Wiki 동기화 스크립트: ${REPO_OWNER}/${REPO_NAME}"
echo "=========================================================="

# gh auth 토큰 확인
if command -v gh >/dev/null 2>&1; then
    TOKEN=$(gh auth token 2>/dev/null || true)
    if [ -n "$TOKEN" ]; then
        AUTH_WIKI_REMOTE="https://x-access-token:${TOKEN}@github.com/${REPO_OWNER}/${REPO_NAME}.wiki.git"
    else
        AUTH_WIKI_REMOTE="${WIKI_REMOTE}"
    fi
else
    AUTH_WIKI_REMOTE="${WIKI_REMOTE}"
fi

# Wiki 초기화 여부 확인
echo "🔍 GitHub Wiki 저장소 접근 확인 중..."
if ! git ls-remote "${AUTH_WIKI_REMOTE}" >/dev/null 2>&1; then
    echo "⚠️  [알림] GitHub Wiki 저장소가 아직 초기화되지 않았습니다!"
    echo "👉 GitHub 정책상 최초 1회는 웹 브라우저에서 초기화가 필요합니다:"
    echo "   1) https://github.com/${REPO_OWNER}/${REPO_NAME}/wiki 접속"
    echo "   2) 'Create the first page' 버튼 클릭 후 'Save page' 클릭"
    echo "   3) 완료 후 본 스크립트(./sync_to_github_wiki.sh)를 다시 실행해주세요."
    exit 1
fi

TEMP_CLONE_DIR=$(mktemp -d /tmp/wiki_sync_XXXXXX)
trap 'rm -rf "${TEMP_CLONE_DIR}"' EXIT

echo "📥 Wiki 저장소 클론 중: ${WIKI_REMOTE}..."
git clone "${AUTH_WIKI_REMOTE}" "${TEMP_CLONE_DIR}"

echo "📋 wiki/ 폴더 내 파일 복사 중..."
cp -v "${WIKI_DIR}"/*.md "${TEMP_CLONE_DIR}/"

cd "${TEMP_CLONE_DIR}"
git config user.name "$(git log -1 --pretty=format:'%an' 2>/dev/null || echo 'zkrypto-bot')"
git config user.email "$(git log -1 --pretty=format:'%ae' 2>/dev/null || echo 'research@zkrypto.com')"

git add .
if git diff --cached --quiet; then
    echo "✅ 이미 최신 상태입니다. 변경 사항이 없습니다."
else
    git commit -m "docs: sync Canton, Arc, Regulatory & ZKRYPTON knowledge base to wiki"
    echo "📤 GitHub Wiki로 푸시 중..."
    git push origin master 2>/dev/null || git push origin main
    echo "🎉 성공적으로 GitHub Wiki에 지식베이스가 동기화되었습니다!"
    echo "👉 확인: https://github.com/${REPO_OWNER}/${REPO_NAME}/wiki"
fi
