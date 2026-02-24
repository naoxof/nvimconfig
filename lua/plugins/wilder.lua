return {
  "gelguy/wilder.nvim",
  event = "CmdlineEnter",
  dependencies = { "romgrk/fzy-lua-native" },
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })

    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 1,
          fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.vim_search_pipeline()
      ),
    })

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        border = "rounded",
        highlights = {
          border = "Normal",
          accent = wilder.make_hl("WilderAccent", "Pmenu", {
            { a = 1 },
            { a = 1 },
            { foreground = "#f4468f" },
          }),
        },
        highlighter = wilder.lua_fzy_highlighter(),
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
      }))
    )
  end,
}
