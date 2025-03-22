import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/domain/models/cart.dart';
import 'package:yabiso_ecommerce/pages/cart/cart_page.dart';
import 'package:yabiso_ecommerce/pages/home/components/categories_section.dart';
import 'package:yabiso_ecommerce/pages/home/components/home_banner.dart';
import 'package:yabiso_ecommerce/pages/home/home_controller.dart';
import 'package:yabiso_ecommerce/pages/shared_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeControllerProvider);
    final homeController = ref.watch(homeControllerProvider.notifier);
    final sharedState = ref.watch(sharedStateProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
        title: Text("Yabiso ${sharedState.totalCartItems}"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeBanner(),
              SizedBox(height: 10),
              CategoriesSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Products", style: TextStyle(fontSize: 18)),
                  Text("see all", style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 260,
                  ),
                  itemCount: homeState.products.length,
                  itemBuilder: (context, index) {
                    final product = homeState.products[index];
                    return SizedBox(
                      child: GestureDetector(
                        onTap: () => {homeController.addToCart(product, ref)},
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "${product.photo}",
                                  height: 180,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "${product.name}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "${product.price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
