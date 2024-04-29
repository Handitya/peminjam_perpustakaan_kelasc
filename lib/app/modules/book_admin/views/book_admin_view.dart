import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/model/response_book.dart';

import '../../../routes/app_pages.dart';
import '../controllers/book_admin_controller.dart';

class BookAdminView extends GetView<BookAdminController> {
  const BookAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookView'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_BOOK),
          child: Icon(Icons.add),
        ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            DataBook dataBook = state[index];
            return ListTile(
              title: Text("${dataBook.judul}"),
              subtitle: Text(
                  "Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}"),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        )),
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
          currentIndex: Get.find<BookAdminController>().tabIndex.value,
          onTap: (index) {
            Get.find<BookAdminController>().changeTabIndex(index);
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

