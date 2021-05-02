

import 'package:flutter/material.dart';
import 'package:flutter_graphql_implementation/model/Country.dart';


class HomeCountryItem extends StatelessWidget {
  final Country country;

  HomeCountryItem({@required this.country});


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child:Column(
          children: [

            Item(title: "Code",discription: country?.code),
            Item(title: "Name",discription: country?.name),
            Item(title: "Currency",discription: country?.currency),
            Item(title: "Phone",discription: country?.phone),
            Item(title: "Capital",discription: country?.capital),
            Item(title: "Emoji ui",discription: country?.emojiU),
           Item(title: "Emoji ",discription: country?.emoji),
          ],
        )

    );
  }



   Item({String title,  discription}){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 15),),
          Spacer(),

          Text('$discription',
            style: TextStyle(
                fontSize: 15),),

        ],
      )
    );
  }
}

