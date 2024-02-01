import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_c/app/data/model/reponse_peminjaman.dart';
import 'package:peminjam_perpustakaan_c/app/data/provider/storage_provider.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPeminjaman>>{

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getPinjam();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPinjam() async {
    change(null,status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get("${Endpoint.pinjam}/${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 200) {
        final ReponsePeminjaman responseBook = ReponsePeminjaman.fromJson(response.data);
        if(responseBook.data!.isEmpty){
          change(null,status: RxStatus.empty());
        }
        else {
          change(responseBook.data,status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null,status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null,status: RxStatus.error(e.toString()));
    }
  }
}
