import 'package:get/get.dart';

import '../controllers/settingAdmin_controller.dart';

class SettingAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingAdminController>(
          () => SettingAdminController(),
    );
  }
}