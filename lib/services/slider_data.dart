import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_sphere/models/slider_model.dart';

class Sliders {
  List<sliderModel> sliders = [];

  // sliders.add()

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=5b4017551dcc4fdda7285569c4ff39d5";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        print('PRINTING!!!!!!!!!!!!!!!');
        if (element["urlToImage"] != null && element['description'] != null) {
          sliderModel slidermodel = sliderModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          sliders.add(slidermodel);
          print(sliders);
        }
      });
    }
  }
}
