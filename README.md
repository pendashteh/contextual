# `contextual`

Brings context to your shell windows (and tmux panes).

When you are working on a project in terminal, imagine if you could capture the state of terminal in that moment, such as the history of the commands you ran and especially the directory you're in. Unfortunately, shells comes with only one state.

Contextual changes this.

With `contextual` installed, you will be asked at the beginning of a terminal session for the context. This will preserve the history and the present working directory for next time you open your shell with that context.

```bash
context name? [default: main]

```
let's say we enter "preso" for the work we do on our presentation. The shell now will indicate the context:
```bash
[preso] ~ $
[preso] ~ $ cd ~/work/presentation
[preso] ~/work/presentation $
```

Now, next time you open terminal window (or a new pane in tmux), if you enter `preso` for context, you will be taken directly to the last directory you were, and the history of the commands you had run in that context:
```bash
context name? [default: main] preso

[preso] ~/work/presentation $
```
## Requirements
`contextual` utilises **Toppings** to inject itself in `bashrc`. Toppings come with `potato`:
https://github.com/pendashteh/potato

