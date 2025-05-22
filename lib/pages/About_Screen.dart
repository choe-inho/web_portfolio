import 'package:flutter/material.dart';
import 'package:web_portfolio/widget/App_Drawer.dart';
import 'package:web_portfolio/widget/Footer.dart';
import 'package:web_portfolio/widget/Header.dart';
import 'package:web_portfolio/widget/Timeline_Section.dart';
import 'package:web_portfolio/widget/State_Section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 헤더
              Header(),

              // 페이지 제목
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 60,
                ),
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '소개',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '저에 대한 이야기와 경력을 소개합니다',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 18,
                          color: Colors.white.withValues(alpha:0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 자세한 소개
              _buildDetailedAbout(context),

              // 통계
              StatsSection(),

              // 경력 및 학력 타임라인
              TimelineSection(),

              // 푸터
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedAbout(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
      ),
      color: Theme.of(context).colorScheme.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          if (isMobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileImage(),
                SizedBox(height: 40),
                _buildAboutText(context),
              ],
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildProfileImage(),
                ),
                SizedBox(width: 60),
                Expanded(
                  flex: 3,
                  child: _buildAboutText(context),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300],
          ),
          child: Center(
            child: Icon(
              Icons.person,
              size: 80,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '안녕하세요, 저는 최인호입니다',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '사용자 경험에 가치를 더하는 개발자',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 24),
        Text(
          '저는 모바일과 웹을 아우르는 크로스 플랫폼 개발자로서, 사용자 중심의 직관적인 UI/UX를 구현하는 데 전념하고 있습니다. Flutter와 Dart를 주력으로 사용하며, 클린 코드와 최적화된 성능을 추구합니다.\n\n'
              '특히 사용자의 실제 문제를 해결하는 애플리케이션 개발에 열정을 가지고 있으며, 단순히 코드를 작성하는 것을 넘어 비즈니스 가치를 창출하는 솔루션을 만들고자 합니다.\n\n'
              '다양한 기술 스택과 도구에 대한 지속적인 학습을 통해 빠르게 변화하는 기술 환경에 적응하고 있으며, 새로운 도전을 통해 계속해서 성장하고 있습니다.',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16,
            height: 1.6,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 40),
        Text(
          '주요 관심 분야',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildInterestChip('크로스 플랫폼 개발', context),
            _buildInterestChip('모바일 UX 디자인', context),
            _buildInterestChip('성능 최적화', context),
            _buildInterestChip('클린 아키텍처', context),
            _buildInterestChip('반응형 웹', context),
          ],
        ),
      ],
    );
  }

  Widget _buildInterestChip(String label, BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 14,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha:0.1),
    );
  }
}