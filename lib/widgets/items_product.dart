import 'package:flutter/material.dart';
import 'package:shopper/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemsProduct extends StatelessWidget {
  const ItemsProduct(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
                // color: Colors.transparent,
                colorBlendMode: BlendMode.color,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    product.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_rounded,
                        size: 18,
                      ),
                      Text(
                        product.price.toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        product.rating.rate.toString(),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
