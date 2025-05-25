import 'package:flutter/material.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

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
          color: Theme.of(context).colorScheme.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 섹션 타이틀
              Center(
                child: Column(
                  children: [
                    Text(
                      '경력 & 교육',
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
                      '제 경력과 교육 배경입니다',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onBackground.withValues(alpha: 0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),

              // 타임라인 내용
              isMobile
                  ? _buildMobileTimeline(context)
                  : _buildDesktopTimeline(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopTimeline(BuildContext context) {
    // 타임라인 항목 데이터
    final timelineItems = _getTimelineItems();

    return Column(
      children: List.generate(timelineItems.length, (index) {
        final item = timelineItems[index];
        final isLeft = index % 2 == 0;

        return Row(
          children: [
            // 왼쪽 항목 (짝수 인덱스)
            if (isLeft)
              Expanded(
                child: _buildTimelineCard(context, item, isLeft: true),
              )
            else
              Expanded(child: Container()),

            // 중앙 타임라인 라인
            Container(
              width: 100,
              child: Column(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: item['isEducation'] as bool
                          ? Color(0xFF8B5CF6) // 교육은 보라색
                          : Color(0xFF2563EB), // 경력은 파란색
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 3,
                      ),
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 100,
                    color: Theme.of(context).colorScheme.onBackground.withValues(alpha: 0.1),
                  ),
                ],
              ),
            ),

            // 오른쪽 항목 (홀수 인덱스)
            if (!isLeft)
              Expanded(
                child: _buildTimelineCard(context, item, isLeft: false),
              )
            else
              Expanded(child: Container()),
          ],
        );
      }),
    );
  }

  Widget _buildMobileTimeline(BuildContext context) {
    // 타임라인 항목 데이터
    final timelineItems = _getTimelineItems();

    return Column(
      children: timelineItems.map((item) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 왼쪽 타임라인 라인
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: item['isEducation'] as bool
                        ? Color(0xFF8B5CF6) // 교육은 보라색
                        : Color(0xFF2563EB), // 경력은 파란색
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.background,
                      width: 3,
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 120,
                  color: Theme.of(context).colorScheme.onBackground.withValues(alpha: 0.1),
                ),
              ],
            ),
            SizedBox(width: 16),

            // 오른쪽 내용
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: _buildTimelineCard(
                    context,
                    item,
                    isLeft: false,
                    isMobile: true
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTimelineCard(BuildContext context, Map<String, dynamic> item, {required bool isLeft, bool isMobile = false}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(
          horizontal: isMobile ? 0 : 16,
          vertical: 8
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // 기간
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: item['isEducation'] as bool
                  ? Color(0xFF8B5CF6).withValues(alpha: 0.1)
                  : Color(0xFF2563EB).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              item['period'] as String,
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: item['isEducation'] as bool
                    ? Color(0xFF8B5CF6)
                    : Color(0xFF2563EB),
              ),
            ),
          ),
          SizedBox(height: 12),

          // 제목
          Text(
            item['title'] as String,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: isLeft && !isMobile ? TextAlign.right : TextAlign.left,
          ),
          SizedBox(height: 4),

          // 장소/회사
          Text(
            item['place'] as String,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: isLeft && !isMobile ? TextAlign.right : TextAlign.left,
          ),
          SizedBox(height: 12),

          // 내용
          Text(
            item['description'] as String,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              height: 1.5,
            ),
            textAlign: isLeft && !isMobile ? TextAlign.right : TextAlign.left,
          ),

          // 관련 기술 태그 (경력 항목인 경우)
          if (item.containsKey('skills') && (item['skills'] as List).isNotEmpty)
            Column(
              crossAxisAlignment: isLeft && !isMobile ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Wrap(
                  alignment: isLeft && !isMobile ? WrapAlignment.end : WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 8,
                  children: (item['skills'] as List<String>).map((skill) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        skill,
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getTimelineItems() {
    // 실제 데이터로 교체해야 합니다
    return [
      {
        'period': '2025.03 - 2025.12',
        'title': '창업 지원단 멘토 평가 및 피드백',
        'place': '창원 여성 가족 제단',
        'description': '창원시에서 진행한 창업 지원단에 개발 관련 멘토링',
        'isEducation': false,
        'skills': ['기술 자문', '제품 전략', '모바일 앱 평가', '코드 리뷰'],
      },
      {
        'period': '2023 - 현재',
        'title': '시니어 모바일 개발자',
        'place': '주식회사 에핀',
        'description': '크로스 플랫폼 모바일 개발, 제품 기획, 설계, 개발, 성능 최적화 작업',
        'isEducation': false,
        'skills': ['Flutter', 'Dart', 'AWS', 'PM', 'Node.js'],
      },
      {
        'period': '2017 - 2023',
        'title': '소프트웨어 공학 학사',
        'place': '경성대학교',
        'description': '경성대학교 소프트웨어 학과 졸업 및 (주)지트랜 하계 장기 현장실습 모바일 프론트엔드 개발',
        'isEducation': true,
        'skills': ['자료구조', '파일처리', '데이터베이스', '컴퓨터구조'],
      },
    ];
  }
}

// 애니메이션 버전
class AnimatedTimelineSection extends StatefulWidget {
  const AnimatedTimelineSection({super.key});

  @override
  _AnimatedTimelineSectionState createState() => _AnimatedTimelineSectionState();
}

class _AnimatedTimelineSectionState extends State<AnimatedTimelineSection> with SingleTickerProviderStateMixin {
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
            child: TimelineSection(),
          ),
        );
      },
    );
  }
}