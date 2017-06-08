function __my_ruby_version {
  if [ -f .ruby-version ]; then
    echo `rbenv local`
  fi
}

# This is an alternative approach. Single line minimalist in git repo.
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  function prompt_callback {
    local PS1="$(gp_truncate_pwd)"
    local RubyVersion=`__my_ruby_version`
    gp_set_window_title "$PS1"
    echo " # "`__my_ruby_version`
  }

  PathShort="\W";

  GIT_PROMPT_PREFIX="["
  GIT_PROMPT_SUFFIX="]"
  GIT_PROMPT_SEPARATOR=" "
  GIT_PROMPT_STAGED="${Red}●${ResetColor}"
  GIT_PROMPT_CONFLICTS="${Red}✖${ResetColor}"
  GIT_PROMPT_CHANGED="${Blue}✚${ResetColor}"
  GIT_PROMPT_UNTRACKED="${Cyan}…${ResetColor}"
  GIT_PROMPT_STASHED="${BoldBlue}⚑${ResetColor}"
  GIT_PROMPT_CLEAN="${BoldGreen}✔${ResetColor}"

  GIT_PROMPT_COMMAND_OK="${Green}✔"
  GIT_PROMPT_COMMAND_FAIL="${Red}✘"

  GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${White}${ResetColor} ${Cyan}${PathShort}${ResetColor}"
  GIT_PROMPT_END_USER="${ResetColor} $ "
  GIT_PROMPT_END_ROOT="${BoldRed} # "

}

reload_git_prompt_colors "Custom"

