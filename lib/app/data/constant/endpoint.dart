class Endpoint {
  static const String baseUrlApi =
      "http://192.168.1.23:8000/api/v1/user/";

  static const String register = "${baseUrlApi}register";
  static const String login = "${baseUrlApi}login";
  static const String book = "${baseUrlApi}book";
  static const String pinjam = "${baseUrlApi}pinjam";
  static const String role = "${baseUrlApi}role";
  static const String UID = "${baseUrlApi}UID";
}
class Endpoint_admin{
  static const String baseUrlApi = "https://192.168.6.27:8000//api/v1/petugas/";


  static const String login_admin = "${baseUrlApi}login";
  static const String book_admin = "${baseUrlApi}book";
  static const String pinjam_admin = "${baseUrlApi}pinjam";
}
