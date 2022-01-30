import 'package:flutterpj/mysql/koneksi_mysql.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterpj/constants.dart';

class model_harian {
  static String table = 'hrd_absen';
  static String table_detail = 'hrd_absend';
  koneksi_mysql m_koneksi = koneksi_mysql();
  String baseUrl = base_url;

  ///paginate
  Future count_harian_paginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/count_harian_paginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  /// paginate
  Future<List> data_harian_paginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/harian_paginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> insert_harian(Map data_insert) async {
    try {
      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_harian"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kd_bag": data_insert['kd_bag'].toString(),
          "nm_bag": data_insert['nm_bag'].toString(),
          "kd_grup": data_insert['kd_grup'].toString(),
          "nm_grup": data_insert['nm_grup'].toString(),
          "notes": data_insert['notes'].toString(),
          "dr": data_insert['dr'].toString(),
          "flag": data_insert['flag'].toString(),
          "per": data_insert['per'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_harian"),
          body: {
            "no_bukti": data_insert['no_bukti'].toString(),
            "flag": data_insert['flag'].toString(),
            "kd_bag": data_detail[i]['kd_bag'].toString(),
            "nm_bag": data_detail[i]['nm_bag'].toString(),
            "kd_peg": data_detail[i]['kd_peg'].toString(),
            "nm_peg": data_detail[i]['nm_peg'].toString(),
            "kd_grup": data_detail[i]['kd_grup'].toString(),
            "nm_grup": data_detail[i]['nm_grup'].toString(),
            "dr": data_detail[i]['dr'].toString(),
            "ptkp": data_detail[i]['ptkp'].toString(),
            "hr": data_detail[i]['hr'].toString(),
            "jam1": data_detail[i]['jam1'].toString(),
            "jam2": data_detail[i]['jam2'].toString(),
            "jam1rp": data_detail[i]['jam1rp'].toString(),
            "jam2rp": data_detail[i]['jam2rp'].toString(),
            "lain": data_detail[i]['lain'].toString(),
            "insentifbulanan": data_detail[i]['insentifbulanan'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
            "per": data_detail[i]['per'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> update_harian(Map data_insert) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kolom": "no_bukti",
          "tabel": "hrd_absend"
        },
      );

      ///DATA HEADER
      ///AMBIL DARI CONTROLLER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/edit_header_harian"),
        body: {
          "no_bukti": data_insert['no_bukti'].toString(),
          "kd_bag": data_insert['kd_bag'].toString(),
          "nm_bag": data_insert['nm_bag'].toString(),
          "notes": data_insert['notes'].toString(),
        },
      );

      ///DATA DETAIL
      ///AMBIL DARI CONTROLLER
      // PER,TYPE,kd_peg,nm_peg,ptkp,JUMLAH
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_harian"),
          body: {
            "no_bukti": data_insert['no_bukti'].toString(),
            "flag": data_insert['flag'].toString(),
            "kd_bag": data_detail[i]['kd_bag'].toString(),
            "nm_bag": data_detail[i]['nm_bag'].toString(),
            "kd_peg": data_detail[i]['kd_peg'].toString(),
            "nm_peg": data_detail[i]['nm_peg'].toString(),
            "kd_grup": data_detail[i]['kd_grup'].toString(),
            "nm_grup": data_detail[i]['nm_grup'].toString(),
            "dr": data_detail[i]['dr'].toString(),
            "ptkp": data_detail[i]['ptkp'].toString(),
            "hr": data_detail[i]['hr'].toString(),
            "jam1": data_detail[i]['jam1'].toString(),
            "jam2": data_detail[i]['jam2'].toString(),
            "jam1rp": data_detail[i]['jam1rp'].toString(),
            "jam2rp": data_detail[i]['jam2rp'].toString(),
            "lain": data_detail[i]['lain'].toString(),
            "insentifbulanan": data_detail[i]['insentifbulanan'].toString(),
            "jumlah": data_detail[i]['jumlah'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
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

  ///SELECT DETAIL
  Future<List> select_harian_detail(
      String no_bukti, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": no_bukti, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> delete_harian(String no_bukti) async {
    var konek = await m_koneksi.koneksi();
    var results1 =
        await konek.query("delete from $table where no_bukti = '$no_bukti';");
    var results2 = await konek
        .query("delete from $table_detail where no_bukti = '$no_bukti';");
    await konek.close();
    return results2.toList();
  }
}
