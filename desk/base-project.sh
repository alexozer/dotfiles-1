PROJECT_PATH=$1


HISTFILE=$HOME/.cache/zsh-history-desk-${DESK_NAME}  # Use a per project history file

alias home="cd ${PROJECT_PATH}"                      # Go in project home
alias dev-home="cd ${PROJECT_PATH}"                  # Go in project home
alias dev-files="o ${PROJECT_PATH}"                  # Browse development files

cd "$PROJECT_PATH"
