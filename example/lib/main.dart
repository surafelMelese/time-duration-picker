import 'package:flutter/material.dart';
import 'package:time_duration_picker/time_duration_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SetAlarm(),
    );
  }
}

class SetAlarm extends StatefulWidget {
  const SetAlarm({Key? key}) : super(key: key);

  @override
  State<SetAlarm> createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  String alarmTime = "8:10 AM";
  String bedTime = "10:30 AM";
  String sleepDuration = "??";
  @override
  Widget build(BuildContext context) {
    double smallerMarginRatio = 0.025;

    double horizontalPadding = 0.08;

    double verticalPadding = 0.05;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 248, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizontalPadding,
                vertical: size.height * verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * smallerMarginRatio),
                TimeDurationPicker(
                  start: const TimeOfDay(hour: 8, minute: 10),
                  end: const TimeOfDay(hour: 10, minute: 30),
                  diameter: size.width * 0.775,
                  icon1Data: Icons.notifications_none,
                  icon2Data: Icons.bed,
                  knobDecoration: const BoxDecoration(
                      color: Color.fromRGBO(167, 153, 240, 1)),
                  clockDecoration: const BoxDecoration(
                      gradient: RadialGradient(colors: [
                    Color.fromRGBO(167, 153, 240, 1),
                    Colors.white
                  ])),
                  knobBackgroundDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(218, 224, 238, 1),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.white,
                        Color.fromRGBO(218, 224, 238, 1),
                      ],
                      stops: [0.1, 1],
                    ),
                  ),
                  onIcon1RotatedCallback: (value) {
                    setState(() {
                      alarmTime = value;
                    });
                  },
                  onIcon2RotatedCallback: (value) {
                    setState(() {
                      bedTime = value;
                    });
                  },
                  setDurationCallback: (value) {
                    setState(() {
                      sleepDuration = value;
                    });
                  },
                ),
                SizedBox(height: size.height * 2 * smallerMarginRatio),
                SizedBox(
                  width: size.width * 0.45,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      sleepDuration,
                      style: const TextStyle(
                        color: Color.fromRGBO(
                          54,
                          61,
                          86,
                          1,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 2 * smallerMarginRatio),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AlarmDescription(
                        iconData: Icons.bed,
                        title: "Bedtime",
                        width: size.width * 0.4,
                        time: bedTime),
                    AlarmDescription(
                        iconData: Icons.notifications_none,
                        title: "Wake Up",
                        width: size.width * 0.4,
                        time: alarmTime)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlarmDescription extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String time;
  final double width;
  const AlarmDescription(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.width,
      required this.time})
      : super(key: key);

  @override
  _AlarmDescriptionState createState() => _AlarmDescriptionState();
}

class _AlarmDescriptionState extends State<AlarmDescription> {
  double horizontalPadding = 0.15;
  double verticalPadding = 0.1;
  double aspectRatio = 0.8;
  late double height;

  @override
  void initState() {
    super.initState();
    height = widget.width / aspectRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: height,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(252, 253, 255, 1),
          borderRadius: BorderRadius.circular(widget.width * 0.25)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * verticalPadding,
            horizontal: widget.width * horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.iconData,
              color: const Color.fromRGBO(167, 153, 240, 1),
              size: height * 0.3,
            ),
            SizedBox(
              width: widget.width * (1 - 2 * horizontalPadding) * 0.65,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: Color.fromRGBO(
                        54,
                        61,
                        86,
                        1,
                      ),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: widget.width * (1 - 2 * horizontalPadding),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.time,
                  style: const TextStyle(
                    color: Color.fromRGBO(
                      54,
                      61,
                      86,
                      1,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widget.width * (1 - 2 * horizontalPadding) * 0.45,
              child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "Tomorrow",
                  style: TextStyle(
                    color: Color.fromRGBO(
                      144,
                      158,
                      174,
                      1,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
