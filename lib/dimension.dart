import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinity_walk/practice.dart';

class Dimension extends StatefulWidget {
  const Dimension({Key? key}) : super(key: key);

  @override
  State createState() => _DimensionState();
}

class _DimensionState extends State<Dimension> {
  bool _dimension = false;
  bool _alternate = false;
  final String _alternate1 = '6 ft x 12 ft dimension is recommended.';
  final String _alternate2 =
      'If it is not comfortable, we can use 8 ft x 16 ft.';

  void _initialChange() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _dimensionChange();
      _altDimension();

      // _gotoNext();
    });
  }

  void _dimensionChange() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _dimension = true;
      });
    });
  }

  void _altDimension() {
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _alternate = true;
      });
    });
  }

  void _gotoNext() {
    Future.delayed(const Duration(seconds: 13), () {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => (const Practice())));
      });
    });
  }

  @override
  void initState() {
    _initialChange();
    _gotoNext();
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
                'Eight Pattern Walking',
                style: TextStyle(
                    fontFamily: 'paprika',
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              toolbarHeight: 60,
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(255, 20, 147, 1.0),
              elevation: 0.0,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Text('North',
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      )),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 3000),
                    curve: Curves.easeInCirc,
                    height: !_dimension ? 0.0 : 0.6.sh,
                    width: !_dimension ? 0.0 : 0.8.sw,
                    child: Image(
                      image:
                          AssetImage('assets/images/eight_dimension_image.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text('South',
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      )),
                  Divider(
                    thickness: 2.0,
                    height: 2.0,
                    color:
                        _alternate ? Colors.green.shade800 : Colors.transparent,
                  ),
                  _alternate
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(
                                _alternate1,
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                _alternate2,
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(
                                height: 0.1.sw,
                              )
                            ])
                      : const Text(''),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
