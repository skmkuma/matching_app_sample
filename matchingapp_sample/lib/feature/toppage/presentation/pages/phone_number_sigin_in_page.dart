import 'package:flutter/material.dart';

class PhoneNumberSignInPage extends StatelessWidget {
  const PhoneNumberSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: const Center(child: Text('data')),
    );
  }
}
