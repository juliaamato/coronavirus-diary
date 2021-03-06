import 'package:flutter/material.dart';

class LabeledRadio<T> extends StatelessWidget {
  const LabeledRadio({
    @required this.onChanged,
    @required this.value,
    @required this.groupValue,
    this.label,
    this.semanticsLabel,
    this.semanticsValue,
    this.axis = Axis.horizontal,
  }) : assert(axis != null);

  final VoidCallback onChanged;
  final T value;
  final T groupValue;
  final String label;
  final String semanticsLabel;
  final String semanticsValue;
  final Axis axis;

  Widget _wrapForOrientation({List<Widget> children}) {
    switch (axis) {
      case Axis.horizontal:
        return Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children);
      case Axis.vertical:
        return Column(children: children);
    }
    assert(false, 'Axis $axis not handled');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _wrapForOrientation(
      children: <Widget>[
        Semantics(
          explicitChildNodes: false,
          label: semanticsLabel,
          value: semanticsValue,
          child: Radio<T>(
            onChanged: (T value) => onChanged(),
            value: value,
            groupValue: groupValue,
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        ExcludeSemantics(
          child: GestureDetector(
            onTap: onChanged,
            child: Text(label, style: Theme.of(context).textTheme.button),
          ),
        ),
      ],
    );
  }
}
