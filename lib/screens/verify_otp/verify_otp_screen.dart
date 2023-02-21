import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/domain/models/response/base_rest_model.dart';
import 'package:flutter_base_bloc/screens/list_specicalist/list_specialist_screen.dart';
import 'package:flutter_base_bloc/utils/app_util.dart';

import '../../domain/models/request/get_otp_request.dart';
import '../../domain/models/request/verify_otp_request.dart';
import '../../domain/models/request_http/get_otp_request.dart';
import '../../domain/models/response/token_user_model.dart';
import '../../domain/repository/rest_http_repository.dart';
import '../../domain/repository/rest_repository.dart';
import '../../utils/constants.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () async {
                // Rest Api with HTTP

                // final restRepository = RestHttpRepository();
                // try {
                //   final response = await restRepository.getOtp(
                //     GetOtpHttpRequest(phoneNumber: '0904561321'),
                //   );
                //   // print(response.)

                //   print(response?.code ?? '0000');
                //   if (response != null &&
                //       response.code == Constants.RESPONSE_STATUS_SUCCESS) {
                //     // BaseRestModel? response =
                //     //     await restRepository.verifyOtp(VerifyOtpRequest(
                //     //   phoneNumber: '0936068193',
                //     //   otp: '020593',
                //     // ));
                //     // if (response != null &&
                //     //     response.code == Constants.RESPONSE_STATUS_SUCCESS) {
                //     //   // AppUtil.removeKey(phoneNumber);

                //     //   final tokenUser = TokenUserModel.fromJson(response.data);
                //     //   AppUtil.saveString(
                //     //       Constants.accessToken, tokenUser.accessToken);
                //     //   AppUtil.saveString(
                //     //       Constants.refreshToken, tokenUser.refreshToken);
                //     //   // ignore: use_build_context_synchronously
                //     //   Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //       builder: (context) => const ListSpecialistScreen(),
                //     //     ),
                //     //   );
                //     // }
                //     // AppUtil.saveListString(Constants.firebaseTopic, tokenUser.topics);
                //   } else {
                //     if (response != null && response.message.isNotEmpty) {
                //       // AppUtil.showToast(response.message);
                //     } else {
                //       // AppUtil.showToast(Constants.CommonErrorMessage);
                //     }
                //   }
                // } catch (e) {
                //   print('error $e');
                // }

                final restRepository = RestRepository();
                try {
                  final response = await restRepository.getOtp(
                    GetOtpRequest(phoneNumber: '0936068193'),
                  );
                  if (response != null &&
                      response.code == Constants.RESPONSE_STATUS_SUCCESS) {
                    BaseRestModel? response =
                        await restRepository.verifyOtp(VerifyOtpRequest(
                      phoneNumber: '0936068193',
                      otp: '020593',
                    ));
                    if (response != null &&
                        response.code == Constants.RESPONSE_STATUS_SUCCESS) {
                      // AppUtil.removeKey(phoneNumber);

                      final tokenUser = TokenUserModel.fromJson(response.data);
                      AppUtil.saveString(
                          Constants.accessToken, tokenUser.accessToken);
                      AppUtil.saveString(
                          Constants.refreshToken, tokenUser.refreshToken);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListSpecialistScreen(),
                        ),
                      );
                    }
                    // AppUtil.saveListString(Constants.firebaseTopic, tokenUser.topics);
                  } else {
                    if (response != null && response.message.isNotEmpty) {
                      // AppUtil.showToast(response.message);
                    } else {
                      // AppUtil.showToast(Constants.CommonErrorMessage);
                    }
                  }
                } catch (e) {
                  ///
                }
              },
              child: Text('ok'),
            ),
          ],
        ),
      ),
    );
  }
}
