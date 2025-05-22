
// 코드 요소 위젯 (시각적 효과)
import 'package:flutter/material.dart';

class CodeElement extends StatelessWidget {
  final int index;

  const CodeElement({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // 각 요소마다 다른 코드 스니펫이나 기술 아이콘 표시
    final items = [
      '{ }',
      '</>',
      '[]',
      '()',
      'fn',
      '→',
    ];

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        items[index % items.length],
        style: TextStyle(
          fontFamily: 'Pretendard',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}