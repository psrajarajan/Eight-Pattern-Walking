import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishingEn extends StatefulWidget {
  const FinishingEn({Key? key}) : super(key: key);

  @override
  _FinishingEnState createState() => _FinishingEnState();
}

class _FinishingEnState extends State<FinishingEn> {
  bool _height1 = false;
  bool _height2 = false;

  void _heightChange() {
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _height1 = true;
      });
      _height2Change();
    });
  }

  void _height2Change() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        _height2 = true;
      });
    });
  }

  @override
  void initState() {
    _heightChange();
    super.initState();
  }

  @override
  void dispose() {
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
                'Eight pattern walking',
                style: TextStyle(
                    fontFamily: 'paprika',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              toolbarHeight: 60,
              centerTitle: true,
              backgroundColor: Colors.deepPurple.shade900,
              elevation: 0.0,
            ),
            body: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.decelerate,
                  left: MediaQuery.of(context).size.width * 0.5 - 0.35.sw,
                  top: !_height1
                      ? -2.0.sw
                      : MediaQuery.of(context).size.height / 4 - 0.30.sw,
                  child: SizedBox(
                    width: 0.7.sw,
                    height: 0.7.sw,
                    child: const Image(
                      image: AssetImage('assets/images/youdidit.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.bounceOut,
                  left: MediaQuery.of(context).size.width * 0.5 - 0.35.sw,
                  top: !_height2
                      ? 2.0.sw
                      : MediaQuery.of(context).size.height / 4 + 0.30.sw,
                  child: SizedBox(
                    width: 0.7.sw,
                    height: 0.7.sw,
                    child: const Image(
                      image: AssetImage('assets/images/great_day.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
