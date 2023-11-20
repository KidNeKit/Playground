import 'package:flutter/material.dart';
import 'package:instagram/src/ui/inst_profile_header/inst_profile_header.dart';

class InstProfileScreen extends StatelessWidget {
  const InstProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverToBoxAdapter(
              child: InstProfileHeader(),
            ),
          ],
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'A'),
                ],
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
