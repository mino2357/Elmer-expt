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

## 実験一覧

[2次元流体の検証，OpenFOAMとの比較](2d-flow-verification/README.md)

WIP [流れと音と密度の実験](acoustic/README.md)

[キャビティ流れ](cavity/README.md)

[反応拡散方程式](Gray-Scott/README.md)
- issueあり．https://github.com/mino2357/Elmer-expt/issues/1

WIP [流れ場で駆動するスカラー](scalarDrivenByFluid/README.md)

## 線形ソルバ

NS 方程式で使うもののまとめ．

```
  Equation = Navier-Stokes ! NSの特殊性より必要キーワード。NS用に離散化される。

  Stabilization Method=Stabilized ! 必要。圧縮性ならBubble functionが使われる。上のスライドの行列。

  Steady State Convergence Tolerance = 1.0e-5 ! 定常問題なら必要。その判定。相対誤差。

  Nonlinear System Convergence Tolerance = 1.0e-8 ! ニュートン反復での収束判定。
  Nonlinear System Max Iterations = 20 ! そのままの意味。
  Nonlinear System Newton After Iterations = 3 ! ピカール反復を何回するか。
  Nonlinear System Relaxation Factor = 1 ! よく反復法関連で出てくる緩和係数みたいなやつ。
  Nonlinear System Newton After Tolerance = 1.0e-3 ! これ以下になったらニュートン反復する。
  Linear System Solver = Iterative ! 反復法で解く。小さい問題ならDirectでも良い。
  Linear System Symmetric = True ! NSから出てくる行列は対称ではないが既知の値を行列から除外したりゼロにして行列を対称化するか。
  Linear System Iterative Method = BicgstabL ! そのまま。
  BiCGStabl polynomial degree = 4 ! そのまま。以下略。
  Linear System Max Iterations = 500
  Linear System Convergence Tolerance = 1.0e-10
  Linear System Residual Output = 10 ! 残差を何回に1回出力するか。
  Linear System Preconditioning = ILU0
```
