import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Movies App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Movies>> bringMovies() async{
    var movieList=List<Movies>();
    var f1=Movies(1, "Anadoluda", "anadoluda.png", 10.36);
    var f2=Movies(2, "Django", "django.png", 20.36);
    var f3=Movies(3, "Inception", "inception.png", 35.36);
    var f4=Movies(4, "Intersteller", "interstellar.png", 364.36);
    var f5=Movies(5, "Thehatefuleight", "thehatefuleight.png", 69.36);
    var f6=Movies(6, "Thepianist", "thepianist.png", 78.36);
    
    movieList.add(f1);
    movieList.add(f2);
    movieList.add(f3);
    movieList.add(f4);
    movieList.add(f5);
    movieList.add(f6);

    return movieList;

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),


      body:FutureBuilder<List<Movies>>(
        future: bringMovies(),
        builder: (context, snapshot){
          if(snapshot.hasData){
             var movieList=snapshot.data;

             return GridView.builder(
               itemCount: movieList.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: 2/3.5,
               ),

               itemBuilder: (context, index){ //such as loop..
                 var movie = movieList[index];

                 return GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(movie: movie,)));
                   },
                   child: Card(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Image.asset("images/${movie.moviePictureName}"),
                         ),

                         Text(movie.movieName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.blue),),

                         Text("${movie.moviePrice} \u{20BA}", style: TextStyle(fontSize: 16,color: Colors.red.shade900),),


                       ],
                     ),
                   ),
                 );

               },

             );
          }

          else{
            return Center();
          }
        },

      ),

    );
  }
}



//MY CLASS...
class Movies{
  int movieID;
  String movieName;
  String moviePictureName;
  double moviePrice;

  Movies(this.movieID, this.movieName, this.moviePictureName, this.moviePrice);

}





//DETAILS PAGE.....
class DetailsPage extends StatefulWidget {
  Movies movie;


  DetailsPage({this.movie});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.movieName),
      ),


      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Image.asset("images/${widget.movie.moviePictureName}"),

            Text("${widget.movie.moviePrice} \u{20BA}", style: TextStyle(fontSize: 48,color: Colors.red.shade900),),

            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("RENT MOVIE"),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: (){
                  print(" ${widget.movie.movieName} , You Rented!");
                },

              ),
            ),

          ],
        ),
      ),

    );
  }
}































