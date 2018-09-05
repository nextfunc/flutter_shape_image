import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final String assetPath;
  final double radius;

  CircleImage({Key key, this.imageUrl, this.assetPath, this.radius = 100.0})
      : assert(!(imageUrl == null && assetPath == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: this.assetPath != null
          ? Image.asset(
              this.assetPath,
              width: this.radius * 2,
              height: this.radius * 2,
            )
          : Image.network(
              this.imageUrl,
              width: this.radius * 2,
              height: this.radius * 2,
            ),
      clipper: CircleClipper(this.radius * 2),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  final double radius;

  CircleClipper(this.radius);

  @override
  getClip(Size size) {
    return Rect.fromLTWH((size.width - this.radius) / 2,
        (size.height - this.radius) / 2, this.radius, this.radius);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
