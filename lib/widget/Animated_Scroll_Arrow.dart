// 스크롤 유도를 위한 애니메이션 화살표
import 'dart:math';

import 'package:flutter/material.dart';

import 'Code_Element.dart';
import 'Developer_Logo.dart';

class AnimatedScrollArrow extends StatefulWidget {
  const AnimatedScrollArrow({super.key});

  @override
  _AnimatedScrollArrowState createState() => _AnimatedScrollArrowState();
}

class _AnimatedScrollArrowState extends State<AnimatedScrollArrow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
            size: 36,
          ),
        );
      },
    );
  }
}

// 개발자 일러스트레이션 (코드 관련 시각적 요소)
class DeveloperIllustration extends StatelessWidget {
  final double size;

  const DeveloperIllustration({Key? key, this.size = 300}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        children: [
          // 배경 원형
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),

          // 중앙 로고 또는 이미지
          Center(
            child: DeveloperLogo(
              size: size * 0.5,
              isAnimated: true,
            ),
          ),

          // 코드 스니펫 요소들 - 주변에 배치
          ..._buildCodeElements(),
        ],
      ),
    );
  }

  List<Widget> _buildCodeElements() {
    final elements = <Widget>[];
    final double radius = size * 0.4;
    final int count = 6;

    // 원 주변에 코드 스니펫 요소 배치
    for (int i = 0; i < count; i++) {
      final angle = (i / count) * 2 * 3.14159;
      final x = radius * cos(angle);
      final y = radius * sin(angle);

      elements.add(
        Positioned(
          left: size / 2 + x - 30,
          top: size / 2 + y - 20,
          child: CodeElement(index: i),
        ),
      );
    }

    return elements;
  }
}