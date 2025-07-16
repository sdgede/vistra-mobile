class CommonResponseModel {
  final int httpCode;
  final String errorCode;
  final String message;
  final dynamic data;

  CommonResponseModel({
    required this.httpCode,
    required this.message,
    this.errorCode = '00',
    this.data,
  });

  bool isSuccess() => httpCode == 201;

  factory CommonResponseModel.fromJson(
    int httpCode,
    Map<String, dynamic> json,
  ) {
    int finalHttpCode = httpCode;

    // Cek status API: sukses/success dianggap 200
    final status = json['status']?.toString().toLowerCase().trim();
    if (status == 'sukses' || status == 'success') {
      finalHttpCode = 201;
    } else if (status != null) {
      finalHttpCode = 400;
    }

    // Cek error_code: jika ada error meskipun httpCode 200, set ke 400
    final errorCode = json['error_code']?.toString().trim() ?? '00';
    if (errorCode != '00' && finalHttpCode == 201) {
      finalHttpCode = 400;
    }

    return CommonResponseModel(
      httpCode: finalHttpCode,
      message: json['pesan'] ?? json['message'] ?? 'Terjadi Kesalahan',
      errorCode: errorCode,
      data: json['data'],
    );
  }
}
