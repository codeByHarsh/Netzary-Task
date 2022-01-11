// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netzary_task/modals/data_modal.dart';

class TopSearchSlider extends StatefulWidget {
  List<BackgroundImages> backImages;
  TopSearchSlider(this.backImages);

  @override
  _TopSearchSliderState createState() => _TopSearchSliderState();
}

class _TopSearchSliderState extends State<TopSearchSlider> {
  @override
  Widget build(BuildContext context) {
    print('in top slider with value ${widget.backImages.length}');
    return Container(
      padding: const EdgeInsets.all(0.0),
      height: MediaQuery.of(context).size.height * 0.28,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          CarouselSlider(
              items: widget.backImages.map(
                (e) {
                  // print(e.image);
                  return Image.network(
                    // 'assets/images/event-detail.jpeg',
                    '${e.image}',
                    fit: BoxFit.fitWidth,
                    height: double.infinity,
                    width: double.infinity,
                  );
                },
              ).toList(),
              options: CarouselOptions(
                height: double.infinity,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInCirc,
                enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              )),
          Positioned(
              left: 10,
              right: 10,
              top: 80,
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(1.0),
                      child: Center(
                        child: Text(
                          'What are you searching for?',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
                    Container(
                      padding: const EdgeInsets.all(1.0),
                      height: double.infinity,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.height * 0.10,
                      child: Text(
                        'Search',
                        style: Theme.of(context).textTheme.button!.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          // color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
              )),
          Positioned(
              left: 25,
              right: 25,
              bottom: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 0.0,
                        primary: Colors.orange),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'FIND PROPERTY',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 0.0,
                        primary: Colors.orange),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'POST A PROPERTY',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  // Expanded(
                  //     child: Container(
                  //   padding: const EdgeInsets.all(1.0),
                  //   child: Center(
                  //     child: Text(
                  //       'What are you searching for?',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .subtitle1!
                  //           .copyWith(
                  //               fontSize: 16,
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.w400),
                  //     ),
                  //   ),
                  // )),

                  // Container(
                  //   padding: const EdgeInsets.all(1.0),
                  //   width: MediaQuery.of(context).size.height * 0.10,
                  //   child: Text(
                  //     'Search',
                  //     style: Theme.of(context).textTheme.button!.copyWith(
                  //         fontSize: 16,
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // )
                ],
              ))
        ],
      ),
    );
  }
}
