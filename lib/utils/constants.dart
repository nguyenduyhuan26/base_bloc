class Constants {
  Constants._();

  // static final FirebaseAnalytics analytics = FirebaseAnalytics();

  static const String userId = 'userId';
  static const String userName = 'userName';
  static const String userPhone = 'userPhone';
  static const String userAvatar = 'userAvatar';
  static const String profileId = 'profileId';
  static const String fcmToken = 'fcmToken';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String firebaseTopic = 'firebaseTopic';
  static const String testStringeeFromId = 'testStringeeFromId';
  static const String testStringeeToId = 'testStringeeToId';
  static const String kFirstTimeOpenApp = 'isFirstTimeOpenApp';
  static const String userPID = 'user_pid_id';
  static const String userPIDPassword = 'user_pid_password';
  static const String isAskFullPermission = 'true';
  static const String listProfilePidPass = 'listProfilePidPass';
  static const String mapCountdownPhone = 'mapCountdownPhone';

  static bool isNeedReloadHistoryAppointments = false;
  static bool isNeedReloadHistoryVideoCall = false;

  static String urlPreviewImage = "http://58.186.85.189:31491/";

  static String imagedefault = "assets/imagedefault.png";
  static String imageLoading = "assets/imagedefault.png";

  // static const String ARG_TYPE_CREATE = "ARG_TYPE_CREATE";
  // static const String ARG_TYPE_EDIT = "ARG_TYPE_EDIT";
  static const String CommonErrorMessage = "Không thành công. Vui lòng thử lại";

  ////895  - test PCR / 896 - test Nhanh
  static const String PACKAGE_ID_COVID_QUICK_TEST = "896";
  static const String PACKAGE_ID_COVID_PCR_TEST = "895";

  static const int RESPONSE_STATUS_SUCCESS = 200;
  static const int RESPONSE_STATUS_FAIL = 1;
  static const String DATA_TOKEN_EXPIRED = 'jwt.expired';

  static const String RESULT_SUCCESS = "RESULT_SUCCESS";
  static const String RESULT_FAILURE = "RESULT_FAILURE";
  static const String RESULT_SUCCESS_AND_GOTO_HISTORY =
      "RESULT_SUCCESS_AND_GOTO_HISTORY";

  //Notify Type
  static const String NOTIFY_CODE_NEWS = "NEWS";
  static const String NOTIFY_CODE_APP_UPDATE = "APP_UPDATE";
  static const String NOTIFY_CODE_VIDEO_CALL = "VIDEO_CALL";
  static const String NOTIFY_CODE_QUESTION_ANSWER = "QUESTION_ANSWER";
  static const String NOTIFY_CODE_WEB_VIEW = "WEB_VIEW";

  //BannerType
  static const String BANNER_TYPE_BANNER_NEWS = "BANNER_NEWS";
  static const String BANNER_TYPE_BANNER_PACKAGE = "BANNER_PACKAGE";
  static const String BANNER_TYPE_BANNER_VC = "BANNER_VC";
  static const String BANNER_TYPE_BANNER_XNTN = "BANNER_XNTN";
  static const String BANNER_TYPE_BANNER_HOS = "BANNER_HOS";
  static const String BANNER_TYPE_BANNER_LINK = "BANNER_LINK";
  static const String BANNER_TYPE_BANNER_VIEW = "BANNER_VIEW";

  static const String CONFIRM_OK = "CONFIRM_OK";
  static const String CONFIRM_CANCEL = "CONFIRM_CANCEL";

  static String hintCommon = "Vui lòng chọn";
  static String hintProvince = "Chọn tỉnh/thành phố";
  static String hintDistrict = "Chọn quận/huyện";
  static String hintWard = "Chọn xã/phường";

  static bool isCallingRefreshToken =
      false; //chặn trường hợp khi gọi nhiều APi 1 lúc, cùng gặp TOKEN_EXPIRED thì sẽ chỉ có 1 request được gọi lấy refreshToken thôi

  static const int maxTimeCountdown = 180; // 3 phút
  static const int resetTimeCountdown = 60; // 1 phút

  static const idDoctorSpam = 'idDoctorSpam';
  static const idDoctorLock = 'idDoctorLock';
  static const idDoctorApproved = 'idDoctorApproved';
}
