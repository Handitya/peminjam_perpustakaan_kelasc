import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/settingAdmin_controller.dart';

class SettingAdminView extends GetView<SettingAdminController> {
  const SettingAdminView({Key? key}) : super(key: key);
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
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  StorageProvider.write(StorageKey.status, "");
                  Get.snackbar("SUCCESS", "Berhasil Logout!", backgroundColor: Colors.green);
                  Get.toNamed(Routes.LOGIN);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Ubah warna latar belakang menjadi merah
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: Text("LOGOUT", style: TextStyle(color: Colors.white, fontSize: 18)), // Ubah warna teks menjadi putih untuk kontras yang baik
              ),
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
          currentIndex: Get.find<SettingAdminController>().tabIndex.value,
          onTap: (index) {
            Get.find<SettingAdminController>().changeTabIndex(index);
            switch (index) {
              case 0:
                Get.offNamed(Routes.HOME_ADMIN);
                break;
              case 1:
                Get.offNamed(Routes.BOOK_ADMIN);
                break;
              case 2:
                Get.offNamed(Routes.SETTING_ADMIN);
                break;
            }
          },
        ),
      ),
    );
  }
}
