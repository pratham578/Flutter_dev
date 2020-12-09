import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Ted2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    _getBoxImage(String imgURL){
      return Container(
          child: Image(
            image: NetworkImage(imgURL),
          ),
      );
    }
    _getBox(String imgURL,String imgText, String imgSubText){
      return Container(
        child: Stack(
          children: [
            _getBoxImage(imgURL),
            Positioned(
              bottom: 20,
              left:0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween    ,
                  children: [
                     Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(imgText,style: TextStyle(color: Colors.white54, fontSize: 20, fontWeight: FontWeight.bold),),
                           Text(imgSubText,style: TextStyle(color: Colors.white, fontSize: 15,),),
                         ],
                       ),
                     ),
                    Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.more_vert,
                          color: Colors.white54,
                          size: 20,
                        ),
                      ],
                    ),
                    ),
                  ],
                ),
            )
          ],
        ),
      );

    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
              // mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all((2)),
                child: _getBox('https://upload.wikimedia.org/wikipedia/commons/e/e6/Pixarpiersunset2019_%28cropped%29.jpg',
                    'Amusement Park Italy',
                    'Gardaland is the Disneyland of Italy and India .... @@'),
              ),
              Container(
                padding: EdgeInsets.all((2)),
                child: _getBox('https://upload.wikimedia.org/wikipedia/commons/d/d3/Wikifenagh.jpg',
                    'Natural Satellite Moon',
                    'The Moon is a rounded astronomical body.'),
              ),
              Container(
                padding: EdgeInsets.all((2)),
                child: _getBox('https://upload.wikimedia.org/wikipedia/commons/3/3b/Central_Park_on_foggy_night.jpg',
                    'Central Park on foggy night.',
                    'A park is an area of natural, semi-natural or planted space.'),),
            ],
          ),
        ),
      )
      );
  }
}
