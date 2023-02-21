class LogoutRequest {
  final String fcmToken;

  LogoutRequest({required this.fcmToken});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fcmToken': fcmToken,
    };
  }
}
