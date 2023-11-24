# Elmer数値解析実験場

[Elmer FEM](https://www.csc.fi/web/elmer) の実験場所．バージョンは9．

## 解析方法

1. Gmshで形状とメッシュを作る．hoge.geo -> hoge.msh．
2. `ElmerGrid 14 2 hoge.msh` でElmer用の格子を生成する．
3. 格子とソルバと計算条件などを設定する `hoge.sif`（Elmer用の解析条件が書かれたファイルの拡張子は `.sif` なのでsifファイルと今後も言うことにする．）を書く．
   1. 最初はGUIで慣れると良い．
4. `ElmerSolver hoge.sif` を実行する．
5. Paraviewで結果を見る．

## 基本情報

以下のリンクのPDF群はすべてに目を通しておくこと．

[Documentation](https://www.nic.funet.fi/pub/sci/physics/elmer/doc/)

簡単な読み方（2023年11月24日時点）．

- ElmerGUIManual.pdf           2023-04-06
  - はじめはGUIでなれて吐き出されるsifファイルに慣れること．
- ElmerGridManual.pdf          2023-04-06
  - Elmerのメッシュはここでは扱わない．（.grdファイル．）
- ElmerModelsManual.pdf        2023-08-18
  - いろいろな物理現象がソルバモデルとして書かれたドキュメントとなる．
- ElmerOverview.pdf            2023-04-06
  - 概要．
- ElmerParamManual.pdf         2022-08-02
  - ここでは扱わない．
- ElmerProgrammersTutorial.pdf 2022-10-17
  - 読んでおくと良い．
- ElmerSolverManual.pdf        2023-04-06
  - 時間発展，線形ソルバ関連が書かれているのでかなり重要．高速化や精度を考える上で必読．
- ElmerTutorials-nonGUI.pdf    2023-04-06
  - 基本的にGUIは使わなくなるのでsifファイルをそのまま書くことに慣れること．
- ElmerTutorials.pdf           2023-04-06
  - チュートリアル．初めの方に読むと良い．
- GetStartedElmer.pdf          2023-04-06
  - インストール方法など．
- MATCManual.pdf               2023-04-06
  - 境界条件などを数式で与える場合，MATCで書くことになるので必読．




