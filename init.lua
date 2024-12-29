-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 自动进入插入模式
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
})

-- 禁止 Esc 和 Ctrl-[ 切换到命令模式
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "i", "<C-[>", "<Nop>", { noremap = true, silent = true })
  end,
})

vim.o.guifont = "JetBrainsMono Nerd Font:h12"

-- 确保你已安装 yazi，适当配置插件和命令
-- 定义一个函数来使用 yazi 打开图片文件
local function open_with_yazi()
  local file = vim.fn.expand('%:p')
  vim.fn.jobstart({'yazi', file})
end

-- 创建一个自动命令，在打开图片文件时调用 open_with_yazi 函数
vim.api.nvim_create_autocmd("BufRead", {
  pattern = {"*.jpg", "*.jpeg", "*.png", "*.gif", "*.bmp"},
  callback = open_with_yazi,
})

