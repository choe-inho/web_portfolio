import 'package:flutter/material.dart';
import 'package:web_portfolio/widget/App_Drawer.dart';
import 'package:web_portfolio/widget/Footer.dart';
import 'package:web_portfolio/widget/Header.dart';
import 'package:web_portfolio/widget/Project_Section.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

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
                        '프로젝트',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '제가 개발한 주요 프로젝트들을 소개합니다',
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

              // 모든 프로젝트 표시 (기존 ProjectsSection 확장)
              ProjectsSection(showAllProjects: true),

              // 푸터
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}