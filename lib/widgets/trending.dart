
import 'package:flutter/material.dart';




class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text("Trending Movies",style: TextStyle(fontSize: 20),),
          SizedBox(height: 10),
          Container(
            color:Colors.grey,
              height: 270,
              child: ListView.builder(
              
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              child: Text("done",style: TextStyle(color: Colors.black,fontSize: 20),),
                              height: MediaQuery.of(context).size.height*0.9,
                              width: MediaQuery.of(context).size.width*0.3,
                             
                              decoration: BoxDecoration(
                              
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']
                                      ),
                                ),
                                
                                 
                              ),
                              
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : 'Loading') ),
                            
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}