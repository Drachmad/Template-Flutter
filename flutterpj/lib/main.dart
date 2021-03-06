import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutterpj/controller/account_controller.dart';
import 'package:flutterpj/controller/pilih_bagian_controller.dart';
import 'package:flutterpj/controller/pilih_grup_controller.dart';
import 'package:flutterpj/controller/master/hrd_pegawai_controller.dart';
import 'package:flutterpj/controller/master/hrd_bagian_controller.dart';
import 'package:flutterpj/controller/master/hrd_borongan_controller.dart';
import 'package:flutterpj/controller/master/hrd_grup_controller.dart';
import 'package:flutterpj/controller/master/hrd_model_controller.dart';
import 'package:flutterpj/controller/laporan/absen_harian_controller.dart';
import 'package:flutterpj/controller/laporan/absen_lemburan_controller.dart';
import 'package:flutterpj/controller/laporan/lembur_harian_controller.dart';
import 'package:flutterpj/controller/laporan/lembur_borongan_controller.dart';
import 'package:flutterpj/controller/laporan/lembur_perjam_controller.dart';
import 'package:flutterpj/controller/transaksi/kasmasuk_controller.dart';
import 'package:flutterpj/controller/transaksi/kaskeluar_controller.dart';
import 'package:flutterpj/controller/transaksi/bankmasuk_controller.dart';
import 'package:flutterpj/controller/transaksi/bankkeluar_controller.dart';
import 'package:flutterpj/controller/transaksi/memo_controller.dart';
import 'package:flutterpj/controller/home_controller.dart';
import 'package:flutterpj/controller/login_controller.dart';
import 'package:flutterpj/view/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'controller/laporan/absen_harian_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Provider
  sl.registerFactory(() => HomeController());
  sl.registerFactory(() => AccountController());
  sl.registerFactory(() => PilihBagianController());
  sl.registerFactory(() => PilihGrupController());
  sl.registerFactory(() => HRD_PegawaiController());
  sl.registerFactory(() => HRD_BagianController());
  sl.registerFactory(() => HRD_BoronganController());
  sl.registerFactory(() => HRD_GrupController());
  sl.registerFactory(() => HRD_ModelController());
  sl.registerFactory(() => AbsenHarianController());
  sl.registerFactory(() => AbsenLemburanController());
  sl.registerFactory(() => LemburHarianController());
  sl.registerFactory(() => LemburBoronganController());
  sl.registerFactory(() => LemburPerjamController());
  sl.registerFactory(() => KasmasukController());
  sl.registerFactory(() => KaskeluarController());
  sl.registerFactory(() => BankmasukController());
  sl.registerFactory(() => BankkeluarController());
  sl.registerFactory(() => MemoController());
  sl.registerFactory(() => LoginController());
}

Future<void> main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) =>
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => sl<HomeController>()),
          ChangeNotifierProvider(create: (context) => sl<AccountController>()),
          ChangeNotifierProvider(
              create: (context) => sl<PilihBagianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<PilihGrupController>()),
          ChangeNotifierProvider(
              create: (context) => sl<HRD_PegawaiController>()),
          ChangeNotifierProvider(
              create: (context) => sl<HRD_BagianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<HRD_BoronganController>()),
          ChangeNotifierProvider(create: (context) => sl<HRD_GrupController>()),
          ChangeNotifierProvider(
              create: (context) => sl<HRD_ModelController>()),
          ChangeNotifierProvider(
              create: (context) => sl<AbsenHarianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<AbsenLemburanController>()),
          ChangeNotifierProvider(
              create: (context) => sl<LemburHarianController>()),
          ChangeNotifierProvider(
              create: (context) => sl<LemburBoronganController>()),
          ChangeNotifierProvider(
              create: (context) => sl<LemburPerjamController>()),
          ChangeNotifierProvider(create: (context) => sl<KasmasukController>()),
          ChangeNotifierProvider(
              create: (context) => sl<KaskeluarController>()),
          ChangeNotifierProvider(
              create: (context) => sl<BankmasukController>()),
          ChangeNotifierProvider(
              create: (context) => sl<BankkeluarController>()),
          ChangeNotifierProvider(create: (context) => sl<MemoController>()),
          ChangeNotifierProvider(create: (context) => sl<LoginController>()),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PT. RUBBER",
      theme: theme(),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
