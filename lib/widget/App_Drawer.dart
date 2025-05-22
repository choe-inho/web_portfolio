// 드로어 메뉴
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_portfolio/widget/Developer_Logo.dart';

import '../provider/Theme_Provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'icon': Icons.home, 'label': '홈', 'route': '/'},
      {'icon': Icons.code, 'label': '기술 스택', 'route': '/skills'},
      {'icon': Icons.work, 'label': '프로젝트', 'route': '/projects'},
      {'icon': Icons.person, 'label': '소개', 'route': '/about'},
    ];

    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeveloperLogo(),
                  SizedBox(height: 12),
                  Text(
                    '최인호',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,)
                  ),
                  SizedBox(height: 4),
                  Text(
                    '사용자 경험에 가치를 더하는 개발자',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
            ),
            // 메뉴 아이템
            ...menuItems.map((item) {
              final isActive = GoRouterState.of(context).path == item['route'];

              return ListTile(
                leading: Icon(
                  item['icon'] as IconData,
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                title: Text(
                  item['label'] as String,
                  style: TextStyle(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  if (!isActive) {
                    context.go(item['route']! as String);
                  }
                },
              );
            }),
            Divider(),
            // 다크 모드 토글
            ListTile(
              leading: Icon(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              title: Text(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? '라이트 모드'
                    : '다크 모드',
              ),
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}