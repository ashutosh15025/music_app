import 'package:ashe_music/feature/domain/model/search_model.dart';
import 'package:ashe_music/feature/presentation/bloc/artist_bloc.dart';
import 'package:ashe_music/feature/presentation/widget/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});
  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    final args = ((ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map)["title"];
    return Scaffold(
      appBar: AppBar(title: Text("Player"),),
      body: Center(
        child:Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
                color: Color.fromRGBO(21, 21, 33, 1),
            child: BlocBuilder<ArtistBloc, ArtistState>(
          builder: ( context,state) {
            if(state is SearchDataSucessState){
             return PlayerWidget(listdata:  BlocProvider.of<ArtistBloc>(context).searchData!.data,position: args);
            }
            else if(state is PlayRecentSongState){
              print(BlocProvider.of<ArtistBloc>(context).lastPlayed.length.toString()+"size"+args.toString());
             return PlayerWidget(listdata:  [...BlocProvider.of<ArtistBloc>(context).lastPlayed],position: args);
            }
            else{

                   return Center(
                     child: CircularProgressIndicator(),
               );

            }
            },
        )
        ),
        ),
      );
  }


}

class ScreenArguments {
  final int position;


  ScreenArguments(this.position);
}
