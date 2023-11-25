import 'package:flutter/material.dart';
import 'package:mpc/data/models/category_model.dart';
import 'package:mpc/widgets/custom_appbar.dart';
import 'package:mpc/widgets/profile_text.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CategorysListView extends StatelessWidget {
  final List<CatrgoryModel> categoryList;
  const CategorysListView({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: CustomAppBarSecondary(),
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/scaffold.jpg',
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.fill,
              ),
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GradientText(
                    "All Category", //"वर्तमान मैं संचालित हो रहे कार्यक्रम",
                    style: const TextStyle(
                      fontFamily: 'Hind',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                    colors: const [Color(0xFFC33764), Color(0xFF1D2671)],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: ListView.builder(
                    itemCount: (categoryList.length / 4).ceil(),
                    itemBuilder: (context, index) {
                      var startIndex = index * 4;
                      var endIndex = (startIndex + 4) <= categoryList.length
                          ? (startIndex + 4)
                          : categoryList.length;

                      var itemsToDisplay =
                          categoryList.sublist(startIndex, endIndex);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var item in itemsToDisplay)
                            WidgetsClass.buildItem(
                              'Image1',
                              item.categoryHindi!,
                              'assets/homepage/1.png',
                              context,
                              [],
                            ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ])
          ],
        ));
  }
}