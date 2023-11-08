import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            //pinned: true,
            centerTitle: false,
            expandedHeight: 300.0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: Image(
                image: AssetImage('assets/images/cats.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverAppBar(
            elevation: 0,
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 20,
                color: Colors.purple,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 200,
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.amberAccent,
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
