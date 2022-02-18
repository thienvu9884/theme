import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ktesst/model/post_model.dart';
import 'api_constants.dart';
import 'api_interfaces.dart';

class ApiClient extends ApiInterface {

  @override
  Future<List<PostModel>> getPostList() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      // var popularJson = jsonDecode(response.body);
      // List<PostModel> postResult = [];
      // if (popularJson != null) {
      //   popularJson.forEach((e) {
      //     postResult.add(PostModel.fromJson(e));
      //   });
      // }
      // return postResult;
      Iterable postJson = jsonDecode(response.body);
      return postJson.map((e) => PostModel.fromJson(e)).toList();
    } else {
      var message = response.body;
      print(message);
      return throw Exception('Error: Service Not Available. Please try later');
    }
  }


}
