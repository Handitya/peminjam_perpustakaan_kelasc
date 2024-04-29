import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${Get.parameters['judul']}'),
          centerTitle: true,
        ),
        body: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text("Buku yang dipinjam: ${Get.parameters['judul']}"),
                DateTimePicker(
                  controller: controller.tanggalPinjamController,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Tanggal Pinjam',
                  dateMask: 'yyyy-MM-dd',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                  icon: Icon(Icons.calendar_today),
                ),
                DateTimePicker(
                  controller: controller.tanggalKembaliController,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Tanggal Kembali (<= 2 minggu)',
                  dateMask: 'yyyy-MM-dd',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                  icon: Icon(Icons.calendar_today),
                ),
                Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          controller.addPinjam();
                        },
                        child: Text("Pinjam")))
              ],
            )));
  }
}
