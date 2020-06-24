import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:showcountries/model/countries.dart';
class Countriesdata{
  Future<List<Countries>> getdata()async{
    List<Countries> countries=List<Countries>();
    String url="https://www.delivery-web.tk/api/v1/countries";
    var response=await http.get(url);
    if (response.statusCode == 200) {
      var data=jsonDecode(response.body);
    var jasondata=data["data"];
    for(int i=0;i<jasondata.length;i++ ){
      if(jasondata[i]["cities"].length>0) {
        Countries country = Countries(
            name: jasondata[i]["name"], id: jasondata[i]["id"],cities:jasondata[i]["cities"] );
        countries.add(country);
      }
    }
    print(countries.length);
    return countries;
    }
    else{print("faild load");}
    }
}