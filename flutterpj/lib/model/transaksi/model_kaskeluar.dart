import 'package:flutterpj/mysql/koneksi_mysql.dart';
import 'package:flutterpj/controller/login_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutterpj/constants.dart';

class model_kaskeluar {
  static String tipe = 'BKK';
  koneksi_mysql m_koneksi = koneksi_mysql();
  String baseUrl = base_url;

  ///paginate
  Future count_kaskeluar_paginate(
      String key_cari, String start_date, String end_date) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_kaskeluar_paginate"),
      body: {"cari": key_cari, "tglawal": start_date, "tglakhir": end_date},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT HEADER
  Future<List> data_kaskeluar_paginate(String cari, String start_date,
      String end_date, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/kaskeluar_paginate"),
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
  Future<List> select_kaskeluar_detail(
      String no_bukti, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": no_bukti, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> insert_kaskeluar(Map data_insert) async {
    try {
      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_kas"),
        body: {
          "nobukti": data_insert['no_bukti'].toString(),
          "tgl": data_insert['tanggal'].toString(),
          "per": "01/2022",
          "tipe": tipe,
          "ket": data_insert['keterangan'].toString(),
          "user": LoginController().nama_staff.toString(),
          "bacno": data_insert['bacno'].toString(),
          "bnama": data_insert['nama'].toString(),
          "jumlah": data_insert['sumjumlah'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,ACNO,NACNO,URAIAN,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_kas"),
          body: {
            "rec": (i + 1).toString(),
            "nobukti": data_insert['no_bukti'].toString(),
            "per": "01/2022",
            "tipe": tipe,
            "acno": data_detail[i]['acno'].toString(),
            "nacno": data_detail[i]['nacno'].toString(),
            "uraian": data_detail[i]['uraian'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> update_kaskeluar(Map data_insert) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kolom": "NO_BUKTI",
          "tabel": "kasd"
        },
      );

      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/edit_header_kas"),
        body: {
          "nobukti": data_insert['no_bukti'].toString(),
          "tgl": data_insert['tanggal'].toString(),
          "ket": data_insert['keterangan'].toString(),
          "user": LoginController().nama_staff.toString(),
          "bacno": data_insert['bacno'].toString(),
          "bnama": data_insert['nama'].toString(),
          "jumlah": data_insert['sumjumlah'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,ACNO,NACNO,URAIAN,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_kas"),
          body: {
            "rec": (i + 1).toString(),
            "nobukti": data_insert['no_bukti'].toString(),
            "per": "01/2022",
            "tipe": tipe,
            "acno": data_detail[i]['acno'].toString(),
            "nacno": data_detail[i]['nacno'].toString(),
            "uraian": data_detail[i]['uraian'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> nobukti_kas(String tgl) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/nobukti_kaskeluar"),
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

  Future<List> delete_kaskeluar_header(String no_bukti) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_header_kas"),
      body: {"no_bukti": no_bukti},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<bool> delete_kaskeluar(String no_bukti) async {
    try {
      // Hapus Header
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_header_kaskeluar"),
        body: {"no_bukti": no_bukti},
      );
      // Hapus detail
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail_kaskeluar"),
        body: {"no_bukti": no_bukti},
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
