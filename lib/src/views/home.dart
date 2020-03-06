// Widget sans état
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/movie.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;

typedef Future<void> OnTapMovie(Movie m);

class MovieWidget extends StatelessWidget {

  // Référence vers la méthode définie en typedef : OnTapMovie
  final OnTapMovie onTap;

  final Movie movie;

  MovieWidget(this.movie, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 284,
                child: Image.network(
                  'http://image.tmdb.org/t/p/w185/${movie.posterPath}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Text(
                movie.overview,
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          movie.releaseDate,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onTap(movie);
                      },
                      icon: Icon(
                        movie.favorite ? Icons.star : Icons.star_border,
                        color: movie.favorite ? Colors.yellow : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
