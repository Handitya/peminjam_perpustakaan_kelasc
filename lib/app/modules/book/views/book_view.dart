import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIST BOOK'),
        centerTitle: true,
      ),
      body: controller.obx(
            (state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            DataBook dataBook = state[index];
            return ListTile(
              title: Text("${dataBook.judul}"),
              subtitle: Text(
                  "Penulis ${dataBook.penulis}\n${dataBook.penerbit}-${dataBook.tahunTerbit}"),
              trailing: ElevatedButton(
                onPressed: () => Get.toNamed(
                  Routes.ADD_PEMINJAMAN,
                  parameters: {
                    'id': (dataBook.id ?? 0).toString(),
                    'judul': dataBook.judul ?? '-',
                  },
                ),
                child: const Text("ADD"),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
        onLoading: const Center(child: CupertinoActivityIndicator()),
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
          currentIndex: Get.find<BookController>().tabIndex.value,
          onTap: (index) {
            Get.find<BookController>().changeTabIndex(index);
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
