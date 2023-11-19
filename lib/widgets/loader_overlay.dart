import 'package:flutter/material.dart';

/// A widget that shows a loader overlay over its child when [isLoading] is true.
class LoaderOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoaderOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          if (isLoading)
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                child: Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
        ],
      );
}
