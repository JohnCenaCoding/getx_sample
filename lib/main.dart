import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/binding/binding_page.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_getx.dart';
import 'package:getx_sample_route_manage/src/controller/dependency_controller.dart';
import 'package:getx_sample_route_manage/src/home.dart';
import 'package:getx_sample_route_manage/src/pages/binding.dart';
import 'package:getx_sample_route_manage/src/pages/next.dart';
import 'package:getx_sample_route_manage/src/pages/nomal/named/first.dart';
import 'package:getx_sample_route_manage/src/pages/nomal/named/second.dart';
import 'package:getx_sample_route_manage/src/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: "/first",
            page: () => FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/second",
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/next", page: () => NextPage(), transition: Transition.zoom),
        GetPage(
            name: "/user/273283",
            page: () => UserPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/binding",
            page: () => BindingPage(),
            binding: BindingPageBinding())
      ],
    );
  }
}
