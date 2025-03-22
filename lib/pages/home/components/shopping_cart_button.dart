import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/themes/theme.dart';
import '../../cart/cart_page.dart';
import '../../shared_state.dart';

class ShoppingCartButton extends ConsumerWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedState = ref.watch(sharedStateProvider);

    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
          child: SizedBox(
            height: 30,
            width: 30,
            child: Card(
              color: MaterialTheme.lightScheme().error,
              child: Center(
                child: Text(
                  "${sharedState.totalCartItems}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
