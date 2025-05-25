#import "@preview/touying:0.6.1": *
#import themes.university: *
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.5" as fletcher: node, edge
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/enja-bib:0.1.0": *
#import "@preview/diagraph:0.3.3": *
#import "@preview/pintorita:0.1.4"
#import bib-setting-plain: *
#show: bib-init
#let citek = bib-style.bib-cite-func.with(bib-cite: ([], bib-citefull-default, [; ], []))
#let empty(a) = {
  ""
}
#set footnote(
  numbering: empty
)
#let citefoot(label) = {
  [#citen(label)#footnote([#citen(label)#citek(label)])]
}
#show raw.where(lang: "pintora"): it => pintorita.render(it.text)

#import cosmos.clouds: *
#show: show-theorion
#set text(font: "Noto Serif CJK JP", lang: "jp")

// cetz and fletcher bindings for touying
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

#show: university-theme.with(
  aspect-ratio: "16-9",
  // align: horizon,
  // config-common(handout: true),
  config-common(frozen-counters: (theorem-counter,)),  // freeze theorem counter for animation
  config-info(
    subtitle: [Effects of an AI-supported approach to peer feedback on university EFL students' feedback quality and writing ability #h(1000em) 論文・文献講読],
    author: [22266505 岩井 政樹],
    date: datetime.today(),
    institution: [金子研究室B4],
  ),
  config-methods(
  init: (self: none, body) => {
    set text(fill: self.colors.neutral-darkest, size: 24pt)
    show footnote.entry: set text(size: .6em)
    show strong: self.methods.alert.with(self: self)
    show heading.where(level: self.slide-level + 1): set text(1.4em)

    body
  },
)
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

== Outline <touying:hidden>

#show outline: it => {
  text(size: 18pt, it)
}

#components.adaptive-columns(outline(title: none, indent: 1em, ))

= 概要

== 実験と結果の概要
#h(0em)

- ELF Writing（外国語としての英語）の授業で AI Chat Bot「Eva」をオンラインレビューシステムに組み込んだ
- 他の受講者が作成した小論文へのレビューに対して* Eva からのフィードバックを受けた群は*そうでない群と比べて
  - *より質の高いレビューができるようになった*
  - *ライティング能力も向上した* #citefoot(<target>)

#showybox(
  frame: (
    border-color: orange.lighten(-0%),
    title-color: orange.lighten(30%),
    body-color: orange.lighten(50%),
    inset: 0.31em
  ),
  title-style: (
    color: black,
    weight: "regular",
  ),
  title: [#text(size: 20pt, weight: "bold")[用語の注意]],
  [人間からのレスポンスを*レビュー* \ AIからのレスポンスを*フィードバック*と表記します]
)

= 研究背景

== ELF Writing の授業が抱える課題

#show figure: it => {
	show figure.caption: cap => text(size: 10pt, cap)
	it
}

