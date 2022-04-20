import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/home.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //as User(객체)로 형변환 시키기
            Text("${Get.parameters['uid']}"), //273283

            Text("${Get.parameters['name']}") //개남
            ,
            Text("${Get.parameters['age']}"), //22
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("뒤로 이동"),
            ),
          ],
        ),
      ),
    );
  }
}
