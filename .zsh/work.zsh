export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)
export JAVA_18_HOME=$(/usr/libexec/java_home -v18)
export JAVA_19_HOME=$(/usr/libexec/java_home -v19)
export JAVA_20_HOME=$(/usr/libexec/java_home -v20)
export JAVA_21_HOME=$(/usr/libexec/java_home -v21)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'
alias java18='export JAVA_HOME=$JAVA_18_HOME'
alias java19='export JAVA_HOME=$JAVA_19_HOME'
alias java20='export JAVA_HOME=$JAVA_20_HOME'
alias java21='export JAVA_HOME=$JAVA_21_HOME'

java17

export PATH=~/fvm/versions/3.24.0/bin:$PATH

export PATH="$PATH":"$HOME/.pub-cache/bin"

eval "$(rbenv init -)"

export PATH=$PATH:$(go env GOPATH)/binexport PATH=$PATH:$HOME/.maestro/bin
