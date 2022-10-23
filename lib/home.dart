import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_crud/controller/data_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<Controller>();
    return Scaffold(
      body: Obx(
        () => _controller.isLoading.value
            ? const CircularProgressIndicator()
            : Center(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: _controller.userList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.red,
                          width: 100,
                          height: 100,
                          padding: EdgeInsets.all(10),
                          child: Text(
                              '${_controller.userList[0].data?.first.firstName}'),
                        );
                      },
                    )),
              ),
      ),
    );
  }
}
