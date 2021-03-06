import 'package:flutterpj/controller/login_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterpj/constants.dart';

class model_memo {
  static String FLAG = 'BL';
  String baseUrl = base_url;

  ///paginate
  Future count_memo_paginate(
      String key_cari, String start_date, String end_date) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_memo_paginate"),
      body: {"cari": key_cari, "tglawal": start_date, "tglakhir": end_date},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT HEADER
  Future<List> data_memo_paginate(String cari, String start_date,
      String end_date, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/memo_paginate"),
      body: {
        "cari": cari,
        "tglawal": start_date,
        "tglakhir": end_date,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT DETAIL
  Future<List> select_memo_detail(
      String no_bukti, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": no_bukti, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> insert_memo(Map data_insert) async {
    try {
      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_memo"),
        body: {
          "nobukti": data_insert['no_bukti'].toString(),
          "tgl": data_insert['tanggal'].toString(),
          "per": "01/2022",
          "flag": FLAG,
          "ket": data_insert['keterangan'].toString(),
          "user": LoginController().nama_staff.toString(),
          "debet": data_insert['debet'].toString(),
          "kredit": data_insert['kredit'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,ACNO,NACNO,URAIAN,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_memo"),
          body: {
            "rec": (i + 1).toString(),
            "nobukti": data_insert['no_bukti'].toString(),
            "per": "01/2022",
            "flag": FLAG,
            "acno": data_detail[i]['acno'].toString(),
            "nacno": data_detail[i]['nacno'].toString(),
            "uraian": data_detail[i]['uraian'].toString(),
            "debet": data_detail[i]['debet'].toString(),
            "kredit": data_detail[i]['kredit'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> update_memo(Map data_insert) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kolom": "NO_BUKTI",
          "tabel": "memod"
        },
      );

      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/edit_header_memo"),
        body: {
          "nobukti": data_insert['no_bukti'].toString(),
          "tgl": data_insert['tanggal'].toString(),
          "ket": data_insert['keterangan'].toString(),
          "user": LoginController().nama_staff.toString(),
          "debet": data_insert['debet'].toString(),
          "kredit": data_insert['kredit'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,ACNO,NACNO,URAIAN,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_memo"),
          body: {
            "rec": (i + 1).toString(),
            "nobukti": data_insert['no_bukti'].toString(),
            "per": "01/2022",
            "flag": FLAG,
            "acno": data_detail[i]['acno'].toString(),
            "nacno": data_detail[i]['nacno'].toString(),
            "uraian": data_detail[i]['uraian'].toString(),
            "debet": data_detail[i]['debet'].toString(),
            "kredit": data_detail[i]['kredit'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> nobukti_memo(String tgl) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/nobukti_memo"),
      body: {"tgl": tgl},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> get_no_bukti(
      String kode, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/check_no_bukti"),
      body: {"cari": kode, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> delete_memo(String no_bukti) async {
    try {
      // Hapus Header
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_header_memo"),
        body: {"no_bukti": no_bukti},
      );
      // Hapus detail
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail_memo"),
        body: {"no_bukti": no_bukti},
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
