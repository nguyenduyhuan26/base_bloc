class ApiPath {
  ApiPath._();

  // Doctor
  static const String getOtp = '/api/v1/doctor/login';
  static const String verifyOtp = '/api/v1/doctor/verify-otp';
  static const String getInfo = '/api/v1/doctor/info';
  static const String login = '/api/v1/doctor/loginUserPass';
  static const String register = '/api/v1/doctor/register';
  static const String getNewToken = '/api/v1/doctor/refresh-token';
  static const String logout = '/api/v1/doctor/logout';
  static const String updateInfo = '/api/v1/doctor/update';
  static const String uploadAvatarDoctor = '/api/v1/doctor/upload';
  static const String addFcm = '/api/v1/doctor/add-fcm';

  // Address
  static const String getProvince = '/api/v1/region/provinces';
  static const String getDistrictByProvinceId =
      '/api/v1/region/findDistrictByProvinceId';
  static const String getWardByDistrictId =
      '/api/v1/region/findWardByDistrictId';
  static const String searchAddress = '/api/v1/region/list';

  // Patient
  static const String createPatient = '/api/v1/patient/create';
  static const String getListPatientWithSort = '/api/v1/patient/list';
  static const String deletePatient = '/api/v1/patient/delete';
  static const String uploadAvatar = '/api/v1/patient/upload';
  static const String getListPatient = '/api/v1/patient/list-patient';
  static const String checkInfoPatient = '/api/v1/patient/checkInfo';
  static const String updatePatient = '/api/v1/patient/update';
  static const String getDetailPatient = '/api/v1/patient';

  // PackageService
  static const String createPackage = '/api/v1/package-service/create';
  static const String getListPackage = '/api/v1/package-service/list';
  static const String getDetailPackage = '/api/v1/package-service/detail';
  static const String getListService = '/api/v1/package-service/list-service';
  static const String updatePackage = '/api/v1/package-service/update';
  static const String getListServiceBySpecity =
      '/api/v1/package-service/list-by-specify';

  // SpecifyTest
  static const String createSpecify = '/api/v1/specify-test/create';
  static const String getListSpecify = '/api/v1/specify-test/list';
  static const String getStatisticSpecify = '/api/v1/specify-test/statistics';
  static const String getListSpecifyOfPatient =
      '/api/v1/specify-test/list-by-patient';
  static const String getDetailSpecify = '/api/v1/specify-test';
  static const String updateSpecify = '/api/v1/specify-test/update';
  static const String cancelSpecify = '/api/v1/specify-test/cancel';
  static const String getProcessSpecify = '/api/v1/specify-test/process';
  static const String getResult = '/api/v1/specify-test/result-by-sid';

  // WorkTime
  static const String getListWorkTime = '/api/v1/worktime/list';

  // Category
  static const String getListSpecialist = '/api/v1/category/specialist/list';

  // HomeController
  static const String getContentHomeCollaborator = '/api/v1/home/content';

  // StatisticController
  static const String getOverviewStatistic = '/api/v1/report/overview';
  static const String getStatisticReality = '/api/v1/report/detail-lis';
  static const String getStatisticTemporality = '/api/v1/report/detail';

  // NotificationController
  static const String getListNotification = '/api/v1/notification/list';
  static const String readNotification = '/api/v1/notification/read';
  static const String deleteNotification = '/api/v1/notification/delete';
  static const String deleteAllNotification = '/api/v1/notification/delete-all';
  static const String getNotificationCount = '/api/v1/notification/count';
}
