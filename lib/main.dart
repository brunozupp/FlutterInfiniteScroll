import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll_with_getx/application/bindings/application_binding.dart';
import 'package:flutter_infinite_scroll_with_getx/modules/home/binding/home_binding.dart';
import 'package:flutter_infinite_scroll_with_getx/modules/home/view/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/', 
          page: () => HomePage(Get.find()),
          binding: HomeBinding()
        ),
      ],
    );
  }
}