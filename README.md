# Bytemanの例

<https://byteman.jboss.org/>

`example.btm`には次の例が含まれています。

- `HelloModel`のコンストラクタが呼ばれたらスタックトレースを出力する
- `HelloController.sayHello`の引数、`HelloModel`の`name`を大文字にする
- `HelloController.sayHello`の戻り値へキーが`foo`、値が`bar`のエントリーを追加する

## 起動

```bash
./mvnw spring-boot:run -Dspring-boot.run.agents="$BYTEMAN_HOME/lib/byteman.jar=script:example.btm"
```

## 動作確認

```bash
curl -s http://localhost:8080/hello -d name=world | jq
```

## btmファイルのチェック

```bash
$BYTEMAN_HOME/bin/bytemancheck.sh -cp "target/classes:$(./mvnw dependency:build-classpath -q -Dmdep.outputFile=/dev/stdout)" example.btm
```
