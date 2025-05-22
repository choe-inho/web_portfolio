import 'package:flutter/material.dart';
import 'package:web_portfolio/widget/App_Drawer.dart';
import 'package:web_portfolio/widget/Conntact_Section.dart';
import 'package:web_portfolio/widget/Footer.dart';
import 'package:web_portfolio/widget/Hero_Section.dart';
import 'package:web_portfolio/widget/Project_Section.dart';
import 'package:web_portfolio/widget/Timeline_Section.dart';

import '../helper/Responsive_Layout.dart';
import '../widget/Header.dart';
import '../widget/Skills_Section.dart';
import '../widget/State_Section.dart';

// 홈 화면 예시
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 헤더 부분
              Header(),

              // 히어로 섹션
              HeroSection(),

              //스킬 섹션
              ScrollObserver(
                child: SkillsSection(),
              ),

              //프로젝트 섹션
              ProjectsSection(),

              //통계 섹션
              StatsSection(),

              //타임라인 섹션
              TimelineSection(),

              //컨택트 섹션
              ContactSection(),

              FooterSection()
            ],
          ),
        ),
      ),
    );
  }
}
