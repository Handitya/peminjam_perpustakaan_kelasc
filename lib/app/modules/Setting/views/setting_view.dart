import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
        margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  StorageProvider.write(StorageKey.status, "");
                  Get.snackbar("SUCCESS", "Berhasil Logout!", backgroundColor: Colors.green);
                  Get.toNamed(Routes.LOGIN);
                } ,
                    child: Text("LOGOUT")),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: Get.find<SettingController>().tabIndex.value,
          onTap: (index) {
            Get.find<SettingController>().changeTabIndex(index);
            switch (index) {
              case 0:
                Get.offNamed(Routes.HOME);
                break;
              case 1:
                Get.offNamed(Routes.BOOK);
                break;
              case 2:
                Get.offNamed(Routes.SETTING);
                break;
            }
          },
        ),
      ),
    );
  }
}
