// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopPicksCard extends StatelessWidget {
  String url;
  String price;
  String forSale;
  String desc;
  String tag1;
  String tag2;
  String location;
  TopPicksCard({
    required this.url,
    required this.price,
    required this.forSale,
    required this.desc,
    required this.tag1,
    required this.tag2,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    // print(NumberFormat.currency(locale: 'INR').format(39500000.0));
    return Container(
      padding:
          const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 0.0),
      height: MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width * 0.55,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.19,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(2.5),
                  child: Text(
                    'FOR SALE',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                bottom: 0.0,
                right: 0.0,
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\u{20B9} ${price[0]} Crore',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.favorite_border,
                  size: 18,
                  color: Colors.black,
                ),
              )
            ],
          ),
          // const SizedBox(
          //   height: 5.0,
          // ),
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                desc,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 13.5,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tag1,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                tag2,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.black,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                location,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 0.8,
            color: Colors.grey,
          ),
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
