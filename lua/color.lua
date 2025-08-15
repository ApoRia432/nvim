local isNotify = false
-- ファイルパス
local path = os.getenv("HOME") .. '/.config/omarchy/current/theme/colorscheme'

-- ファイルを開く
local file = io.open(path, "r")

-- ファイルが開けているか確認
if not file then
    if isNotify then
        vim.notify('colorscheme file not found')
    end
    return
end

-- colorschemeをファイルから読み取る
local colorscheme = file:read("*l")
file:close()

-- colorschemeの値が空か確認
if not colorscheme or colorscheme == "" then
    if isNotify then
        vim.notify('empty colorscheme')
    end
    return
end

-- 設定
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not ok then
    if isNotify then
        vim.notify('failed to set colorscheme')
    end
end
