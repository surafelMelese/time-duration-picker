import 'dart:math';

class SimpleTime {
  int hours = 0;
  int minutes = 0;

  SimpleTime.fromTime(this.hours, this.minutes);

  SimpleTime.fromAngle(double angle){
    int pastNoon = angle >= pi ? 12 : 0;

    double angleInDegrees = angle * (180 / pi);
    int timeSinceMidday = (angleInDegrees.toInt() / 0.5) as int;

    hours = (timeSinceMidday / 30).floor();
    minutes = timeSinceMidday - 30 * hours;

    hours += pastNoon;
  }

  SimpleTime.fromTimeBetweenAngles(double angle1, double angle2){
    SimpleTime time1 = SimpleTime.fromAngle(angle1);
    SimpleTime time2 = SimpleTime.fromAngle(angle2);

    //todo: difference
    hours = time1.hours - time2.hours;
    minutes = time1.minutes - time2.minutes;
  }

  @override
  String toString(){
    String time = "";

    time += "${hours < 10 ? "0" + hours.toString() : hours}:";
    time += minutes < 10 ? "0" + minutes.toString() : minutes.toString();

    return time;
  }

  String toAMPMString(){
    String median = this.hours > 12 ? "PM" : "AM";

    String time = "";

    int hours = this.hours;
    if(this.hours > 12) hours -= 12;

    time += "${hours < 10 ? "0" + hours.toString() : hours}:";
    time += minutes < 10 ? "0" + minutes.toString() : minutes.toString();

    return "$time$median";
  }
}