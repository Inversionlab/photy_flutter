import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wall/models/phmodel.dart';
class trend{
  static gettrendingwallpaper() async{
    List<phmodel> tdwallpaper=[];
    await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?page=4&per_page=50"),
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
}