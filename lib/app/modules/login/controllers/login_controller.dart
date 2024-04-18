import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;


  @override
  void onInit() {
    super.onInit();
    //StorageProvider.write(StorageKey.theme, "white");
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if(status == 'logged'){
      Get.offAllNamed(Routes.HOME);
    }
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      if(formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: {
              "username": usernameController.text.toString(),
              "password": passwordController.text.toString()
            }
        );
        if(response.statusCode == 200){
          // ResponseLogin responseLogin = ResponseLogin();
          String uname = usernameController.text.toString();
          final id = await ApiProvider.instance().get('${Endpoint.UID}/$uname');
          // final ResponseLogin responseLogin =ResponseLogin.fromJson(response.data);

          // responseLogin
          await StorageProvider.write(StorageKey.status, "logged");
          // await StorageProvider.write(StorageKey.UID, response.data['id']);
          // await StorageProvider.write(StorageKey.UID, responseLogin.data!.id!.toString());
          await StorageProvider.write(StorageKey.UID, id.toString());
          final responseRole = await ApiProvider.instance().get('${Endpoint.role}/$uname');
          final role = responseRole.data['role']; // Mengambil nilai role dari respons
          StorageProvider.write(StorageKey.role, role); // Menyimpan nilai role ke penyimpanan lokal

          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
    } on dio.DioError catch (e) {
      if (e.response != null) {
        if (e.response!.data != null) {
          Get.snackbar("Sorry", "${e.response!.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }
}