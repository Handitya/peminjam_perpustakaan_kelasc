import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_login.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;

  @override
  void onReady() {
    super.onReady();
    String? status = StorageProvider.read(StorageKey.status);
    log("status: $status");
    if (status == "logged") {
      Get.offAllNamed(Routes.HOME);
    }
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      if (formKey.currentState!.validate()) {
        formKey.currentState?.save();
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap({
              "username": usernameController.text.toString(),
              "password": passwordController.text.toString()
            }));
        if (response.statusCode == 200) {
          final ResponseLogin responLogin =
          ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(
              StorageKey.idUser, responLogin.data!.id!.toString());
          await Get.offAllNamed(Routes.HOME); // Tambahkan await di sini
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
    } on dio.DioError catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.toString(), backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }
}
