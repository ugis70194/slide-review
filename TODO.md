# レビューフィードバック環境を構築する

- [x] typst の slide を自動で build できるようにする
- [x] build 成功時に自動で pull request を作成するようにする
- [ ] pull request へコメントしたときに gemini API 経由で gemini にコメントを送信してフィードバックを得られるようにする
  - [x] issue_comment をしたときに自動で応答する actions を作成する
  - [x] gemini の API key を取得する
  - [ ] 作成した actions に組み込んで gemini からの応答を得られるようにする
    - [x] API 経由でgeminiの応答を得る script を書く
    - [ ] 2.5 flash を使えるようにする
      - defualt は flash-2.0
      - モデルを選ぶには請求先を設定しないとダメそう
    - [x] script に入力を与えられるようにする
    - [ ] actions に script を組み込む 
  - [ ] フィードバック用のプロンプトを書く