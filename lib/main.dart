import 'package:ashe_music/feature/presentation/page/Home.dart';
import 'package:ashe_music/feature/presentation/page/Music_player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/presentation/bloc/artist_bloc.dart';
import 'injection_container.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) {
        return ArtistBloc();
      },
      child: MaterialApp(
        initialRoute: "/",
      routes: {
          "/":(context)=>Home(),
          "/music_player_page":(context)=>MusicPlayer(),
      },

    )

    );
  }

}
