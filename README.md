# Flutter Form with Focus Node

Implementation of a form in flutter with using the widget `Form()`. This form uses `focusNode:`.

## Implementation

This is actually not a complete project, in this repository, I showed how to implement a form correctly with the focus node.

This project demonstrates how `TextFormFields()` communicate with each other, how to pass `FocusNode()` instance to any `TextFormFields()`. Also, it handles all active focus nodes by clicking dropdown menu.
```
Form(
          key: _formGlobalKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
              
                TextFormField(
                  focusNode: _textFocusNode1,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    // PASS THE FOCUS NODE TO NEXT FIELD
                    FocusScope.of(context).requestFocus(_textFocusNode2);
                  },  
                ),

                TextFormField(
                  focusNode: _textFocusNode2,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    // DON'T HAVE NEXT TEXT FIELD, UNFOCUS FOCUS-NODE
                    _textFocusNode2.unfocus(),
                  },
                  
                ),
   
                DropdownButtonFormField(
                  
                  //...some codes are omitted
                  
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _selectedText = value;
                    });
                  },
                  
                  //... other codes like decoration, items etc.
                ),
                    
             ],
         ),
     ),
),
```

Putting this on the dropdown will unfocus all active focus node.

```
onChanged: (value) {
           setState(() {
                FocusScope.of(context).requestFocus(new FocusNode());
                _selectedText = value;
            });     
},
```



## Preview

![](https://github.com/utpal-barman/form_with_focus_node/raw/master/20200108_151055.gif)


# Getting Started

1. [Download](https://flutter.dev/docs/get-started/install) Flutter SDK.
3. [Download](https://developer.android.com/studio/) Android Studio and install flutter plugin.
3. [OPTIONAL] [Download](https://code.visualstudio.com/Download) VS Code and install flutter plugin in it. (If you want to code in VS Code only, but you must have Android Studio installed on your system.)
4. Clone this repository, Terminal: `https://github.com/utpal-barman/Flutter-Form-with-Focus-Node.git`
5. Run the app, Debug > Run without debugging in VS Code, also you can run the app with terminal by `flutter run`

Find more information to get started check the official [documentation](https://flutter.dev/docs/get-started/editor?tab=androidstudio).



## How to Contribute

You can submit feedback and report bugs as Github issues. Please be sure to include your operating system, device, version number, and steps to reproduce reported bugs.

[Report a Github Issue](https://github.com/utpal-barman/form_with_focus_node.git/issues/new)

### Request or submit a feature :postbox:

Would you like to request a feature? Please get in touch with me on [LinkedIn](https://www.linkedin.com/in/utpal-barman/) , [Telegram](https://t.me/utpal_barman)

If you’d like to contribute code with a Pull Request, please make sure to follow code submission guidelines. Create your own branch and then pull a request.

### Spread the word :hatched_chick:

To learn more about me, join the conversation:
- [LinkedIn](https://www.linkedin.com/in/utpal-barman/) 
- [Skype](https://join.skype.com/invite/YKZe1ad0yuyK)
- [Telegram](https://t.me/utpal_barman)
- [Facebook](https://www.facebook.com/utpal777)
- [Instagram](https://www.instagram.com/utpal_barman_/)

## Contributor


<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<a href="https://www.linkedin.com/in/utpal-barman/"><img src="https://github.com/utpal-barman/ushop/raw/master/utpal-barman.png" width="100px;" alt=""/><br /><sub><b>Utpal Barman</b></sub></a>


<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->


## License
This app is available under the MIT license. Free for commercial and non-commercial use.



