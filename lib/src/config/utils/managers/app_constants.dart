abstract class AppConstants {
  static const double appBarHeight = 80;
  static const String appTitle = "Ayatt BNB";
  static const String noPhoto = "NOPHOTO";
  static const String appFontFamily = "OpenSans";


  // LocalStorage
  static const String currentUser = "currentUser";
  static const String userApiToken = "userApiToken";
  static const int tokenMinLen = 100;


  //API
  static const String baseApiUrl = "http://146.190.6.47:8080";
  static const int apiTimeOut = 60;
  static const String contentType = "application/json";
  static const String signUpEndpoint = "/v1/user/signup";
  static const String loginEndpoint = "/v1/user/login";
  static const String logoutEndpoint = "/v1/user/logout";
  static const String searchEndPoint = "/v1/property/search";

}
