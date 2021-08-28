# flutter_test_practice_2

練習: 各種測試

https://codelabs.developers.google.com/codelabs/flutter-app-testing#0

https://flutter.dev/docs/testing

https://pub.dev/packages/mockito

## 測試

```
flutter test test/<path_to>/foo_test.dart
```

> Tip: You can run all the tests in the test directory at once by running:
>
> `$ flutter test`

## 整合測試 - 1 (使用 `integration_test`)

> ref: [Flutter: A deep dive into the integration_test library](https://blog.gskinner.com/archives/2021/06/flutter-a-deep-dive-into-integration_test-library.html) ([src](https://github.com/gskinnerTeam/flutter-integration-test-examples))

執行 `flutter test integration_test/app_test.dart`

## 整合測試 - 2 (此版本 `flutter_driver` 目前寫不出來 😢)

> ref: [Flutter | An introduction to integration testing](https://flutter.dev/docs/cookbook/testing/integration/introduction)

請執行這個指令

```
flutter drive --driver=test_driver/integration_test.dart --target=test_driver/app_test.dart
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
