import 'package:http/http.dart' as http;
import 'package:test_app/repository/http_method.dart';

class CommentRepository {
  static Future<void> comment(
    http.Client client,
    Map<String, dynamic> data,
  ) async {
    await RepositoryUtils.postData(
        client, "http://89.108.103.40/complaint/profile",
        data: data);
  }
}
