import 'package:get/get.dart';

enum NUM { FIRST, SECOND }

class User {
  String? name;
  int? age;

  //초기값을 받을 수 있도록 해줘도 되고 안해줘도 된다.
  User({this.name, this.age});
}

//반응형 상태관리는 extend로 GetxController를 넣지 않아도 됌
//반응형 상태관리의 경우에는 evnet trigger를 할 수 있는데 GetxController를 상속 받아야함.
class CountControllerWithReactive extends GetxController {
  // 옆에 .obs를 찍고 Rx형태로 변수를 바꿔주면 옵저버를 심어서 변화를 자동으로 감지 할 수 있다.
  RxInt count = 0.obs;
  //enum type에 경우 Rx<>형태에 초기 형태를 대입해주면 된다.
  Rx<NUM> nums = NUM.FIRST.obs;
  Rx<User> user = User(name: "개남", age: 25).obs;
  //RxList 초기값을 넣어줄때는 초기값이 List type에 맞게 넣어준다.
  RxList<String> list = [""].obs;
  void increase() {
    count++;

    nums(NUM.SECOND);
    //Rx<class> 타입을 바꾸려려면 아래와 같이 class를 통째로 넣어줘도 되고,
    user(User());
    //.update를 써서 바꿔줘도 된다
    user.update((_user) {
      _user!.name = "개발하는 남자";
    });

    //Rxlist 값 바꾸기 .add , addall 을 사용해 주면 된다.
    // list.add();
    // list.addAll();
    //addIf는 앞에는 조건문을 넣어주고 뒤에는 추가할 값을 넣어준다.
    list.addIf(user.value.name == "개발하는 남자", "okay");
  }

  void putNumber(int value) {
    //count = value 보통 이런식으로 하는데
    //obs같은 경우는 아래와 같이 한다.
    count(value);
  }

  //GetxController에는 life cycle이 있음 ( oninit, onclose, ondelete가 있음 )

  @override
  void onInit() {
    //ever같은 경우는 매번 값이 호출될 때마다 매번 호출(여기서는 count가 바뀔 때 마다, 반응형 상태일때만 가능)
    ever(count, (_) => print('매번 호출'));
    //once는 한 번만 호출하고 그 뒤로 호출 되지 않음.
    once(count, (_) => print('한 번만 호출'));
    //debounce는 아무리 눌러도 호출되지 않다가 마지막 변경에 한 번만 호출 해준다. time을 설정해줘서 그 시간 만큼 deley 시킨 뒤 호출 시킬 수 있다.
    //debounce는 검색 쪽에 많이 사용 된다. 실시간으로 추천 키워드를 주면 서버에 부하가 될 수 있으니 키를 입력하고 잠깐의 텀을 가질 때 추천 키워드를 추천해줄때 많이 사용한다.
    debounce(count, (_) => print('마지막 변경에 한 번만 호출'),
        time: Duration(seconds: 1));
    //선언한 rx변수의 변화가 감지되는동안 설정한 초마다 interval 하게 호출된다.
    interval(count, (_) => print('변경되고 있는 동안 설정한 시간 마다 호출'),
        time: Duration(seconds: 1));
    super.onInit();
  }
}
