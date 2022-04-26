import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinity_walk/details.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const MaterialApp(
        initialRoute: '/', debugShowCheckedModeBanner: false, home: MyApp()));
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _advancedPlayer = AudioPlayer();
  AudioCache _audioCache = AudioCache();
  bool _height1 = false;
  bool _height2 = false;
  bool _height3 = false;
  bool _welcome = false;

  void _heightChange() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _height1Change();
      _height2Change();
      _height3Change();
      _welcome = true;
    });
  }

  void _height1Change() {
    Future.delayed(const Duration(milliseconds: 1100), () {
      setState(() {
        _height1 = true;
        _playWelcome();
      });
    });
  }

  void _height2Change() {
    Future.delayed(const Duration(milliseconds: 6000), () {
      setState(() {
        _height2 = true;
        _welcome = false;
      });
    });
  }

  void _height3Change() {
    Future.delayed(const Duration(milliseconds: 8600), () {
      setState(() {
        _height3 = true;
      });
    });
  }

  void _playWelcome() async {
    _audioCache.load('music/welcome_speak.mp3');
    _advancedPlayer = await _audioCache.play(
      'music/welcome_speak.mp3',
    );
  }

  void _gotoNext() {
    Future.delayed(const Duration(milliseconds: 12000), () {
      setState(() {
        _advancedPlayer.stop();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => (const Details())));
      });
    });
  }

  @override
  void initState() {
    _heightChange();
    _gotoNext();
    super.initState();
  }

  @override
  void dispose() {
    _advancedPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return ScreenUtilInit(
        designSize: const Size(320, 470),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Eight Pattern Walking',
          home: Scaffold(
            backgroundColor: Colors.lightGreen.shade100,
            appBar: AppBar(
              title: Text(
                'Eight Pattern Walking',
                style: TextStyle(
                    fontFamily: 'paprika',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              toolbarHeight: 60,
              centerTitle: true,
              backgroundColor: Colors.deepOrange,
              elevation: 0.0,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedContainer(
                    duration: const Duration(seconds: 4),
                    width: !_height1 ? 0.0.sw : 0.8.sw,
                    curve: Curves.easeOut,
                    child: const Image(
                      image: AssetImage('assets/images/eight_top_1.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  _welcome
                      ? AnimatedContainer(
                          duration: const Duration(seconds: 4),
                          width: !_welcome ? 0.0 : 0.8.sw,
                          curve: Curves.easeIn,
                          child: const Image(
                            image: AssetImage('assets/images/welcome1.png'),
                            fit: BoxFit.contain,
                          ),
                        )
                      : Column(children: <Widget>[
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            width: !_height3 ? 0.0.sw : 0.8.sw,
                            curve: Curves.fastOutSlowIn,
                            child: const Image(
                              image:
                                  AssetImage('assets/images/eight_top_2.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            width: !_height3 ? 0.0.sw : 0.8.sw,
                            curve: Curves.easeIn,
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/eight_bottom_1.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ]),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 2000),
                    width: !_height2 ? 0.0 : 0.8.sw,
                    curve: Curves.easeInCirc,
                    child: const Image(
                      image: AssetImage('assets/images/eight_bottom_2.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
