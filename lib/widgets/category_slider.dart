// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netzary_task/modals/data_modal.dart';

class CategorySlider extends StatefulWidget {
  Data data;
  CategorySlider(this.data);

  @override
  _CategorySliderState createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      height: MediaQuery.of(context).size.height * 0.25,
      child: CarouselSlider(
          items: widget.data.items!.map(
            (e) {
              // print(e.image);
              return ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  '${e.image}',
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: double.infinity,
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
            height: double.infinity,
            aspectRatio: 16 / 9,
            viewportFraction: 0.7,
            initialPage: 0,
            enableInfiniteScroll: true,
            disableCenter: false,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInCirc,
            enlargeCenterPage: true,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
