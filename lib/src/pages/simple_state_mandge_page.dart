import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_getx.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_provider.dart';
import 'package:getx_sample_route_manage/src/pages/state/with_getx.dart';
import 'package:getx_sample_route_manage/src/pages/state/with_provider.dart';
import 'package:provider/provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Getx는 Get.put으로 인스턴스화를 할 수 있다. 이렇게만 해놓으면 어디서든지 사용이 가능하다.
    // Get.put(CountControllerWithGetx());
    return Scaffold(
      appBar: AppBar(
        title: Text('단순상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: WithGetX()),
            Expanded(
                child: ChangeNotifierProvider<CountControllerWithProvider>(
              create: (context) => CountControllerWithProvider(),
              child: WithProvider(),
            )),
          ],
        ),
      ),
    );
  }
}
