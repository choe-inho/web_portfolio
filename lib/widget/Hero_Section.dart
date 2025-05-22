// 히어로 섹션 위젯
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Animated_Scroll_Arrow.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 반응형 디자인을 위한 화면 너비 확인
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        final isDesktop = constraints.maxWidth >= 1024;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : isTablet ? 40 : 80,
            vertical: isMobile ? 40 : isTablet ? 60 : 80,
          ),
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
          child: isMobile
              ? _buildMobileHero(context)
              : _buildDesktopHero(context, isTablet),
        );
      },
    );
  }

  // 모바일용 히어로 콘텐츠
  Widget _buildMobileHero(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 인사말 텍스트
        Text(
          '안녕하세요,',
          style: TextStyle(
            fontFamily: 'Pretendard',
            color: Colors.white.withOpacity(0.9),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),

        // 이름과 직함
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Pretendard',
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            children: [
              TextSpan(text: '저는 '),
              TextSpan(
                text: '최인호',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              TextSpan(text: '입니다'),
            ],
          ),
        ),
        SizedBox(height: 16),

        // 부제목/소개
        Text(
          '사용자 경험에 가치를 더하는 Flutter 개발자',
          style: TextStyle(
            fontFamily: 'Pretendard',
            color: Colors.white.withOpacity(0.9),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
        SizedBox(height: 24),

        // 간단한 소개문
        Text(
          '모바일과 웹을 아우르는 크로스 플랫폼 앱을 개발하며, 사용자 중심의 직관적인 UI/UX를 구현합니다. 기술과 디자인의 조화를 통해 실용적이고 아름다운 디지털 경험을 창조합니다.',
          style: TextStyle(
            fontFamily: 'Pretendard',
            color: Colors.white.withOpacity(0.8),
            fontSize: 14,
            height: 1.6,
          ),
        ),
        SizedBox(height: 32),

        // CTA 버튼들
        ElevatedButton(
          onPressed: () {
            // 프로젝트 섹션으로 이동
            context.go('/projects');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text('프로젝트 보기'),
        ),

        // 아래쪽에 작은 애니메이션 화살표 추가 (스크롤 유도)
        SizedBox(height: 60),
        Center(
          child: AnimatedScrollArrow(),
        ),
      ],
    );
  }

  // 데스크톱/태블릿용 히어로 콘텐츠
  Widget _buildDesktopHero(BuildContext context, bool isTablet) {
    return Row(
      children: [
        // 왼쪽: 텍스트 콘텐츠
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 인사말 텍스트
              Text(
                '안녕하세요,',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  color: Colors.white.withOpacity(0.9),
                  fontSize: isTablet ? 20 : 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),

              // 이름과 직함
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Colors.white,
                    fontSize: isTablet ? 40 : 56,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(text: '저는 '),
                    TextSpan(
                      text: '최인호',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    TextSpan(text: '입니다'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // 부제목/소개
              Text(
                '사용자 경험에 가치를 더하는 Flutter 개발자',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  color: Colors.white.withOpacity(0.9),
                  fontSize: isTablet ? 18 : 22,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 24),

              // 간단한 소개문
              Text(
                '모바일과 웹을 아우르는 크로스 플랫폼 앱을 개발하며, 사용자 중심의 직관적인 UI/UX를 구현합니다. 기술과 디자인의 조화를 통해 실용적이고 아름다운 디지털 경험을 창조합니다.',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  color: Colors.white.withOpacity(0.8),
                  fontSize: isTablet ? 15 : 16,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 40),

              // CTA 버튼들
              ElevatedButton(
                onPressed: () {
                  // 프로젝트 섹션으로 이동
                  context.go('/projects');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                child: Text('프로젝트 보기'),
              ),
            ],
          ),
        ),

        // 오른쪽: 일러스트레이션/이미지
        Expanded(
          flex: 4,
          child: Center(
            child: DeveloperIllustration(
              size: isTablet ? 300 : 380,
            ),
          ),
        ),
      ],
    );
  }
}