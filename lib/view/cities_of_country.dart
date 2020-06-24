import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcountries/helper/style.dart';
import 'package:showcountries/model/countries.dart';

class Countrydetails extends StatefulWidget {
  Countries countries;
  int index;
  Countrydetails(this.countries,this.index);
  @override
  _CountrydetailsState createState() => _CountrydetailsState();
}

class _CountrydetailsState extends State<Countrydetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(" ${widget.countries.name}"), centerTitle: true,), body:

    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text("Cities of country:",style: textStyle,),
        SizedBox(height: 6,),
        ListView.builder(
          shrinkWrap: true,
            itemCount: widget.countries.cities.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${widget.countries.cities[index]["name"]}",style: textStyle,textDirection: TextDirection.rtl),
              );
            })
      ],),
    ));
  }
}

