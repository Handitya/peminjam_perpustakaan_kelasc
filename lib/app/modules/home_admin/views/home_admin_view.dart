import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TreasureBook'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun widget ke tengah
          children: [
            Image.asset("assets/home.png"),
            SizedBox(height: 20),
            Text(
              "“Ada lebih banyak harta karun di dalam buku \ndaripada disemua jarahan bajak laut di Pulau \nHarta Karun.”",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Menyesuaikan ukuran tombol
              ),
              child: Text(
                "Pinjaman Saya",
                style: TextStyle(fontSize: 18), // Menyesuaikan ukuran teks tombol
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
          currentIndex: Get.find<HomeAdminController>().tabIndex.value,
          onTap: (index) {
            Get.find<HomeAdminController>().changeTabIndex(index);
            switch (index) {
              case 0:
                Get.offNamed(Routes.HOME_ADMIN);
                break;
              case 1:
                Get.offNamed(Routes.BOOK_ADMIN);
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
