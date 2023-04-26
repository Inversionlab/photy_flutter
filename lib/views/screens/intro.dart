

import 'package:flutter/material.dart';
import 'package:wall/views/screens/home.dart';
class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0F2027),
              Color(0xff203A43),
              Color(0xff2C5364)
              
            ],
          )
        ),
        alignment: Alignment.center,
          child: Column(
            children: [

              Image.asset("images/tt.png",height: 300,width: 300,),
              Text("H E Y Y...",style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold,color: Colors.white),),
              Text(" WELCOME...",style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold,color:Colors.white),),

              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),
                    children: [
                      WidgetSpan(child: Icon(Icons.warning_amber_rounded,size: 40,color: Colors.redAccent,)),
                      TextSpan(text: "This is pre build app..\nif images are not loading \nTRY TO SCROLL MORE..",style:TextStyle(color: Colors.white54)),
                    ],
                  )
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 100),
                child: FloatingActionButton.extended(
                  hoverElevation: 15,
                  onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>home()),(Route<dynamic> r)=>false);
              },
                  label: Text("Get Started",style: TextStyle(color:Colors.black),),
                icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
                backgroundColor: Color(0xffC6FFDD),


              ),),

            ],
          ),
      ) ,
    );
  }
}
