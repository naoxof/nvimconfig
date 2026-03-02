-- 文字コード設定
-- （NeovimではencodingはUTF-8デフォルトです）
-- vim.o.encoding = 'utf-8'    -- Lua では不要になるケースが多い
vim.o.fileencoding = 'utf-8'

-- 編集中のファイルが外部で変更されたら自動で読み直す
vim.o.autoread = true

-- バッファが編集中でも他のファイルを開けるように
vim.o.hidden = true

-- 入力中のコマンドをステータスに表示する
vim.o.showcmd = true

-- 行番号を表示
vim.wo.number = true

-- スマートインデント
vim.o.smartindent = true

-- 括弧入力時の対応する括弧を表示
vim.o.showmatch = true

-- 新しいウィンドウを右側に開く
vim.o.splitright = true

-- シンタックスハイライト有効化
-- Lua では :syntax on 相当を実行させるなら下記のように書けます
vim.cmd('syntax enable')

-- 不可視文字の可視化（タブを「▸-」と表示）
vim.o.list = true
vim.o.listchars = 'tab:▸-'

-- Tab文字を半角スペースにする
vim.o.expandtab = true

-- タブ幅設定
vim.o.tabstop = 4       -- 行頭以外のTab表示幅
vim.o.shiftwidth = 4    -- 自動インデント等で使われるTab幅

-- C-w C-n で右側に新しいバッファを開く
vim.keymap.set('n', '<C-w>n', '<cmd>vnew<CR>', { silent = true })

-- ESCを2回押した時に検索ハイライトを消す
vim.keymap.set('n', '<ESC><ESC>', ':nohl<CR>', { silent = true })

-- Leaderキーをスペースキーに
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- アンダースコアを単語の区切りとして認識させる
vim.opt.iskeyword:append('_')

-- 検索中の選択範囲に対して"*"を実行→ cgn で置換
vim.keymap.set('n', '<leader>*', "*''cgn")

-- 新規タブでターミナルモードを起動
vim.keymap.set('n', 'tt', '<cmd>terminal<CR>', { silent = true })

-- 下分割でターミナルモードを起動
vim.keymap.set('n', 'tx', '<cmd>belowright new<CR><cmd>terminal<CR><cmd>resize 10<CR>', { silent = true })

-- Ctrl-j でターミナルをトグル（下に表示）
local _term_bufnr = nil
local function toggle_terminal()
  -- ターミナルウィンドウが表示中か探す
  if _term_bufnr and vim.api.nvim_buf_is_valid(_term_bufnr) then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == _term_bufnr then
        -- 表示中なら閉じる
        vim.api.nvim_win_close(win, true)
        return
      end
    end
    -- バッファはあるがウィンドウが無い→再表示
    vim.cmd('botright split')
    vim.cmd('resize 15')
    vim.api.nvim_win_set_buf(0, _term_bufnr)
    vim.cmd('startinsert')
    return
  end
  -- 新規作成
  vim.cmd('botright split')
  vim.cmd('resize 15')
  vim.cmd('terminal')
  _term_bufnr = vim.api.nvim_get_current_buf()
end

vim.keymap.set('n', '<C-j>', toggle_terminal, { silent = true, desc = 'Toggle terminal' })
vim.keymap.set('t', '<C-j>', function() toggle_terminal() end, { silent = true, desc = 'Close terminal' })

-- ターミナルを開いたら常にinsertモードに入る
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.cmd('startinsert')
  end
})

-- ウインドウの不透明度
vim.api.nvim_set_hl(0, "Normal", {
  bg      = "none",  -- 旧 guibg=NONE に相当
  ctermbg = "none",  -- 旧 ctermbg=NONE に相当
})

-- 行番号の色を上書き
vim.cmd("highlight LineNr cterm=NONE ctermfg=250 guifg=#aaaaaa")

-- カーソル行番号の色を上書き
vim.cmd("highlight CursorLineNr cterm=bold ctermfg=255 guifg=#ffffff")

-- Visual モード時の選択範囲の背景色を上書き
vim.cmd [[
  highlight Visual cterm=NONE ctermbg=239 guibg=#777777

]]

------------------------------------------------------------------------------
-- ターミナルモードのキーバインド
------------------------------------------------------------------------------

-- ノーマルモードへ戻る
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], { silent = true })

-- 新規バッファを開く
vim.keymap.set('t', '<C-W>n', '<cmd>new<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-N>', '<cmd>new<cr>', { silent = true })

-- バッファ・ウィンドウを閉じる/終了
vim.keymap.set('t', '<C-W>q', '<cmd>quit<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-Q>', '<cmd>quit<cr>', { silent = true })
vim.keymap.set('t', '<C-W>c', '<cmd>bd!<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-C>', '<cmd>bd!<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-W>', '<cmd>bd!<cr>', { silent = true })

-- 縦横移動
vim.keymap.set('t', '<C-W><Down>', '<cmd>wincmd j<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-J>', '<cmd>wincmd j<cr>', { silent = true })
vim.keymap.set('t', '<C-W>j', '<cmd>wincmd j<cr>', { silent = true })
vim.keymap.set('t', '<C-W><Up>', '<cmd>wincmd k<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-K>', '<cmd>wincmd k<cr>', { silent = true })
vim.keymap.set('t', '<C-W>k', '<cmd>wincmd k<cr>', { silent = true })
vim.keymap.set('t', '<C-W><Left>', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-H>', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-W><BS>', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-W>h', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-W><Right>', '<cmd>wincmd l<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-L>', '<cmd>wincmd l<cr>', { silent = true })
vim.keymap.set('t', '<C-W>l', '<cmd>wincmd l<cr>', { silent = true })


------------------------------------------------------------------------------
-- ファイルパスをクリップボードにコピーするコマンド
------------------------------------------------------------------------------

vim.api.nvim_create_user_command('CopyFilePath', function()
  local path = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, {})

vim.api.nvim_create_user_command('CopyAbsFilePath', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, {})

vim.api.nvim_create_user_command('CopyFilePathAndLineNumber', function()
  local path = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.') .. ':' .. vim.fn.line('.')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, {})

vim.api.nvim_create_user_command('CopyAbsFilePathAndLineNumber', function()
  local path = vim.fn.expand('%:p') .. ':' .. vim.fn.line('.')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, {})

require("config.lazy")

-- 起動時にチートシートの開き方を表示
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_echo({
        { " Cheatsheet: ", "MoreMsg" },
        { "<Space>? ", "Title" },
        { "または ", "Normal" },
        { ":Cheatsheet", "Title" },
        { " で開けます", "Normal" },
      }, false, {})
    end, 1000)
  end,
})