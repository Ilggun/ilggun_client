import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/view/addPage/addPage.dart';
import 'package:ilggun/view/detailPage/detailPage.dart';
import 'package:ilggun/view/homePage/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const MaterialColor white = const MaterialColor(
      0xFFFFFFFF,
      const <int, Color>{
        50: const Color(0xFFFFFFFF),
        100: const Color(0xFFFFFFFF),
        200: const Color(0xFFFFFFFF),
        300: const Color(0xFFFFFFFF),
        400: const Color(0xFFFFFFFF),
        500: const Color(0xFFFFFFFF),
        600: const Color(0xFFFFFFFF),
        700: const Color(0xFFFFFFFF),
        800: const Color(0xFFFFFFFF),
        900: const Color(0xFFFFFFFF),
      },
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/detailPage',
          page: () => DetailPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/addPage',
          page: () => AddPage(),
          transition: Transition.fadeIn,
        )
      ],
    );
  }
}
