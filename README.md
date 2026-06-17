# AlexChapman18's dotfiles

A small Bash/Git terminal setup focused on the features I actually use:

- Git-aware shell prompt that shows the current branch or short SHA.
- Prompt and Git output colouring.
- Case-insensitive shell completion.
- Bash/Git/SSH command completion.
- Smarter Up/Down history search based on the text already typed.
- Bootstrap installer for copying the dotfiles into `$HOME`.
- Homebrew setup for Bash, Bash completion, wget, tmux, Python, htop, Git, Git LFS, and fzf.
- Git and terminal aliases imported from `utility-scripts`.

## Installation

Review the files before installing. The bootstrap script copies these dotfiles
into your home directory and may overwrite existing files with the same names.

```bash
git clone https://github.com/AlexChapman18/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update an existing checkout:

```bash
cd dotfiles
source bootstrap.sh
```

To skip the confirmation prompt:

```bash
set -- -f
source bootstrap.sh
```

## Homebrew Packages

To install Homebrew if needed, update it, and install the package list, run:

```bash
./install-brew-and-packages.sh
```

The script updates Homebrew and installs:

- `bash`
- `bash-completion`
- `wget`
- `tmux`
- `python`
- `htop`
- `git`
- `git-lfs`
- `fzf`

## Aliases

Terminal:

- `c` clears the terminal.

Git:

- `g` runs `git`.
- `gl` shows the latest commit in a coloured one-line format.
- `gll` shows the Git log in the same coloured one-line format.
- `gs` runs `git status`.
- `gcan` amends the latest commit without editing its message.
- `gcm` commits with a message.
- `gcrm` commits reusing `ORIG_HEAD`'s message.
- `gad` stages all changes.
- `gp` runs `git push`.
- `gf` uses `fzf` to create a fixup commit.
- `gsa` uses `fzf` to apply a stash.
- `gsd` uses `fzf` to drop a stash.
- `gspm` creates a stash with a message.
- `gsp` pops the latest stash.
- `gsl` lists stashes with colour.
- `gss` shows a stash.
- `grf` uses `fzf` to remove selected files from the latest commit.

The `fzf`-based aliases fall back to explanatory messages when `fzf` is not
installed.

## Prompt

The prompt shows:

```text
user at host in /path/to/worktree on branch
$
```

When inside a Git repository, the prompt appends status markers:

- `+` staged changes.
- `!` unstaged changes.
- `$` stashed changes.

If `HEAD` is detached, the prompt shows the short commit SHA.

## Authors

- Alex Chapman / `AlexChapman18`
- [Hugues Kamba](https://github.com/hugueskamba), whose fork this repository is based on

Original upstream author:

| [![twitter/mathias](http://gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=70)](http://twitter.com/mathias "Follow @mathias on Twitter") |
|---|
| [Mathias Bynens](https://mathiasbynens.be/) |

## Thanks to…

* @ptb and [his _macOS Setup_ repository](https://github.com/ptb/mac-setup)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [Gianni Chiappetta](https://butt.zone/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://osxnotes.net/defaults.html)
* [Matijs Brinkhuis](https://matijs.brinkhu.is/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Sindre Sorhus](https://sindresorhus.com/)
* [Tom Ryder](https://sanctum.geek.nz/) and his [dotfiles repository](https://sanctum.geek.nz/cgit/dotfiles.git/about)
* [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [macOS-Defaults project](https://github.com/kevinSuttle/macOS-Defaults), which aims to provide better documentation for [`~/.macos`](https://mths.be/macos)
* [Haralan Dobrev](https://hkdobrev.com/)
* Anyone who [contributed a patch](https://github.com/mathiasbynens/dotfiles/contributors) or [made a helpful suggestion](https://github.com/mathiasbynens/dotfiles/issues)
