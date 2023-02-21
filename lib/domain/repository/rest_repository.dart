import '../../data/data_source/rest_provider.dart';
import '../../data/network/api_path.dart';
import '../../data/network/http_method.dart';
import '../models/request/get_otp_request.dart';

import '../models/request/specialist_request.dart';
import '../models/request/verify_otp_request.dart';
import '../models/response/base_rest_model.dart';

class RestRepository {
  final _restProvider = RestProvider();

  Future<BaseRestModel?> getOtp(GetOtpRequest data) async {
    return await _restProvider.callApi(
      path: ApiPath.getOtp,
      method: HttpMethod.post,
      data: data.toJson(),
    );
  }

  Future<BaseRestModel?> verifyOtp(VerifyOtpRequest data) async {
    return await _restProvider.callApi(
      path: ApiPath.verifyOtp,
      method: HttpMethod.post,
      data: data.toJson(),
    );
  }

  Future<BaseRestModel?> getListSpecialist(SpecialistRequest param) async {
    return await _restProvider.callApi(
        path: ApiPath.getListSpecialist,
        method: HttpMethod.get,
        param: param.toJson());
  }
}
