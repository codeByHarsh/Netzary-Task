// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:netzary_task/modals/data_modal.dart';
import 'package:netzary_task/widgets/top_picks_card.dart';

class Latest extends StatefulWidget {
  Data data;
  Latest(this.data);

  @override
  _LatestState createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Latest',
                  style: Theme.of(context).textTheme.button!.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'SEE ALL',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade700,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.data.items!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return TopPicksCard(
                      url: '${widget.data.items![i].thumbnail}',
                      price: '${widget.data.items![i].price}',
                      forSale: '${widget.data.items![i].minPrice}',
                      desc: '${widget.data.items![i].title}',
                      tag1: '${widget.data.items![i].categorySlug}',
                      tag2: '${widget.data.items![i].viewers}',
                      location: '${widget.data.items![i].locality}');
                }),
          )
        ],
      ),
    );
  }
}
