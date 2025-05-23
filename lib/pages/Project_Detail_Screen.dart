import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_portfolio/pages/Privacy_Policy_Page.dart';
import 'package:web_portfolio/pages/Terms_Of_Service_Page.dart';
import 'package:web_portfolio/widget/App_Drawer.dart';
import 'package:web_portfolio/widget/Footer.dart';
import 'package:web_portfolio/widget/Header.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.projectId});
  final String projectId;

  @override
  Widget build(BuildContext context) {
    // 프로젝트 데이터 가져오기
    final projectData = _getProjectData(projectId);

    if (projectData == null) {
      return _buildNotFoundPage(context);
    }

    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 헤더
              Header(),

              // 프로젝트 히어로 섹션
              _buildProjectHero(context, projectData),

              // 프로젝트 상세 내용
              _buildProjectContent(context, projectData),

              // 관련 프로젝트 (선택 사항)
              _buildRelatedProjects(context),

              // 푸터
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  // 프로젝트 데이터 가져오기
  Map<String, dynamic>? _getProjectData(String projectId) {
    final projects = {
      'awaken_quest': {
        'title': '모바일 투두 앱 (Awaken Quest)',
        'shortDescription': '사용자가 해야 할 일을 기록하는것과 더불어 사용자 맞춤 특정 반복적인 할일 주는 앱입니다.',
        'description': '모바일 투두 앱은 사용자의 일정 관리와 생산성 향상을 목적으로 개발된 크로스 플랫폼 애플리케이션입니다. 단순한 할 일 관리를 넘어서 사용자 맞춤형 반복 업무를 추천하고, 성취감을 느낄 수 있는 게이미피케이션 요소를 도입했습니다.',
        'image': 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FzI9GN%2FbtsOae2zsfn%2FPuGpvzbZSLtUho1Dv7IBs1%2Fimg.png',
        'gallery': [
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbvwJW2%2FbtsObuSDvVm%2FAkI1Ban9S8TnoqdiGsUaJ0%2Fimg.jpg',
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbrH2y1%2FbtsOaZTqmRx%2FY1Ks1p4ckytTjcho7hJcm1%2Fimg.jpg',
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fc19iSu%2FbtsOcltRmHH%2F6OYwu4SeZ8N5CsUHXZntu0%2Fimg.jpg',
        ],
        'technologies': ['Flutter', 'GetX', 'Firebase', 'Cloud Firestore', 'Firebase Auth'],
        'features': [
          '직관적인 할 일 추가 및 관리',
          '사용자 맞춤형 반복 업무 추천',
          '일일 미션으로 개인 능력 수치화',
          '화려한 이팩트 및 칭호 효과로 성취감 증대'
        ],
        'challenges': [
          {
            'title': '상태 관리 최적화',
            'description': 'GetX를 활용하여 복잡한 상태 관리를 단순화하고 성능을 향상시켰습니다.',
          },
          {
            'title': '로컬 저장소 활용',
            'description': 'SharedPreferences와 Hive를 이용한 다양한 로컬 저장소 활용',
          },
          {
            'title': '다양한 이팩트 위젯 구현',
            'description': '사용자의 재미를 위해 이팩트 ',
          }
        ],
        'duration': '2025.05 - 2025.06 (1개월)',
        'role': 'Flutter 개발자 (개인 프로젝트)',
        'githubUrl': 'https://github.com/choe-inho/awaken_quest',
        'playstoreUrl': 'https://play.google.com/store/apps/details?id=com.example.awaken_quest',
        'appStoreUrl' : null,
        'term' : 'awaken_quest',
        'privacy' : 'awaken_quest'
      },
      'nadal': {
        'title': '스포츠 소셜 앱 (타임네트)',
        'shortDescription': '실시간 채팅 및 네트 스포츠기능을 합친 일정관리 앱입니다.',
        'description': '스포츠 소셜 앱은 스포츠를 좋아하는 사람들이 모여 경기를 주선하고, 실시간으로 소통할 수 있는 소셜 플랫폼입니다. 지역별 스포츠 모임 생성, 참가자 모집, 실시간 채팅 등의 기능을 제공합니다.',
        'image': 'https://cdn.imweb.me/upload/S20211213bcf9913dca729/f419314f3ea67.png',
        'gallery': [
          'https://play-lh.googleusercontent.com/uICN_-q81MbDBm4dXBANFnZcJBhandE0gkf9W0KJv_oVNHdWrff0SupV0gsaiZpUJ-I=w2560-h1440-rw',
          'https://play-lh.googleusercontent.com/3SHnD32deqSPUnuwp6mImYtpGC3t2qmVNDSLAKOtrQDKHQfPygaanru1FU5vn07ZufXi=w2560-h1440-rw',
          'https://play-lh.googleusercontent.com/fMtj8Ywq1UW6_wjQFkSkFUet-QehrAbEg-HkUx55HAX-5SdjAzlQeh3hDWhMA6wDOw=w2560-h1440-rw',
        ],
        'technologies': ['Flutter', 'Provider', 'Node.js', 'Socket.io', 'AWS', 'MongoDB'],
        'features': [
          '지역별 스포츠 모임 생성 및 참가',
          '실시간 채팅 및 알림',
          '사용자 프로필 및 매칭 시스템',
          '경기 일정 관리',
        ],
        'challenges': [
          {
            'title': '실시간 통신',
            'description': 'Socket.io를 활용하여 실시간 채팅과 알림 시스템을 구현했습니다.',
          },
          {
            'title': '확장 가능한 백엔드',
            'description': 'AWS 클라우드 인프라를 활용하여 확장 가능한 서버 아키텍처를 구축했습니다.',
          },
          {
            'title': '푸시 메시지 및 카카오 연결',
            'description': '채팅과 다양한 알림을 위한 푸시메시지 시스템 구축 및 카카오를 이용한 로그인 및 공유 시스템',
          }
        ],
        'duration': '2024.01 - 2025.3 (1년 3개월)',
        'role': 'Full-stack 개발자',
        'githubUrl': null,
        'playstoreUrl': 'https://play.google.com/store/apps/details?id=com.gtran.timenet2&hl=ko',
        'appStoreUrl' : 'https://apps.apple.com/kr/app/%ED%83%80%EC%9E%84%EB%84%A4%ED%8A%B8/id6737107364',
        'term' : null,
        'privacy' : null
      },
      'amity': {
        'title': '오프라인 게임 앱 (Amity)',
        'shortDescription': '오프라인에서 친구들과 할 수 있는 놀이의 앱 입니다.',
        'description': '오프라인 게임 앱은 친구들과 함께 즐길 수 있는 다양한 미니게임을 제공하는 애플리케이션입니다. 인터넷 연결 없이도 플레이할 수 있으며, 파티나 모임에서 분위기를 띄울 수 있는 재미있는 게임들로 구성되어 있습니다.',
        'image': 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbtQAfh%2FbtsN9JhJkll%2FuyGfG8UL4pqQZ08c4ZVpYk%2Fimg.png',
        'gallery': [
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F74r5e%2FbtsN8snUxn9%2FEL9rYYKzDdPTXn7yId7OA1%2Fimg.png',
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcqcsJt%2FbtsN8qKopF2%2Fo6yISVzCoEGJdT0I18yVjk%2Fimg.png',
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbasQ9r%2FbtsN8tHdip9%2FqEkp71VniUq4LOLpPii2XK%2Fimg.png',
        ],
        'technologies': ['Flutter', 'GetX', 'SharedPreferences', 'Hive', 'Custom Animations'],
        'features': [
          '4가지 이루어진 게임',
          '오프라인 완전 지원',
          '사용자 지정 룰 설정',
          '다양한 벌칙 커스터마이징'
        ],
        'challenges': [
          {
            'title': '오프라인 데이터 관리',
            'description': 'SharedPreferences 활용하여 효율적인 로컬 데이터 저장소를 구현했습니다.',
          },
          {
            'title': '게임 로직 최적화',
            'description': '복잡한 게임 로직을 효율적으로 처리하고 부드러운 애니메이션을 구현했습니다.',
          },
          {
            'title': '사용자 경험',
            'description': '직관적인 UI/UX로 누구나 쉽게 접근할 수 있는 게임을 만들었습니다.',
          }
        ],
        'duration': '2023.01 - 2023.04 (3개월)',
        'role': 'Flutter 개발자 (개인 프로젝트)',
        'githubUrl': 'https://github.com/Inhochoi0201/amity2-main',
        'appStoreUrl' : null,
        'playstoreUrl': null,
        'term' : null,
        'privacy' : null
      },
      'one_shot': {
        'title': '복권번호 생성기(OneShot)',
        'shortDescription': '지금까지의 기록을 통한 확률형 계산으로 번호를 생성해주는 앱입니다',
        'description': '최근까지의 복권번호를 JSON화 하여 가장 많이나온, 적게나온 번호들로 번호를 축력해줍니다. 번호를 보기위해서는 리워드 광고를 통해야합니다',
        'image': 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fuq8uW%2FbtsN9x9HzHn%2FKF1wDqutBBHahQNHMjBra0%2Fimg.png',
        'gallery': [
          'assets/images/projects/amity_1.jpg',
          'assets/images/projects/amity_2.jpg',
          'assets/images/projects/amity_3.jpg',
        ],
        'technologies': ['Flutter', 'Provider', 'SharedPreferences', 'Firebase', 'Ads'],
        'features': [
          '횟차별 계산 지원',
          '완전 랜덤 번호 생성',
          '최대,최소 등장 숫자 생성',
          '구글 광고'
        ],
        'challenges': [
          {
            'title': '데이터 JSON화',
            'description': '효율적인 데이터 관리를위해 현재까지의 복권 번호를 자리별로 JSON화 했습니다',
          },
          {
            'title': '횟수별 등장률 알고리즘',
            'description': '각자리별 등장 번호들을 회차별로 계산하였습니다',
          },
          {
            'title': '광고',
            'description': '광고를 통한 수익모델을 구현했습니다',
          }
        ],
        'duration': '2023.04 - 2023.05 (1개월)',
        'role': 'Flutter 개발자 (개인 프로젝트)',
        'githubUrl': null,
        'appStoreUrl' : null,
        'playstoreUrl': null,
        'term' : null,
        'privacy' : null
      },
      'unity': {
        'title': '유니티 리듬게임 (클론 코딩 기반 프로젝트)',
        'shortDescription': 'C#과 Unity를 활용하여 리듬게임을 구현한 프로젝트입니다.',
        'description': '처음 접한 언어인 C#을 사용하여 Unity 리듬게임을 클론 코딩한 후, 직접 고안한 장애물 시스템을 구현하는 데 성공했습니다. 이 경험을 통해 Unity 엔진과 C# 언어에 대한 이해도를 비약적으로 향상시킬 수 있었습니다.',
        'image': 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FodhxT%2FbtsObmgdKVW%2FT9HEn5atHhmdX0JA566lc0%2Fimg.png',
        'gallery': null,
        'technologies': ['Unity', 'C#', 'Game Development'],
        'features': [
          '클론 코딩을 통해 리듬게임 기본 구조 학습',
          '유니티 툴과 3D 공간 개념 이해',
          '직접 설계한 장애물 생성 로직 구현',
        ],
        'challenges': [
          {
            'title': 'C#과 Unity의 첫 경험',
            'description': '이전까지 사용해보지 않았던 언어와 툴을 다루면서, 자료형, 클래스 구조, 이벤트 시스템 등 새로운 개념을 빠르게 익히는 것이 도전이었습니다.',
          },
          {
            'title': '게임 내 오브젝트 충돌 및 타이밍 처리',
            'description': '리듬게임 특성상 정확한 타이밍과 충돌 판정이 필요했기 때문에, 충돌 처리 로직과 타이밍 동기화 기능을 구현하는 데 있어 많은 테스트와 반복이 필요했습니다.',
          },
          {
            'title': '장애물 커스터마이징 및 게임성 확장',
            'description': '기존 클론코딩 내용을 넘어서 개인적으로 창의적인 장애물을 설계하고 적용하는 과정에서 많은 시행착오를 겪었지만, 이를 통해 Unity의 물리 시스템과 애니메이션 제어에 대한 실무적인 감각을 키울 수 있었습니다.',
          }
        ],
        'duration': '2022.05 - 2022.06 (1개월)',
        'role': '총괄 개발 (팀 프로젝트)',
        'githubUrl': null,
        'playstoreUrl': null,
        'appStoreUrl' : null,
        'term' : null,
        'privacy' : null,
        'blog' : 'https://iconoding.tistory.com/category/%EC%96%B8%EC%96%B4/C%23'
      },
    };

    return projects[projectId];
  }

  // 프로젝트 히어로 섹션
  Widget _buildProjectHero(BuildContext context, Map<String, dynamic> project) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : isTablet ? 40 : 80,
            vertical: isMobile ? 40 : 80,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isMobile
              ? _buildMobileHero(context, project)
              : _buildDesktopHero(context, project, isTablet),
        );
      },
    );
  }

  Widget _buildMobileHero(BuildContext context, Map<String, dynamic> project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 뒤로가기 버튼
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withValues(alpha:0.2),
          ),
        ),
        SizedBox(height: 20),

        // 프로젝트 제목
        Text(
          project['title'] as String,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),

        // 프로젝트 간단 설명
        Text(
          project['shortDescription'] as String,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16,
            color: Colors.white.withValues(alpha:0.9),
            height: 1.5,
          ),
        ),
        SizedBox(height: 24),

        // 프로젝트 메타 정보
        _buildProjectMeta(context, project, true),
      ],
    );
  }

  Widget _buildDesktopHero(BuildContext context, Map<String, dynamic> project, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 뒤로가기 버튼
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha:0.2),
                ),
              ),
              SizedBox(height: 20),

              // 프로젝트 제목
              Text(
                project['title'] as String,
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: isTablet ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // 프로젝트 간단 설명
              Text(
                project['shortDescription'] as String,
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: isTablet ? 18 : 20,
                  color: Colors.white.withValues(alpha:0.9),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32),

              // 프로젝트 메타 정보
              _buildProjectMeta(context, project, false),
            ],
          ),
        ),
        SizedBox(width: 40),

        // 프로젝트 이미지 (플레이스홀더)
        Expanded(
          flex: 4,
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              image: (project['image'] as String).startsWith('http') ? DecorationImage(
                  image: NetworkImage(project['image']),
                  fit: BoxFit.cover
              ) : null
            ),
            child:
            Visibility(
              visible: !(project['image'] as String).startsWith('http'),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 80,
                  color: Colors.white.withValues(alpha:0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectMeta(BuildContext context, Map<String, dynamic> project, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 기간과 역할
        Row(
          children: [
            _buildMetaItem(Icons.access_time, project['duration'] as String),
            if (!isMobile) SizedBox(width: 32),
            if (!isMobile) _buildMetaItem(Icons.person, project['role'] as String),
          ],
        ),
        if (isMobile) SizedBox(height: 16),
        if (isMobile) _buildMetaItem(Icons.person, project['role'] as String),
        SizedBox(height: 24),

        // 액션 버튼들
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            if (project['githubUrl'] != null)
              _buildActionButton(
                'GitHub',
                Icons.code,
                    () => _launchURL(project['githubUrl'] as String),
              ),
            if (project['playstoreUrl'] != null)
              _buildActionButton(
                'Play Store',
                Icons.android,
                    () => _launchURL(project['playstoreUrl'] as String),
              ),
            if (project['appStoreUrl'] != null)
              _buildActionButton(
                'GitHub',
                Icons.apple,
                    () => _launchURL(project['appStoreUrl'] as String),
              ),

            if (project['term'] != null)
              _buildActionButton(
                '이용약관',
                Icons.list_alt,
                    () => _navigatorTerm(project['term'], context),
              ),

            if (project['privacy'] != null)
              _buildActionButton(
                '개인정보처리방침',
                Icons.security,
                    () => _navigatorPolicy(project['privacy'], context),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetaItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white.withValues(alpha:0.8), size: 16),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Pretendard',
            color: Colors.white.withValues(alpha:0.8),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF2563EB),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  // 프로젝트 상세 내용
  Widget _buildProjectContent(BuildContext context, Map<String, dynamic> project) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : isTablet ? 40 : 80,
            vertical: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로젝트 개요
              _buildSection(
                context,
                '프로젝트 개요',
                Text(
                  project['description'] as String,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    height: 1.6,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),

              SizedBox(height: 60),

              // 기술 스택
              _buildSection(
                context,
                '사용 기술',
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (project['technologies'] as List<String>).map((tech) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha:0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withValues(alpha:0.3),
                        ),
                      ),
                      child: Text(
                        tech,
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 60),

              // 주요 기능
              _buildSection(
                context,
                '주요 기능',
                Column(
                  children: (project['features'] as List<String>).map((feature) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              feature,
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 60),
              // 프로젝트 갤러리
              if(project['gallery'] != null)
              _buildSection(
                context,
                '프로젝트 갤러리',
                _buildProjectGallery(context, project['gallery'] as List<String>),
              ),
              SizedBox(height: 60),
              // 개발 과정 및 도전 과제
              _buildSection(
                context,
                '개발 과정 및 도전 과제',
                Column(
                  children: (project['challenges'] as List<Map<String, String>>).map((challenge) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 24),
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor.withValues(alpha:0.05),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            challenge['title']!,
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            challenge['description']!,
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 16,
                              height: 1.5,
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha:0.8),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 24),
        content,
      ],
    );
  }

  // 관련 프로젝트
  Widget _buildRelatedProjects(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Text(
            '다른 프로젝트도 살펴보세요',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.go('/projects');
            },
            child: Text('모든 프로젝트 보기'),
          ),
        ],
      ),
    );
  }

  // 404 페이지
  Widget _buildNotFoundPage(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 24),
              Text(
                '프로젝트를 찾을 수 없습니다',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '존재하지 않는 프로젝트이거나 링크가 잘못되었습니다.',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onBackground.withValues(alpha:0.7),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => context.go('/projects'),
                child: Text('프로젝트 목록으로 돌아가기'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _navigatorTerm(String id, BuildContext context){
    if(id == 'awaken_quest'){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> TermsOfServicePage()));
    }
  }

  void _navigatorPolicy(String id, BuildContext context){
    if(id == 'awaken_quest'){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> PrivacyPolicyPage()));
    }
  }

  // 프로젝트 갤러리
  Widget _buildProjectGallery(BuildContext context, List<String> gallery) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        // 화면 크기에 따른 그리드 열 개수
        int crossAxisCount = isMobile ? 1 : isTablet ? 2 : 3;
        double aspectRatio = isMobile ? 16/9 : 1.2;

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: gallery.length,
          itemBuilder: (context, index) {
            return _buildGalleryItem(context, gallery[index], index);
          },
        );
      },
    );
  }

  Widget _buildGalleryItem(BuildContext context, String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        // 이미지 상세 보기 모달 열기
        _showImageModal(context, imagePath, index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(alpha:0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 이미지 플레이스홀더 (실제 프로젝트에서는 Image.asset 사용)
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha:0.1),
                  image:  !imagePath.startsWith('http') ? null : 
                      DecorationImage(image: NetworkImage(imagePath))
                ),
                child: Visibility(
                  visible: !imagePath.startsWith('http'),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 48,
                          color: Theme.of(context).colorScheme.primary.withValues(alpha:0.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '스크린샷 ${index + 1}',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary.withValues(alpha:0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 호버 효과 (웹에서만)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha:0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.zoom_in,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 이미지 상세 보기 모달
  void _showImageModal(BuildContext context, String imagePath, int index) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(20),
          child: Stack(
            children: [
              // 이미지
              Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.9,
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha:0.3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        image: imagePath.startsWith('http') ? DecorationImage(
                            image: NetworkImage(imagePath)
                        ) : null
                      ),
                      child: AspectRatio(
                        aspectRatio: 9/16, // 모바일 앱 스크린샷 비율
                        child: Visibility(
                          visible: !imagePath.startsWith('http'),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 80,
                                  color: Theme.of(context).colorScheme.primary.withValues(alpha:0.5),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  '스크린샷 ${index + 1}',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 닫기 버튼
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha:0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),

              // 이미지 인덱스 표시
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha:0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${index + 1} / 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}