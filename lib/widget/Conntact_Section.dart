import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  // 폼 키와 컨트롤러
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;
  bool _isSubmitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

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
            children: [
              // 섹션 타이틀
              Center(
                child: Column(
                  children: [
                    Text(
                      '연락하기',
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
                  ],
                ),
              ),
              SizedBox(height: 60),

              // 연락처 콘텐츠 - 모바일/태블릿과 데스크톱 레이아웃 분리
              isMobile || isTablet
                  ? _buildMobileContactContent(context)
                  : _buildDesktopContactContent(context),
            ],
          ),
        );
      },
    );
  }

  // 모바일/태블릿용 레이아웃
  Widget _buildMobileContactContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 연락처 정보
        _buildContactInfo(context),
      ],
    );
  }

  // 데스크톱용 레이아웃
  Widget _buildDesktopContactContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 연락처 정보
        Expanded(
          flex: 2,
          child: _buildContactInfo(context),
        ),
      ],
    );
  }

  // 연락처 정보
  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '연락처 정보',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 24),

        // 이메일
        ContactInfoItem(
          icon: Icons.email_outlined,
          title: '이메일',
          content: 'iconoding.dev@gmail.com',
          onTap: () {
            _launchURL('mailto:iconoding.dev@gmail.com');
          },
        ),

        // 위치
        ContactInfoItem(
          icon: Icons.location_on_outlined,
          title: '위치',
          content: '부산광역시',
          onTap: null,
        ),

        SizedBox(height: 40),

        // 소셜 미디어 링크
        Text(
          'SNS',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 16),

        // 소셜 미디어 아이콘들
        Row(
          children: [
            // GitHub
            SocialIconButton(
              icon: BootstrapIcons.github,
              color: Color(0xFF333333),
              onTap: () {
                _launchURL('https://github.com/choe-inho');
              },
            ),
            SizedBox(width: 16),

            // instagram
            SocialIconButton(
              icon: BootstrapIcons.instagram,
              color: Color(0xFFE1306C),
              onTap: () {
                _launchURL('https://linkedin.com/in/yourusername');
              },
            ),
            SizedBox(width: 16),

            // 블로그
            SocialIconButton(
              icon: Icons.create_outlined,
              color: Color(0xFF03A9F4),
              onTap: () {
                _launchURL('https://your-blog-url.com');
              },
            ),
          ],
        ),
      ],
    );
  }
}

// 연락처 정보 아이템
class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final VoidCallback? onTap;

  const ContactInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onBackground.withValues(alpha: 0.6),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 소셜 미디어 아이콘 버튼
class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
    );
  }
}

// 애니메이션 버전
class AnimatedContactSection extends StatefulWidget {
  const AnimatedContactSection({super.key});

  @override
  _AnimatedContactSectionState createState() => _AnimatedContactSectionState();
}

class _AnimatedContactSectionState extends State<AnimatedContactSection> with SingleTickerProviderStateMixin {
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
            child: ContactSection(),
          ),
        );
      },
    );
  }
}