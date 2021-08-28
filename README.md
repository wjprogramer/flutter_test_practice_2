# flutter_test_practice_2

練習: 各種測試

https://codelabs.developers.google.com/codelabs/flutter-app-testing#0

https://flutter.dev/docs/testing

https://pub.dev/packages/mockito

## 測試

```
flutter test test/models/favourites_test.dart
```

> Tip: You can run all the tests in the test directory at once by running:
>
> `$ flutter test`

## 整合測試

請跑這個測試

```
flutter drive --driver=test_driver/integration_test.dart
```

解說用

```
flutter drive \
    --driver=test_driver/integration_test.dart \
    --target=integration_test/foo_test.dart \
    -d web-server
```

- `flutter drive` 預設是執行 `test_driver/main_test.dart`
- `target` 是 `integration_test` 資料夾裡面的命名規則，例：`foo_test.dart`、`bar_test.dart`
