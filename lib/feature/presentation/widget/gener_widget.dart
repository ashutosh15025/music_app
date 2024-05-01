import 'package:ashe_music/feature/presentation/bloc/artist_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../page/Music_player_page.dart';

class GenerWidget extends StatelessWidget {
  final String name;
  final String url;
  const GenerWidget({super.key,required this.name,required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ArtistBloc bloc = BlocProvider.of<ArtistBloc>(context);
        bloc.search=name;
        bloc.add(SearchLoadingEvent());
        Navigator.pushNamed(context, "/music_player_page",arguments: {"title":1}).then((value) {
          bloc.emit(ArtistDataSucessState());
        });

      },
      child: SizedBox(
        width: 120,
        height: 120,
        child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration:  BoxDecoration(
              color:  Color.fromRGBO(21, 21, 33, 1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade700,
                  blurRadius: 2.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
                  offset: Offset(
                    2.0, // Move to right 5  horizontally
                    2.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child:  ClipRRect(
                    child: Image.network(url,fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                child:Text(name,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                  ),))
              ],
            )
        ),
      ),
    );
  }
}
