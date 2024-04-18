import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_pinjam.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Fungsi untuk kembali ke halaman sebelumnya
            Get.back();
          },
        ),
      ),
      body: controller.obx((state) => ListView.separated(
        itemCount: state!.length,
        itemBuilder: (context, index) {
          DataPinjam dataPinjam = state[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("${dataPinjam.book?.judul}"),
              subtitle: Text(
                "${dataPinjam.book?.penulis}\n\nTanggal Pinjam:  ${dataPinjam.tanggalPinjam}\nTanggal Kembali: ${dataPinjam.tanggalKembali}",
              ),
              trailing: Text("${dataPinjam.status}"),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      )),
    );
  }
}
