import 'package:flutter/material.dart';

class LockState extends ChangeNotifier {
  bool isLocked_left = true;
  bool isLocked_right = true;
  bool isLocked_top = true;
  bool isLocked_bottom = true;
  int itemSelected = 0;

  void BottomNavBarItemsChange(int index) {
    itemSelected = index;
    notifyListeners();
  }

  void updateState_left() {
    isLocked_left = !isLocked_left;
    // isLocked_bottom = !isLocked_bottom;
    // isLocked_right = !isLocked_right;
    // isLocked_top = !isLocked_top;
    notifyListeners();
  }

  void updateState_right() {
    // isLocked_left = !isLocked_left;
    // isLocked_bottom = !isLocked_bottom;
    isLocked_right = !isLocked_right;
    // isLocked_top = !isLocked_top;
    notifyListeners();
  }

  void updateState_top() {
    // isLocked_left = !isLocked_left;
    // isLocked_bottom = !isLocked_bottom;
    // isLocked_right = !isLocked_right;
    isLocked_top = !isLocked_top;
    notifyListeners();
  }

  void updateState_bottom() {
    // isLocked_left = !isLocked_left;
    isLocked_bottom = !isLocked_bottom;
    // isLocked_right = !isLocked_right;
    // isLocked_top = !isLocked_top;
    notifyListeners();
  }

  var isCoolSelected = true;

  void updateCoolSelected() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  var wheels_vis = false;

  void updateWheelsVis(int index) {
    // itemSelected = index;
    if (itemSelected != 3 && index == 3) {
      Future.delayed(Duration(milliseconds: 300), () {
        wheels_vis = true;
        notifyListeners();
      });
      // wheels_vis == true;
      // notifyListeners();
      // print("hhhhhh" + wheels_vis.toString());
    } else {
      wheels_vis = false;
      notifyListeners();
    }
    // notifyListeners();
  }
}
