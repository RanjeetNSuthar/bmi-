import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import '../description.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: 'Top Rated Movies', size: 26, color: Colors.green),
          const SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                        name: toprated[index]['original_title'],
                                        bannerurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                toprated[index]
                                                    ['backdrop_path'],
                                        posterurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                toprated[index]['poster_path'],
                                        description: toprated[index]
                                            ['overview'],
                                        vote: toprated[index]['vote_average']
                                            .toString(),
                                        launchon: toprated[index]
                                            ['release_date'],
                                        key: ObjectKey(toprated[index]['id']),
                                      )));
                        },
                        child: Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path']),
                                  ),
                                ),
                                height: 200,
                              ),
                              const SizedBox(height: 5),
                              Container(
                                child: ModifiedText(
                                    text: toprated[index]['title'] ?? 'Loading',
                                    color: Colors.green,
                                    size: 15),
                              )
                            ],
                          ),
                        ));
                  }))
        ],
      ),
    );
  }
}
