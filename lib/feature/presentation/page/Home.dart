import 'package:ashe_music/feature/domain/model/search_model.dart';
import 'package:ashe_music/feature/domain/model/singers_model.dart';
import 'package:ashe_music/feature/presentation/page/Music_player_page.dart';
import 'package:ashe_music/feature/presentation/widget/singer_widget.dart';
import 'package:ashe_music/feature/presentation/widget/song_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/model/genre_model.dart';
import '../bloc/artist_bloc.dart';
import '../widget/gener_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<ArtistBloc>(context).add(GenreLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(30, 206, 240, 1),
        title: Text("Music App"),
      ),
      body: _blocBuild(),
    );
  }

  _blocBuild() {
    var bloc = BlocProvider.of<ArtistBloc>(context);
   print("home pr to data aya h");
    return BlocBuilder<ArtistBloc, ArtistState>(
        builder: (_, state) {
          var list = bloc.genre;
          print(bloc.artists.length.toString());
          var singerList = bloc.artists;
          if (list != null && singerList != null) {
            return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleHeaderWidget(heading: "Genre"),
                    GenreListViewWidget(list: list),
                    TitleHeaderWidget(heading: "Artist",),
                    SingerListViewWidget(singerList: singerList),
                    TitleHeaderWidget(heading: "Recently played"),
                    SongListViewWiget(singerList: bloc.lastPlayed),
                  ],
                ));
          }
          else {
            return Text("hi");
          }
        });
  }

  ListView getArtist(List<Datum> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GenerWidget(name: list[index].name, url: list[index].picture);
      },
    );
  }
}

class GenreListViewWidget extends StatelessWidget {
  const GenreListViewWidget({
    super.key,
    required this.list,
  });

  final List<Datum> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return SingerWidget(
            name: list[index].name,
            url: list[index].picture,
            id: list[index].id,
          );
        },
      ),
    );
  }
}

class SongListViewWiget extends StatelessWidget {
  const SongListViewWiget({
    super.key,
    required this.singerList,
  });

  final List<SearchData> singerList;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistBloc, ArtistState>(
      builder: (_, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: singerList.length,
          itemBuilder: (context, index) {
            return SongWidget(data: this.singerList[index], position: index,);
          },
        );
      },
    );
  }
}

class SingerListViewWidget extends StatelessWidget {
  const SingerListViewWidget({
    super.key,
    required this.singerList,
  });


  final List<SingerModel>? singerList;

  @override
  Widget build(BuildContext context) {
    if (singerList == null)
      return Text("played");
    return SizedBox(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: singerList?.length,
        itemBuilder: (context, index) {
          return GenerWidget(
              name: singerList![index].name,
              url: singerList![index].picture);
        },
      ),
    );
  }
}

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget({
    super.key,
    required this.heading
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Text(
          "${heading}",
          style: TextStyle(
            color: Color.fromRGBO(30, 206, 240, 1),
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ));
  }
}
