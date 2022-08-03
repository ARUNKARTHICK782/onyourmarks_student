import 'package:flutter/material.dart';

class BuildChoiceChips extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onSelectionChanged;
  const BuildChoiceChips(this.items,{required this.onSelectionChanged});

  @override
  State<BuildChoiceChips> createState() => _BuildChoiceChipsState();
}

class _BuildChoiceChipsState extends State<BuildChoiceChips> {

  List<String> selectedChoices = [];
  buildChoiceChips(){
    List<Widget> choices = [];
    widget.items.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          selectedColor: Colors.blue,
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices); // +added
            });
          },
        ),
      ));
    });
    return choices;
  }


  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: buildChoiceChips(),
    );
  }
}
