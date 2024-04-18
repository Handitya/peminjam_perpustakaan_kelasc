import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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

  add() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(
          Endpoint.register,
          data:{
            "username": usernameController.text.toString(),
            "password": passwordController.text.toString(),
            "nama": namaController.text.toString(),
            "telp": telpController.text.toString(),
            "alamat": alamatController.text.toString(),
          },
        );
        Get.snackbar("SUCCESS", "Berhasil mendaftarkan akun", backgroundColor: Colors.green);
        Get.toNamed(Routes.LOGIN);
      }
    } catch (e) {
      loading(false);
      if (e is dio.DioException) {
        loading(false);
        if (e.response != null) {
          if (e.response?.data != null) {
            Get.snackbar(
              "Sorry",
              "${e.response?.data['message']}",
              backgroundColor: Colors.orange,
            );
          }
        } else {
          Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
        }
      } else {
        loading(false);
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    } finally {
      loading(false);
    }
  }
}
