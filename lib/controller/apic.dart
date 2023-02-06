import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wall/models/phmodel.dart';
class apic{
  static List<phmodel> tdwallpaper=[];
  static List<phmodel> searchlist=[];
  static gettrendingwallpaper() async{

    await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?7page=3&per_page=50"),
      headers: {
          "Authorization":"iuK48sxsdvekBedqbZaluCmYTRVdDu0gY6owqMcvtBNCuydvkNtbe4Og"
      }
        ).then((value){
          Map<String,dynamic> js=jsonDecode(value.body);
          List ph=js["photos"];
          ph.forEach((element) {

            tdwallpaper.add(phmodel.fromapitoapp(element));
          });
    });
    return tdwallpaper;
  }
  getsearch(String query) async{

    await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":"iuK48sxsdvekBedqbZaluCmYTRVdDu0gY6owqMcvtBNCuydvkNtbe4Og"
        }
    ).then((value){
      Map<String,dynamic> js=jsonDecode(value.body);
      List ph=js["photos"];
      searchlist.clear();
      ph.forEach((element) {


        searchlist.add(phmodel.fromapitoapp(element));
      });
    });
    return searchlist;

  }
}