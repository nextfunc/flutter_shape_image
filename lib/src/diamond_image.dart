import 'package:flutter/material.dart';

class DiamondImage extends StatelessWidget {
  final String imageUrl;
  final String assetPath;
  final double width;
  final double height;

  DiamondImage(
      {Key key, this.imageUrl, this.assetPath, this.width, this.height})
      : assert(!(imageUrl == null && assetPath == null)),
        assert(!(width == 0 || height == 0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: this.assetPath != null
          ? Image.asset(
              this.assetPath,
              width: this.width,
              height: this.height,
            )
          : Image.network(
              this.imageUrl,
              width: this.width,
              height: this.height,
            ),
      clipper: DiamondClipper(this.width, this.height),
    );
  }
}

class DiamondClipper extends CustomClipper<Path> {
  final double width;
  final double height;

  DiamondClipper(this.width, this.height);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.relativeLineTo(this.width / 2, this.height / 2);
    path.relativeLineTo(-this.width / 2, this.height / 2);
    path.relativeLineTo(-this.width / 2, -this.height / 2);
    path.relativeLineTo(this.width / 2, -this.height / 2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
