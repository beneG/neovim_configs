# Neovim

Личный конфиг Neovim: gruvbox, LSP (C/C++, Python, Lua), автодополнение, Telescope, дерево файлов и запуск текущего файла по `<F5>`.

Конфиг лежит в `.config/nvim/init.lua`. Репозиторий нельзя клонировать прямо в `~/.config/nvim`: Neovim ищет `init.lua` в корне конфига, а здесь он вложен в `.config/nvim`.

## Требования

- Linux
- Neovim **0.13** или новее (`vim.highlight.hl_op` есть с 0.13)
- `git`, `curl`, `tar`, `unzip`, `gcc`, `make`
- `ripgrep` (`rg`) — поиск по проекту в Telescope
- `xclip` (X11) или `wl-clipboard` (Wayland) — общий буфер обмена
- `clang`, `clang++`, `clangd`, `clang-format` — C/C++, LSP и форматирование
- `python3` — запуск Python и сервер `pyright`
- `nodejs` — запуск JavaScript
- Nerd Font из каталога `fonts/` — иконки в строке статуса и в дереве файлов

Ubuntu / Debian:

```bash
sudo apt update
sudo apt install -y \
  git curl tar unzip gcc make ripgrep \
  clang clangd clang-format \
  python3 nodejs \
  xclip wl-clipboard
```

Neovim 0.13 в репозиториях дистрибутива может ещё не быть. Подойдёт [релиз с GitHub](https://github.com/neovim/neovim/releases) или текущий nightly.

## Шрифт

Иконки в lualine и nvim-tree берутся из Nerd Font. В комплекте два семейства:

- `LigaConsola Nerd Font` — Consolas с лигатурами
- `Consolas NF` — моноширинный Consolas Nerd Font

```bash
mkdir -p ~/.local/share/fonts
cp fonts/*.ttf ~/.local/share/fonts/
fc-cache -f
```

В эмуляторе терминала выставьте одно из этих семейств. Без Nerd Font иконки отобразятся как пустые квадраты, сам редактор при этом работает.

## Установка

Сохраните текущий конфиг, если он уже есть:

```bash
mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d)
mv ~/.local/share/nvim ~/.local/share/nvim.bak.$(date +%Y%m%d)
mv ~/.local/state/nvim ~/.local/state/nvim.bak.$(date +%Y%m%d)
```

Каталоги `share` и `state` хранят плагины, LSP и undo. Их можно не трогать, если нужно оставить уже поставленные пакеты.

```bash
git clone https://github.com/beneG/neovim_configs.git ~/neovim_configs
ln -s ~/neovim_configs/.config/nvim ~/.config/nvim
```

Первый запуск скачает lazy.nvim и плагины. Нужен доступ в интернет.

```bash
nvim
```

Дождитесь окончания установки. Дальше:

```text
:Lazy sync
:Mason
```

Mason ставит `clangd`, `pyright` и `lua_ls`. `clang-format` Mason не ставит: он должен быть в `PATH` (пакет `clang-format` выше).

Проверка:

```text
:checkhealth
:Mason
```

В `:Mason` у `clangd`, `pyright` и `lua-language-server` статус installed. `:checkhealth` не должен ругаться на `rg`, clipboard и компилятор.

## Обновление

```bash
cd ~/neovim_configs
git pull
```

Затем в Neovim: `:Lazy sync`.

## Клавиши

Пробел — leader.

| Клавиши | Действие |
| --- | --- |
| `<leader>fd` | Файлы в текущем каталоге |
| `<leader>fg` | Текст по проекту (`rg`) |
| `<leader>b` | Открытые буферы |
| `<leader>e` | Дерево файлов, курсор на текущем файле |
| `<leader>?` | Локальные привязки буфера |
| `gd` | Определение |
| `gr` | Вхождения |
| `<leader>rn` | Переименовать символ |
| `<leader>ca` | Code action |
| `<leader>ch` | Переключение `.h` / `.cpp` |
| `<leader>ct` | Иерархия типов clangd |
| `=` | Формат C/C++ через clang-format |
| `<F5>`, `<leader>rr` | Запустить текущий файл |
| `<Tab>` / `<S-Tab>` | Сниппет, затем пункт меню дополнения |
| `<CR>` | Подтвердить дополнение |
| `<Esc>` | Закрыть всплывающие окна |
| `ys` / `ds` / `cs` | Добавить, убрать, сменить surround |

`<F5>` пишет буфер на диск и запускает его:

| filetype | Команда |
| --- | --- |
| `c` | `clang -Wall -g` |
| `cpp` | `clang++ -std=c++23 -Wall -g` |
| `python` | `python3` |
| `javascript` | `node` |
| `sh`, `bash` | `bash` |
| `lua` | внутри Neovim (`:luafile`) |

Вывод открывается в терминале снизу. Пока программа работает, ввод идёт в неё. После завершения Neovim ждёт Enter и оставляет вывод на экране. `q` в normal-режиме закрывает это окно.
