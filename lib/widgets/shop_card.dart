// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:genotechies_app/models/shop_model.dart';
import 'package:genotechies_app/theme/constants.dart';

class ShopCard extends StatelessWidget {
  final ShopModel shop;
  const ShopCard({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              shop.imageLink,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: defaultHeight,
          ),
          Text(
            shop.name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: defaultHeight,
          ),
          Text(
            "Location: ${shop.location}",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: primaryColor),
          ),
          const SizedBox(
            height: defaultHeight,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.cabin,
                ),
                SizedBox(
                  width: defaultHeight,
                ),
                Text("Tap to view products"),
              ],
            ),
          ),
          const SizedBox(
            height: defaultHeight / 4,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.pedal_bike,
              ),
              const SizedBox(
                width: defaultHeight,
              ),
              Text(
                "Between ${shop.deliveryDateRange} days island wide delivery",
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
