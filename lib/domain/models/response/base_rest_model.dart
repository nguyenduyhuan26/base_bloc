class BaseRestModel {
  final int code;
  final String message;
  final dynamic data;

  BaseRestModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BaseRestModel.fromJson(Map<String, dynamic> map) {
    return BaseRestModel(
      code: map['code'] ?? 0,
      message: map['message'] ?? '',
      data: map['data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code;'] = code;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
