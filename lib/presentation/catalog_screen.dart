import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lensitive_care/data/data.dart';
import 'package:lensitive_care/presentation/item_details.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List allItem = items + recommended;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Catalog',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
        leading: Container(),
        elevation: 1,
      ),
      body: GridView.builder(
        itemCount: allItem.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemDetails(item: allItem[index]),
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
                          image: AssetImage(allItem[index].imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(allItem[index].rating,
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
                          Text(allItem[index].iteamName,
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 3),
                          Text(
                            allItem[index].itemPrice,
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
}
