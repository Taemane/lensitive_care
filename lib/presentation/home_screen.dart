import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lensitive_care/data/data.dart';
import 'package:lensitive_care/models/item.dart';
import 'package:lensitive_care/presentation/item_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * .1,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Hello User',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const Text('Get the look you\'ve always wanted!!'),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .35,
              // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                  autoPlay: true,
                  reverse: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: [
                  buildOfferImage(
                      imageUrl: 'assets/images/banner-1.jpg', context: context),
                  buildOfferImage(
                      imageUrl: 'assets/images/banner-2.jpg', context: context),
                  buildOfferImage(
                      imageUrl: 'assets/images/banner-3.jpg', context: context),
                ].map((e) {
                  return Builder(builder: (BuildContext context) {
                    return SizedBox(
                      width: size.width,
                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: e,
                    );
                  });
                }).toList(),
              ),
              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   shrinkWrap: true,
              //   children: [
              //     buildOfferImage('assets/images/banner-1.jpg'),
              //   ],
              // ),
            ),
            Container(
              height: size.height * .22,
              padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exclusive',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'View all',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: buildItems(items: items, context: context),
                    ),
                  ),
                  // SizedBox(
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     children: buildItem(items),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              height: size.height * .22,
              padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'View all',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: buildRecommended(
                          items: recommended, context: context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOfferImage({required String imageUrl, required context}) {
    return Card(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 60,
            child: SizedBox(
              child: Column(
                children: [
                  const Text(
                    'Save up to',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '50%',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildItems({required List<Item> items, required context}) {
    List<Widget> cards = [];

    for (var item in items) {
      cards.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemDetails(item: item),
              ),
            );
          },
          child: Card(
            child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(item.rating,
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                        const SizedBox(width: 3),
                        const Icon(
                          FluentIcons.star_24_filled,
                          size: 16,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    left: 5,
                    child: Column(
                      children: [
                        Text(item.iteamName,
                            style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(height: 3),
                        Text(
                          item.itemPrice,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return cards;
  }

  List<Widget> buildRecommended({required List<Item> items, required context}) {
    List<Widget> cards = [];

    for (var item in items) {
      cards.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemDetails(item: item),
              ),
            );
          },
          child: Card(
            child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(item.rating,
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                        const SizedBox(width: 3),
                        const Icon(
                          FluentIcons.star_24_filled,
                          size: 16,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    left: 5,
                    child: Column(
                      children: [
                        Text(item.iteamName,
                            style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(height: 3),
                        Text(
                          item.itemPrice,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return cards;
  }
}
