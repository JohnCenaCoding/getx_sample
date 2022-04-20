import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_getx.dart';

class BindingPage extends GetView<CountControllerWithGetx> {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // GetBuilder<CountControllerWithGetx>(builder: (controller) {
          //   return Text('${controller.count}');
          // }),
          //Getview 이용해서 obx로 바꾸기 !(반드시 Rx형으로 바꿔줘야함.)
          Obx(() => Text('${controller.count}')),

          ElevatedButton(
              onPressed: () {
                //원래는 바인딩 되어서 인스턴스로 올린 controller를 screen에서 사용할때 Get.find를 썼었다.
                //근데 <> 도 써줘야 해서 이 Get.find 하는게 너무 귀찮다. 좀 더 간편한 방법이 있다. controller단에서 간편하게 할 수 있다.
                // Get.find<CountControllerWithGetx>().increase('');

                //static을 이용해서 간단하게 만들기
                // CountControllerWithGetx.to.increase('');

                controller.increase('id');
              },
              child: Text('+'))
        ],
      ),
    );
  }
}
