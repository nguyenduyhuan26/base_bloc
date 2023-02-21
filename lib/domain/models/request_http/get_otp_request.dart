class GetOtpHttpRequest {
  final String phoneNumber;

  GetOtpHttpRequest({required this.phoneNumber});

  Map<String, String> toJson() {
    return {'phone': phoneNumber};
  }
}
