import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tanggalPinjamController = TextEditingController();
  final TextEditingController tanggalKembaliController =
      TextEditingController();
  final loading = false.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addPinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        // Parse tanggal_pinjam and tanggal_kembali to DateTime objects
        DateTime tanggalPinjam = DateTime.parse(tanggalPinjamController.text);
        DateTime tanggalKembali = DateTime.parse(tanggalKembaliController.text);

        // Calculate the difference in days between tanggalPinjam and tanggalKembali
        int differenceInDays = tanggalKembali.difference(tanggalPinjam).inDays;

        // Check if the difference is more than 14 days (2 weeks)
        if (differenceInDays <= 14) {
          final response = await ApiProvider.instance().post(Endpoint.pinjam, data: {
            "user_id": int.parse(StorageProvider.read(StorageKey.UID)),
            "book_id": int.parse(Get.parameters['id'].toString()),
            "tanggal_pinjam": tanggalPinjamController.text.toString(),
            "tanggal_kembali": tanggalKembaliController.text.toString()
          });
          if (response.statusCode == 201) {
            Get.back();
          } else {
            Get.snackbar("Sorry", "Simpan Gagal", backgroundColor: Colors.orange);
          }
        } else {
          Get.snackbar("Sorry", "Batas waktu pengembalian maksimal adalah 2 minggu (14 hari)", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      throw Exception('Error $e');
    }
  }

  void increment() => count.value++;
}
