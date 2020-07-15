import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: camel_case_types
class load_shimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        highlightColor: Colors.grey.shade300,
        baseColor: Colors.grey.shade200,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, index) {
              return Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 100,
                    width: 110,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 200,
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 100,
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 70,
                        height: 15,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
