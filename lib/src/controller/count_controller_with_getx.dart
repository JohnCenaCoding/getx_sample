import 'package:get/get.dart';

//getx도 단순 상태관리는 provider와 비슷함
class CountControllerWithGetx extends GetxController {
  // 어차피 Getxcontroller는 보통 싱글턴 방식이기 때문에 하나밖에 존재 하지 않는다. 그래서 static으로 전역으로 사용하면 편하다.
  static CountControllerWithGetx get to => Get.find();
  //기존
  // int count = 0;
  //Getview에서 Getbuilder를 Obx로 바꾸기 위해 Rx형으로 바꾼 것
  RxInt count = 0.obs;
  void increase(String id) {
    count++;

    //기존
    //provider의 notifylisener와 달리 update를 사용
    // update([id]);

    //Getview에서 Getbuilder를 Obx로 바꾸기 위해 Rx형으로 바꾼 것
    //Rx는 update를 안씀
  }

  void putNumber(int value) {
    //기존
    // count = value;
    // update();

    //Getview에서 Getbuilder를 Obx로 바꾸기 위해 Rx형으로 바꾼 것
    count(value);
  }

  //반응형이 아니고 일반적인 Getxcontroller의 경우에는 ever를 등록할때 위에 count 변수를 등록 할 수 없다. (즉, 반응형 상태관리에서만 ever가 가능하다.)
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
