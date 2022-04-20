import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  WithGetX({Key? key}) : super(key: key);
//class가 생성될 때 바로 사용 할 수 있도록 controller로 선언 하기
  CountControllerWithGetx _controllerWithGetx =
      Get.put(CountControllerWithGetx());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "GetX",
          style: TextStyle(fontSize: 30),
        ),
        //Provider에서 Consumer를 썼듯이 Getx에는 Getbuilder가 있다.
        //Provder Consumer의 snapshot을 controller가 해준다.
        GetBuilder<CountControllerWithGetx>(
            id: "first",
            builder: (controller) {
              return Text(
                ' ${controller.count}',
                style: TextStyle(fontSize: 50),
              );
            }),
        GetBuilder<CountControllerWithGetx>(
            id: "second",
            builder: (controller) {
              return Text(
                ' ${controller.count}',
                style: TextStyle(fontSize: 50),
              );
            }),
        //Provider는 context로 찾았지만, Getx는 Get.find로 찾는다.
        //context를 안쓸때의 장점은 이렇게 따로 빼주고서도 사용 할 수 있다.
        _button("first"),
        _button("second"),
      ],
    ));
  }

  Widget _button(String id) {
    return ElevatedButton(
      onPressed: () {
        _controllerWithGetx.increase(id);
      },
      child: Text(
        "+",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
