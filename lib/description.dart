import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchon;

  const Description(
      {required Key key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('bannerurl : $bannerurl');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                    bottom: 10,
                    child: ModifiedText(text: '⭐ Average Rating - ', size: 20)),
              ])),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(text: name, size: 24)),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child:
                  ModifiedText(text: 'Releasing On - ' + launchon, size: 14)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ModifiedText(text: description, size: 18)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
