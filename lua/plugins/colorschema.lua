return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "dark",
          floats = "dark",
        },
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Tema explícito: fondo oscuro en sección b con texto claro,
      -- evitando el fondo claro del tema solarized-osaka por defecto
      opts.options.theme = {
        normal   = { a = { bg = "#268bd2", fg = "#002d38", gui = "bold" }, b = { bg = "#002d38", fg = "#9facae" }, c = { bg = "#00141a", fg = "#657b83" } },
        insert   = { a = { bg = "#859900", fg = "#002d38", gui = "bold" } },
        visual   = { a = { bg = "#d33682", fg = "#002d38", gui = "bold" } },
        replace  = { a = { bg = "#dc322f", fg = "#002d38", gui = "bold" } },
        command  = { a = { bg = "#b38600", fg = "#002d38", gui = "bold" } },
        inactive = { a = { bg = "#002d38", fg = "#657b83" }, b = { bg = "#002d38", fg = "#657b83" }, c = { bg = "#00141a", fg = "#657b83" } },
      }
      return opts
    end,
  },
}
