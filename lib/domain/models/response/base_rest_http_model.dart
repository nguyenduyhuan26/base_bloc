// class BaseRestHttpModel {
//   final int code;
//   final dynamic message;
//   final dynamic data;

//   BaseRestHttpModel({
//     required this.code,
//     required this.message,
//     required this.data,
//   });

//   factory BaseRestHttpModel.fromJson(Map<dynamic, dynamic> map) {
//     return BaseRestHttpModel(
//       code: map['code'] ?? 0,
//       message: map['message'] ?? '',
//       data: map['data'] ?? '',
//     );
//   }

//   Map<dynamic, dynamic> toJson() {
//     final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
//     data['code;'] = code;
//     data['message'] = message;
//     data['data'] = data;
//     return data;
//   }
// }
