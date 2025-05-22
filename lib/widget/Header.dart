import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_portfolio/widget/Developer_Logo.dart';

import '../provider/Theme_Provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 반응형 디자인을 위한 화면 너비 확인
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        final isDesktop = constraints.maxWidth >= 1024;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : isTablet ? 24 : 32,
            vertical: 16,
          ),
          color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 로고/이름 부분
              DeveloperLogo(),

              // 모바일에서는 메뉴 아이콘, 그 외에는 네비게이션 링크
              isMobile
                  ? _buildMobileMenu(context)
                  : _buildDesktopMenu(context, isTablet),
            ],
          ),
        );
      },
    );
    }

  // 모바일 메뉴 아이콘
  Widget _buildMobileMenu(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        // 드로어 메뉴 열기
        Scaffold.of(context).openDrawer();
      },
    );
  }

  // 데스크톱/태블릿 메뉴
  Widget _buildDesktopMenu(BuildContext context, bool isTablet) {
    final menuItems = [
      {'icon': Icons.home, 'label': '홈', 'route': '/'},
      {'icon': Icons.code, 'label': '기술 스택', 'route': '/skills'},
      {'icon': Icons.work, 'label': '프로젝트', 'route': '/projects'},
      {'icon': Icons.person, 'label': '소개', 'route': '/about'},
    ];

    return Row(
      children: [
        // 메뉴 아이템들
        ...menuItems.map((item) {
          final isActive = GoRouterState.of(context).path == item['route'];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 8 : 12),
            child: InkWell(
              onTap: () {
                if (!isActive) {
                  context.go(item['route']! as String);
                }
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: isTablet ? 8 : 12,
                ),
                child: Row(
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 18,
                      color: isActive
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).brightness == Brightness.light
                          ? Color(0xFF64748B)
                          : Color(0xFFCBD5E1),
                    ),
                    if (!isTablet) SizedBox(width: 8),
                    if (!isTablet)
                      Text(
                        item['label'] as String,
                        style: TextStyle(
                          color: isActive
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).brightness == Brightness.light
                              ? Color(0xFF64748B)
                              : Color(0xFFCBD5E1),
                          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                          fontSize: 14,
                        )
                      ),
                  ],
                ),
              ),
            ),
          );
        }),

        // 다크 모드 토글 버튼
        SizedBox(width: isTablet ? 12 : 20),
        IconButton(
          icon: Icon(
            Provider.of<ThemeProvider>(context).isDarkMode
                ? Icons.light_mode
                : Icons.dark_mode,
            size: 20,
          ),
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
        ),
      ],
    );
  }
}
