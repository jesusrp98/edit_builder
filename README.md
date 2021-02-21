# Edit Builder

[![Package](https://img.shields.io/pub/v/edit_builder.svg?style=for-the-badge)](https://pub.dartlang.org/packages/edit_builder)
[![Build](https://img.shields.io/github/workflow/status/jesusrp98/edit_builder/Flutter%20Package%20CI?style=for-the-badge)](https://github.com/jesusrp98/big_tip/actions)
[![License](https://img.shields.io/github/license/jesusrp98/edit_builder.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![Patreon](https://img.shields.io/badge/Support-Patreon-orange.svg?style=for-the-badge)](https://www.patreon.com/jesusrp98)

Simple package to help on the creation of edit pages.

This package aims to provide a super easy way to build an edit view of any kind. It uses `flutter_bloc` under the hood, in order to maintain the current state the editing item.

You must enter a valid `initialState`: it could be a just-initialzed object, or an object with data already inside. The type of this parameter is controller by the generic type of the widget.

The `value` and `setValue` inside the `builder` parameter offers an interface between the data & the view. Similiar to a `StatefullWidget`, in order to change the value of the `value` parameter, you just have to make the editing operation inside the `setValue` function. This function receives a new object of the same type as the previous one, and reloads the UI to reflect the changes.

## Example

If you want to take a deeper look at the example, take a look at the [example](https://github.com/jesusrp98/edit_builder/tree/master/example) folder provided with the project.

```
EditBuilder<String>(
  initialValue: 'C++',
  builder: (context, value, setValue) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(value),
        FlatButton(
          child: Text('INCREASE'),
          onPressed: () => setValue(value += '+'),
        )
      ],
    ),
  ),
),
```

## Getting Started

This project is a starting point for a Dart [package](https://flutter.io/developing-packages/), a library module containing code that can be shared easily across multiple Flutter or Dart projects.

For help getting started with Flutter, view our [online documentation](https://flutter.io/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Built with

- [Flutter](https://flutter.dev/) - Beautiful native apps in record time.
- [Android Studio](https://developer.android.com/studio/index.html/) - Tools for building apps on every type of Android device.
- [Visual Studio Code](https://code.visualstudio.com/) - Code editing. Redefined.

## Authors

- **Jesús Rodríguez** - you can find me on [GitHub](https://github.com/jesusrp98), [Twitter](https://twitter.com/jesusrp98) & [Reddit](https://www.reddit.com/user/jesusrp98).

## License

This project is licensed under the GNU GPL v3 License - see the [LICENSE](LICENSE) file for details.
