# Based on mira zsh theme with asdf .tool-versions support

ASDF_LOCAL_FILE='./.tool-versions';

function get_lang_and_version() {
  if test -f "$ASDF_LOCAL_FILE"; then
    local content=$(head -n 1 $ASDF_LOCAL_FILE)
    local lang=$(echo $content | cut -d " " -f 1)
    local version=$(echo $content | cut -d " " -f 2)

    local lang_version="%{$fg[green]%}‹${lang}-${version}›%{$reset_color%}"
  else 
    local lang_version=""
  fi

  echo $lang_version
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

local git_branch='$(git_prompt_info)'

local lang_version_refound='$(get_lang_and_version)'

PROMPT="╭─${user_host} ${current_dir} ${lang_version_refound} ${git_branch}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"