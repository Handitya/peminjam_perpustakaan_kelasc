import 'package:get/get.dart';

import '../controllers/book_admin_controller.dart';

class BookAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookAdminController>(
      () => BookAdminController(),
    );
  }
}
