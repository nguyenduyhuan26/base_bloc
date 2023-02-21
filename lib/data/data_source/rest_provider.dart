import 'package:dio/dio.dart';

import '../../domain/models/request/logout_request.dart';
import '../../domain/models/response/base_rest_model.dart';
import '../../domain/models/response/token_user_model.dart';
import '../../utils/app_util.dart';
import '../../utils/auth_util.dart';
import '../../utils/constants.dart';
import '../network/api_path.dart';
import '../network/http_interceptor.dart';
import '../network/http_method.dart';

class RestProvider {
  RestProvider() {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 60000
      ..options.receiveTimeout = 60000
      ..interceptors.add(HttpLogInterceptor());
  }

  late final Dio _dio;
  final String baseUrl = 'https://meddoctortest.medon.vn/app';

  Future<BaseRestModel?> callApi({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? param,
    dynamic data,
  }) async {
    Response? apiResponse;

    try {
      switch (method) {
        case HttpMethod.get:
          apiResponse = await _dio.get(
            path,
            queryParameters: param,
          );
          break;

        case HttpMethod.post:
          apiResponse = await _dio.post(
            path,
            queryParameters: param,
            data: data,
          );
          break;

        case HttpMethod.put:
          apiResponse = await _dio.put(
            path,
            queryParameters: param,
            data: data,
          );
          break;

        case HttpMethod.delete:
          apiResponse = await _dio.delete(
            path,
            queryParameters: param,
            data: data,
          );
          break;

        default:
          break;
      }

      if (apiResponse != null &&
          apiResponse.statusCode == 200 &&
          apiResponse.data != null) {
        final rootRes = BaseRestModel.fromJson(apiResponse.data);
        if (rootRes.data != null &&
            rootRes.data == Constants.DATA_TOKEN_EXPIRED &&
            Constants.isCallingRefreshToken == false) {
          Constants.isCallingRefreshToken == true;
          final tokenRes = await _getNewToken();
          if (tokenRes != null &&
              tokenRes.data == Constants.DATA_TOKEN_EXPIRED) {
            if (tokenRes.data != null) {
              final tokenUserModel = TokenUserModel.fromJson(tokenRes.data);
              AppUtil.saveString(
                  Constants.accessToken, tokenUserModel.accessToken);
              AppUtil.saveString(
                  Constants.refreshToken, tokenUserModel.refreshToken);

              return callApi(
                path: path,
                method: method,
                param: param,
                data: data,
              );
            }
          } else {
            AppUtil.showLog('getNewToken FAIL ==> GO TO ADD_PHONE');
            final logoutResponse = await logout(
              LogoutRequest(
                  fcmToken: await AppUtil.getString(Constants.fcmToken)),
            );
            if (logoutResponse != null &&
                logoutResponse.code == Constants.RESPONSE_STATUS_SUCCESS) {
              AuthUtil.handleAfterLogout();
            } else {
              // AppUtil.showToast(Constants.CommonErrorMessage);
            }
          }
        } else {
          return rootRes;
        }
      }
    } catch (e) {
      AppUtil.showLogFull('RestProvider callApi ERROR: $e');
    }

    return null;
  }

  Future<BaseRestModel?> _getNewToken() async {
    try {
      final response = await _dio.get(ApiPath.getNewToken);
      if (response.statusCode == 200 && response.data != null) {
        return BaseRestModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      AppUtil.showLogFull('RestProvider getNewToken ERROR: $e');
    }
    return null;
  }

  Future<BaseRestModel?> logout(LogoutRequest body) async {
    try {
      final response = await _dio.post(ApiPath.logout, data: body.toJson());
      if (response.statusCode == 200) {
        return BaseRestModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      AppUtil.showLogFull('RestProvider logout ERROR: $e');
    }
    return null;
  }
}
