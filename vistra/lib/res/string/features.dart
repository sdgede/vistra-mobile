import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppFeatureText {
  static const String home = 'Beranda';
  static const String transaction = 'Transaksi';
  static const String transactionNew = 'Transaksi Baru';
  static const String favTransaction = 'Transaksi Favorit';
  static const String profile = 'Akun Anda';
  static const String setting = 'Pengaturan';
  static const String notification = 'Notifikasi';
  static const String history = 'Riwayat Transaksi';

  static const String transfer = 'Transfer';
  static const String transferNew = 'Transfer Baru';
  static const String transferBank = 'Transfer Bank';
  static const String transferBankBooking = 'Permohonan Transfer Bank';
  static const String transferInternal = 'Transfer Sesama';
  static const String payment = 'Bayar';
  static const String paymentNew = 'Bayar Baru';
  static const String shopping = 'Belanja';
  static const String eForm = 'E-Form';
  static const String withdraw = 'Tarik Tunai';
  static const String autoDebet = 'AutoDebet';
  static const String newreceiver = 'Penerima Baru';
  static const String accountInfo = 'Info Rekening';
  static const String myMerchant = 'Toko Saya';
  static const String merchant = 'Merchant';
  static const String prepaidPayment = 'Pembelian';
  static const String postpaidPayment = 'Pembayaran';

  static String point = dotenv.env['POINT_NAME'] ?? 'Poin';
  static String pointFull = dotenv.env['POINT_FULL_NAME'] ?? 'Poin';
  static String qrPayment = dotenv.env['PAYMENT_NAME'] ?? 'PAY';

  static const String news = 'Berita Terkini';
  static const String newsDescription =
      'Selalu ikuti berita seputar \nkeuangan terkini';
  static const String balanceSummary = 'Catatan Keuangan';
  static const String balanceStatement = 'Catatan Keuangan';

  static const String transactionIn = 'Uang Masuk';
  static const String transactionOut = 'Uang Keluar';

  static const String term = 'Syarat dan Ketentuan';
  static const String contactUs = 'Kontak Kami';
  static const String info = 'Tentang Aplikasi';
  static const String changePassword = 'Ganti Password';
  static const String changePin = 'Ganti PIN';

  static const String service = 'Layanan';
  static const String help = 'Bantuan';
  static const String security = 'Keamanan';

  static const String ppobMenuTitle = 'Pintasan Tagihan';
}
