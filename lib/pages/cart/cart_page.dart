import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/pages/cart/cart_controller.dart';
import 'package:yabiso_ecommerce/pages/shared_state.dart';

class CartPage extends ConsumerWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartControllerProvider);
    final sharedState = ref.watch(sharedStateProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Cart"),
      ),
      body: Center(
        child: Text("${sharedState}"),
      ),
    );
  }

}