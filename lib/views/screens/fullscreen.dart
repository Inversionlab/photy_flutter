import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
class fullscreen extends StatelessWidget {
  String uri;
  fullscreen({super.key,required this.uri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(uri),
            fit: BoxFit.cover,
          )
        ),
      ),
      floatingActionButton:FloatingActionButton.large(
        onPressed: () async{
          // final temp=await getTemporaryDirectory();
          // final path='${temp.path}/myfile.jpg';
          // await Dio().download(uri,path);
          await GallerySaver.saveImage(uri,toDcim: true);
          Fluttertoast.showToast(msg: "Downloaded Successfully..");
        },
        backgroundColor: Colors.white54,
        child: Icon(Icons.file_download_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
