import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/style/shadowStyle.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _keyEditingController = TextEditingController();

  TextStyle hintStyle() {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
    );
  }

  TextStyle labelStyle() {
    return TextStyle(
      color: ColorSet.noWarning,
      fontWeight: FontWeight.bold,
      fontSize: 23,
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: ShadowStyle.shadow(),
              ),
              alignment: Alignment.center,
              width: Get.size.width * 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _nameEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "입력하신 내용으로 대시보드에 표기됩니다.",
                    hintStyle: hintStyle(),
                    labelText: "명칭을 입력해 주세요",
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: ShadowStyle.shadow(),
              ),
              alignment: Alignment.center,
              width: Get.size.width * 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _keyEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "제품에 표기된 인증키를 입력해 주세요.",
                    hintStyle: hintStyle(),
                    labelText: "인증키를 입력해 주세요",
                    labelStyle: labelStyle(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {
            validTextField(_nameEditingController) &&
                    validTextField(_keyEditingController)
                ? print("둘다 입력")
                : print("오류");
          },
          child: Container(
            color: ColorSet.noWarning,
            height: 60,
            child: Center(
              child: Text(
                "등록하기",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
