import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingStars extends StatefulWidget {
  // This class returns 2 widgets: 5 rating stars filled according to rating,
  // and the number of raters between parenthesis. It is currently read-only,
  //  but can turned to an editable version (that's why it's stateful)

  final double rating;
  final int raters;

  RatingStars([this.rating,this.raters]);

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SmoothStarRating(
        isReadOnly: true,
        // widget here is the parent class RatingStars
        rating: widget.rating,
        size: 40,
        filledIconData: Icons.star,
        halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        starCount: 5,
        allowHalfRating: true,
        spacing: 2.0,
      ),
      Text('${widget.raters}')
    ]);
  }
}