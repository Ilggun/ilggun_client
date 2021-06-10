import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/style/shadowStyle.dart';
import 'package:ilggun/style/textStyle.dart';
import 'package:ilggun/view/singUpPage/component/mainTitle.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _mailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _passwordCheck;

  bool _emailCheck;
  bool _phoneCheck;

  bool validTextField(TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController == null ||
        textEditingController.text == "") {
      return false;
    } else {
      return true;
    }
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validatePhone(String value) {
    Pattern pattern = r'^\d{3}\d{3,4}\d{4}$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  void initState() {
    _passwordCheck = false;
    _emailCheck = false;
    _phoneCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  MainTitle(),
                  const SizedBox(height: 100),
                  _buildIDArea(),
                  const SizedBox(height: 30),
                  _buildPasswordArea(),
                  const SizedBox(height: 10),
                  _buildPasswordCheckArea(),
                  const SizedBox(height: 10),
                  _buildPasswordCheckWidget(),
                  const SizedBox(height: 30),
                  _buildNameArea(),
                  const SizedBox(height: 30),
                  _buildPhoneArea(),
                  const SizedBox(height: 10),
                  _buildPhoneCheckWidget(),
                  const SizedBox(height: 30),
                  _buildMailArea(),
                  const SizedBox(height: 10),
                  _buildEmailCheckWidget(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {
            Get.offAndToNamed('/homePageTemp');
          },
          child: Container(
            color: NewColorSet.blue,
            height: 60,
            child: Center(
              child: Text(
                "회원가입",
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

  Widget _buildPasswordCheckWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 50,
        ),
        child: Text(
          _passwordCheck ? "비밀번호가 일치합니다" : "비밀번호가 일치하지 않습니다",
          style: TextStyle(
            color: _passwordCheck ? NewColorSet.blue : NewColorSet.red,
          ),
        ),
      ),
    );
  }

  Widget _buildEmailCheckWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 50,
        ),
        child: Text(
          _emailCheck ? "이메일 형식이 올바릅니다" : "이메일 형식이 올바르지 않습니다.",
          style: TextStyle(
            color: _emailCheck ? NewColorSet.blue : NewColorSet.red,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneCheckWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 50,
        ),
        child: Text(
          _phoneCheck
              ? "휴대폰 번호 형식이 올바릅니다"
              : "휴대폰 번호 형식이 올바르지 않습니다.\nex. 01000000000",
          style: TextStyle(
            color: _phoneCheck ? NewColorSet.blue : NewColorSet.red,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget _buildIDArea() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: ShadowStyle.shadow(),
            ),
            alignment: Alignment.center,
            width: Get.size.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: _idController,
                validator: (name) {
                  if (name.isEmpty) {
                    return "아이디를 입력하세요";
                  }
                  return null;
                },
                onSaved: (name) => _idController.text = name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "아이디",
                  labelStyle: TextStyleSet.labelStyle(),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print(_nameController.text);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: NewColorSet.blue,
              ),
              width: Get.size.width * 0.2,
              height: 50,
              child: Center(
                child: Text(
                  "확인",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordArea() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: ShadowStyle.shadow(),
            ),
            alignment: Alignment.center,
            width: Get.size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: _passwordController,
                onChanged: (value) {
                  if (_passwordController.text ==
                      _passwordCheckController.text) {
                    setState(() {
                      _passwordCheck = true;
                    });
                  } else {
                    setState(() {
                      _passwordCheck = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "비밀번호",
                  labelStyle: TextStyleSet.labelStyle(),
                ),
                obscureText: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordCheckArea() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: ShadowStyle.shadow(),
            ),
            alignment: Alignment.center,
            width: Get.size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: _passwordCheckController,
                onChanged: (value) {
                  if (_passwordController.text ==
                      _passwordCheckController.text) {
                    setState(() {
                      _passwordCheck = true;
                    });
                  } else {
                    setState(() {
                      _passwordCheck = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "비밀번호 재입력",
                  labelStyle: TextStyleSet.labelStyle(),
                ),
                obscureText: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameArea() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: ShadowStyle.shadow(),
            ),
            alignment: Alignment.center,
            width: Get.size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: _nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "이름",
                  labelStyle: TextStyleSet.labelStyle(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneArea() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: ShadowStyle.shadow(),
            ),
            alignment: Alignment.center,
            width: Get.size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  if (validatePhone(value)) {
                    setState(() {
                      _phoneCheck = true;
                    });
                  } else {
                    setState(() {
                      _phoneCheck = false;
                    });
                  }
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: _phoneController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "휴대폰 번호",
                  labelStyle: TextStyleSet.labelStyle(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMailArea() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: ShadowStyle.shadow(),
            ),
            alignment: Alignment.center,
            width: Get.size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  if (validateEmail(value)) {
                    setState(() {
                      _emailCheck = true;
                    });
                  } else {
                    setState(() {
                      _emailCheck = false;
                    });
                  }
                },
                controller: _mailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "이메일",
                  labelStyle: TextStyleSet.labelStyle(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
