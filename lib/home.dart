import 'package:flutter/material.dart';
import 'package:submission_flutter/detail.dart';
import 'package:submission_flutter/data_hotel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("List Hotel")
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final DataHotel hotel = hotelList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(hotel: hotel);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Image.network(
                    hotel.imageUrl[1],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          hotel.name,
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            for (var i=0; i<hotel.stars; i++)
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ]
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          hotel.roomPrice,
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]
                    )
                  )
                ]
              )
            )
          );
        },
        itemCount: hotelList.length,
      ),
    );
  }
}