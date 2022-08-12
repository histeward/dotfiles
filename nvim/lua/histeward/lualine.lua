-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
    red = '#ca1243',
    grey = '#a0a1a7',
    black = '#383a42',
    white = '#f3f3f3',
    light_green = '#83a598',
    orange = '#fe8019',
    green = '#8ec07c',

    -- own added colours
    pastel_blue = '#A9CADF',
    darker_pastel_blue = '#416B85',
    teal = '#15EBCA',
    light_red = '#ED6751',
    dark_red = '#B82324',
    pastel_purple = '#D1D3EB',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.pastel_blue },
        b = { fg = colors.white, bg = colors.darker_pastel_blue },
        c = { fg = colors.black, bg = colors.pastel_purple },
        z = { fg = colors.black, bg = colors.pastel_blue },
    },
    insert = { a = { fg = colors.black, bg = colors.light_red } },
    visual = { a = { fg = colors.black, bg = colors.orange } },
    replace = { a = { fg = colors.white, bg = colors.dark_red } },
}
require('lualine').setup {
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}
