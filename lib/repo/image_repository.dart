import 'dart:convert';
import 'dart:io';
import 'package:chat_app/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<PixelfordImage>> getNetworkImages() async {
    try {
      var endpointurl = Uri.parse(
          'https://i0.wp.com/picjumbo.com/wp-content/uploads/magical-spring-forest-scenery-during-morning-breeze-free-photo.jpg?w=600&quality=80');

      final response = await http.get(endpointurl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;
        final List<PixelfordImage> _imageList = decodedList.map((listIem) {
          return PixelfordImage.fromJson(listIem);
        }).toList();

        //print(response.body);
        print(_imageList[0].urlFullSize);
        return _imageList;
      } else {
        throw Exception('API not Successful!');
      }
    } on SocketException {
      throw Exception('Bad Internet Connection!');
    } on HttpException {
      throw Exception('API not Successful!');
    } on FormatException {
      throw Exception('Invalid Data Format!');
    } catch (e) {
      print(e);
      throw Exception('Unknown Error!');
    }
  }
}
