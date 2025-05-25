import 'package:flutter/material.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 반응형 디자인을 위한 화면 너비 확인
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        // 통계 항목 리스트
        final stats = [
          {
            'number': '10+',
            'title': '완료한 프로젝트',
            'icon': Icons.check_circle_outline,
          },
          {
            'number': '2+',
            'title': '개발 경력(년)',
            'icon': Icons.access_time,
          },
          {
            'number': '2',
            'title': '출시 앱',
            'icon': Icons.phone_android,
          },
        ];

        // 화면 크기에 따른 그리드 열 개수 설정
        int crossAxisCount = isMobile ? 2 : 3;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : isTablet ? 40 : 80,
            vertical: 60,
          ),
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            children: [
              // 통계 그리드
              Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: isMobile ? 1.0 : 1.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: stats.length,
                  itemBuilder: (context, index) {
                    final stat = stats[index];
                    return _buildStatCard(context, stat);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatCard(BuildContext context, Map<String, dynamic> stat) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 아이콘
          Icon(
            stat['icon'] as IconData,
            color: Colors.white,
            size: 36,
          ),
          SizedBox(height: 16),

          // 숫자
          Text(
            stat['number'] as String,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),

          // 제목
          Text(
            stat['title'] as String,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.9),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 애니메이션 효과가 있는 버전의 숫자 카운터 위젯
class CounterAnimation extends StatefulWidget {
  final String endValue;
  final TextStyle style;

  const CounterAnimation({
    super.key,
    required this.endValue,
    required this.style,
  });

  @override
  State<CounterAnimation> createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 숫자와 기호 분리
    final numberOnly = widget.endValue.replaceAll(RegExp(r'[^0-9]'), '');
    final symbols = widget.endValue.replaceAll(RegExp(r'[0-9]'), '');

    // 숫자만 있는 경우 애니메이션 적용
    if (numberOnly.isNotEmpty && int.tryParse(numberOnly) != null) {
      final endValue = int.parse(numberOnly);

      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final value = (endValue * _animation.value).round();
          return Text(
            '$value$symbols',
            style: widget.style,
          );
        },
      );
    }

    // 숫자가 아닌 경우 그대로 표시
    return Text(
      widget.endValue,
      style: widget.style,
    );
  }
}