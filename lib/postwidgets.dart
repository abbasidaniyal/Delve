import 'package:flutter/material.dart';
import 'textstyles.dart';
import 'main.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;

  ForumCard({this.forum});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 60.0),
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(
              "icon1.png",
              fit: BoxFit.fitWidth,
              height: 300,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ForumDetailsWidget(forum: forum),
            ),
            Positioned(
              left: 0,
              bottom: 80.0,
              child: ForumNameWidget(forum: forum),
            ),
          ],
        ),
      ),
    );
  }
}

class ForumDetailsWidget extends StatelessWidget {
  final Forum forum;

  ForumDetailsWidget({this.forum});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: 180.0,
        padding: const EdgeInsets.only(
            left: 20.0, right: 16.0, top: 24.0, bottom: 12.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4), width: 2.0),
                    ),
                    height: 40.0,
                    width: 40.0,
                    child: Center(
                        child: Text(
                          forum.rank,
                          style: rankStyle,
                        )),
                  ),
                  Text("new", style: labelTextStyle),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LabelValueWidget(
                  value: "4",
                  label: "likes",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.threads,
                  label: "comments",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.subs,
                  label: "share",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height * 0.5;
    final double width = size.width;

    Path clippedPath = Path();
    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - distanceFromWall);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall,
        height - controlPointDistanceFromWall, 0 + distanceFromWall, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 0 + 30.0);
    clippedPath.quadraticBezierTo(width - 5, 0 + 5.0, width - 35, 0 + 15.0);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ForumNameWidget extends StatelessWidget {
  final Forum forum;

  ForumNameWidget({this.forum});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      elevation: 20.0,
      shape: CustomShapeBorder(),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 18.0, left: 20.0, right: 16.0, bottom: 5.0),
        child: Text(
          forum.title,
          style: forumNameTextStyle,
        ),
      ),
    );
  }
}

class CustomShapeBorder extends ShapeBorder {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return getClip(Size(130.0, 60.0));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return null;
  }

  Path getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.moveTo(0 + distanceFromWall, 0);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall,
        0 + controlPointDistanceFromWall, 0, 0 + distanceFromWall);
    clippedPath.lineTo(0, size.height - distanceFromWall);
    clippedPath.quadraticBezierTo(
        0 + controlPointDistanceFromWall,
        size.height - controlPointDistanceFromWall,
        0 + distanceFromWall,
        size.height);
    clippedPath.lineTo(size.width - distanceFromWall, size.height);
    clippedPath.quadraticBezierTo(
        size.width - controlPointDistanceFromWall,
        size.height - controlPointDistanceFromWall,
        size.width,
        size.height - distanceFromWall);
    clippedPath.lineTo(size.width, size.height * 0.6);
    clippedPath.quadraticBezierTo(
        size.width - 1,
        size.height * 0.6 - distanceFromWall,
        size.width - distanceFromWall,
        size.height * 0.6 - distanceFromWall - 3);
    clippedPath.lineTo(0 + distanceFromWall + 6, 0);
    clippedPath.close();
    return clippedPath;
  }
}

class LabelValueWidget extends StatelessWidget {
  final String label, value;
  final TextStyle labelStyle, valueStyle;

  LabelValueWidget({this.label, this.value, this.labelStyle, this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(value, style: valueStyle),
        Text(label, style: labelStyle),
      ],
    );
  }
}