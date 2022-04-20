import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/pages/dependencys/dependency_manage_page.dart';
import 'package:getx_sample_route_manage/src/pages/nomal/first.dart';
import 'package:getx_sample_route_manage/src/pages/reactive_state_mandge_page.dart';
import 'package:getx_sample_route_manage/src/pages/simple_state_mandge_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => FirstPage());
              },
              child: Text("일반적인 라우트 전환"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/first");
              },
              child: Text("Named 라우트 전환"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/next", arguments: User("개남", 22));
              },
              child: Text("argument 전달"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/user/273283?name=개남&age=22");
              },
              child: Text("동적 url전달"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SimpleStateManagePage());
              },
              child: Text("단순상태관리"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ReactiveStateManagePage());
              },
              child: Text("반응형상태관리"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => DependencyManagePage());
              },
              child: Text("의존성 관리"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/binding');
              },
              child: Text("바인딩"),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String? name;
  final int? age;
  User(this.name, this.age);
}
