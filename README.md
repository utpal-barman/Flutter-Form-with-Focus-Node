# Flutter Form with Focus Node

A new Flutter project using `Form()`. This form uses `focusNode:`.

## Getting Started

This is actually not a complete project, in this repository, I showed how to implement a form correctly with the focus node.

This project demonstrates how `TextFormFields()` communicate with each other, how to pass `FocusNode()` instance to any `TextFormFields()`. Also, it handles all active focus nodes by clicking dropdown menu.

Putting this on the dropdown will unfocus all active focus node.

```
onChanged: (value) {
           setState(() {
                // Will unfocus other fields, otherwise after selecting
                // a value last active focus node will be focused
                FocusScope.of(context).requestFocus(new FocusNode());
                _selectedText = value;
            });     
},
```

## To get this to your device

Make sure you have installed git in your computer or device.

run this in terminal / git bash / command prompt

`git clone https://github.com/utpal-barman/form_with_focus_node.git`

## Preview

![](https://github.com/utpal-barman/form_with_focus_node/raw/master/20200108_151055.gif)
