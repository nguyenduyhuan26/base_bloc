// Rest Api with HTTP

// import '../../data/network/api_path.dart';
// import '../../data/network/http_method.dart';
// import '../../http/data_source/base_rest_provider.dart';
// import '../models/request/specialist_request.dart';
// import '../models/request/verify_otp_request.dart';
// import '../models/request_http/get_otp_request.dart';
// import '../models/response/base_rest_model.dart';

// class RestHttpRepository {
//   final _restProvider = BaseHttpProvider();

//   Future<BaseRestModel?> getOtp(GetOtpHttpRequest data) async {
//     return await _restProvider.callApi(
//       path: ApiPath.getOtp,
//       method: HttpMethod.post,
//       body: data.toJson(),
//     );
//   }

//   Future<BaseRestModel?> verifyOtp(VerifyOtpRequest data) async {
//     return await _restProvider.callApi(
//       path: ApiPath.verifyOtp,
//       method: HttpMethod.post,
//       // headers: data.toJson(),
//     );
//   }

//   Future<BaseRestModel?> getListSpecialist(SpecialistRequest param) async {
//     return await _restProvider.callApi(
//       path: ApiPath.getListSpecialist,
//       method: HttpMethod.get,
//       // param: param.toJson(),
//     );
//   }
// }
