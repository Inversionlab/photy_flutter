import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wall/controller/apic.dart';
import 'package:wall/models/phmodel.dart';
import 'package:wall/controller/trending.dart';

import 'package:wall/controller/premium.dart';
import 'package:wall/views/screens/fullscreen.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState()=>  _home();
}

class  _home extends State<home>{
  late List<phmodel> tdlist=[];
  late List<phmodel> trending=[];
  late List<phmodel> premium=[];
  getwallpaper() async{
    tdlist=await apic.gettrendingwallpaper();
    trending=await trend.gettrendingwallpaper();
    premium=await prem.gettrendingwallpaper();
  }
  @override
  void initState() {

    super.initState();
    getwallpaper();

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(

          backgroundColor: Colors.cyan,
          elevation: 5,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff004e92),
                  Color(0xff000428),

                ],
                    begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home),text: "home",),
              Tab(icon: Icon(Icons.watch_later_outlined),text: "Trending"),
              Tab(icon: Icon(Icons.star),text: "Premium",),

            ],
          ),
          titleSpacing: 20,

        ),

        backgroundColor: Color(0xff000428),
        body: TabBarView(
          children: [

            SingleChildScrollView(
              physics:ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    height: MediaQuery.of(context).size.height,

                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 300,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 38,
                    ),
                        itemCount: 50,
                        itemBuilder: (context,index)=>InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>fullscreen(uri: trending[index].src)));
                          },
                          child: Container(
                            height: 300,
                            width: 50,
                            child: ClipRRect(

                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: trending[index].src,
                                fit: BoxFit.fill,
                                placeholder:(context,url)=>SizedBox(child: new CircularProgressIndicator(color: Colors.cyanAccent,),height: 2,width: 2,),
                                errorWidget: (context,url,error)=>new Icon(Icons.downloading),
                              ),

                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    height: MediaQuery.of(context).size.height,

                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 300,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 30,
                    ),
                        itemCount: 50,
                        itemBuilder: (context,index)=>InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>fullscreen(uri: tdlist[index].src)));
                          },
                          child: Container(
                            
                            height: 500,
                            width: 50,
                            child: ClipRRect(

                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: tdlist[index].src,
                                fit: BoxFit.fill,
                                placeholder:(context,url)=>SizedBox(child: new CircularProgressIndicator(color: Color(0x000428),),height: 2,width: 2,),
                                errorWidget: (context,url,error)=>new Icon(Icons.downloading),
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    height: MediaQuery.of(context).size.height,

                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 300,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 30,
                    ),
                        itemCount: 40,
                        itemBuilder: (context,index)=>InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>fullscreen(uri:premium[index].src )));
                          },
                          child:Container(
                            
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: premium[index].src,
                                fit: BoxFit.cover,
                                placeholder:(context,url)=>SizedBox(child: new CircularProgressIndicator(color: Colors.cyanAccent,),height: MediaQuery.of(context).size.height/5,width: 2,),
                                errorWidget: (context,url,error)=>new Icon(Icons.downloading),
                              ),
                            ),
                          )
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
