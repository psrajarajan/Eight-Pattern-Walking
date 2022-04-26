import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinity_walk/compass.dart';
import 'package:infinity_walk/finishing.dart';
import 'package:wakelock/wakelock.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  AudioPlayer advancedPlayer1 = AudioPlayer();
  AudioCache audioCache1 = AudioCache();
  AudioPlayer advancedPlayer2 = AudioPlayer();
  AudioCache audioCache2 = AudioCache();
  AudioPlayer advancedPlayer3 = AudioPlayer();
  AudioCache audioCache3 = AudioCache();

  double _clock = 60.0;
  double _clock1 = 60.0;
  double _clock2 = 60.0;
  double _duration = 60.0;

  Timer _timer1 = Timer(const Duration(seconds: 0), () {});
  Timer _timer2 = Timer(const Duration(seconds: 0), () {});
  Timer _timer3 = Timer(const Duration(seconds: 0), () {});
  Timer _timer4 = Timer(const Duration(seconds: 0), () {});

  bool _isSouth1 = false;
  bool _isSouth2 = false;
  bool _isSouth3 = false;
  bool _isSouth4 = false;
  bool _isSouth5 = false;
  bool _isSouth6 = false;
  bool _isSouth7 = false;
  bool _isSouth8 = false;
  bool _isNorth1 = false;
  bool _isNorth2 = false;
  bool _isNorth3 = false;
  bool _isNorth4 = false;
  bool _isNorth5 = false;
  bool _isNorth6 = false;
  bool _isNorth7 = false;
  bool _isNorth8 = false;

  bool _isStart = false;
  bool _isSouthNorth = false;
  bool _isFinished = false;
  bool _isDemo = true;
  bool _isFive = false;
  bool _isTen = false;
  bool _isFifteen = false;
  bool _isTwentyOne = false;
  bool _isThirty = false;
  bool _isInstruction = false;

  String _guide = '';

  void playMusic() async {
    audioCache1.load('music/ytm_valentine2021_sitar_flute.mp3');
    advancedPlayer1 = await audioCache1.loop(
      'music/ytm_valentine2021_sitar_flute.mp3',
    );
  }

  void playTenChime() async {
    audioCache2.load('music/westmister_ten_chime.mp3');
    advancedPlayer2 = await audioCache2.play(
      'music/westmister_ten_chime.mp3',
    );
  }

  void playFiveChime() async {
    _isSouthNorth = true;
    _isSouth1 = true;
    _guide =
        'Get ready.\nStand @ South, Face @ East\nAfter 5 bells, start walking';
    _isInstruction = true;
    audioCache3.load('music/westmister_five_chime.mp3');
    advancedPlayer3 = await audioCache3.play('music/westmister_five_chime.mp3');
    _walkStart();
  }

  void _reminder1() {
    _clock1 = _duration;
    _timer2 = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_clock1 < 26) {
        _isNorth1 = true;
        _isInstruction = true;
        _guide = 'Get ready.\nAfter 10 bells,\nreverse the walking direction';
        advancedPlayer1.pause();
        playTenChime();
        _timer2.cancel();
      } else {
        _clock1 = _clock1 - 1;
      }
    });
  }

  void southNorth() {
    _isInstruction = false;
    _guide = '';
    playMusic();

    _isSouthNorth = true;
    _reminder1();
    _clock = _duration;
    _timer1 = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_clock < 1) {
        setState(() {
          _isSouth1 = false;
          _isSouth2 = false;
          _isSouth3 = false;
          _isSouth4 = false;
          _isSouth5 = false;
          _isSouth6 = false;
          _isSouth7 = false;
          _isSouth8 = false;
        });
        northSouth();
        _timer1.cancel();
      } else {
        _clock = _clock - 1;
        if (_isSouth7 == true && _isSouth8 == false) {
          _isSouth8 = true;
        } else if (_isSouth6 == true && _isSouth7 == false) {
          _isSouth7 = true;
        } else if (_isSouth5 == true && _isSouth6 == false) {
          _isSouth6 = true;
        } else if (_isSouth4 == true && _isSouth5 == false) {
          _isSouth5 = true;
        } else if (_isSouth3 == true && _isSouth4 == false) {
          _isSouth4 = true;
        } else if ((_isSouth1 == true) &&
            (_isSouth2 == true) &&
            (_isSouth3 == true) &&
            (_isSouth4 == true) &&
            (_isSouth5 == true) &&
            (_isSouth6 == true) &&
            (_isSouth7 == true) &&
            (_isSouth8 == true)) {
          _isSouth1 = true;
          _isSouth2 = false;
          _isSouth3 = false;
          _isSouth4 = false;
          _isSouth5 = false;
          _isSouth6 = false;
          _isSouth7 = false;
          _isSouth8 = false;
        } else if (_isSouth2 == true && _isSouth3 == false) {
          _isSouth3 = true;
        } else if (_isSouth1 == true && _isSouth2 == false) {
          _isSouth2 = true;
        } else if (_isSouth1 == false) {
          _isSouth1 = true;
        }
        setState(() {});
      }
    });
  }

  void _reminder2() {
    _clock2 = _duration;

    _timer4 = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_clock2 < 26) {
        advancedPlayer1.stop();
        playTenChime();
        _timer4.cancel();
      } else {
        _clock2 = _clock2 - 1;
      }
    });
  }

  void northSouth() {
    _clock = _duration;
    _isInstruction = false;
    _guide = '';
    advancedPlayer2.stop();
    playMusic();
    _reminder2();
    _isSouthNorth = false;
    _timer3 = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_clock < 1) {
        setState(() {
          _isNorth1 = false;
          _isNorth2 = false;
          _isNorth3 = false;
          _isNorth4 = false;
          _isNorth5 = false;
          _isNorth6 = false;
          _isNorth7 = false;
          _isNorth8 = false;
        });
        Wakelock.disable();
        _isFinished = true;
        advancedPlayer2.stop();
        _haveNice();

        _timer3.cancel();
      } else {
        _clock = _clock - 1;
        if (_isNorth7 == true && _isNorth8 == false) {
          _isNorth8 = true;
        } else if (_isNorth6 == true && _isNorth7 == false) {
          _isNorth7 = true;
        } else if (_isNorth5 == true && _isNorth6 == false) {
          _isNorth6 = true;
        } else if (_isNorth4 == true && _isNorth5 == false) {
          _isNorth5 = true;
        } else if (_isNorth3 == true && _isNorth4 == false) {
          _isNorth4 = true;
        } else if ((_isNorth1 == true) &&
            (_isNorth2 == true) &&
            (_isNorth3 == true) &&
            (_isNorth4 == true) &&
            (_isNorth5 == true) &&
            (_isNorth6 == true) &&
            (_isNorth7 == true) &&
            (_isNorth8 == true)) {
          _isNorth1 = true;
          _isNorth2 = false;
          _isNorth3 = false;
          _isNorth4 = false;
          _isNorth5 = false;
          _isNorth6 = false;
          _isNorth7 = false;
          _isNorth8 = false;
        } else if (_isNorth2 == true && _isNorth3 == false) {
          _isNorth3 = true;
        } else if (_isNorth1 == true && _isNorth2 == false) {
          _isNorth2 = true;
        } else if (_isNorth1 == false) {
          _isNorth1 = true;
        }

        setState(() {});
      }
    });
  }

  void _haveNice() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FinishingEn()));
    });
  }

  void _walkStart() {
    Future.delayed(const Duration(seconds: 17), () {
      advancedPlayer3.stop();
      southNorth();
    });
  }

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
  }

  @override
  void dispose() {
    _timer1.cancel();
    _timer2.cancel();
    _timer3.cancel();
    _timer4.cancel();
    advancedPlayer1.dispose();
    advancedPlayer2.dispose();
    advancedPlayer3.dispose();
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
              key: _scaffoldkey,
              backgroundColor: Colors.lightGreen.shade100,
              appBar: AppBar(
                leading: IconButton(
                  icon: Image.asset('assets/images/compass_icon.png'),
                  onPressed: () => _scaffoldkey.currentState?.openDrawer(),
                ),
                title: Text(
                  'Eight Pattern Walking',
                  style: TextStyle(
                      fontFamily: 'paprika',
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                toolbarHeight: 70.0,
                centerTitle: true,
                backgroundColor: Colors.brown.shade600,
                elevation: 0.0,
              ),
              drawer: Container(
                width: 0.65.sw,
                padding: const EdgeInsets.all(0),
                child: Drawer(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 0.2.sh,
                          child: DrawerHeader(
                            child: RichText(
                              text: TextSpan(
                                text: '8-Shaped Figure',
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                ),
                                children: [
                                  TextSpan(
                                    text: '\nLayout &\n Walking Direction',
                                    style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const Compass(),
                        RichText(
                          text: TextSpan(
                            text: '\nLayout',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                '\nForm the shape of ‘8’ by drawing two circles each of about 6 or 8 feet diameter in the south-north direction. You may use the above compass to confirm the direction.',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        RichText(
                          text: TextSpan(
                            text: '\nWalking direction',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                '\nFirst half cycle:\nFrom South (facing East) to North. \nSecond half cycle:\nFrom North (facing West) to South.',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Container(
                              alignment: Alignment.center,
                              child: !_isFinished
                                  ? Text('West',
                                      style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown.shade800,
                                      ))
                                  : const Text(''),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                child: !_isFinished
                                    ? Text('North',
                                        style: TextStyle(
                                          fontFamily: 'nunito',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0.sp,
                                          color: Colors.brown.shade800,
                                        ))
                                    : const Text('')),
                            _isSouthNorth
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isSouth4 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/south4.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isSouth5 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/south5.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(0),
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isNorth1 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/north1.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isNorth8 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/north8.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            _isSouthNorth
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isSouth3 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/south3.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isSouth6 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/south6.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isNorth2 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/north2.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isNorth7 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/north7.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            _isSouthNorth
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isSouth7 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/south7.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isSouth2 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/south2.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isNorth6 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/north6.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isNorth3 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/north3.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            _isSouthNorth
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isSouth8 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/south8.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isSouth1 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/south1.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isNorth5 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/north5.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.15.sh,
                                        width: 0.30.sw,
                                        child: AnimatedOpacity(
                                          opacity: _isNorth4 ? 1.0 : 0.0,
                                          duration: const Duration(seconds: 0),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/north4.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            Container(
                                alignment: Alignment.center,
                                child: !_isFinished
                                    ? Text('South',
                                        style: TextStyle(
                                          fontFamily: 'nunito',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0.sp,
                                          color: Colors.brown.shade800,
                                        ))
                                    : const Text('')),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: !_isFinished
                                  ? Text('East',
                                      style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown.shade800,
                                      ))
                                  : const Text(''),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 2.0,
                      color: !_isFinished
                          ? Colors.green.shade800
                          : Colors.transparent,
                    ),
                    if (!_isStart)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            color:
                                !_isDemo ? Colors.red : Colors.brown.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            elevation: 2.0,
                            onPressed: _isDemo
                                ? () {
                                    setState(() {
                                      _duration = 60.0;
                                      _isDemo = true;
                                      _isFive = false;
                                      _isTen = false;
                                      _isFifteen = false;
                                      _isTwentyOne = false;
                                      _isThirty = false;
                                    });
                                  }
                                : () {
                                    setState(() {
                                      _duration = 60.0;
                                      _isDemo = true;
                                      _isFive = false;
                                      _isTen = false;
                                      _isFifteen = false;
                                      _isTwentyOne = false;
                                      _isThirty = false;
                                    });
                                  },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            minWidth: 0.18.sw,
                            height: 0.015.sh,
                            padding: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                'Demo',
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                    fontSize: (16.sp)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: !_isStart
                                ? () {
                                    playFiveChime();
                                    setState(() {
                                      _isStart = true;
                                    });
                                  }
                                : () {},
                            fillColor: Colors.deepOrange,
                            child: Text('Start',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (18.sp),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'nunito')),
                            shape: const CircleBorder(
                              side: BorderSide(
                                width: 8.0,
                                color: Color.fromRGBO(128, 0, 0, 0.5),
                                style: BorderStyle.solid,
                              ),
                            ),
                            padding: const EdgeInsets.all(30.0),
                          ),
                          MaterialButton(
                            color:
                                !_isThirty ? Colors.red : Colors.brown.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            elevation: 2.0,
                            onPressed: () {
                              setState(() {
                                _duration = 1800.0;
                                _isThirty = true;
                                _isFive = false;
                                _isDemo = false;
                                _isTen = false;
                                _isFifteen = false;
                                _isTwentyOne = false;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            minWidth: 0.2.sw,
                            height: 0.015.sh,
                            padding: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                '60 min',
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: (16.sp)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      !_isFinished
                          ? _isInstruction
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 0.03.sh,
                                    ),
                                    Text(_guide,
                                        style: TextStyle(
                                          fontFamily: 'nunito',
                                          fontSize: 16.0.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple.shade900,
                                        ),
                                        textAlign: TextAlign.center),
                                  ],
                                )
                              : Text(
                                  (_clock / 60)
                                          .truncateToDouble()
                                          .toStringAsFixed(0) +
                                      ':' +
                                      (_clock % 60)
                                          .toStringAsFixed(0)
                                          .padLeft(2, '0'),
                                  style: _isSouthNorth
                                      ? TextStyle(
                                          fontSize: 80.0.sp,
                                          color: Colors.brown.shade600,
                                          fontWeight: FontWeight.bold,
                                        )
                                      : (_isDemo ||
                                              _isFive ||
                                              _isTen ||
                                              _isFifteen ||
                                              _isTwentyOne ||
                                              _isThirty)
                                          ? TextStyle(
                                              fontSize: 80.0.sp,
                                              // color: Colors.deepPurple.shade900,
                                              color: Colors.deepPurple.shade900,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : TextStyle(
                                              fontSize: 80.0.sp,
                                              // color: Colors.deepPurple.shade900,
                                              color: Colors.transparent,
                                              fontWeight: FontWeight.bold,
                                            ))
                          : const Text(''),
                    !_isStart
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                color: !_isFive
                                    ? Colors.red
                                    : Colors.brown.shade700,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                elevation: 2.0,
                                onPressed: () {
                                  setState(() {
                                    _duration = 300.0;
                                    _isFive = true;
                                    _isDemo = false;
                                    _isTen = false;
                                    _isFifteen = false;
                                    _isTwentyOne = false;
                                    _isThirty = false;
                                  });
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                minWidth: 0.18.sw,
                                height: 0.015.sh,
                                padding: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    '10 min',
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: (16.sp)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                color: !_isTen
                                    ? Colors.red
                                    : Colors.brown.shade700,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                elevation: 2.0,
                                onPressed: () {
                                  setState(() {
                                    _duration = 600.0;
                                    _isTen = true;
                                    _isFive = false;
                                    _isDemo = false;
                                    _isFifteen = false;
                                    _isTwentyOne = false;
                                    _isThirty = false;
                                  });
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                minWidth: 0.18.sw,
                                height: 0.015.sh,
                                padding: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    '20 min',
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: (16.sp)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                color: !_isFifteen
                                    ? Colors.red
                                    : Colors.brown.shade700,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                elevation: 2.0,
                                onPressed: () {
                                  setState(() {
                                    _duration = 900.0;
                                    _isFifteen = true;
                                    _isFive = false;
                                    _isDemo = false;
                                    _isTen = false;
                                    _isTwentyOne = false;
                                    _isThirty = false;
                                  });
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                minWidth: 0.18.sw,
                                height: 0.015.sh,
                                padding: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    '30 min',
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: (16.sp)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                color: !_isTwentyOne
                                    ? Colors.red
                                    : Colors.brown.shade700,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                elevation: 2.0,
                                onPressed: () {
                                  setState(() {
                                    _duration = 1260.0;
                                    _isTwentyOne = true;
                                    _isFive = false;
                                    _isDemo = false;
                                    _isTen = false;
                                    _isFifteen = false;
                                    _isThirty = false;
                                  });
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                minWidth: 0.18.sw,
                                height: 0.015.sh,
                                padding: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    '42 min',
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: (16.sp)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}
