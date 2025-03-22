
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yabiso_ecommerce/pages/home/home_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final homeState = ref.watch(homeControllerProvider);
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }


}
