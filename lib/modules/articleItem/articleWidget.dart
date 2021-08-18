import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session6/modules/articleView/article_view.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
      {required this.urlToImage, required this.title,required this.description,required this.url});

  final String urlToImage, title, description,url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(url: this.url,)));},
      child: Container(
        child: Column(
          children: [
            ClipRRect(child: Image.network(urlToImage),borderRadius: BorderRadius.circular(10),),
            Padding(
              padding: const EdgeInsets.only(left: 8,top: 8),
              child: Text(
                "$title",
                style:
                    GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "$description",
                style: GoogleFonts.cabin(
                    fontWeight: FontWeight.bold, color: Colors.white70,fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
