import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_c/app/data/model/reponse_peminjaman.dart';
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
    DataPeminjaman dataPinjam = state[index];
    return ListTile(
    title: Center(child: Text("Peminjaman")),
    subtitle: Center(
    child: Text(
    "${dataPinjam.book?.judul}\n${dataPinjam.book?.penulis}\n${dataPinjam.tanggalPinjam}\n${dataPinjam.tanggalKembali}"),
    ),
    leading: Icon(Icons.book_rounded,color: Colors.blue,),
    );
    },
    separatorBuilder: (context, index) => Divider(),
    ),onLoading: Center(child: CupertinoActivityIndicator())
    ),
    );
  }
}
