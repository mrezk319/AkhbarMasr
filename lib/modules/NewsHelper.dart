import 'dart:convert';
import '../models/ArticleModel.dart';
import 'package:http/http.dart' as http;
import 'package:Akhbark/models/ArticleModel.dart';

class News {
  List<articleModel> news = [];

  Future<void> getNews(String Country,String Category) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$Country&category=$Category&apiKey=afe009d8d0d944d2936f28de8b92bd7a");
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData["status"] == "ok"){

      jsonData["articles"].forEach((e){
        if(e["urlToImage"] != null && e["title"] != null && e["description"] != null ){
          articleModel article = new articleModel(
          title: e["title"].toString(),
            author: e["author"].toString(),
            content: e["content"].toString(),
            description: e["description"].toString(),
            url: e["url"].toString(),
            urlToImage: e["urlToImage"].toString(),
          );
          news.add(article);
        }
      });

    }


  }
}
