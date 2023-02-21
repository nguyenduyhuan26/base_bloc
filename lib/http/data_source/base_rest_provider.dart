// Rest Api with HTTP

// import 'dart:convert' as convert;

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// import '../../data/network/api_path.dart';
// import '../../data/network/http_method.dart';
// import '../../domain/models/request/logout_request.dart';
// import '../../domain/models/response/base_rest_model.dart';
// import '../../domain/models/response/token_user_model.dart';
// import '../../utils/app_util.dart';
// import '../../utils/auth_util.dart';
// import '../../utils/constants.dart';

// class BaseHttpProvider {
//   // BaseHttpProvider() {
//   //   client = http.Client;
//   // }

//   // // BaseHttpProvider() {}
//   // late final Type client;
//   var client = http.Client();

//   Future<BaseRestModel?> callApi({
//     required String path,
//     required HttpMethod method,
//     Map<String, String>? headers,
//     Object? body,
//   }) async {
//     Response? apiResponse;
//     const String baseUrl = 'https://meddoctortest.medon.vn/app';
//     var url =
//         Uri.parse('https://meddoctortest.medon.vn/app/api/v1/doctor/login');
//     try {
//       switch (method) {
//         case HttpMethod.get:
//           // apiResponse = await http.get(
//           //   url,
//           //   headers: headers,
//           // );
//           // var response = await client.get(url)
//           break;

//         case HttpMethod.post:
//           // apiResponse = await http.post(
//           //   url,
//           //   headers: {
//           //     'Accept': 'application/json; charset=UTF-8',
//           //     'Accept-Language': 'vi',
//           //     // 'Content-type': 'application/json'
//           //   },
//           //   body: body,
//           // );
//           apiResponse = await client.post(
//             url,
//             // headers: {
//             //   // 'Accept': 'application/json; charset=UTF-8',
//             //   'Accept-Language': 'vi',
//             //   // 'Content-type': 'application/json'
//             // },
//             body: body,
//           );
//           print(apiResponse.body);
//           break;

//         case HttpMethod.delete:
//           apiResponse = await http.post(
//             url,
//             headers: headers,
//           );
//           break;

//         case HttpMethod.put:
//           apiResponse = await http.put(
//             url,
//             headers: headers,
//           );
//           break;

//         default:
//           break;
//       }
//       if (apiResponse != null && apiResponse.statusCode == 200) {
//         var decodedResponse =
//             convert.jsonDecode(apiResponse.body) as Map<String, dynamic>;
//         final rootRes = BaseRestModel.fromJson(decodedResponse);
//         if (rootRes.data != null &&
//             rootRes.data == Constants.DATA_TOKEN_EXPIRED &&
//             Constants.isCallingRefreshToken == false) {
//           Constants.isCallingRefreshToken == true;
//           final tokenRes = await getNewToken();
//           if (tokenRes != null &&
//               tokenRes.data == Constants.DATA_TOKEN_EXPIRED) {
//             if (tokenRes.data != null) {
//               final tokenUserModel = TokenUserModel.fromJson(tokenRes.data);
//               AppUtil.saveString(
//                   Constants.accessToken, tokenUserModel.accessToken);
//               AppUtil.saveString(
//                   Constants.refreshToken, tokenUserModel.refreshToken);

//               return callApi(
//                 path: path,
//                 method: method,
//                 headers: headers,
//               );
//             }
//           } else {
//             AppUtil.showLog('getNewToken FAIL ==> GO TO ADD_PHONE');
//             final logoutResponse = await logout(
//               LogoutRequest(
//                   fcmToken: await AppUtil.getString(Constants.fcmToken)),
//             );
//             if (logoutResponse != null &&
//                 logoutResponse.code == Constants.RESPONSE_STATUS_SUCCESS) {
//               AuthUtil.handleAfterLogout();
//             } else {
//               // AppUtil.showToast(Constants.CommonErrorMessage);
//             }
//           }
//         } else {
//           return rootRes;
//         }
//       }
//     } catch (e) {
//       ///
//     }
//     return null;
//   }

//   Future<BaseRestModel?> getNewToken() async {
//     var url = Uri.https(ApiPath.getNewToken);

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         var decodedResponse =
//             convert.jsonDecode(response.body) as Map<String, dynamic>;

//         return BaseRestModel.fromJson(decodedResponse);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       AppUtil.showLogFull('RestProvider getNewToken ERROR: $e');
//     }
//     return null;
//   }

//   Future<BaseRestModel?> logout(LogoutRequest body) async {
//     var url = Uri.https(ApiPath.logout);

//     try {
//       final response = await http.post(url);
//       if (response.statusCode == 200) {
//         var decodedResponse =
//             convert.jsonDecode(response.body) as Map<String, dynamic>;

//         return BaseRestModel.fromJson(decodedResponse);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       AppUtil.showLogFull('RestProvider logout ERROR: $e');
//     }
//     return null;
//   }
// }
