import 'package:http/http.dart' as http;

class AuthService {
  String backend = 'https://fast-caverns-83701.herokuapp.com';
  //sign in with email and password
  Future<http.Response> signIn(email, password) async {
    try {
      var uri = Uri.parse('$backend/signin');
      var response =
          await http.post(uri, body: {"email": email, "password": password});
      return response;
    } catch (err) {
      print(err);
      return http.Response('failed', 400);
    }
  }

  //register
  Future<http.Response> register(
      email, phone, country, dob, fullname, zipcode, password) async {
    try {
      var uri = Uri.parse('$backend/register');
      var response = await http.post(uri, body: {
        "email": email,
        "phone": phone,
        "country": country,
        "dob": dob,
        "name": fullname,
        "zipcode": zipcode,
        "password": password,
      });
      return response;
    } catch (err) {
      print(err);
      return http.Response('failed', 400);
    }
  }

  // get otp
  Future<http.Response> getOtp(phone) async {
    try {
      var uri = Uri.parse('$backend/getotp');
      var response = await http.post(uri, body: {"phone": phone});
      return response;
    } catch (err) {
      print(err);
      return http.Response('failed', 400);
    }
  }

  // reset password
  Future<http.Response> resetPassword(password) async {
    try {
      var uri = Uri.parse('$backend/resetpassword');
      var response = await http.post(uri, body: {"password": password});
      return response;
    } catch (err) {
      print(err);
      return http.Response('failed', 400);
    }
  }

  //sign out
}
