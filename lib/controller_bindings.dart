import 'package:get/instance_manager.dart';
import 'package:user_crud/controller/data_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}
