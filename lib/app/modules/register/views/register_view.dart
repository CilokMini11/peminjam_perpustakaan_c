import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nama,
                  decoration: InputDecoration(hintText: "Masukan nama"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.username,
                  decoration: InputDecoration(hintText: "Masukan username"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.telp,
                  decoration: InputDecoration(hintText: "Masukan Telp"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Telpon tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.alamat,
                  decoration: InputDecoration(hintText: "Masukan Alamat"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Alamat tidak boleh kosong";
                    }
                    return null;
                  },
                ), TextFormField(
                  controller: controller.password,
                  decoration: InputDecoration(hintText: "Masukan Password"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                    onPressed: () {
                      controller.getReg();
                    },
                    child: Text("Register")))
              ],
            ),
          )
      ),
    );
  }
}
