library scroll_positioned;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/// # Scroll Positioned
/// 
/// Allows you to position widgets fixed along with a scroll. It can be positioned relative to the parent widget, or the absolute position.
/// Best used with a Scrollable, like a ListView, but can be used on its own.
class ScrollPositioned extends StatefulWidget {
  final Widget child;
  final ScrollController? controller;

  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  final double? width;
  final double? height;

  final bool isAbsolute;

  /// ## Scroll Positioned
  /// 
  /// Allows you to position widgets fixed along with a scroll. It can be positioned relative to the parent widget, or the absolute position.
  /// Best used with a Scrollable, like a ListView, but can be used on its own.
  const ScrollPositioned({
    super.key,
    required this.child,
    this.controller,

    this.top,
    this.right,
    this.bottom,
    this.left,

    this.width,
    this.height,
  }) : 
    isAbsolute = false;
  
  /// ## Scroll Positioned - Expand
  /// 
  /// Allows you to position widgets fixed along with a scroll. It can be positioned relative to the parent widget, or the absolute position.
  /// Best used with a Scrollable, like a ListView, but can be used on its own.
  /// 
  /// Extends relative to the parent widget, in practice, sets top, right, bottom and left to 0. Covers the entire parent.
  const ScrollPositioned.expand({
    super.key,
    required this.child,
    this.controller,
  }) : 
    top = 0,
    right = 0,
    bottom = 0,
    left = 0,
    
    width = null,
    height = null,
    
    isAbsolute = false;
  
  /// ## Scroll Positioned - Absolute
  /// 
  /// Allows you to position widgets fixed along with a scroll. It can be positioned relative to the parent widget, or the absolute position.
  /// Best used with a Scrollable, like a ListView, but can be used on its own.
  /// 
  /// Set the position to the absolute position, relative to the screen.
  /// 
  /// * `bottom` and `left` cannot be set.
  /// 
  /// If you want the widget size to cover the whole screen, use `MediaQuery.of(context).size`.
  const ScrollPositioned.absolute({
    super.key,
    required this.child,
    this.controller,
    this.top,
    this.left,
    this.width,
    this.height,
  }) : 
    right = null,
    bottom = null,
    
    isAbsolute = true;

  @override
  State<ScrollPositioned> createState() => _ScrollPositionedState();
}

class _ScrollPositionedState extends State<ScrollPositioned> {
  ScrollController? controller;
  Axis axis = Axis.vertical;
  double offset = 0;
  double position = 0;

  double? width;
  double? height;

  RenderBox? render;

  @override
  void initState() {
    width = widget.width;
    height = widget.height;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _removeListener();
    controller = widget.controller ?? Scrollable.of(context)?.widget.controller;
    if (controller != null) {
      axis = controller!.position.axis;
      offset = controller!.offset;
      position = 0;

      controller?.addListener(_offsetChanged);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double offset = controller!.offset;

    final Widget resultWidget;
    if (axis == Axis.vertical) {
      if (widget.isAbsolute) {
        resultWidget = Positioned(
          top: offset,
          width: widget.width,
          height: widget.height,
          child: AbsolutePositioned(child: widget.child, offset: Offset(widget.top ?? 0, widget.left ?? 0)),
        );
      } else {
        resultWidget = Positioned(
          top: widget.top != null || widget.bottom == null ? (widget.top ?? 0) + offset : null,
          bottom: widget.bottom != null ? widget.bottom! - offset : null,
          left: widget.left,
          right: widget.right,
          width: widget.width,
          height: widget.height,
          child: widget.child,
        );
      }
    } else {
      if (widget.isAbsolute) {
        resultWidget = Positioned(
          left: offset,
          width: widget.width,
          height: widget.height,
          child: AbsolutePositioned(offset: Offset(widget.left ?? 0, widget.top ?? 0), child: widget.child),
        );
      } else {
        resultWidget = Positioned(
          left: widget.left != null || widget.right == null ? (widget.left ?? 0) + offset : null,
          right: widget.right != null ? widget.right! - offset : null,
          top: widget.top,
          bottom: widget.bottom,
          width: widget.width,
          height: widget.height,
          child: widget.child,
        );
      }
    }


    if (context.findAncestorWidgetOfExactType<Stack>() != null) {
      return resultWidget;
    } else {
      return Stack(children: [ resultWidget ]);
    }
  }

  void _removeListener() {
    if (controller != null) controller!.removeListener(_offsetChanged);
  }

  void _offsetChanged() {
    if (mounted) setState(() => offset = (controller?.offset ?? 0) - position);
  }
}

class AbsolutePositioned extends StatefulWidget {
  const AbsolutePositioned({
    Key? key,
    required this.child,
    this.offset = Offset.zero,
  }) : super(key: key);

  final Widget child;
  final Offset offset;

  @override
  State<AbsolutePositioned> createState() => _AbsolutePositionedState();
}

class _AbsolutePositionedState extends State<AbsolutePositioned> {
  RenderBox? render;
  Offset? position;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        final render = context.findRenderObject();
        if (render is RenderBox && mounted) setState(() => this.render = render);
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: (render?.localToGlobal(Offset.zero) ?? Offset.zero) * -1 + widget.offset,
      child: widget.child,
    );
  }
}