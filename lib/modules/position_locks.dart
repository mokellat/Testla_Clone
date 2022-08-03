import 'package:flutter/material.dart';
import 'package:tesla/modules/Lock_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget Position_Locks(
    LockState lockState, double top, double left, bool dir_door, var fun) {
  return AnimatedPositioned(
    duration: Duration(milliseconds: 300),
    left: left,
    top: top,
    child: AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: lockState.itemSelected == 0 ? 1 : 0,
      child: GestureDetector(
        onTap: fun,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: dir_door
              ? SvgPicture.asset(
                  "assets/icons/door_lock.svg",
                  key: Key("Lock"),
                )
              : SvgPicture.asset(
                  "assets/icons/door_unlock.svg",
                  key: Key("Unlock"),
                ),
        ),
      ),
    ),
  );
}
