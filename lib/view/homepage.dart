import 'package:flutter/material.dart';
import 'package:showcountries/helper/countriesData.dart';
import 'package:showcountries/helper/style.dart';
import 'package:showcountries/model/countries.dart';

import 'cities_of_country.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Countries countries = Countries();
  Countriesdata countriesdata = Countriesdata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
            future: countriesdata.getdata(),
            // ignore: missing_return
            builder: (context, AsyncSnapshot snapshot) {
              var value = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("no connection");
                  break;
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                  break;
                case ConnectionState.done:
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Countrydetails(value[index], index);
                                  }));
                                },
                                title: Row(
                                  children: <Widget>[
                                    Text("country name: ",
                                        style: textStyle,
                                       ),
                                    Text(" ${value[index].name}",
                                        style: textStyle,
                                        textDirection: TextDirection.rtl),
                                  ],
                                ),
                                subtitle: Row(
                                  children: <Widget>[
                                    Text("country _Id: ${value[index].id}",
                                        style: textStyle,
                                        textDirection: TextDirection.ltr),
                                  ],
                                ),
                              ),
                            ));
                      });
                  break;
                case ConnectionState.active:
                  return CircularProgressIndicator();
                  break;
              }
            }),
      ),
    );
  }
}
