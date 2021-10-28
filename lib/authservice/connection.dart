import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();
  login(phone, password) async {
    try {
      return await dio.post('https://eaidas.herokuapp.com/authenticate',
          data: {"phone": phone, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      print(e);
    }
  }

  addregistration(
      fullName, phone, region, zone, wereda, kebelie, password, role) async {
    return await dio.post('https://eaidas.herokuapp.com/register',
        data: {
          "fullName": fullName,
          "phone": phone,
          "region": region,
          "zone": zone,
          "wereda": wereda,
          "kebelie": kebelie,
          "password": password,
          "role": role
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addinnovativeidea(
    message,
    innovationImages,
    date,
  ) async {
    return await dio.post('https://eaidas.herokuapp.com/explore_idea',
        data: {
          "message": message,
          "innovationImages": innovationImages,
          "date": date,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addproblem(userName, message, problemImages, date) async {
    return await dio.post('https://eaidas.herokuapp.com/reportproblem',
        data: {
          "userName": userName,
          "message": message,
          "problemImages": problemImages,
          "date": date
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  comment(comment, userName, postId, date) async {
    return await dio.post('https://eaidas.herokuapp.com/comments',
        data: {
          "comment": comment,
          "userName": userName,
          "postId": postId,
          "date": date
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
