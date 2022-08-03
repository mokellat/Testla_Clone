import 'package:flutter/material.dart';

class BatteryStatus extends StatefulWidget {
  const BatteryStatus({Key? key, required this.value}) : super(key: key);
  final value;
  @override
  State<BatteryStatus> createState() => _BatteryStatusState();
}

class _BatteryStatusState extends State<BatteryStatus> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.value,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    "300 mi",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "67%",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.60,
              ),
              Column(
                children: [
                  Text(
                    "Charging".toUpperCase(),
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "13 min remaining",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "22 mi/h",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "232 v",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
