import 'package:finalproject/widgets/tvinfo.dart';
import 'package:flutter/material.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular TV Shows'),
          
          SizedBox(height: 10),
          Container(
              // color: Colors.grey,
              height: 200,
              
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return  InkWell(
                       onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tvinfo(
                                      name:tv[index]['title']!=null? tv[index]['title']:"loading",
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['poster_path'],
                                      description: tv[index]['overview'],
                                      vote: tv[index]['vote_average']
                                          .toString(),
                                      launch_on: tv[index]
                                          ['release_date']!=null?tv[index]['release_date']:"coming_soon",
                                    )));
                        
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        // color: Colors.green,
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                
                                image: DecorationImage(
                                    image: NetworkImage(
                                        // ignore: prefer_interpolation_to_compose_strings
                                         tv[index]['backdrop_path'] == null?
                                           "https://media.istockphoto.com/vectors/loading-icon-vector-illustration-vector-id1335247217?k=20&m=1335247217&s=612x612&w=0&h=CQFY4NO0j2qc6kf4rTc0wTKYWL-9w5ldu-wF8D4oUBk="
                                         // ignore: prefer_interpolation_to_compose_strings
                                         :'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path']


 
                              // "https://media.istockphoto.com/vectors/loading-icon-vector-illustration-vector-id1335247217?k=20&m=1335247217&s=612x612&w=0&h=CQFY4NO0j2qc6kf4rTc0wTKYWL-9w5ldu-wF8D4oUBk="
                                            ),
                                    fit: BoxFit.cover),
                              ),
                              height: 140,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text( tv[index]['original_name'] != null
                                      ? tv[index]['original_name']
                                      : 'Loading')
                            )
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