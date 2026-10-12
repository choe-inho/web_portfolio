# 이코노딩 빌리지 (Iconoding Village)

포트폴리오를 늘어놓는 대신, 마을로 지었어요. 프로젝트 하나에 건물 한 채 — 걸어 들어가 구경하는 Flutter 개발자 최인호의 픽셀 마을 포트폴리오입니다.

**사이트:** https://choe-inho.github.io/web_portfolio/

## 구성

- `site/index.html` — 배포되는 페이지 전체. 그림(Figma AI로 생성 후 픽셀 정리), 폰트(Galmuri, OFL), 코드가 한 파일에 들어 있습니다.
- `site/og.png`, `site/favicon.png`, `site/icons/` — 공유 미리보기 이미지와 아이콘.
- `.github/workflows/deploy.yml` — `main`에 push하면 `site/` 폴더를 그대로 GitHub Pages에 올립니다(빌드 단계 없음).
- `lib/`, `web/`, `pubspec.yaml` — 이전 Flutter 웹 포트폴리오 소스. 저장소에 남겨 두었지만 지금은 배포되지 않습니다.

## 마을 안내

- 키보드: 방향키/WASD 이동, Shift 달리기, Space 말 걸기·들어가기, M 게임↔메뉴, ? 조작법
- 모바일: 왼쪽 아래 조이스틱으로 이동, 말풍선 버튼으로 말 걸기, 운동화 버튼으로 달리기
- 건물마다 프로젝트 하나(Awaken Quest, 타임네트, OneShot, Amity, 유니티 리듬게임)와 테마곡이 있습니다. 배경음악은 기본으로 꺼져 있어요.
- 방명록은 claude.ai 안에서만 저장소가 연결됩니다. GitHub Pages에서는 준비 중 안내가 나옵니다.
