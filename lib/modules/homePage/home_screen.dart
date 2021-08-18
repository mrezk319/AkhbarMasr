import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session6/modules/ArticleModel.dart';
import 'package:session6/modules/NewsHelper.dart';
import 'package:session6/modules/articleItem/articleWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<articleModel> articles = [];
bool loading = true;
String country = "us";
String category = "general";
  getNews(country,category) async {
    News mewsclass = News();
    await mewsclass.getNews(country,category);
    articles = mewsclass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getNews(country,category);
  }
  fun(String category){
  loading = true;
  setState(() {
    category = "$category";
    getNews(country, category);
  });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",style: GoogleFonts.merriweather(color: Colors.white70)),
            Text("App",style: GoogleFonts.merriweather(color: Colors.blue),),
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            setState(() {
              country = "us";
              getNews(country,category);
            });
          }, child: Text("US")),
          TextButton(onPressed: (){
            setState(() {
              country = "eg";
              getNews(country,category);
            });
          }, child: Text("EGypt")),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Center(
                child: Text("Categories",style: GoogleFonts.allertaStencil(fontSize: 30),),
              ),
              SizedBox(height: 20,  ),
              GestureDetector(
                onTap: (){fun("business");Navigator.pop(context);},
                child: DrawerWidget(text: "Business",icon: Icons.business_center_sharp),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){fun("sports");Navigator.pop(context);},
                child: DrawerWidget(text: "Sports",icon: Icons.sports_baseball),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){fun("science");Navigator.pop(context);},
                child: DrawerWidget(text: "Science",icon: Icons.science),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){fun("technology");Navigator.pop(context);},
                child: DrawerWidget(text: "Technology",icon: Icons.laptop_chromebook),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){fun("entertainment");Navigator.pop(context);},
                child: DrawerWidget(text: "Entertainment",icon: Icons.drive_file_move_outline),
              ),
            ],
          ),
        ),
      ),
      body: loading?Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(itemBuilder: (context,index)=>ArticleWidget(
          title: articles[index].title,
          description: articles[index].description,
          urlToImage: articles[index].urlToImage,
          url: articles[index].url,
        ),separatorBuilder: (context,index)=>SizedBox(height: 25,),itemCount: articles.length,shrinkWrap: true,physics: ClampingScrollPhysics(),),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    required this.text,required this.icon
  }) : super();
final String text;final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        this.icon,color: Colors.white,size: 30,
      ),
      SizedBox(width: 5,),
      Text("${this.text}",style: GoogleFonts.merriweather(fontSize: 19),)
    ],);
  }
}