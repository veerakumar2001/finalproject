
import 'package:finalproject/widgets/toprated.dart';
import 'package:finalproject/widgets/trending.dart';
import 'package:finalproject/widgets/tv.dart';
import 'package:flutter/material.dart';

import 'package:tmdb_api/tmdb_api.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

// ignore: camel_case_types
class _mainscreenState extends State<mainscreen> {

List trendingmovies = [];
List topratedmovies=[];
List tv =[];

final String apikey1 ='6877f957e1e5810e8190f80f0e3ba9d2';
final readaccesstoken1='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ODc3Zjk1N2UxZTU4MTBlODE5MGY4MGYwZTNiYTlkMiIsInN1YiI6IjYyYjk5MjA4MmUyYjJjMDMxZDI0MzRmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QtHDBst_p_7K09NuOUQi0_AX9VItl1bOriEk0GxgvT0';
  void initstate(){
    loadmovies();
    super.initState();
  }
  loadmovies()async{
    TMDB tmdbCustomLogs= TMDB(ApiKeys(apikey1,readaccesstoken1),
  logConfig: ConfigLogger(
    showLogs: true,
  showErrorLogs: true));
  Map trendingresult=await tmdbCustomLogs.v3.trending.getTrending();
  Map topratedresult=await tmdbCustomLogs.v3.movies.getTopRated();
  Map tvresult=await tmdbCustomLogs.v3.tv.getPopular();
  
  setState(() {
    trendingmovies=trendingresult['results'];
    topratedmovies=topratedresult['results'];
    tv=tvresult['results'];
  }
  
  );
  debugPrint('$trendingresult');
  print(trendingmovies);
  
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: Icon(Icons.menu,color: Colors.black,),
        title: Text("Movies Hub",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,),
      ),
      body: ListView(
        children: [TrendingMovies(trending: trendingmovies,),
        TopRatedMovies(toprated: topratedmovies,),
         TV(tv: tv)],
        
      ),
    );
  }
}