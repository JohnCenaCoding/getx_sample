import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_route_manage/src/controller/dependency_controller.dart';
import 'package:getx_sample_route_manage/src/pages/dependencys/get_lazyput.dart';
import 'package:getx_sample_route_manage/src/pages/dependencys/get_put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의존성 주입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //GetPut페이지로 보낼때 binding이라는 것을 할 텐데 여기서 binding은 다른 페이지로 이동할때 보내줄 controller를 주입하는 것을 의미한다.
                //BindingsBuilder를 이용해서 필요한 의존성들을 어떤 식으로 주입할지 정의를 내려준다.
                //Get.put 같은 경우에는 이 페이지로 들어감과 동시에 인스턴스화 시킨다.
                Get.to(() => GetPut(), binding: BindingsBuilder(() {
                  Get.put(DependencyController());
                }));
              },
              child: Text("GetPut"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => GetLazyPut(), binding: BindingsBuilder(() {
                  //lazyPut은 builder를 사용한다.
                  Get.lazyPut<DependencyController>(
                      () => DependencyController());
                }));
              },
              child: Text("Get.lazyPut"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => GetPut(), binding: BindingsBuilder(() {
                  Get.putAsync<DependencyController>(() async {
                    await Future.delayed(Duration(seconds: 3));
                    return DependencyController();
                  });
                }));
              },
              child: Text("Get.putAsync"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => GetPut(), binding: BindingsBuilder(() {
                  Get.create<DependencyController>(
                      () => DependencyController());
                }));
              },
              child: Text("Get.create"),
            ),
          ],
        ),
      ),
    );
  }
}
