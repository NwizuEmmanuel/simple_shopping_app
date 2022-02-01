import 'package:flutter/material.dart';

import 'models/product_models.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({Key? key}) : super(key: key);

  @override
  _ProductItemWidgetState createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return buildItem(ProductModels.items[index]);
      },
      itemCount: ProductModels.items.length,
    );
  }

  Widget buildItem(ProductModels productModels) {
    Future<void> _showDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('Do you want to remove item from cart?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    productModels.isAdded = !productModels.isAdded;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              )
            ],
          );
        },
      );
    }

    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        image: AssetImage(productModels.imageUrl),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.topLeft,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productModels.name),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('\$${productModels.price}')
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              child: productModels.isAdded
                  ? TextButton(
                      onPressed: () {
                        _showDialog();
                      },
                      child: const Text('Added'),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          productModels.isAdded = !productModels.isAdded;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
