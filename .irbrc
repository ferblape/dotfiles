# Hirb.enable
require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require 'irbtools'

# # Autocomplete
# require 'irb/completion'
#
# # Prompt behavior
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

# History
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "~/.irb_history"

# Disable readline. Useful for latin users
# IRB.conf[:USE_READLINE]=false

# Auto-indentation
IRB.conf[:AUTO_INDENT]=true

# copy a string to the clipboard
def pbcopy(string)
  `echo "#{string}" | pbcopy`
  string
end
