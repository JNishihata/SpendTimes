# Spend Times

Spend Times は、指定したアプリを開いている間の利用時間を  
**Live Activity / Dynamic Island にリアルタイム表示**する iOS アプリです。

SNS や動画アプリを見ていると、つい時間感覚を失いがちです。  
このアプリを使うと「今どれくらい使っているか」を常に確認できます。

## できること

- 対象アプリを開くと、カウントアップタイマーを開始
- 対象アプリを閉じると、タイマーを停止
- 利用時間を Dynamic Island 上で一目で確認

## 対応端末について

- Dynamic Island による体験を想定したアプリです
  - iPhone 14 Pro / 14 Pro Max
  - iPhone 15 シリーズ以降
- Dynamic Island 非搭載端末でも動作は可能ですが、UX は低下します
- 改善案があれば、Issue で提案してもらえると助かります

---

## 設定方法（ショートカットのオートメーション）

利用するには、**「開始用」と「停止用」**の 2 つのオートメーションを作成します。

### 1) 開始用オートメーションを作る

1. アプリをインストール（または Xcode からビルド）します。
2. 「ショートカット」アプリを開き、「オートメーション」を選択します。
3. 右上の「＋」→「アプリ」を選択します。
4. 計測したいアプリを選び、**「開いている」だけ**にチェックを入れます。
5. 実行設定は **「すぐに実行」** を選びます（通知は任意）。
6. 「次へ」→「新規ショートカットを作成」を選択します。
7. 検索ボックスで `Spend times` を検索します。
8. 「タイマー開始」を選択します。
9. 「アプリ名」に、計測対象アプリの名称を入力して保存します。

### 2) 停止用オートメーションを作る

1. もう一度「オートメーション」を新規作成し、「アプリ」を選択します。
2. 同じ計測対象アプリを選び、今度は **「閉じている」だけ**にチェックを入れます。
3. 実行設定は同様に **「すぐに実行」** を選びます。
4. 「次へ」→「新規ショートカットを作成」を選択します。
5. 検索ボックスで `Spend times` を検索します。
6. 「タイマー停止」を選択して保存します。

これで設定完了です。

---

## 権利 / License

本リポジトリのソースコードは、以下の条件で利用できます。

- 個人利用・学習目的でのビルドおよび改変は可能
- 著作者の書面による許可なく、以下を禁止
  - App Store / TestFlight 等での再配布
  - 別アプリとしての公開・配布
- 著作権は作者 JNishihata に帰属

The source code in this repository is available under the following conditions.

- You may build and modify it for personal or educational use.
- The following actions are NOT permitted without written permission from the author:
  - Redistribution via App Store, TestFlight, or similar platforms
  - Publishing or distributing it as a separate application
- Copyright belongs to JNishihata. All rights reserved.
