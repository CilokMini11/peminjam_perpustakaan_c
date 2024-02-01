import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

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
      body: Center(
          child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Text("Buku yang dipinjam : ${Get.parameters['judul']}"),
            DateTimePicker(
              controller: controller.tgl_pinjam,
              dateMask: 'yyyy-MM-dd',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Tanggal pinjam',
              onChanged: (val) => print(val),
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => print(val),
            ),
            DateTimePicker(
              controller: controller.tgl_kembali,
              dateMask: 'yyyy-MM-dd',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Tanggal Kembali',
              onChanged: (val) => print(val),
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => print(val),
            ),
            Obx(() => controller.loading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      controller.Pinjam();
                    },
                    child: Text("Pinjam")))
          ],
        ),
      )),
    );
  }
}
