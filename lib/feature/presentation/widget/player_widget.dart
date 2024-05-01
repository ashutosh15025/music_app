
import 'package:ashe_music/feature/domain/model/search_model.dart';
import 'package:ashe_music/feature/presentation/bloc/artist_bloc.dart';
import 'package:ashe_music/feature/presentation/widget/slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key, required this.listdata,  required this.position});
   final List<SearchData> listdata;
  final int position;

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
   bool showProgressBar = true;
   int songIndex=0;
   ArtistBloc ? bloc;



   @override
   void dispose() {
     super.dispose();

   }
   @override
  void initState() {
     bloc = BlocProvider.of<ArtistBloc>(context);
     counter(widget.position);

     super.initState();
  }
  @override
  Widget build(BuildContext context) {
  print(songIndex.toString()+"posiiton");
  return Stack(
    children: [Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Container(
            height: 500,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.listdata![songIndex].album.coverXl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
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
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            widget.listdata[songIndex].album.title,
            maxLines: 1,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            widget.listdata[songIndex].album.title,
            maxLines: 1,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
        SliderWidget(url: widget.listdata![songIndex].preview.toString(),counterCallback: counter,songLoading: progressBarVisiblity,),
      ],
    ),
      Visibility(
        visible: showProgressBar,
          child: Center(
        child: CircularProgressIndicator(),
      ))
      ],
  );
  }


  void counter(int x){
    setState(() {
      songIndex+=x;
      print(songIndex);

      if(songIndex==widget.listdata?.length||songIndex<0)
        songIndex=0;

      checkIfExists();


    });


  }

  void checkIfExists(){
     int pos=-1;
     for(var i in bloc!.lastPlayed){
       print(i.title.toString()+"index");
     }
   for (int i=0 ;i<bloc!.lastPlayed.length;i++){

     if(bloc!.lastPlayed[i].id==widget.listdata[songIndex].id)
       {
         pos=i;
         print("break");
         break;
       }
     else{
       print("no break");
     }
   }
   print("yaha aya");

   bloc!.lastPlayed.insert(0, widget.listdata[songIndex]);
     if(pos!=-1)
      bloc!.lastPlayed.removeAt(pos+1);
     print(songIndex.toString());
     for(var i in bloc!.lastPlayed){
       print(i.title.toString()+"index");
     }
for(var i in widget.listdata){
  print(i.title.toString()+"index");
}
  }



   void progressBarVisiblity(){
     showProgressBar=!showProgressBar;
   setState(() {
     showProgressBar;
     print(showProgressBar);
   });
   }

}

