import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/home.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Named page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("뒤로 이동"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/');
              },
              child: Text("홈으로 이동"),
            ),
          ],
        ),
      ),
    );
  }
}
