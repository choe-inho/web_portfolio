import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectsSection extends StatelessWidget {
  final bool showAllProjects;

  const ProjectsSection({
    super.key,
    this.showAllProjects = false,
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
              // 섹션 타이틀
              Center(
                child: Column(
                  children: [
                    Text(
                      '프로젝트',
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
                      '제가 개발한 대표 프로젝트들입니다',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),

              // 프로젝트 그리드
              _buildProjectsGrid(context, isMobile, isTablet),

              // 더 많은 프로젝트 버튼
              if(!showAllProjects)...[
                SizedBox(height: 40),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.go('/projects'); // 프로젝트 전체 페이지로 이동
                    },
                    icon: Icon(Icons.grid_view),
                    label: Text('더 많은 프로젝트 보기'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                  ),
                ),
              ]
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectsGrid(BuildContext context, bool isMobile, bool isTablet) {
    // 프로젝트 데이터
    final projects = [
      {
        'title': '모바일 투두 앱',
        'description': '사용자가 해야 할 일을 기록하는것과 더불어 사용자 맞춤 특정 반복적인 할일 주는 앱입니다. GetX를 이용한 상태관리와 Firebase를 활용한 데이터 저장 및 사용자 관리 기능을 구현했습니다',
        'image': 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FzI9GN%2FbtsOae2zsfn%2FPuGpvzbZSLtUho1Dv7IBs1%2Fimg.png',
        'tags': ['Flutter', 'Getx', 'Firebase', 'Todo'],
        'url': '/projects/awaken_quest',
      },
      {
        'title': '스포츠 소셜 앱',
        'description': '실시간 채팅 및 네트 스포츠기능을 합친 일정관리 앱입니다. Provider를 이용한 상태관리와 웹소켓을 통한 실시간 통신기능을 구현했습니다.',
        'image': 'https://cdn.imweb.me/upload/S20211213bcf9913dca729/f419314f3ea67.png',
        'tags': ['Flutter', 'Provider', 'Node.js', 'Communication'],
        'url': '/projects/nadal',
      },
      {
        'title': '오프라인 게임 앱',
        'description': '오프라인에서 친구들과 할 수 있는 놀이의 앱 입니다. Getx를 이용한 상태관리와 로컬 저장소 sharedpreferences 이용하여 구현했습니다',
        'image': 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbtQAfh%2FbtsN9JhJkll%2FuyGfG8UL4pqQZ08c4ZVpYk%2Fimg.png',
        'tags': ['Flutter', 'Firebase', 'sharedpreferences', 'Game'],
        'url': '/projects/amity',
      },
    ];

    if(showAllProjects){
      projects.addAll(
        [
          {
            'title': '유니티를 이용한 리듬게임(클론코딩)',
            'description': '처음 유니티를 접하고 프로젝트로 클론 코딩을 진행하였습니다.',
            'image': 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FodhxT%2FbtsObmgdKVW%2FT9HEn5atHhmdX0JA566lc0%2Fimg.png',
            'tags': ['C#', 'Unity', 'Game'],
            'url': '/projects/unity',
          },
          {
            'title': '복권 번호 자동 생성기',
            'description': '오프라인에서 친구들과 할 수 있는 놀이의 앱 입니다. Getx를 이용한 상태관리와 로컬 저장소 sharedpreferences 이용하여 구현했습니다',
            'image': 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fuq8uW%2FbtsN9x9HzHn%2FKF1wDqutBBHahQNHMjBra0%2Fimg.png',
            'tags': ['Flutter', 'Firebase', 'Ads', 'Game'],
            'url': '/projects/one_shot',
          },
          {
            'title': '기록이 남지 않는 채팅',
            'description': '서버에서 캐시로만 주고받아 기록이 전혀 남지 않는 1대1 랜덤 채팅앱을 구현했습니다',
            'image': 'assets/images/projects/chat_app.jpg',
            'tags': ['Flutter', 'Node.js', 'Socket.io', 'Random Chat'],
            'url': '/projects/null',
          },
        ]
      );
    }

    // 화면 크기에 따른 그리드 열 개수 설정
    int crossAxisCount = isMobile ? 1 : isTablet ? 2 : 3;
    double aspectRatio = isMobile ? 1 : 1.1;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return _buildProjectCard(context, project);
      },
    );
  }

  Widget _buildProjectCard(BuildContext context, Map<String, dynamic> project) {
    return InkWell(
      onTap: () {
        // 프로젝트 상세 페이지로 이동
        context.go(project['url'] as String);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로젝트 이미지
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Stack(
                  children: [
                    if((project['image'] as String).startsWith('http'))
                    Image.network(project['image'] as String)
                    else
                    Container(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 48,
                          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                    // 이미지 로드 실패 시 대체 이미지 표시
                    // Image.asset(
                    //   project['image'] as String,
                    //   width: double.infinity,
                    //   height: double.infinity,
                    //   fit: BoxFit.cover,
                    // ),
                  ],
                ),
              ),
            ),

            // 프로젝트 내용
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 프로젝트 제목
                    Text(
                      project['title'] as String,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),

                    // 프로젝트 설명
                    Expanded(
                      child: Text(
                        project['description'] as String,
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // 기술 태그
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (project['tags'] as List<String>).map((tag) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tag,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 애니메이션 버전 (스크롤 시 등장 효과)
class AnimatedProjectsSection extends StatefulWidget {
  const AnimatedProjectsSection({super.key});

  @override
  _AnimatedProjectsSectionState createState() => _AnimatedProjectsSectionState();
}

class _AnimatedProjectsSectionState extends State<AnimatedProjectsSection> with SingleTickerProviderStateMixin {
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
            child: ProjectsSection(),
          ),
        );
      },
    );
  }
}