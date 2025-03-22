import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Categories", style: TextStyle(fontSize: 18)),
            Text("see all", style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Card(child: Center(child: Text("$index"))),
                    ),
                    Text("T-Shirt", style: TextStyle(fontWeight: FontWeight.w500),),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
