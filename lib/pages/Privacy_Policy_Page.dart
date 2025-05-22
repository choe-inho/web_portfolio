import 'package:flutter/material.dart';

import 'Terms_Of_Service_Page.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('개인정보 처리방침'),
        backgroundColor: const Color(0xFF5D00FF),
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '개인정보 처리방침',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '시행일자: 2025년 5월 22일',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),

            PrivacySection(
              title: '1. 개인정보의 처리 목적',
              content: '''본 앱은 다음의 목적을 위하여 개인정보를 처리합니다:
                - 회원 가입 및 관리
                - 서비스 제공 및 개선
                - 고객 지원''',
            ),

            PrivacySection(
              title: '2. 처리하는 개인정보의 항목',
              content: '''필수 수집 정보
                  - 구글 로그인을 통한 정보: 이메일 주소
                  - 사용자 입력 정보: 닉네임, 성별

                    선택 수집 정보
                    현재 선택적으로 수집하는 개인정보는 없습니다.''',
            ),

            PrivacySection(
              title: '3. 개인정보의 처리 및 보유기간',
              content: '''- 보유기간: 회원 탈퇴 시까지
                - 처리기간: 수집 목적 달성 시까지
                - 회원이 탈퇴를 요청하는 경우 지체 없이 해당 정보를 파기합니다.''',
            ),

            PrivacySection(
              title: '4. 개인정보의 제3자 제공',
              content: '''본 앱은 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 단, 다음의 경우에는 예외로 합니다:
                  - 이용자가 사전에 동의한 경우
                  - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우''',
            ),

            PrivacySection(
              title: '5. 개인정보처리 위탁',
              content: '현재 개인정보 처리를 위탁하는 업체는 없습니다.',
            ),

            PrivacySection(
              title: '6. 정보주체의 권리·의무 및 그 행사방법',
              content: '''이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다:
                        - 개인정보 처리정지 요구권
                        - 개인정보 열람요구권
                        - 개인정보 정정·삭제요구권
                        - 개인정보 처리정지 요구권''',
            ),

            PrivacySection(
              title: '7. 처리하는 개인정보의 안전성 확보 조치',
              content: '''본 앱은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보 조치를 하고 있습니다:
                  - 관리적 조치: 내부관리계획 수립·시행
                  - 기술적 조치: 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 개인정보의 암호화
                  - 물리적 조치: 전산실, 자료보관실 등의 접근통제''',
            ),

            PrivacySection(
              title: '8. 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항',
              content: '본 앱은 쿠키 등 개인정보 자동 수집장치를 운영하지 않습니다.',
            ),

            PrivacySection(
              title: '9. 개인정보 보호책임자',
              content: '''개인정보 보호책임자
            - 성명: 최인호 
            - 연락처: iconoding.dev@gmail.com

              개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.''',
            ),

            PrivacySection(
              title: '10. 개인정보 처리방침 변경',
              content: '이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.',
            ),

            PrivacySection(
              title: '11. 개인정보의 열람청구를 접수·처리하는 부서',
              content: '''정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.

                개인정보 열람청구 접수·처리 
                - 담당자: 최인호
                - 연락처: iconoding.dev@gmail.com''',
            ),

            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 16),
            Text(
              '본 방침은 2025년 5월 22일부터 시행됩니다.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5D00FF),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class PrivacySection extends StatelessWidget {
  final String title;
  final String content;

  const PrivacySection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5D00FF),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

// 개인정보처리방침 동의 다이얼로그
class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const PrivacyPolicyDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('개인정보처리방침 동의'),
      content: const Text('개인정보처리방침에 동의하시겠습니까?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrivacyPolicyPage(),
              ),
            );
          },
          child: const Text('방침 보기'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('취소'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('동의'),
        ),
      ],
    );
  }
}

// 회원가입 시 약관 및 개인정보처리방침 동의 위젯
class AgreementWidget extends StatefulWidget {
  final Function(bool termsAgreed, bool privacyAgreed) onAgreementChanged;

  const AgreementWidget({
    super.key,
    required this.onAgreementChanged,
  });

  @override
  State<AgreementWidget> createState() => _AgreementWidgetState();
}

class _AgreementWidgetState extends State<AgreementWidget> {
  bool _termsAgreed = false;
  bool _privacyAgreed = false;

  void _updateAgreement() {
    widget.onAgreementChanged(_termsAgreed, _privacyAgreed);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 이용약관 동의
        Row(
          children: [
            Checkbox(
              value: _termsAgreed,
              onChanged: (value) {
                setState(() {
                  _termsAgreed = value ?? false;
                });
                _updateAgreement();
              },
              activeColor: const Color(0xFF5D00FF),
            ),
            Expanded(
              child: Text('이용약관에 동의합니다. (필수)'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsOfServicePage(),
                  ),
                );
              },
              child: const Text(
                '보기',
                style: TextStyle(color: Color(0xFF5D00FF)),
              ),
            ),
          ],
        ),
        // 개인정보처리방침 동의
        Row(
          children: [
            Checkbox(
              value: _privacyAgreed,
              onChanged: (value) {
                setState(() {
                  _privacyAgreed = value ?? false;
                });
                _updateAgreement();
              },
              activeColor: const Color(0xFF5D00FF),
            ),
            Expanded(
              child: Text('개인정보처리방침에 동의합니다. (필수)'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
              },
              child: const Text(
                '보기',
                style: TextStyle(color: Color(0xFF5D00FF)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // 전체 동의 버튼
        Row(
          children: [
            Checkbox(
              value: _termsAgreed && _privacyAgreed,
              onChanged: (value) {
                setState(() {
                  _termsAgreed = value ?? false;
                  _privacyAgreed = value ?? false;
                });
                _updateAgreement();
              },
              activeColor: const Color(0xFF5D00FF),
            ),
            const Text(
              '전체 동의',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 사용 예제
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _termsAgreed = false;
  bool _privacyAgreed = false;

  bool get _canSignUp => _termsAgreed && _privacyAgreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        backgroundColor: const Color(0xFF5D00FF),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 다른 회원가입 폼들...
            const Spacer(),

            // 약관 동의 위젯
            AgreementWidget(
              onAgreementChanged: (termsAgreed, privacyAgreed) {
                setState(() {
                  _termsAgreed = termsAgreed;
                  _privacyAgreed = privacyAgreed;
                });
              },
            ),

            const SizedBox(height: 24),

            // 회원가입 버튼
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _canSignUp ? () {
                  // 회원가입 처리
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('회원가입이 완료되었습니다!')),
                  );
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5D00FF),
                  disabledBackgroundColor: Colors.grey,
                ),
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}