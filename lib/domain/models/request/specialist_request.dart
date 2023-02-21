class SpecialistRequest {
  final int pageNum;
  final int pageSize;

  SpecialistRequest({
    required this.pageNum,
    required this.pageSize,
  });
  static const isActive = 1;
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pageNum': pageNum,
      'pageSize': pageSize,
      'status': isActive,
    };
  }
}
