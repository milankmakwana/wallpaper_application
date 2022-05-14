// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({
    Key? key,
    required this.imageurl,
  }) : super(key: key);
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('SetWallPaper'))),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.network(widget.imageurl),
            ),
          ),
          InkWell(
            onTap: () {
              setwallpaper();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text('Set Wallpaper',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
