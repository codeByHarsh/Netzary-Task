// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riv;
import 'package:netzary_task/api/api_provider.dart';
import 'package:netzary_task/modals/data_modal.dart';
import 'package:netzary_task/widgets/category_slider.dart';
import 'package:netzary_task/widgets/latest_section.dart';
import 'package:netzary_task/widgets/top_pick_section.dart';
import 'package:netzary_task/widgets/top_search_slider.dart';

class FirstScreen extends riv.ConsumerStatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends riv.ConsumerState<FirstScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    ref.read(dataModalProvider).apiInitiate();
    super.initState();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: customDrawer(),
      bottomNavigationBar: customBottmNav(),
      extendBodyBehindAppBar: true,
      appBar: customAppBar(),
      body: riv.Consumer(
        builder: (context, watch, child) {
          Status status = watch.watch(dataModalProvider).status;
          List<Data> data = watch.watch(dataModalProvider).data;
          List<BackgroundImages> backGroundImage =
              watch.watch(dataModalProvider).backImages;
          if (status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (status == Status.error) {
            return const Center(child: Text('Error Occured'));
          } else {
            return Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TopSearchSlider(
                      backGroundImage,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CategorySlider(data[0]),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TopPicks(data[1]),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Latest(data[2]),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget navItemSmall(IconData icon, String text, String desc, Color color) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, bottom: 10.0),
            child: Icon(icon, size: 25, color: color),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          desc,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right_outlined,
                      size: 25,
                      color: Colors.black,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Divider(
                  color: Colors.grey.shade400,
                  height: 0.8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: const Color(0x00000000),
      shadowColor: Colors.transparent,
      // leadingWidth: MediaQuery.of(context).size.width,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                'Kashmir',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5.0,
              ),
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 25,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
      leading: InkWell(
        onTap: () => _scaffoldKey.currentState!.openDrawer(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/icons/drawer.png',
              fit: BoxFit.fill,
              height: 12,
              width: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget customBottmNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            color: Colors.grey,
          ),
          title: Text(
            "Home",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: Colors.grey,
                fontSize: 12),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.grain_sharp,
            color: Colors.grey,
          ),
          title: Text(
            "Explore",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
                fontFamily: 'Inter',
                fontSize: 12),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_rounded,
            color: Colors.grey,
          ),
          title: Text(
            "Saved",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
                fontFamily: 'Inter',
                fontSize: 12),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
          title: Text(
            "Notifications",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: Colors.grey,
                fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget customDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.28,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey.shade700,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(25))),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 22.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login/ Signup',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.arrow_right_outlined,
                          size: 30,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seng us your Requirements',
                        style: Theme.of(context).textTheme.button!.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Can't find the right property?",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Icon(Icons.pin_drop_rounded,
                      size: 30, color: Colors.black),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            //
            const SizedBox(
              height: 10.0,
            ),
            navItemSmall(
                Icons.settings, 'Setting', 'Theme', Colors.blue.shade900),
            navItemSmall(Icons.chat_outlined, 'Help & Support',
                'FAQs and know more', Colors.red),
            navItemSmall(
                Icons.help, 'About', 'Share, rate and know more', Colors.green),
            navItemSmall(Icons.settings, 'My Listings',
                'Properties posted by you', Colors.orange.shade400),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      primary: Colors.white,
                      side: const BorderSide(
                        width: 1.5,
                        color: Colors.orange,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 5.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calculate,
                          size: 25,
                          color: Colors.orange,
                        ),
                        Text(
                          'Calculate Commission',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
