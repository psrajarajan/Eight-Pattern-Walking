import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinity_walk/dimension.dart';
import 'package:infinity_walk/practice.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(320, 470),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.lightGreen.shade100,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.green.shade700,
              toolbarHeight: 60,
              bottomOpacity: 0.5,
              title: Text(
                'Eight Pattern Walking',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'paprika',
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 0.0,
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 0.01.sh,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                  color: Colors.transparent,
                  child: RichText(
                    text: TextSpan(
                      text: 'What is 8-pattern walking?',
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '\nInstead of walking straight, walking in the shape of \'8\' at normal speed is called 8-pattern walking (or Infinity walking).',
                          style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                  color: Colors.transparent,
                  child: RichText(
                    text: TextSpan(
                        text: 'Benefits of 8-pattern walking:',
                        style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '\nIt helps us avoid and treat several chronic diseases like Obesity, Diabetes, Heart attack, Kidney related disorders, High Blood Pressure, High Cholesterol and many more. 20 minutes of walking in the shape \'8\' is equivalent to 1 hour of regular walking.',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                  color: Colors.transparent,
                  child: RichText(
                    text: TextSpan(
                        text: 'When & How to walk in 8-shape?',
                        style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '\nWalk both in the morning and evening when the stomach is empty. We should walk in bare foot. In the first half cycle, walk from South (facing East) to North and in the second half cycle, walk from North (facing West) to South. While walking, concentrate on the shape 8 and breathe slowly. Having Yoga mudra while walking gives additional benefits. After completing the walking, do some simple stretching & breathing exercise.',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                  color: Colors.transparent,
                  child: RichText(
                    text: TextSpan(
                      text: 'Who can do it?',
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '\nAny adult person between the ages of 18 and 75 can do this walking. Pregnant ladies and cancer patients are not advised to practice this walking.',
                          style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                  color: Colors.transparent,
                  child: RichText(
                    text: TextSpan(
                        text: 'How to form 8-shape & where to draw?',
                        style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '\nForm the shape of ‘8’ by drawing two circles each of about 6 or 8 feet diameter in the south-north direction. This can be drawn at the backyard, terrace, car parking, road or even at living space or just place two chairs at 3 feet distance and walk around them in 8-pattern.',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ]),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (const Dimension())));
                        },
                        child: const Text('Dimension check'),
                        style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            primary: Colors.white,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0.r)),
                            elevation: 6.0,
                            shadowColor: Colors.brown.shade200,
                            textStyle: TextStyle(
                              fontFamily: 'nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0.sp,
                              color: Colors.black,
                            )),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (const Practice())));
                        },
                        child: const Text('Proceed to walk'),
                        style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            primary: Colors.white,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0.r)),
                            elevation: 6.0,
                            shadowColor: Colors.brown.shade200,
                            textStyle: TextStyle(
                              fontFamily: 'nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0.sp,
                              color: Colors.black,
                            )),
                      ),
                    ]),
                SizedBox(
                  height: 0.01.sh,
                ),
              ],
            ))),
      ),
    );
  }
}
