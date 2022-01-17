import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  static route() {
    return MaterialPageRoute(builder: (_) => const TopPage());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 255, 255, 255),
        )),
        Positioned(
          top: 0,
          height: 550,
          left: -70,
          child: Image.asset(
            'images/top_bizyo.jpg',
            // scale: 2.4,
            height: 600,
          ),
        ),
        const Positioned(
            top: 250,
            left: 30,
            child: Text(
              'MatchingAppSample',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30),
            )),
        const Padding(
          padding: EdgeInsets.only(right: 25, left: 25, top: 535),
          child: SignInButton(),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 720),
          child: SignInSupportButton(),
        )
      ],
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              backgroundColor: const Color.fromARGB(255, 0, 72, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              side: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 0, 72, 255),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.facebook_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                SpaceBox.width(30),
                const Text(
                  'Facebookでサインイン',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onPressed: () {}),
        SpaceBox.height(10),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              backgroundColor: const Color.fromARGB(255, 0, 195, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              side: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 0, 195, 255),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.mail_outline_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                SpaceBox.width(30),
                const Text(
                  'メールアドレスでサインイン',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onPressed: () {}),
        SpaceBox.height(10),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              side: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.app_registration_outlined,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                SpaceBox.width(30),
                const Text(
                  'Appleでサインイン',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onPressed: () {}),
      ],
    );
  }
}

class SignInSupportButton extends StatelessWidget {
  const SignInSupportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _makeTextButton() {
      const List<String> _text = [
        'その他の方法でサインイン',
        'ログイン・新規登録でお困りのお客様へ',
      ];
      List<TextButton> _list = [];
      for (var i = 0; i < _text.length; i++) {
        _list.add(TextButton(
            style: const ButtonStyle(
                // padding: MaterialStateProperty.all(EdgeInsets.zero),
                // minimumSize: MaterialStateProperty.all(Size.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text(
              _text[i],
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 255, 144, 172),
                  fontSize: 14),
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors
                      .transparent, // モーダル拝啓を透過させておくことでBorderRadiusの丸みが見える
                  builder: (BuildContext context) {
                    return Container(
                      height: 800,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: (i == 0)
                          ? const Center(
                              child: Text('Implement phione number sign in'))
                          : const Center(child: Text('Implement Dialog help')),
                    );
                  });
            }));
      }
      return _list;
    }

    return Column(
      children: [
        _makeTextButton()[0],
        _makeTextButton()[1],
        SpaceBox.height(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '利用規約',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 169, 169, 169),
                  fontSize: 13),
            ),
            SpaceBox.width(20),
            const Text(
              'プライバシーポリシー',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 169, 169, 169),
                  fontSize: 13),
            )
          ],
        ),
      ],
    );
  }
}

class SpaceBox extends SizedBox {
  const SpaceBox({Key? key, double width = 0, double height = 0})
      : super(key: key, width: width, height: height);

  SpaceBox.width([double value = 8]) : super(width: value);
  SpaceBox.height([double value = 8]) : super(height: value);
}
