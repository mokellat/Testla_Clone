import 'package:flutter/material.dart';

final wheels_status = [
  ["23.6psi", "50", "Low", "PRESSURE"],
  ["26psi", "41", "", ""],
  ["", "", "40", "67psi"],
  ["", "", "27", "34.7psi"],
];

final psis = [27.9, 35.4, 37, 32.9];
final temps = [37.2, 54, 52, 27.3];

Widget WheelsStatus(List<Animation<double>> value) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
    ),
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1.35 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            maxCrossAxisExtent: 200),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ScaleTransition(
            scale: value[index],
            child: Container(
              // alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    index >= 2 ? Spacer() : Container(),
                    RichText(
                      text: TextSpan(
                        text: psis[index].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'psi',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // TextSpan(text: ' world!'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      temps[index].toString() + "°C",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    if (index < 2) Spacer(),
                    psis[index] < 30
                        ? Text(
                            "Low".toUpperCase(),
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          )
                        : Container(),
                    psis[index] < 30
                        ? Text(
                            "Pressure",
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: psis[index] < 30 ? Color.fromARGB(52, 244, 67, 54):Color.fromARGB(46, 158, 158, 158),
                  border: Border.all(
                    width: 2,
                    color: psis[index] > 30 ? Colors.teal : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(2)),
            ),
          );
        }),
  );
}
