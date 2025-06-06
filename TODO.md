# レビューフィードバック環境を構築する

- [x] typst の slide を自動で build できるようにする
- [x] build 成功時に自動で pull request を作成するようにする
- [x] pull request へコメントしたときに gemini API 経由で gemini にコメントを送信してフィードバックを得られるようにする
  - [x] issue_comment をしたときに自動で応答する actions を作成する
  - [x] gemini の API key を取得する
  - [ ] 作成した actions に組み込んで gemini からの応答を得られるようにする
    - [x] API 経由でgeminiの応答を得る script を書く
      - defualt は flash-2.0
      - モデルを選ぶには請求先を設定しないとダメそう
    - [x] script に入力を与えられるようにする
    - [x] actions に script を組み込む 
- [x] フードバック用の観点を与えるためのプロンプトを書く
  - [x] .github/instractions/feedback.instraction.md にfeedback用のプロンプトを書くようにした


## フィードバックのアイデア

**レビューの良し悪しを判断できないとより良いレビュープロンプトを作れないのでレビュー能力を養成する必要はある**

### 懸念点

- 人間がレビューしたい
  - AIにレビューに対してのフィードバックをさせたい
- 人間側のレビューにおいて、新しい観点を獲得できなくてレビュー能力が伸び悩んでしまうことが発生しそう
  - 新しい観点とお手本のレビューが欲しい

### 仮解答
  人間がレビューしたものを見て、AIがレビューに対してフィードバックし、AIもレビューする。という方式にした方が良さそう

## 問題点

- feedbackが遅い
  - node_moduleのcacheをすると良さそう
    - https://qiita.com/mihyon/items/407b0df9c0a0f0f45bbc