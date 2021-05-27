import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/style/shadowStyle.dart';
import 'package:ilggun/view/signInPage/component/mainTitle.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _idEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  TextStyle hintStyle() {
    return TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 18,
    );
  }

  TextStyle labelStyle() {
    return TextStyle(
      color: NewColorSet.blue,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );
  }

  bool validTextField(TextEditingController textEditingController) {
    if (textEditingController.isBlank ||
        textEditingController == null ||
        textEditingController.text == "") {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                MainTitle(),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: ShadowStyle.shadow(),
                    ),
                    alignment: Alignment.center,
                    width: Get.size.width * 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _idEditingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: hintStyle(),
                          labelText: "아이디를 입력해주세요",
                          labelStyle: labelStyle(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: ShadowStyle.shadow(),
                    ),
                    alignment: Alignment.center,
                    width: Get.size.width * 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _passwordEditingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: hintStyle(),
                          labelText: "비밀번호를 입력해주세요",
                          labelStyle: labelStyle(),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "비밀번호 / 아이디 찾기",
                        style: TextStyle(
                          color: ColorSet.dark,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/signUpPage');
                        },
                        child: Text(
                          "회원가입",
                          style: TextStyle(
                            color: NewColorSet.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {
            validTextField(_idEditingController) &&
                    validTextField(_passwordEditingController)
                ? print("둘다 입력")
                : print("오류");
          },
          child: Container(
            color: NewColorSet.blue,
            height: 60,
            child: Center(
              child: Text(
                "로그인",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
