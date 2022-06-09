import 'package:flutter/widgets.dart';

/// # Absolute Positioned
/// 
/// Sets the position of a widget relative to the screen, in an absolute fashion.
/// 
/// ## Caution
/// 
/// This widget was intended to used with [ScrollPositioned] widget.
/// 
/// It does not react with changes on widgets surrounding it, since it needs to be explicitly told to rebuild.
/// Meaning that if it's position changes because of other widgets, it will not automatically update it's position to become absolute again.
class AbsolutePositioned extends StatefulWidget {
  const AbsolutePositioned({
    super.key,
    required this.child,
    this.offset = Offset.zero,
  });

  final Widget child;
  final Offset offset;

  @override
  State<AbsolutePositioned> createState() => _AbsolutePositionedState();
}

class _AbsolutePositionedState extends State<AbsolutePositioned> {
  RenderBox? render;

  @override
  void didChangeDependencies() {
    render = null;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        final render = context.findRenderObject();
        if (render is RenderBox && mounted) setState(() => this.render = render);
      }
    });
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: (render?.localToGlobal(Offset.zero) ?? Offset.zero) * -1 + widget.offset,
      child: widget.child,
    );
  }
}