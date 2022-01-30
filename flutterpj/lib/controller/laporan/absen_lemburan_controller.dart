import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutterpj/config/config.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutterpj/view/base_widget/toast.dart';
import 'package:flutterpj/config/export_pdf.dart';
import 'package:flutterpj/model/laporan/model_laporan.dart';

class AbsenLemburanController with ChangeNotifier {
  model_laporan m_data = model_laporan();
  List data_list = [];
  bool isEnable_button = true;
  int index_terpilih;
  DateTime chooseDate = DateTime.now();
  final format_tanggal = new DateFormat("yyyy-MM-DD");
  TextEditingController tglController = TextEditingController();
  TextEditingController kd_bagController = TextEditingController();

  Future<void> select_data(String KD_BAG) async {
    data_list = await m_data.lap_absen_lemburan(KD_BAG);
    notifyListeners();
  }

  void initData() {
    index_terpilih = null;
    select_data('');
  }

  Future<void> proses_export_absen_lemburan(int mode) async {
    if (data_list.length > 0) {
      BotToast.showLoading();
      List header_excel = [];
      List isi_excel = [];
      header_excel.add("Kode Pegawai");
      header_excel.add("Nama Pegawai");
      header_excel.add("Bagian");
      header_excel.add("Tanggal");
      header_excel.add("U Lembur");
      for (int i = 0; i < data_list.length; i++) {
        Map<String, dynamic> isi_map = <String, dynamic>{};
        isi_map['a'] = data_list[i]['KD_PEG'];
        isi_map['b'] = data_list[i]['NM_PEG'];
        isi_map['c'] = data_list[i]['BAGIAN'];
        isi_map['d'] = tglController.text;
        isi_map['e'] = data_list[i]['ULEMBUR'];
        isi_excel.add(isi_map);
      }
      String judul = "Laporan Absen Lemburan";
      String header_title = "";
      if (mode == 0) {
        config().createExcel3(header_excel, isi_excel, header_title, judul);
      } else {
        ExportPDF(header_excel, isi_excel, judul);
      }
    } else {
      Toast("Tidak ada data untuk di export", "", false);
    }
  }
}
