import 'package:flutter/material.dart';
import 'dart:math' as math;

class DeveloperLogo extends StatefulWidget {
  final double size;
  final bool isAnimated;

  const DeveloperLogo({
    super.key,
    this.size = 60,
    this.isAnimated = true,
  });

  @override
  _DeveloperLogoState createState() => _DeveloperLogoState();
}

class _DeveloperLogoState extends State<DeveloperLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    if (!widget.isAnimated) {
      _controller.stop();
    }
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
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.size * 0.2),
            gradient: LinearGradient(
              colors: [
                Color(0xFF2563EB),
                Color(0xFF7C3AED),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              transform: GradientRotation(
                widget.isAnimated ? _animation.value * math.pi * 2 : 0,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF2563EB).withOpacity(0.3),
                offset: Offset(0, widget.size * 0.05),
                blurRadius: widget.size * 0.1,
              ),
            ],
          ),
          child: Stack(
            children: [
              // 코드 라인 효과
              _buildCodeLines(),

              // 이니셜 "CI"
              Center(
                child: Text(
                  "CI",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: widget.size * 0.5,
                    letterSpacing: -widget.size * 0.05,
                  ),
                ),
              ),

              // 코드 괄호 장식
              _buildCodeBracket(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCodeLines() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.size * 0.2),
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: CodeLinesPainter(
          progress: widget.isAnimated ? _animation.value : 0.7,
        ),
      ),
    );
  }

  Widget _buildCodeBracket() {
    return Positioned(
      right: widget.size * 0.1,
      bottom: widget.size * 0.1,
      child: Transform.translate(
        offset: Offset(
          widget.isAnimated ? math.sin(_animation.value * math.pi * 2) * 2 : 0,
          widget.isAnimated ? math.cos(_animation.value * math.pi * 2) * 2 : 0,
        ),
        child: Text(
          "/>",
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.bold,
            fontSize: widget.size * 0.25,
          ),
        ),
      ),
    );
  }
}

// 코드 라인 효과를 위한 커스텀 페인터
class CodeLinesPainter extends CustomPainter {
  final double progress;

  CodeLinesPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..strokeWidth = size.width * 0.02
      ..style = PaintingStyle.stroke;

    // 상단 가로 라인들
    for (int i = 1; i <= 3; i++) {
      double lineProgress = math.min(1.0, math.max(0.0, progress * 3 - (i - 1)));
      double startX = size.width * 0.2;
      double endX = size.width * (0.2 + 0.6 * lineProgress);
      double y = size.height * (0.2 + i * 0.15);

      canvas.drawLine(
        Offset(startX, y),
        Offset(endX, y),
        paint,
      );
    }

    // 세로 라인
    double verticalProgress = math.min(1.0, progress * 2);
    double x = size.width * 0.3;
    double startY = size.height * 0.2;
    double endY = size.height * (0.2 + 0.6 * verticalProgress);

    canvas.drawLine(
      Offset(x, startY),
      Offset(x, endY),
      paint,
    );
  }

  @override
  bool shouldRepaint(CodeLinesPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

// 사용 예시
class LogoExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 큰 로고
          DeveloperLogo(size: 120, isAnimated: true),
          SizedBox(height: 24),

          // 이름과 직함
          Text(
            "최인호",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Flutter Developer",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),

          // 작은 로고 예시들
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DeveloperLogo(size: 40, isAnimated: false),
              SizedBox(width: 20),
              DeveloperLogo(size: 60, isAnimated: true),
              SizedBox(width: 20),
              DeveloperLogo(size: 40, isAnimated: false),
            ],
          ),
        ],
      ),
    );
  }
}