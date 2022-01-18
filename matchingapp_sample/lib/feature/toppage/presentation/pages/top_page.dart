import 'package:flutter/material.dart';
import 'package:matchingapp_sample/feature/toppage/presentation/pages/phone_number_sigin_in_page.dart';

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
        ),
        const Padding(
          padding: EdgeInsets.only(top: 790),
          child: UsePrivacyPolicyButton(),
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
    TextButton _makeTextButton(String text, int index) {
      return TextButton(
          style: const ButtonStyle(
              // padding: MaterialStateProperty.all(EdgeInsets.zero),
              // minimumSize: MaterialStateProperty.all(Size.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          child: Text(
            text,
            style: const TextStyle(
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 255, 144, 172),
                fontSize: 14),
          ),
          onPressed: () {
            _showModalBottomSheet(context, index);
          });
    }

    return Center(
      child: Column(
        children: [
          _makeTextButton('その他の方法でサインイン', 0),
          _makeTextButton('ログイン・新規登録でお困りのお客様へ', 1),
        ],
      ),
    );
  }

  Future _showModalBottomSheet(BuildContext context, int index) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor:
            Colors.transparent, // モーダル拝啓を透過させておくことでBorderRadiusの丸みが見える
        builder: (BuildContext context) {
          return (index == 0)
              ? PhoneNumberSignInPage()
              : OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 200),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    'ログインでお困りのお客様',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {});
        });
  }
}

class UsePrivacyPolicyButton extends StatelessWidget {
  const UsePrivacyPolicyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextButton _makeTextButton(text) {
      return TextButton(
          style: const ButtonStyle(
              // padding: MaterialStateProperty.all(EdgeInsets.zero),
              // minimumSize: MaterialStateProperty.all(Size.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          child: Text(
            text,
            style: const TextStyle(
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 94, 93, 93),
                fontSize: 13),
          ),
          onPressed: () {
            _showModalBottomSheet(context);
          });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _makeTextButton('利用規約'),
        _makeTextButton('プライバシーポリシー'),
      ],
    );
  }
}

Future _showModalBottomSheet(context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // モーダルを透過させておくことでBorderRadiusの丸みが見える
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: const Center(child: Text('Implement phione number sign in')),
        );
      });
}

class SpaceBox extends SizedBox {
  const SpaceBox({Key? key, double width = 0, double height = 0})
      : super(key: key, width: width, height: height);

  SpaceBox.width([double value = 8]) : super(width: value);
  SpaceBox.height([double value = 8]) : super(height: value);
}
