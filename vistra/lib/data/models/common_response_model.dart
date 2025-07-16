class CommonResponseModel {
  int httpCode;
  String errorCode;
  String message;
  dynamic data;

  CommonResponseModel({
    required this.httpCode,
    required this.message,
    this.errorCode = '00',
    this.data,
  });

  bool isSuccess() => httpCode == 200 || httpCode == 201;

  factory CommonResponseModel.fromJson(
    int httpCode,
    Map<String, dynamic> json,
  ) {
    return CommonResponseModel(
      httpCode: httpCode,
      message: json['meta']?['message'] ?? 'Terjadi Kesalahan',
      errorCode: '00', // default karena gak ada di response
      data: json['data'],
    );
  }
}
