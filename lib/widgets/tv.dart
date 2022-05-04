import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import '../description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Popular TV Shows',
            size: 26,
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                        name: tv[index]['original_name'],
                                        bannerurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                tv[index]['backdrop_path'],
                                        posterurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                tv[index]['poster_path'],
                                        description: tv[index]['overview'],
                                        vote: tv[index]['vote_average']
                                            .toString(),
                                        launchon: tv[index]['release_date'],
                                        key: ObjectKey(tv[index]['id']),
                                      )));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          // color: Colors.green,
                          width: 250,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path']),
                                      fit: BoxFit.cover),
                                ),
                                height: 140,
                              ),
                              const SizedBox(height: 5),
                              Container(
                                child: ModifiedText(
                                    size: 15,
                                    color: Colors.green,
                                    text: tv[index]['original_name'] ??
                                        'Loading'),
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
