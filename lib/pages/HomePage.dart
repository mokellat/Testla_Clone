import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/modules/Lock_state.dart';
import 'package:tesla/modules/Temp_status.dart';
import 'package:tesla/modules/battery_status.dart';
import 'package:tesla/modules/bottomNavBarItems.dart';
import 'package:tesla/modules/position_locks.dart';
import 'package:tesla/modules/wheels.dart';
import 'package:tesla/modules/wheels_status.dart';
import '../modules/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final LockState lockState = LockState();
  // final list = [
  //   HomePage(),
  //   BatteryPage(),
  //   TempPage(),
  //   WheelsPage(),
  // ];
  final list_icons = [
    "assets/icons/Lock.svg",
    "assets/icons/Charge.svg",
    "assets/icons/Temp.svg",
    "assets/icons/Tyre.svg",
  ];

  final _heat = true;
  final _cool = true;
  // battery animation vars
  late Animation battery_info_status;
  late Animation battery_info_battery;
  late AnimationController batter_info;

  // temp animation vars
  late AnimationController temp_car_anim;
  late Animation temp_car_anim_move;
  late Animation temp_status_anim;

  //wheels animation vars
  late AnimationController wheels_anim;
  late Animation<double> wheels_tyres_anim_1;
  late Animation<double> wheels_tyres_anim_2;
  late Animation<double> wheels_tyres_anim_3;
  late Animation<double> wheels_tyres_anim_4;

  late List<Animation<double>> tyres_l;

  void BatteryAnimSettings() {
    batter_info =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    battery_info_battery =
        CurvedAnimation(parent: batter_info, curve: Interval(0, 0.5));
    battery_info_status =
        CurvedAnimation(parent: batter_info, curve: Interval(0.6, 1));
  }

  void TempAnimSettings() {
    temp_car_anim = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    temp_car_anim_move =
        CurvedAnimation(parent: temp_car_anim, curve: Interval(0.2, 0.4));
    temp_status_anim =
        CurvedAnimation(parent: temp_car_anim, curve: Interval(0.5, 0.7));
  }

  void WheelsAimSettngs() {
    wheels_anim = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    wheels_tyres_anim_1 =
        CurvedAnimation(parent: wheels_anim, curve: Interval(0.4, 0.55));
    wheels_tyres_anim_2 =
        CurvedAnimation(parent: wheels_anim, curve: Interval(0.55, 0.7));
    wheels_tyres_anim_3 =
        CurvedAnimation(parent: wheels_anim, curve: Interval(0.7, 0.85));
    wheels_tyres_anim_4 =
        CurvedAnimation(parent: wheels_anim, curve: Interval(0.85, 1));
  }

  @override
  void initState() {
    // TODO: implement initState
    BatteryAnimSettings();
    TempAnimSettings();
    WheelsAimSettngs();
    tyres_l = [
      wheels_tyres_anim_1,
      wheels_tyres_anim_2,
      wheels_tyres_anim_3,
      wheels_tyres_anim_4
    ];
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    batter_info.dispose();
    temp_car_anim.dispose();
    wheels_anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge(
            [lockState, batter_info, temp_car_anim, wheels_anim]),
        builder: (context, _) {
          return Scaffold(
            body: Center(
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width /
                        2 *
                        temp_car_anim_move.value,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 80,
                    // right: 100,
                    // left: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: SvgPicture.asset(
                        "assets/icons/Car.svg",
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.height - 100,
                      ),
                    ),
                  ),
                  lockState.itemSelected == 0
                      ? Position_Locks(lockState, 120, 180,
                          lockState.isLocked_top, lockState.updateState_top)
                      : Position_Locks(
                          lockState,
                          MediaQuery.of(context).size.height / 2,
                          180,
                          lockState.isLocked_top,
                          lockState.updateState_top),
                  lockState.itemSelected == 0
                      ? Position_Locks(
                          lockState,
                          MediaQuery.of(context).size.height / 2 - 30,
                          40,
                          lockState.isLocked_left,
                          lockState.updateState_left)
                      : Position_Locks(
                          lockState,
                          MediaQuery.of(context).size.height / 2 - 30,
                          MediaQuery.of(context).size.width / 2 - 30,
                          lockState.isLocked_left,
                          lockState.updateState_left),
                  lockState.itemSelected == 0
                      ? Position_Locks(
                          lockState,
                          MediaQuery.of(context).size.height / 2 - 30,
                          MediaQuery.of(context).size.width - 90,
                          lockState.isLocked_right,
                          lockState.updateState_right)
                      : Position_Locks(
                          lockState,
                          MediaQuery.of(context).size.height / 2 - 30,
                          MediaQuery.of(context).size.width / 2,
                          lockState.isLocked_right,
                          lockState.updateState_right),
                  lockState.itemSelected == 0
                      ? Position_Locks(
                          lockState,
                          MediaQuery.of(context).size.height - 180,
                          180,
                          lockState.isLocked_bottom,
                          lockState.updateState_bottom)
                      : Position_Locks(
                          lockState,
                          MediaQuery.of(context).size.height / 2,
                          180,
                          lockState.isLocked_bottom,
                          lockState.updateState_bottom),
                  Opacity(
                    opacity: battery_info_battery.value,
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/Battery.svg",
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                    ),
                  ),
                  BatteryStatus(value: battery_info_status.value),
                  TempStatus(
                      value: temp_status_anim.value,
                      lockstate: lockState.updateCoolSelected,
                      isCool: lockState.isCoolSelected),
                  Positioned(
                    right: 0,
                    child: Opacity(
                      opacity: temp_status_anim.value,
                      child: AnimatedSwitcher(
                        duration: Duration(
                          milliseconds: 300,
                        ),
                        child: lockState.isCoolSelected
                            ? Image.asset(
                                "assets/Cool.png",
                                width: 150,
                                height: MediaQuery.of(context).size.height,
                              )
                            : Image.asset(
                                "assets/Hot.png",
                                width: 150,
                                height: MediaQuery.of(context).size.height,
                              ),
                      ),
                    ),
                  ),
                  if (lockState.wheels_vis) ...WheelsVis(context),
                  if (lockState.wheels_vis) WheelsStatus(tyres_l),
                ],
              ),
            ),
            backgroundColor: Colors.black,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: lockState.itemSelected,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                if (index == 1)
                  batter_info.forward();
                else if (lockState.itemSelected == 1 && index != 1)
                  batter_info.reverse();
                if (index == 2)
                  temp_car_anim.forward();
                else if (lockState.itemSelected == 2 && index != 2)
                  temp_car_anim.reverse(from: 0.4);
                if (index == 3)
                  wheels_anim.forward();
                else if (lockState.itemSelected == 3 && index != 3)
                  wheels_anim.reverse();
                lockState.updateWheelsVis(index);
                // lockState.updateWheelsVis(index);
                lockState.BottomNavBarItemsChange(index);
              },
              backgroundColor: Colors.black,
              showSelectedLabels: false,
              showUnselectedLabels: true,
              items: List.generate(
                list_icons.length,
                (index) => BottomNavBarItems(
                  list_icons[index],
                  index,
                  index != lockState.itemSelected ? Colors.grey : Colors.teal,
                ),
              ),
            ),
          );
        });
  }
}
