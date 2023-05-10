import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modals/data_modal.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<List<Movie>?>  fetchData() async {
    http.Response response = await http.get(Uri.parse("https://omdbapi.com/?s=harry%20potter&page=2&apikey=564727fa"),
    );
    if (response.statusCode == 200) {

      Map decodeData = jsonDecode(response.body);
      Map de = jsonDecode(response.body);

      List  data = decodeData["Search"];

      List<Movie> allData =
      data.map((e) => Movie.fromMap(data: e)).toList();

      return allData;
    }
    return null;
  }
}