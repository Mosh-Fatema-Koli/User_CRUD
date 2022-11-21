import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_crud/controller/data_controller.dart';
import 'package:user_crud/loading/custom_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Api Calling'),
      ),
      body: Obx(() => controller.isLoading
          ? const Center(
              child: CustomLoadingAPI(),
            )
          : ListView.builder(
              itemCount: controller.userModel.data.length,
              itemBuilder: (_, index) {
                return Card(
                  elevation: 10,
                  child: Container(
                    height: 150,
                    child: Column(
                      children: [
                        Text(
                          controller.userModel.data.first.firstName.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }
}
