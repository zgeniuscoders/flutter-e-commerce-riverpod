import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/core/themes/theme.dart';
import 'package:yabiso_ecommerce/pages/product_detail/product_detail_controller.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final int productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => {
        ref
            .read(productDetailControllerProvider.notifier)
            .getProduct(widget.productId),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productDetailControllerProvider).product;
    final productDetailController = ref.read(
      productDetailControllerProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("${product?.name}"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Image.asset("${product?.photo}"),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 18,
                    color: MaterialTheme.lightScheme().secondary,
                  ),
                ),
                Text(
                  "${product?.name}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Text("Product  description"),
                SizedBox(height: 4),
                Text("${product?.description}"),
              ],
            ),
          ),
          Spacer(),
          Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          color: MaterialTheme.lightScheme().secondary,
                        ),
                      ),
                      Text(
                        "${product?.price} CDF",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      productDetailController.addToCart(product!);
                    },
                    child: Text("add to cart"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
