class TokenUserModel {
  final String accessToken;
  final String refreshToken;
  final List<String> topics;

  TokenUserModel({
    required this.accessToken,
    required this.refreshToken,
    required this.topics,
  });

  factory TokenUserModel.fromJson(Map<String, dynamic> map) {
    return TokenUserModel(
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      topics: (map['topics'] != null)
          ? (map['topics'] as List).map((topic) => topic.toString()).toList()
          : <String>[],
    );
  }
}
