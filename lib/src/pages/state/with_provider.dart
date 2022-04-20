import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_sample_route_manage/src/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          "Provider",
          style: TextStyle(fontSize: 30),
        ),
        Consumer<CountControllerWithProvider>(
            builder: (context, snapshot, child) {
          return Text(
            "${snapshot.count}",
            style: TextStyle(fontSize: 50),
          );
        }),
        ElevatedButton(
          onPressed: () {
            Provider.of<CountControllerWithProvider>(context, listen: false)
                .intcrease();
          },
          child: Text(
            "+",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    ));
  }
}
