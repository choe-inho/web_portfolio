// Go Router 설정
import 'package:go_router/go_router.dart';

import '../pages/About_Screen.dart';
import '../pages/Home_Screen.dart';
import '../pages/Project_Detail_Screen.dart';
import '../pages/Project_Screen.dart';
import '../pages/Skills_Screen.dart';

class RouterManager{
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/skills',
        builder: (context, state) => SkillsScreen(),
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) => ProjectScreen(),
        routes: [
          // 중첩된 라우트 - 프로젝트 상세 페이지
          GoRoute(
            path: ':projectId', // 경로 매개변수 정의 (예: /projects/awaken_quest)
            builder: (context, state) {
              // state.params에서 경로 매개변수 추출
              final projectId = state.pathParameters['projectId']!;
              return ProjectDetailScreen(projectId: projectId);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => AboutScreen(),
      ),
    ],
  );
}
