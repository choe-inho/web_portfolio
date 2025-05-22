import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('서비스 이용약관'),
        backgroundColor: const Color(0xFF5D00FF),
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '서비스 이용약관',
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

            TermsSection(
              title: '제1조 (목적)',
              content: '본 약관은 이코노딩(이하 "개발자")이 제공하는 투두 RPG 게임 서비스(이하 "서비스")의 이용조건 및 절차, 개발자와 이용자 간의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.',
            ),

            TermsSection(
              title: '제2조 (정의)',
              content: '''본 약관에서 사용하는 용어의 정의는 다음과 같습니다:

              1. "서비스"란 개발자가 제공하는 투두 리스트와 RPG 게임 요소가 결합된 모바일 애플리케이션 서비스를 의미합니다.
              2. "이용자"란 본 약관에 따라 개발자가 제공하는 서비스를 받는 회원을 의미합니다.
              3. "카테고리"란 이용자가 설정하는 할 일의 분류를 의미합니다.
              4. "미션"란 카테고리에 따라 자동 생성되는 일일미션 및 특별미션을 의미합니다.
              5. "게임 요소"란 경험치, HP, MP, 레벨, 스탯, 칭호 등 RPG 게임적 요소를 의미합니다.''',
            ),

            TermsSection(
              title: '제3조 (약관의 효력 및 변경)',
              content: '''1. 본 약관은 서비스 화면에 게시하거나 기타의 방법으로 이용자에게 공지함으로써 효력이 발생합니다.
                2. 개발자는 합리적인 사유가 발생할 경우 관련 법령에 위배되지 않는 범위에서 본 약관을 변경할 수 있습니다.
                3. 약관이 변경되는 경우 변경된 약관의 적용일자 및 변경사유를 명시하여 현행약관과 함께 그 적용일자 7일 이전부터 공지합니다.''',
            ),

            TermsSection(
              title: '제4조 (서비스의 제공 및 변경)',
              content: '''1. 개발자가 제공하는 서비스는 다음과 같습니다:
                       - 투두 리스트 작성 및 관리 기능
                       - 카테고리별 맞춤 미션 자동 생성
                       - 미션 완료 시 경험치 획득 및 HP/MP 소모 시스템
                       - 레벨업을 통한 스탯 증가 기능
                       - 특정 행동 완료 시 칭호 획득 시스템
                       - 기타 개발자가 정하는 서비스

                        2. 개발자는 서비스의 내용 및 제공일정을 변경할 수 있으며, 이 경우 변경된 서비스의 내용 및 제공일정을 이용자에게 통지합니다.''',
            ),

            TermsSection(
              title: '제5조 (서비스 이용신청 및 승낙)',
              content: '''1. 이용신청자는 개발자가 정한 가입 양식에 따라 회원정보를 기입한 후 본 약관에 동의한다는 의사표시를 함으로써 이용신청을 합니다.
                2. 개발자는 제1항과 같이 이용신청한 자에 대하여 원칙적으로 승낙합니다.
                3. 개발자는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다:
                     - 가입신청자가 본 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우
                     - 타인의 명의를 이용한 경우
                     - 허위의 정보를 기재하거나, 개발자가 제시하는 내용을 기재하지 않은 경우
                     - 기타 회원으로 등록하는 것이 개발자의 기술상 현저히 지장이 있다고 판단되는 경우''',
            ),

            TermsSection(
              title: '제6조 (회원정보의 변경)',
              content: '''1. 회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.
                          2. 회원은 회원가입 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 기타의 방법으로 개발자에게 그 변경사항을 알려야 합니다.''',
            ),

            TermsSection(
              title: '제7조 (개인정보보호)',
              content: '개발자는 관련 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 개발자의 개인정보처리방침이 적용됩니다.',
            ),

            TermsSection(
              title: '제8조 (이용자의 의무)',
              content: '''1. 이용자는 다음 행위를 하여서는 안 됩니다:
                 - 신청 또는 변경 시 허위내용의 등록
                 - 개발자가 게시한 정보의 변경
                 - 개발자가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
                 - 개발자나 제3자의 저작권 등 지적재산권에 대한 침해
                 - 개발자나 제3자의 명예를 손상시키거나 업무를 방해하는 행위
                 - 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위''',
            ),

            TermsSection(
              title: '제9조 (서비스의 정지)',
              content: '''1. 개발자는 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
            2. 개발자는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상하지 않습니다.''',
            ),

            TermsSection(
              title: '제10조 (게임 데이터 및 진행상황)',
              content: '''1. 이용자의 게임 진행상황(레벨, 경험치, HP, MP, 스탯, 칭호 등)은 서비스 내에서만 유효합니다.
                      2. 개발자는 시스템 오류, 부정한 방법으로 획득한 게임 데이터에 대해 수정하거나 삭제할 수 있습니다.
                      3. 이용자가 서비스를 탈퇴하는 경우 모든 게임 데이터는 삭제되며, 복구되지 않습니다.''',
            ),

            TermsSection(
              title: '제11조 (서비스 이용료)',
              content: '현재 서비스는 무료로 제공됩니다. 향후 유료 서비스가 제공될 경우 별도로 공지합니다.',
            ),

            TermsSection(
              title: '제12조 (계약해지 및 이용제한)',
              content: '''1. 이용자는 언제든지 서비스 이용을 해지할 수 있으며, 이 경우 개발자는 즉시 회원탈퇴를 처리합니다.
                    2. 개발자는 이용자가 본 약관의 의무를 위반하거나 서비스의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 서비스 이용을 단계별로 제한할 수 있습니다.''',
            ),

            TermsSection(
              title: '제13조 (손해배상)',
              content: '개발자는 무료서비스와 관련하여 이용자에게 어떠한 손해가 발생하더라도 개발자가 고의 또는 중과실로 인한 손해를 제외하고는 이에 대하여 책임을 지지 않습니다.',
            ),

            TermsSection(
              title: '제14조 (면책조항)',
              content: '''1. 개발자는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
                    2. 개발자는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.
                    3. 개발자는 이용자가 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.''',
            ),

            TermsSection(
              title: '제15조 (준거법 및 관할법원)',
              content: '''1. 개발자와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용합니다.
                      2. 개발자와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대해서는 민사소송법상의 관할법원에 소를 제기할 수 있습니다.''',
            ),

            TermsSection(
              title: '부칙',
              content: '본 약관은 2025년 5월 22일부터 시행됩니다.',
            ),

            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 16),
            Text(
              '개발자 연락처: iconoding.dev@gmail.com',
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

class TermsSection extends StatelessWidget {
  final String title;
  final String content;

  const TermsSection({
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

// 사용 예제
class TermsDialog extends StatelessWidget {
  const TermsDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const TermsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('이용약관 동의'),
      content: const Text('서비스 이용약관에 동의하시겠습니까?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TermsOfServicePage(),
              ),
            );
          },
          child: const Text('약관 보기'),
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