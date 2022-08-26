import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lensitive_care/data/data.dart';
import 'package:lensitive_care/models/item.dart';
import 'package:lensitive_care/presentation/item_details.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Wishlist',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
        leading: Container(),
        elevation: 1,
      ),
      body: GridView.builder(
        itemCount: wishlist.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemDetails(item: wishlist[index]),
                ),
              );
            },
            child: Card(
              child: SizedBox(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(wishlist[index].imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        child: Center(
                          child: Icon(
                            FluentIcons.heart_24_filled,
                            size: 15,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      left: 5,
                      child: Column(
                        children: [
                          Text(wishlist[index].iteamName,
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 3),
                          Text(
                            wishlist[index].itemPrice,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // List<Widget> buildItems({required List<Item> items, required context}) {
  //   List<Widget> cards = [];

  //   for (var item in items) {
  //     cards.add(
  //       InkWell(
  //         onTap: () {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) => ItemDetails(item: item),
  //             ),
  //           );
  //         },
  //         child: Card(
  //           child: SizedBox(
  //             child: Stack(
  //               children: [
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                       image: AssetImage(item.imageUrl),
  //                       fit: BoxFit.contain,
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   top: 5,
  //                   right: 5,
  //                   child: Container(
  //                     height: 30,
  //                     width: 30,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(15),
  //                       color: Theme.of(context).colorScheme.primary,
  //                     ),
  //                     child: Center(
  //                       child: Icon(
  //                         FluentIcons.heart_24_filled,
  //                         color: Theme.of(context).colorScheme.secondary,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   bottom: 5,
  //                   right: 5,
  //                   left: 5,
  //                   child: Column(
  //                     children: [
  //                       Text(item.iteamName,
  //                           style: Theme.of(context).textTheme.bodyText1),
  //                       const SizedBox(height: 3),
  //                       Text(
  //                         item.itemPrice,
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .bodyText1
  //                             ?.copyWith(
  //                                 color:
  //                                     Theme.of(context).colorScheme.secondary),
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   return cards;
  // }
}
