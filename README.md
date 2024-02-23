# DB migration by Gradle commands

## Description

主に JVM 畑の人がデータベースのマイグレーション行う際の検討サンプル。

- Gradle: プロジェクト管理、タスク管理
- Flyway: マイグレーションツール
- Postgress: DB 環境
- Docker: DB を簡易的にようにするために使用

## Demo

1. 事前準備
   1. JDK と Gradle をインストールする
   2. JAVA_HOME と GRADLE_HOME の環境変数を設定し、PATH を通す
2. Gradle プロジェクトを作成する
   ```
   gradle init
    ....................................
    Select type of project to generate:
    1: basic
    Select build script DSL:
    1: groovy
    以下省略
    ....................................
   ```
3. モジュール解決
   1. [build.gradle](./build.gradle)をコーディングする
   2. ビルド
      ```bash
      ./gradlew build
      ```
4. マイグレーションファイル(src/main/resources/db/migration/)を準備する
   1. 慣例として「V1\_\_XYZ.sql」の命名
   2. 動作検証はしていないが、依存関係（FK とか）ある場合は 1 ファイルに用意したほうがよいか
5. DB の用意
   1. 簡易的に[docker-compose.yml](./docker-compose.yml)を用意した
      ```bash
      docker-compose up
      ```
   2. DB 名、ユーザ名、パスワードには注意。
6. マイグレーションの実行
   1. コマンド実行する
      ```bash
      ./gradlew flywayMigrate
      ```
   2. 検証: DB コンテナから psql コマンドで SQL を実行して確認
      ```bash
      docker exec -it 「コンテナ名」 bash
      ```
      ```bash
      psql -U myuser -d mydb
      ```
      ```sql
      SELECT * FROM data_managements.daily_details;
      ```

## Operation

- 「./gradlew flywayMigrate」が成功すると「flyway_schema_history」テーブルに内容が記録される
- 次回以降はまたバージョン更新した SQL ファイルを作成して、同様のコマンドを打てばよい
