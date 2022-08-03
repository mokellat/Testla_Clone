import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/modules/globals.dart';

int inc = 20;
bool cool = true;
bool heat = false;

class TempStatus extends StatefulWidget {
  const TempStatus({Key? key, required this.value, required this.lockstate, required this.isCool})
      : super(key: key);
  final value;
  final lockstate;
  final isCool;

  @override
  State<TempStatus> createState() => _TempStatusState();
}

class _TempStatusState extends State<TempStatus> {
  Color coolColor = Colors.tealAccent;
  Color heatColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.value,
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: widget.lockstate,
                  child: widget.isCool
                      ? SvgPicture.asset(
                          "assets/icons/coolShape.svg",
                          width: 70,
                          height: 70,
                          color: coolColor,
                        )
                      : SvgPicture.asset(
                          "assets/icons/coolShape.svg",
                          height: 45,
                          width: 45,
                          color: Colors.grey,
                        ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: widget.lockstate,
                  child: !widget.isCool
                      ? SvgPicture.asset(
                          "assets/icons/heatShape.svg",
                          width: 70,
                          height: 70,
                          color: heatColor,
                        )
                      : SvgPicture.asset(
                          "assets/icons/heatShape.svg",
                          height: 45,
                          width: 45,
                          color: Colors.grey,
                        ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (inc < 50) inc++;
                  });
                },
                icon: Icon(
                  Icons.arrow_drop_up,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              inc.toString() + "°C",
              style: TextStyle(
                color: Colors.white,
                fontSize: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (inc > 0) inc--;
                  });
                },
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Text(
              "Current Temperature".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Inside".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      inc.toString() + "°C",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      "outside".toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "27" + "°C",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
