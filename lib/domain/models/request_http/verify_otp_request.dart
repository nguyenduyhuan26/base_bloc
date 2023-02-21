class VerifyOtpRequest {
  final String phoneNumber;
  final String otp;

  VerifyOtpRequest({
    required this.phoneNumber,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phoneNumber,
      'otp': otp,
    };
  }
}
