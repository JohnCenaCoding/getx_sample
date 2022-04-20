import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_getx.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_provider.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_reactive.dart';
import 'package:getx_sample_route_manage/src/pages/state/with_getx.dart';
import 'package:getx_sample_route_manage/src/pages/state/with_provider.dart';
import 'package:provider/provider.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());
    return Scaffold(
      appBar: AppBar(
        title: Text('반응형상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GetX",
              style: TextStyle(fontSize: 30),
            ),
            //반응형 상태관리 에서는 obx를 사용해서 obs로 선언한 변수의 변화를 감지했을 때 update를 자동으로 날려준다.
            Obx(() => Text(
                  '${Get.find<CountControllerWithReactive>().count.value}',
                  style: TextStyle(fontSize: 50),
                )),

            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().increase();
              },
              child: Text(
                "+",
                style: TextStyle(fontSize: 30),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().putNumber(5);
              },
              child: Text(
                "5로 변경",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
