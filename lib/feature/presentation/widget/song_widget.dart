import 'package:ashe_music/feature/presentation/bloc/artist_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/model/search_model.dart';

class SongWidget extends StatefulWidget {
  const SongWidget({super.key,required this.data, required this.position});
  final SearchData data;
  final int position;

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        BlocProvider.of<ArtistBloc>(context).emit(PlayRecentSongState());
        Navigator.pushNamed(context, "/music_player_page" ,arguments: {"title":widget.position}).then((value) => {
          onPopRecentlyPlayedSong()
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(21, 21, 33, 1),
            borderRadius: BorderRadius.circular(10)
        ),
        height:100,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(widget.data.album.cover),
          fit: BoxFit.cover),
      )

            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(widget.data.titleShort,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                Text(widget.data.artist.name,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                ),),
                Text("${(widget.data.duration/60).toInt()}.${(widget.data.duration%60).toString().padLeft(2, '0')}",style: TextStyle(
                    color: const Color.fromRGBO(30, 206, 240, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                ),),

              ],
            )
            ),
            Spacer(),
            Container(
              width:30,
              height: 30,
              margin: EdgeInsets.all(10),
              child: Image.asset('assets/play.png'),
            ),

          ],
        ),
      ),
    );
  }
  void onPopRecentlyPlayedSong(){
    print("after popopoooppopoop");
    BlocProvider.of<ArtistBloc>(context).add(SongPlayEvent());

  }
}
