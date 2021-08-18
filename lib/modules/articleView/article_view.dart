import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticleView extends StatelessWidget {
  const ArticleView({Key? key, required this.url}) : super(key: key);
  final url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "News", style: GoogleFonts.merriweather(color: Colors.white70)),
            Text("App", style: GoogleFonts.merriweather(color: Colors.blue),),
          ],
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}