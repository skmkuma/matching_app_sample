import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneNumberSignInPage extends StatelessWidget {
  final _phoneNumberController = TextEditingController();
  PhoneNumberSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 238, 238, 238),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CupertinoButton(
                      child: const Text(
                        'キャンセル',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(width: 16),
                  const Text('電話番号の入力',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 65),
                  CupertinoButton(
                      child: Text(
                        '確認',
                        style: TextStyle(
                          color: _phoneNumberController.value.text.isEmpty
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                      onPressed: _phoneNumberController.text.isEmpty
                          ? null
                          : () {
                              Navigator.pop(context);
                            }),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    Row(
                      children: const <Widget>[
                        SizedBox(width: 15),
                        Text(
                          '数字',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text('ここに検索メニュー追加'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 15),
                        const Text(
                          '数字',
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            controller: _phoneNumberController,
                            autofocus: true, // 最初からフォーカスを当てる
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              // labelStyle: TextStyle(fontSize: 20),
                              // labelText: '電話番号',
                              hintText: '電話番号',
                            ),
                            keyboardType: TextInputType.phone,
                            onChanged: (text) {
                              setState(
                                  () => _phoneNumberController.text = text);

                              // カーソル位置をcontroller.text.lengthの位置に設定する
                              _phoneNumberController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: _phoneNumberController.text.length),
                              );
                            },
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
