import 'package:dio/dio.dart';

class ApiServuce {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      required String contentType}) async {
    // ignore: unused_local_variable
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }
}
