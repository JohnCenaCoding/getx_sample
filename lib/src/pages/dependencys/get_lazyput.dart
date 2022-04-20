import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/controller/dependency_controller.dart';

class GetLazyPut extends StatelessWidget {
  const GetLazyPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () {
          Get.find<DependencyController>().increase();
        },
        child: Text("Get.find"),
      ),
    );
  }
}
