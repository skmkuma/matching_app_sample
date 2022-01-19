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
        Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        Stack(children: <Widget>[
          Image.asset(
            'images/top_bizyo.jpg',
            height: 560,
            fit: BoxFit.cover,
          ),
          const Center(
            child: Text(
              'MatchingAppSample',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 255, 0, 255),
                  fontSize: 30),
            ),
          )
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              SignInButton(
                  snsId: 0,
                  text: 'Facebookでサインイン',
                  icon: Icons.facebook_outlined,
                  bordercolor: Color.fromARGB(255, 0, 72, 255),
                  backgroundcolor: Color.fromARGB(255, 0, 72, 255),
                  textColor: Color.fromARGB(255, 255, 255, 255)),
              SizedBox(height: 10),
              SignInButton(
                snsId: 1,
                text: 'メールアドレスでサインイン',
                icon: Icons.mail_outline_outlined,
                bordercolor: Color.fromARGB(255, 255, 255, 255),
                backgroundcolor: Color.fromARGB(255, 0, 166, 255),
                textColor: Color.fromARGB(255, 255, 255, 255),
              ),
              SizedBox(height: 10),
              SignInButton(
                snsId: 2,
                text: 'Appleでサインイン',
                icon: Icons.app_registration_outlined,
                bordercolor: Color.fromARGB(255, 0, 0, 0),
                backgroundcolor: Color.fromARGB(255, 255, 255, 255),
                textColor: Color.fromARGB(255, 0, 0, 0),
              ),
              SignInSupportButton(),
              UsePrivacyPolicyButton(),
            ],
          ),
        )
      ],
    );
  }
}

class SignInButton extends StatelessWidget {
  final int snsId;
  final String text;
  final IconData icon;
  final Color bordercolor;
  final Color backgroundcolor;
  final Color textColor;

  const SignInButton({
    Key? key,
    required this.snsId,
    required this.text,
    required this.icon,
    required this.backgroundcolor,
    required this.textColor,
    required this.bordercolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        backgroundColor: backgroundcolor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        side: BorderSide(
          width: 2,
          color: bordercolor,
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: textColor),
          SpaceBox.width(30),
          Text(
            text,
            style: TextStyle(
                fontSize: 17, color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      onPressed: () {
        if (snsId == 0) {
          null;
        } else if (snsId == 1) {
          null;
        } else {
          null;
        }
      },
    );
  }
}

class SignInToSnsPage extends StatelessWidget {
  const SignInToSnsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
