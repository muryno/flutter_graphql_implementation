import 'package:flutter/material.dart';
import 'package:flutter_graphql_implementation/model/Country.dart';
import 'package:flutter_graphql_implementation/server/country_rx_dart.dart';
import 'package:flutter_graphql_implementation/uiScreens/home_coutry_item.dart';




class  HomeScreen extends StatefulWidget{

  @override
  _HomeScreen createState()  =>  _HomeScreen();

}

class _HomeScreen extends State<HomeScreen>{




  var _search = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Graphql flutter example"),
      ),
      body: SingleChildScrollView(
        child:   Container (
          margin: EdgeInsets.all(16),
          child: Column(


              children: [


                TextField(
                  autocorrect: true,
                  controller: _search,
                  style: TextStyle(color:  Colors.black,),
                  decoration: InputDecoration(
                    hintText: 'Enter country code here eg us, ng',),
                ),

                ElevatedButton(
                  onPressed: (){
                    if(_search.text!= null) {
                      countryRx.fetchCountryByCode(_search.text);
                    }
                  },
                  child: Text("search "),
                ),





                Container(
                  child:
                  StreamBuilder(
                    stream: countryRx.fetchCountry,
                    builder: (context, AsyncSnapshot<Country>  snapshot){
                      if(snapshot.hasData ){



                        if(snapshot.data?.code!=null) {
                          return HomeCountryItem(country: snapshot.data);
                        }else{
                          return Center(
                            child: Text("Kindly use upper case e.g US, NG"),
                          );
                        }

                      }else if(snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }

                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),)

              ]
          ),


        ),
      )
    );
  }
}