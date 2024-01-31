import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
              child: Column(
                children: [
                  ElevatedButton(onPressed: ()=>Get.toNamed(Routes.BOOK), child: Text("Open Halaman Buku")),
                  ElevatedButton(onPressed: ()=>Get.toNamed(Routes.PEMINJAMAN), child: Text("Open Halaman Peminjaman"))
                ],
              ))),
    );
  }
}