#showybox(
  frame: (
    border-color: rgb("#0072BC"),
    title-color: rgb("#ABE1FA70"),
    body-color: rgb("#ABE1FA30"),
    inset: 0.4em
  ),
  title-style: (
    color: black,
    weight: "regular",
  ),
  title: [#text(size: 20pt, weight: "bold")[事実]],
  [レビューはライティング能力向上に（間接に）効果あり#citefoot(<review-fact>)]
)

#figure(
  image("/img/feedback_path.drawio.png", width: 50%),
  caption: [#text(size: 12pt, [フィードバックが執筆能力に影響を与える経路 出典: Hwang S. (2025)[2] より引用改変])]
)

#pagebreak()　

#showybox(
  frame: (
    border-color: red.darken(50%),
    title-color: red.lighten(60%),
    body-color: red.lighten(80%),
    inset: 0.4em
  ),
  title-style: (
    color: black,
    weight: "regular",
  ),
  title: [#text(size: 20pt, weight: "bold")[課題]],
  [受講者が多いとすべての受講者に個人的なレビューをすることが　難しい（教師の負担が大きい）]
)

#showybox(
  frame: (
    border-color: rgb("#3F9877"),
    title-color: rgb("#40BA8D80"),
    body-color: rgb("#40BA8D40"),
    inset: 0.4em
  ),
  title-style: (
    color: black,
    weight: "regular",
  ),
  title: [#text(size: 20pt, weight: "bold")[解決策]],
  [peer review (受講者同士の相互評価)]
)

== peer reviewとは？
#h(1em)

- 同じ立場の者同士でレビューし合うこと

- メリット
  - 批判的思考や議論のスキルを養える#citefoot(<peerfeedback-skill>)
  - 学生同士の協力を促す#citefoot(<encourages-collab>)
  - ライティング能力を向上させる#citefoot(<peerfeedback-improve-writing-performance>)
  
#pagebreak()
#h(1em)

#showybox(
  frame: (
    border-color: red.darken(50%),
    title-color: red.lighten(60%),
    body-color: red.lighten(80%),
    inset: 0.4em
  ),
  title-style: (
    color: black,
    weight: "regular",
  ),
  title: [#text(size: 20pt, weight: "bold")[課題]],
  [ 
    - レビューの質が保証されない
    - レビューの質が低いとライティング能力向上に効果が無い#citefoot(<low-quality-review-effect>)
  ]
)

#showybox(
  frame: (
    border-color: rgb("#3F9877"),
    title-color: rgb("#40BA8D80"),
    body-color: rgb("#40BA8D40"),
    inset: 0.4em
  ),
  title-style: (
    color: black,
    weight: "regular",
  ),
  title: [#text(size: 20pt, weight: "bold")[解決策？]],
  [peer review をさらにレビューして品質を向上させる]
)

- 課題が堂々巡りになる
  - AI導入で解決可能？

= 研究目的

== 研究目的
#h(1em)

#text(size: 32pt, [受講者が書いた*レビューに対してAIから \ フィードバックを与える*ことでレビューの質およびライティング能力が向上するか検証する])


= 実験手法

== 実験環境
#h(1em)
- 実験参加者
 - 中国人の学部生 124 名（うち男性 17 名、女性 107 名）
 - CEFR B2 レベルの英語能力
 - peer review の頻度は平均して半期に一度から月に一度の間（21.77% が経験なし）

- オンラインフィードバックプラットフォーム EvaluMate を作成
 - EvaluMate 上で授業外の課題として peer review を行う

== レビュー方法

#slide(composer: (2fr, 1.2fr))[
  #figure(
  image("/img/EvaluMate.jpg", width: 90%),
  caption: [#text(size: 12pt, [EvaluMate操作画面  出典: Kai Guo(2024)#citefoot(<target>) より引用])]
)][
  - 内容、構成、言語の 3 項目をそれぞれ 5 段階で評価
  
  - 5 つの評価基準（後述）に従いレビューコメントを記述
    - このタスクをAIがサポート
]

== peer review の評価基準
#text(size: 22pt, [以下の 5 つの項目に従って peer review を評価する#citefoot(<Kerman07022024>)])
#text(size: 22pt, [
1. 感情(Affect)
  - 励ましや賞賛が含まれているか
2. 説明(description)
  - 内容の説明や、取られた行動などの要約が大きく含まれているか
3. 特定可能(Identification)
 - 問題を明確かつ局所的に指摘しているか
4. 正当性(Justification)
  - 特定の問題に対して、詳細な説明や正当な根拠が含まれているか
5. 建設性(Constructiveness)
 - さらなる改善のための提言や行動計画が含まれているか
])

== 実験の流れ
#h(1em)

- プレテスト（week 1）

  1. 以下の題材で小論文を書く（40分）
  #text(size: 18pt, [「政府はすべての学生に大学教育を無償で提供すべきである」この声明にどの程度賛成か反対かを論じ、あなたがとる立場の理由を述べなさい。あなたの立場を展開し支持する際には、関連する証拠を含めること。300-500ワードで書きなさい。])

  2. ひとりの学生の小論文に対してレビューを書く（20分）
  3. レビューのトレーニング & EvaluMateのレクチャー

#slide(composer: (2fr, 1.2fr))[
```pintora
sequenceDiagram
  title: Sequence Diagram Example
  autonumber
  participant [<actor> Writer]
  participant [<object> EvaluMate]
  participant [<actor> Reviewer]
  participant [<object> Eva{ChatBot}]
  Writer->>EvaluMate: submit essay
  EvaluMate->>Reviewer: assign review
  activate Reviewer
  alt Reviewer in EG
    loop submit count ≤ 3
      Reviewer->>Eva{ChatBot}: submit review
      activate Eva{ChatBot}
      Eva{ChatBot}->>Reviewer: feedback
      deactivate Eva{ChatBot}
    end
  else Reviwer in CG
    Reviewer->>EvaluMate: submit review
  end
  deactivate Reviewer
  EvaluMate->>Writer: return review
```
][#text(size: 18pt, 
[
  実験（week 2-4）
  
    - 授業中に小論文(essay) を書いて提出
    - 授業後に 3 つの小論文の review が課題として割り当てられる
    - 評価基準は全体に公開されている
      - 実験群はChatBot からのフィードバックを受けられる
      - ChatBotからのフィードバックは 1 つのレビューについて 3 回まで
])]

#h(1em)

