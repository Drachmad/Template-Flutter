'use strict';

module.exports = function (app) {
    var jsonku = require('./controller');
    var master = require('./master/controller');

    app.route('/')
        .get(jsonku.index);
    app.route('/login')
        .post(jsonku.login);
    app.route('/indeks_account')
        .post(jsonku.tampil_account);
    app.route('/indeks_pegawai')
        .post(jsonku.tampil_pegawai);



    // ================Widget Pilih==================
    app.route('/data_bagian')
        .post(jsonku.data_bagian);
    app.route('/data_grup')
        .post(jsonku.data_grup);

    //==================MASTER======================= 
    app.route('/hrd_pegawai_paginate')
        .post(master.hrd_pegawai_paginate);
    app.route('/count_hrd_pegawai_paginate')
        .post(master.count_hrd_pegawai_paginate);
    app.route('/tambah_hrd_pegawai')
        .post(master.tambah_hrd_pegawai);
    app.route('/ubah_hrd_pegawai')
        .post(master.ubah_hrd_pegawai);
    app.route('/hapus_hrd_pegawai')
        .post(master.hapus_hrd_pegawai);

    app.route('/hrd_bagian_paginate')
        .post(master.hrd_bagian_paginate);
    app.route('/count_hrd_bagian_paginate')
        .post(master.count_hrd_bagian_paginate);
    app.route('/tambah_hrd_bagian')
        .post(master.tambah_hrd_bagian);
    app.route('/ubah_hrd_bagian')
        .post(master.ubah_hrd_bagian);
    app.route('/hapus_hrd_bagian')
        .post(master.hapus_hrd_bagian);

    app.route('/hrd_borongan_paginate')
        .post(master.hrd_borongan_paginate);
    app.route('/count_hrd_borongan_paginate')
        .post(master.count_hrd_borongan_paginate);
    app.route('/tambah_hrd_borongan')
        .post(master.tambah_hrd_borongan);
    app.route('/ubah_hrd_borongan')
        .post(master.ubah_hrd_borongan);
    app.route('/hapus_hrd_borongan')
        .post(master.hapus_hrd_borongan);

    app.route('/hrd_grup_paginate')
        .post(master.hrd_grup_paginate);
    app.route('/count_hrd_grup_paginate')
        .post(master.count_hrd_grup_paginate);
    app.route('/tambah_hrd_grup')
        .post(master.tambah_hrd_grup);
    app.route('/ubah_hrd_grup')
        .post(master.ubah_hrd_grup);
    app.route('/hapus_hrd_grup')
        .post(master.hapus_hrd_grup);

    app.route('/hrd_model_paginate')
        .post(master.hrd_model_paginate);
    app.route('/count_hrd_model_paginate')
        .post(master.count_hrd_model_paginate);
    app.route('/tambah_hrd_model')
        .post(master.tambah_hrd_model);
    app.route('/ubah_hrd_model')
        .post(master.ubah_hrd_model);
    app.route('/hapus_hrd_model')
        .post(master.hapus_hrd_model);

    ///LAPORAN ABSEN HARIAN
    app.route('/lap_absen_harian')
        .post(jsonku.lap_absen_harian);
    ///LAPORAN ABSEN LEMBUR
    app.route('/lap_absen_lemburan')
        .post(jsonku.lap_absen_lemburan);
    ///LAPORAN LEMBUR HARIAN
    app.route('/lap_lembur_harian')
        .post(jsonku.lap_lembur_harian);
    ///LAPORAN LEMBUR BORONGAN
    app.route('/lap_lembur_borongan')
        .post(jsonku.lap_lembur_borongan);
    ///LAPORAN LEMBUR PER JAM
    app.route('/lap_lembur_perjam')
        .post(jsonku.lap_lembur_perjam);

    // =====================TRANSAKSI========================
    ///TRANSAKSI HEADER DETAIL HARIAN
    app.route('/harian_paginate')
        .post(jsonku.harian_paginate);
    app.route('/count_harian_paginate')
        .post(jsonku.count_harian_paginate);
    app.route('/tambah_header_harian')
        .post(jsonku.tambah_header_harian);
    app.route('/hapus_harian')
        .post(jsonku.hapus_harian);
    app.route('/tambah_detail_harian')
        .post(jsonku.tambah_detail_harian);
    app.route('/edit_header_harian')
        .post(jsonku.edit_header_harian);

    ///TRANSAKSI HEADER DETAIL BORONGAN
    app.route('/borongan_paginate')
        .post(jsonku.borongan_paginate);
    app.route('/count_borongan_paginate')
        .post(jsonku.count_borongan_paginate);
    app.route('/tambah_header_borongan')
        .post(jsonku.tambah_header_borongan);
    app.route('/hapus_borongan')
        .post(jsonku.hapus_borongan);
    app.route('/tambah_detail_borongan')
        .post(jsonku.tambah_detail_borongan);
    app.route('/edit_header_borongan')
        .post(jsonku.edit_header_borongan);

    ///TRANSAKSI HEADER DETAIL KIK JAHIT
    app.route('/kik_jahit_paginate')
        .post(jsonku.kik_jahit_paginate);
    app.route('/count_kik_jahit_paginate')
        .post(jsonku.count_kik_jahit_paginate);
    app.route('/tambah_header_kik_jahit')
        .post(jsonku.tambah_header_kik_jahit);
    app.route('/hapus_kik_jahit')
        .post(jsonku.hapus_kik_jahit);
    app.route('/tambah_detail_kik_jahit')
        .post(jsonku.tambah_detail_kik_jahit);
    app.route('/edit_header_kik_jahit')
        .post(jsonku.edit_header_kik_jahit);

    ///TRANSAKSI HEADER DETAIL KAS
    app.route('/kasmasuk_paginate')
        .post(jsonku.kasmasuk_paginate);
    app.route('/count_kasmasuk_paginate')
        .post(jsonku.count_kasmasuk_paginate);
    app.route('/kaskeluar_paginate')
        .post(jsonku.kaskeluar_paginate);
    app.route('/count_kaskeluar_paginate')
        .post(jsonku.count_kaskeluar_paginate);
    app.route('/tambah_header_kas')
        .post(jsonku.tambah_header_kas);
    app.route('/nobukti_kas')
        .post(jsonku.nobukti_kas);
    app.route('/tambah_detail_kas')
        .post(jsonku.tambah_detail_kas);
    app.route('/edit_header_kas')
        .post(jsonku.edit_header_kas);
    app.route('/hapus_header_kas')
        .post(jsonku.hapus_header_kas);
    app.route('/hapus_detail_kas')
        .post(jsonku.hapus_detail_kas);
    ///TRANSAKSI HEADER DETAIL BANK
    app.route('/bankmasuk_paginate')
        .post(jsonku.bankmasuk_paginate);
    app.route('/count_bankmasuk_paginate')
        .post(jsonku.count_bankmasuk_paginate);
    app.route('/bankkeluar_paginate')
        .post(jsonku.bankkeluar_paginate);
    app.route('/count_bankkeluar_paginate')
        .post(jsonku.count_bankkeluar_paginate);
    app.route('/nobukti_bank')
        .post(jsonku.nobukti_bank);
    app.route('/tambah_header_bank')
        .post(jsonku.tambah_header_bank);
    app.route('/tambah_detail_bank')
        .post(jsonku.tambah_detail_bank);
    app.route('/edit_header_bank')
        .post(jsonku.edit_header_bank);
    ///TRANSAKSI HEADER DETAIL MEMO
    app.route('/memo_paginate')
        .post(jsonku.memo_paginate);
    app.route('/count_memo_paginate')
        .post(jsonku.count_memo_paginate);
    app.route('/nobukti_memo')
        .post(jsonku.nobukti_memo);
    app.route('/tambah_header_memo')
        .post(jsonku.tambah_header_memo);
    app.route('/tambah_detail_memo')
        .post(jsonku.tambah_detail_memo);
    app.route('/edit_header_memo')
        .post(jsonku.edit_header_memo);

    /// MODAL
    //modal data account header kas
    app.route('/modal_acc_kas')
        .post(jsonku.modal_acc_kas);
    //modal data account header bank
    app.route('/modal_acc_bank')
        .post(jsonku.modal_acc_bank);
    ///SELECT DETAIL
    app.route('/select_detail')
        .post(jsonku.select_detail);
    ///HAPUS DETAIL
    app.route('/hapus_detail')
        .post(jsonku.hapus_detail);
    ///NO URUT
    app.route('/no_urut')
        .post(jsonku.no_urut);
    ///CHECK NO BUKTI
    app.route('/check_no_bukti')
        .post(jsonku.check_no_bukti);

}

