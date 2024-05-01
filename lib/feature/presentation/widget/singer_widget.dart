import 'dart:ffi';

import 'package:ashe_music/feature/domain/usecase/get_search_usecase.dart';
import 'package:ashe_music/feature/presentation/bloc/artist_bloc.dart';
import 'package:ashe_music/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingerWidget extends StatelessWidget {
  const SingerWidget({super.key,required this.name,required this.url,required this.id});
  final String url;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    ArtistBloc bloc = BlocProvider.of<ArtistBloc>(context);
    return InkWell(
        onTap: (){
          bloc.search = name;
          bloc.add(SearchLoadingEvent());
          Navigator.pushNamed(context, "/music_player_page",arguments: {"title":1}).then((value) {
            bloc.emit(ArtistDataSucessState());
          });

        },
    child:Container(
        width: 173,
        height: 173,
        margin: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(url)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                margin: EdgeInsets.all(10),
                child: Text(name,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
              ),),
            ),
              Spacer(),
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.all(10),
                child:SizedBox.expand(
                  child:FittedBox(
                     child:Image.asset("assets/play.png"),
                     fit: BoxFit.fitWidth,
              )))
            ],
          ),
        ));
  }

}