- ポストテスト（week 5）

  1. 以下の題材で小論文を書く（40分）
  #text(size: 18pt, [大学生は、専攻分野を選択する際、その分野の仕事があるかどうかを基準にすべきである」。この声明にどの程度賛成か反対かを論じ、あなたがとる立場の理由を述べなさい。あなたの立場を展開し支持する際には、関連する証拠を含めること。300-500ワードで書きなさい。])

  2. ポストテスト時と同じ学生の小論文に対してレビューを書く（20分）

== 分析方法と使用データ
#h(1em)

- 使用データ
  - プレテスト、およびプレテストで書かれた小論文 248 本
  - プレテスト、およびプレテストで書かれたレビュー 248 本

- レビューの分析
  - 第一著者と第二著者がpeer reviewの評価基準に従って、5 つの項目それぞれについて 2 点満点、合計 10 点満点で評価

- 小論文（ライティング能力）の分析
  - 第一著者と第二著者が内容、構成、言語の項目それぞれについて 5 点満点、合計 15 点満点で評価

- 統計分析はQuade検定を用いた

= 結果

== レビューの質への効果

感情以外の項目で実験群が有意に質が高かった。

#show table: tb => {
  text(size: 18pt, tb)
}

#text(size: 18pt, [Table 1. Quade検定の結果(peer review の質)出典: Kai Guo(2024)[1] より引用])
#table(
  columns: (auto, auto, auto, auto, auto),
  inset: 5pt,
  align: horizon,
  table.header(
    [Feedback quality dimension],	
    [Group],
    [Pretest M (SD)],
    [Posttest M (SD)],
    [F]
  ),
  [Affective],[EG],[1.91(0.29)],[1.98(0.13)],[0.415],
  [], [CG],[1.90(0.30)],[1.97(0.18)], [],
  [Description],[EG],[0.02(0.13)],[1.20(0.82)],[39.129\*],
  [], [CG],[0.07(0.31)],[0.40(0.69)], [],
  [Identification],[EG],[0.95(0.58)],[1.52(0.59)],[31.696\*],
  [], [CG],[0.90(0.44)],[0.85(0.71)],[],
  [Justification],[EG],[0.11(0.31)],[1.19(0.66)],[41.331\*],
  [], [CG],[0.15(0.36)],[0.45(0.67)],[],
  [Constructive],[EG],[0.14(0.35)],[1.45(0.71)],[47.529\*],
  [],[CG],[0.15(0.36)],[0.60(0.67)],[],
  [Totalscore],[EG],[3.13(0.79)],[7.34(1.84)],[111.508\*],
  [],[CG],[3.17(0.67)],[4.27(1.38)],[]
)
== ライティング能力への効果

内容と言語の項目で実験群が有意にスコアが高かった。

#text(size: 18pt, [Table 2. Quade検定の結果（ライティングスコア）出典: Kai Guo(2024)[1] より引用])
#table(
  columns: (auto, auto, auto, auto, auto),
  inset: 5pt,
  align: horizon,
  table.header(
    [Essay quality dimension],	
    [Group],
    [Pretest M (SD)],
    [Posttest M (SD)],
    [F]
  ),
  [Content],[EG],[2.20(0.54)],[3.19(0.66)],[13.372\*],
  [],[CG],[2.18(0.39)],[2.75(0.65)],[],
  [Organisation],[EG],[3.19(0.53)],[3.88(0.63)],[0.141],
  [],[CG],[2.98(0.47)],[3.78(0.69)],[],
  [Language],[EG],[2.89(0.62)],[3.97(0.53)],[4.131\*],
  [],[CG],[2.83(0.64)],[3.77(0.53)],[],
  [Totalscore],[EG],[8.28(1.37)],[11.03(1.40)],[5.124\*],
  [],[CG],[8.00(1.10)],[10.30(1.42)],[],
)

= 私見

== 疑問点
#h(1em)

- 構成の観点で実験前後で有意差がみられなかったのはレビューに構成に関する要素があまり含まれていなかったからではないか
- ただレビューを受けるだけの場合と、レビューもする場合でどの程度レビューの質とライティング能力に差が出るのか
- 実験ではAIからのフィードバックを受けられる回数が 3 回だったが、ここの上限回数を増やすとより能力は向上するのか
- 小論文を読んでからレビューを返すまでの時間は実験後に早くなったのか

== 応用可能性
#h(1em)

- AI と強調して自己調整能力を高めるシステムがあれば任意の能力を高速に高められるのでは？

#figure(
  image("/img/feedback_path.drawio.png", width: 50%),
  caption: [#text(size: 12pt, [フィードバックが執筆能力に影響を与える経路 出典: Hwang S. (2025)[2] より引用改変])]
)

= 参考文献

== 参考文献一覧
#h(1em)

#text(size: 12pt)[
#bibliography-list(
  title: none,
  ..bib-file(read("bib.bib"))
)]
