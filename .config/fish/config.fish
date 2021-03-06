# Env vars
set -x GOPATH $HOME/go
# set -x PYENV_ROOT $HOME/.anyenv/envs/pyenv
set -x PATH $GOPATH/bin $PATH
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x PIPENV_VENV_IN_PROJECT true

# decors/fish-ghq
set -U GHQ_SELECTOR peco

# Color
set -x LSCOLORS gxfxcxdxbxegedabagacad

# Appearance
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x theme_title_use_abbreviated_path yes
set -x theme_display_user no
set -x theme_date_format "+%m/%d %H:%M(%a)"
set -x theme_display_virtualenv yes
set -x theme_powerline_fonts yes
set -x theme_display_git_ahead_verbose yes
set -x theme_git_worktree_support yes
set -g theme_display_git_master_branch yes
set -x theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_project_dir_length 1
set -g theme_display_cmd_duration no
set -g theme_display_k8s_context no

if type nvim > /dev/null 2>&1
    # alias
    balias vim 'nvim'
end

if test -d $HOME/.anyenv
    set -x PATH $HOME/.anyenv/bin $PATH
    . (anyenv init - fish | psub)
end

if test -e /proc/version; and grep -q Microsoft /proc/version
    umask 022
    set -x DISPLAY localhost:0.0
end

if test -d /usr/local/opt/mysql-client/bin
    set -x PATH /usr/local/opt/mysql-client/bin $PATH
end 

if type pyenv > /dev/null 2>&1
    if pyenv global | grep miniconda > /dev/null 2>&1 or; pyenv local | grep miniconda > /dev/null 2>&1
        source (conda info --root)/etc/fish/conf.d/conda.fish
    end
end
