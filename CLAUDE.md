# Neovim設定 (lazy.nvim)

## プロジェクト構成

```
~/.config/nvim/
├── init.lua              # エントリポイント（基本設定 + lazy.nvim読み込み）
├── lua/
│   ├── config/
│   │   └── lazy.lua      # lazy.nvimのブートストラップと setup()
│   └── plugins/          # プラグイン定義（1ファイル = 1プラグイン）
│       ├── hop.lua
│       ├── nvim-treesitter.lua
│       ├── snacks.lua
│       └── ...
└── lazy-lock.json        # ロックファイル（自動生成、手動編集しない）
```

## lazy.nvim の基本ルール

- **プラグイン追加**: `lua/plugins/` に新しいLuaファイルを作成し、テーブルを返す
- **自動読み込み**: `{ import = "plugins" }` により `lua/plugins/` 以下が全て自動で読み込まれる
- **ロックファイル**: `lazy-lock.json` はgit管理する。手動編集しない

## プラグイン定義の書き方

```lua
-- lua/plugins/example.lua
return {
  "author/plugin-name",       -- GitHubリポジトリ（必須）
  dependencies = { ... },     -- 依存プラグイン
  event = "VeryLazy",         -- 遅延読み込みトリガー
  keys = { ... },             -- キーマップトリガー
  opts = { ... },             -- setup()に渡すオプション
  config = function()         -- optsで足りない場合のカスタム設定
    require("plugin-name").setup({ ... })
  end,
}
```

## 遅延読み込み（Lazy Loading）の主なトリガー

| キー | 説明 | 例 |
|------|------|-----|
| `event` | イベント発火時 | `"BufReadPre"`, `"VeryLazy"`, `"InsertEnter"` |
| `cmd` | コマンド実行時 | `"Telescope"`, `"Lazy"` |
| `keys` | キー押下時 | `{ "<leader>ff", ... }` |
| `ft` | ファイルタイプ | `"lua"`, `"python"` |
| `lazy = false` | 即座に読み込み | 起動時に必要なプラグイン |

## よく使うコマンド

- `:Lazy` — プラグイン管理UI を開く
- `:Lazy sync` — プラグインの更新・インストール・クリーンを一括実行
- `:Lazy update` — プラグインを更新
- `:Lazy clean` — 不要なプラグインを削除
- `:Lazy profile` — 起動時間のプロファイリング

## この設定の方針

- Leaderキーは `<Space>`
- タブ幅は4スペース
- 背景は透過（`Normal` の `bg = none`）
