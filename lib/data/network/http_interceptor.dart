import 'package:dio/dio.dart';

import '../../../utils/app_util.dart';
import '../../utils/constants.dart';

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String accessToken = await AppUtil.getString(Constants.accessToken);
    String refreshToken = await AppUtil.getString(Constants.refreshToken);
    AppUtil.showLogFull('Authorization accessToken = $accessToken');
    AppUtil.showLogFull('Refresh-Token refreshToken = $refreshToken');

    options.headers.addAll(
      <String, String>{
        'Authorization': 'Bearer $accessToken',
        'Refresh-Token': 'Bearer $refreshToken',
        'Accept': 'application/json; charset=UTF-8',
        'Accept-Language': 'vi',
      },
    );

    AppUtil.showLogFull(
      'onRequest: ${options.uri}\n'
      'data=${options.data}\n'
      'method=${options.method}\n'
      'headers=${options.headers}\n'
      'queryParameters=${options.queryParameters}',
    );
    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    AppUtil.showLogFull('onRequest: ${response.realUri}');
    AppUtil.showLogFull('onResponse: $response');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    AppUtil.showLogFull(
      'onError: $err\n'
      'Response: ${err.response}',
    );
    return super.onError(err, handler);
  }
}
