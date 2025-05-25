import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsSection extends StatelessWidget {
  final bool isDetailedPage;

  const SkillsSection({
    super.key,
    this.isDetailedPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 반응형 디자인을 위한 화면 너비 확인
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : isTablet ? 40 : 80,
            vertical: 80,
          ),
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 섹션 타이틀 (상세 페이지에서는 표시하지 않음)
              if (!isDetailedPage)
                Center(
                  child: Column(
                    children: [
                      Text(
                        '기술 스택',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 60,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '프로젝트에 활용하는 주요 기술들입니다',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.surface.withValues(alpha:0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: isDetailedPage ? 20 : 60),

              // 스킬 카테고리 및 아이템
              _buildSkillCategories(context, isMobile, isTablet),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSkillCategories(BuildContext context, bool isMobile, bool isTablet) {
    // 기술 스택 데이터
    final categories = [
      {
        'title': '프레임워크 & 언어',
        'skills': [
          {'name': 'Flutter', 'level': 0.9, 'iconData': Icons.flutter_dash, 'color': Color(0xFF02569B)}, // Flutter 파란색
          {'name': 'Dart', 'level': 0.9, 'iconData': Icons.code, 'color': Color(0xFF0175C2)}, // Dart 파란색
          {'name': 'JavaScript', 'level': 0.8, 'iconData': Icons.javascript, 'color': Color(0xFFF7DF1E)}, // JS 노란색
          {'name': 'Node.js', 'level': 0.6, 'iconData': Icons.memory, 'color': Color(0xFF00599C)}, // C++ 파란색
          {'name': 'C++', 'level': 0.6, 'iconData': Icons.data_object, 'color': Color(0xFF3776AB)}, // Python 파란색/노란색
        ]
      },
      {
      'title': '클라우드 서비스',
        'skills': [
          {'name': 'Firebase', 'level': 0.85, 'iconData': Icons.local_fire_department, 'color': Color(0xFFFFCA28)}, // Firebase 노란색
          {'name': 'AWS', 'level': 0.7, 'iconData': Icons.cloud, 'color': Color(0xFF232F3E)}, // AWS 검정색
          {'name': 'Maria DB', 'level': 0.8, 'iconData': Icons.device_hub, 'color': Color(0xFF339933)}, // Node.js 녹색
        ]
      },

    ];

    // 상세 페이지일 경우 추가 스킬 포함 (선택 사항)
    if (isDetailedPage) {
      categories.addAll(
        [{
          'title': '도구 & 기타',
          'skills': [
            {'name': 'Git/GitHub', 'level': 0.7, 'iconData': Icons.merge_type, 'color': Color(0xFF181717)}, // GitHub 검정색
            {'name': 'VS Code', 'level': 0.9, 'iconData': Icons.code, 'color': Color(0xFF007ACC)}, // VS Code 파란색
            {'name': 'Figma', 'level': 0.4, 'iconData': Icons.design_services, 'color': Color(0xFFF24E1E)}, // Figma 빨간색
            {'name': 'Android Studio', 'level': 0.9, 'iconData': Icons.android, 'color': Color(0xFF3DDC84)}, // Android 녹색
          ]
        },
        {
          'title': '상태 관리 & 아키텍처',
          'skills': [
            {'name': 'Provider', 'level': 0.9, 'iconData': Icons.account_tree, 'color': Color(0xFF4CAF50)}, // 녹색
            {'name': 'GetX', 'level': 0.9, 'iconData': Icons.speed, 'color': Color(0xFF00B8D4)}, // 청록색
            {'name': 'MVC/MVVM', 'level': 0.8, 'iconData': Icons.architecture, 'color': Color(0xFF607D8B)}, // 회색
          ]
        },]
      );
      // 예: categories.add({...}) 또는 기존 카테고리에 스킬 추가
    }

    // 화면 너비에 따른 그리드 설정
    int crossAxisCount = isMobile ? 1 : isTablet ? 2 : 3;

    return Column(
      children: categories.map((category) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 카테고리 제목
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                category['title'] as String,
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: isDetailedPage ? 24 : 20, // 상세 페이지에서는 더 큰 폰트
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),

            // 기술 아이템 그리드
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                childAspectRatio: 4.0,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: (category['skills'] as List).length,
              itemBuilder: (context, index) {
                final skill = (category['skills'] as List)[index] as Map<String, dynamic>;
                return _buildSkillItem(context, skill, isDetailed: isDetailedPage);
              },
            ),
            SizedBox(height: 60),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildSkillItem(BuildContext context, Map<String, dynamic> skill, {bool isDetailed = false}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha:0.5),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 아이콘
          Container(
            width: isDetailed ? 56 : 48, // 상세 페이지에서는 더 큰 아이콘
            height: isDetailed ? 56 : 48,
            decoration: BoxDecoration(
              color: (skill['color'] as Color).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
            skill['name'] == "Flutter" ?
                Padding(
                    padding: EdgeInsets.all(12),
                    child: FlutterLogo()) :
            Icon(
              skill['iconData'] as IconData,
              color: skill['color'] as Color,
              size: isDetailed ? 28 : 24,
            ),
          ),
          SizedBox(width: 16),

          // 기술명과 진행바
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      skill['name'] as String,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        fontSize: isDetailed ? 18 : 16, // 상세 페이지에서는 더 큰 폰트
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '${((skill['level'] as double) * 100).round()}%',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: isDetailed ? 16 : 14,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha:0.7),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                _buildProgressBar(context, skill['level'] as double, skill['color'] as Color),
                // 상세 페이지에서만 표시되는 설명 (선택 사항)
                if (isDetailed && skill.containsKey('description'))
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      skill['description'] as String,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha:0.7),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context, double level, Color color) {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(3),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 전체 길이에 대한 비율로 너비 계산
          final maxWidth = constraints.maxWidth;
          final progressWidth = maxWidth * level;

          return Row(
            children: [
              Container(
                width: progressWidth, // 비율에 맞게 너비 설정
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color,
                      color.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// 애니메이션 버전으로 사용하고 싶다면 아래 클래스도 수정
class AnimatedSkillsSection extends StatefulWidget {
  final bool isDetailedPage;

  const AnimatedSkillsSection({
    super.key,
    this.isDetailedPage = false,
  });

  @override
  State<AnimatedSkillsSection> createState() => _AnimatedSkillsSectionState();
}

class _AnimatedSkillsSectionState extends State<AnimatedSkillsSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
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
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - _animation.value)),
            child: SkillsSection(isDetailedPage: widget.isDetailedPage),
          ),
        );
      },
    );
  }
}

// 스크롤로 보이게 되는 요소들을 위한 Observer 위젯
class ScrollObserver extends StatefulWidget {
  final Widget child;
  final bool onceOnly;

  const ScrollObserver({
    super.key,
    required this.child,
    this.onceOnly = true,
  });

  @override
  State<ScrollObserver> createState() => _ScrollObserverState();
}

class _ScrollObserverState extends State<ScrollObserver> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        final visiblePercentage = info.visibleFraction * 100;
        if (visiblePercentage > 30) {
          if (!_isVisible && (!_hasAnimated || !widget.onceOnly)) {
            setState(() {
              _isVisible = true;
              _hasAnimated = true;
            });
            _controller.forward(from: 0.0);
          }
        } else {
          if (_isVisible && !widget.onceOnly) {
            setState(() {
              _isVisible = false;
            });
            _controller.reverse();
          }
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Opacity(
            opacity: _animation.value,
            child: Transform.translate(
              offset: Offset(0, 30 * (1 - _animation.value)),
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}