import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // 로고 또는 이름
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'CI',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                '최인호',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // 간단한 네비게이션 링크
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 10,
            children: [
              FooterLink(
                title: '홈',
                onTap: () {
                  context.go('/');
                },
              ),
              FooterLink(
                title: '프로젝트',
                onTap: () {
                  context.go('/projects');
                },
              ),
              FooterLink(
                title: '기술 스택',
                onTap: () {
                  context.go('/skills');
                },
              ),
              FooterLink(
                title: '소개',
                onTap: () {
                  context.go('/about');
                },
              ),
              FooterLink(
                title: '연락처',
                onTap: () {
                  context.go('/contact');
                },
              ),
            ],
          ),
          SizedBox(height: 30),

          // 저작권 정보
          Text(
            '© ${DateTime.now().year} 최인호. All Rights Reserved.',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          SizedBox(height: 10),

          // 추가 정보
          Text(
            'Flutter & Dart로 제작',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

// 푸터 링크
class FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const FooterLink({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}