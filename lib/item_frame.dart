import 'package:flutter/material.dart';

import 'models/product_models.dart';

class ItemFrame {
  Widget buildItem(ProductModels productModels) {
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
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove),
              ),
            )
          ],
        ),
      ),
    );
  }
}
