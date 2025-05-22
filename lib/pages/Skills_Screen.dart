import 'package:flutter/material.dart';
import 'package:web_portfolio/widget/App_Drawer.dart';
import 'package:web_portfolio/widget/Footer.dart';
import 'package:web_portfolio/widget/Header.dart';
import 'package:web_portfolio/widget/Skills_Section.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

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
                        '기술 스택',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '저의 기술 역량과 전문성을 소개합니다',
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

              // 세부 스킬 정보 (기존 SkillsSection 확장)
              SkillsSection(isDetailedPage: true),

              // 푸터
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}