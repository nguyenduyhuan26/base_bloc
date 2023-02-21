class GetOtpRequest {
  final String phoneNumber;

  GetOtpRequest({required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {'phone': phoneNumber};
  }
}
