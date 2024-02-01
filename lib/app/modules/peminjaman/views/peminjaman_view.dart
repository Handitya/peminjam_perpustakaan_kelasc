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
        ),
        body: controller.obx((state) => ListView.separated(
              itemCount: state!.length,
              itemBuilder: (context, index) {
                DataPinjam dataPinjam = state[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            Colors.grey), // Atur warna garis sesuai kebutuhan
                    borderRadius: BorderRadius.circular(
                        8.0), // Atur sudut border sesuai kebutuhan
                  ),
                  padding: EdgeInsets.all(8.0), // Atur padding sesuai kebutuhan
                  child: ListTile(
                    title: Text("${dataPinjam.book?.judul}"),
                    subtitle: Text(
                        "${dataPinjam.book?.penulis}\n\nTanggal Pinjam:  ${dataPinjam.tanggalPinjam}\nTanggal Kembali: ${dataPinjam.tanggalKembali}"),
                    trailing: Text("${dataPinjam.status}"),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            )));
  }
}
