import 'package:flutter/material.dart';

class UserCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserCenterState();
}

class _UserCenterState extends State<UserCenter> {
  final String _userName = "宋远桥";
  final String _deptName = "金鸡湖消防救援站";
  final String _position = "站长";

  @override
  void initState() {
    super.initState();
    //getUserInfo();
  }

  // /// 初始化用户信息
  // void getUserInfo() async {
  //   PreferenceUtil.getUserInfo().then((userInfo) => {
  //     setState(() {
  //       _userName = userInfo.name ?? "";
  //       _deptName = userInfo.deptName ?? "";
  //       _position = userInfo.position ?? "";
  //     })
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(249, 236, 236, 1), Colors.white])),
          ),
          ListView(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: Column(
                  children: [
                    buildUserInfo(),
                    const SizedBox(
                      height: 15,
                    ),
                    buildWorkTableCard(),
                    const SizedBox(
                      height: 5,
                    ),
                    buildLocationReportCard(),
                    const SizedBox(
                      height: 5,
                    ),
                    buildInfoAndSettingCard(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildUserInfo() {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid),
              image: const DecorationImage(
                image: AssetImage('image/ic_default_head.png'),
                fit: BoxFit.cover,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 姓名
              Text(
                _userName,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    // 单位
                    Text(
                      _deptName,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      // 职位
                      child: Text(
                        _position,
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Image(
            width: 20,
            height: 20,
            image: AssetImage('image/ic_arrow_right_skip.png'),
            fit: BoxFit.cover,
          ),
        )

      ],
    );
  }

  Widget buildWorkTableCard() {
    List children = [
      {
        "title": "值班报备",
        "icon": "icon_tab_duty.png",
        "router": "/duty_info_list"
      },
      {
        "title": "交接班",
        "icon": "ic_change_shift.png",
        "router": "/change_shift"
      },
      {
        "title": "执勤实力",
        "icon": "ic_duty_strength.png",
        "router": "/calculation"
      },
      {
        "title": "水源采集",
        "icon": "ic_water_coll.png",
        "router": "/water_coll"
      },
      {
        "title": "泡沫计算",
        "icon": "ic_main_router2.png",
        "router": "/bubble_calculation"
      },
      // {
      //   "title": "人员信息",
      //   "icon": "icon_tab_person_info.png",
      //   "router": "/person_list"
      // },
      // {
      //   "title": "车辆信息",
      //   "icon": "icon_tab_car_info.png",
      //   "router": "/car_list"
      // },
      // {
      //   "title": "装备信息",
      //   "icon": "icon_tab_equip.png",
      //   "router": "/equip_router"
      // },
      // {
      //   "title": "危险品查询",
      //   "icon": "ic_main_router1.png",
      //   "router": "/dangerous_search"
      // },
      // {
      //   "title": "离线地图",
      //   "icon": "ic_offline_map.png",
      //   "router": "/offline_map"
      // },
      // {
      //   "title": "消防百科",
      //   "icon": "ic_baike.png",
      //   "router": "/fire_control_baike"
      // },
      // {
      //   "title": "现场面积计算",
      //   "icon": "ic_main_router3.png",
      //   "router": "/calculation"
      // },
      // {
      //   "title": "通信信号采集",
      //   "icon": "ic_signal_coll.png",
      //   "router": "/signal_collection_map"
      // },
      {
        "title": "更多",
        "icon": "ic_more_info.png",
        "router": "/signal_collection_map"
      },
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: const BoxConstraints(
        maxHeight: 270
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 9, 18, 9),
          child: Wrap(
            spacing: 20,
            runSpacing: 9,
            alignment: WrapAlignment.start,
            children: children.map((e) => _buildRoundImage(
                e["router"],e["icon"],e["title"])).toList(),
          ),
        ),
      ),
    );
  }

  /// 位置上报
  Widget buildLocationReportCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6)
      ),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // 跳转位置上报页面
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              //   return LocationReportPage();
              // }));
            },
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Image(
                    width: 32,
                    height: 32,
                    image: AssetImage('image/account.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "我的位置上报",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "强制上报",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('image/ic_arrow_right_skip.png'),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 48),
            height: 1,
            color: const Color(0xFFEEEEEE),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // 跳转位置上报页面
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              //   return LocationReportPage();
              // }));
            },
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Image(
                    width: 32,
                    height: 32,
                    image: AssetImage('image/account.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "车辆位置上报",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "手动上报",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  "苏E2980消",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('image/ic_arrow_right_skip.png'),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 48),
            height: 1,
            color: const Color(0xFFEEEEEE),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // 跳转位置上报页面
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              //   return LocationReportPage();
              // }));
            },
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Image(
                    width: 32,
                    height: 32,
                    image: AssetImage('image/account.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "队伍位置上报",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "未绑定",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  "前往绑定",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('image/ic_arrow_right_skip.png'),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///  我的消息和系统设置
  Widget buildInfoAndSettingCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6)
      ),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // 跳转位置上报页面
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              //   return LocationReportPage();
              // }));
            },
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image(
                    width: 32,
                    height: 32,
                    image: AssetImage('image/account.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "我的消息",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('image/ic_arrow_right_skip.png'),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 48),
            height: 1,
            color: const Color(0xFFEEEEEE),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // 跳转位置上报页面
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              //   return LocationReportPage();
              // }));
            },
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image(
                    width: 32,
                    height: 32,
                    image: AssetImage('image/account.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "系统设置",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('image/ic_arrow_right_skip.png'),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGetLocation() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // 跳转信号采集页面
                // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                //   return SignalCollectionMapPage();
                // }));
              },
              child: Row(
                children: const [
                  Image(
                    width: 32,
                    height: 32,
                    image: AssetImage(
                        'image/ic_signal_coll.png'),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "通信信号采集",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image(
                      width: 20,
                      height: 20,
                      image: AssetImage('image/ic_arrow_right_skip.png'),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundImage(String? routeName, String icon, String text) {
    return GestureDetector(
        onTap: () {
          // if (routeName == "/offline_map") {
          //   const _platform = MethodChannel('com.kedacom.flutter.smartsafety_hybrid/channel');
          //   _platform.invokeMethod("openOfflineMap");
          //   return;
          // }
          Navigator.of(context).pushNamed(routeName!);
          /* switch (id) {
            case 0:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return PersonalInformationListPage();
                  },
                  settings: RouteSettings(name: "/person_list")));
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return CarListPage();
                  },
                  settings: RouteSettings(name: "/car_list")));
              break;
            case 2:
              //TODO 装备信息
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EquipRouterPage();
              }));
              // ToastUtil.showToast("功能开发中...");
              break;
            case 3:
              //TODO 勤务管理
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DutyInfoListPage();
              }));
              // ToastUtil.showToast("功能开发中...");
              break;
            default:
              break;
          }*/
        },
        child: Column(
          children: [
            Image.asset(
              "image/$icon",
              width: 80,
              height: 80,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
          // chi
        ));
  }

}
