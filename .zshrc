#PATH
export WS_PATH=~/devspace
export TOOLS_PATH=$WS_PATH/tools
export SCRIPTS_PATH=$WS_PATH/scripts
export DOM_SCRIPTS_PATH=$SCRIPTS_PATH/dom_specific
export SRC_PATH=$WS_PATH/src
export M2_HOME=$TOOLS_PATH/apache-maven-3.6.3
export MAVEN_HOME=$TOOLS_PATH/apache-maven-3.6.3
export KAFKA_HOME=$TOOLS_PATH/kafka_2.11-0.10.2.2
export GOPATH=~/go
export GO111MODULE=on
# export GOPRIVATE=
PATH=$PATH:$SCRIPTS_PATH:$DOM_SCRIPTS_PATH:$TOOLS_PATH/google-cloud-sdk/bin:$GOPATH/bin:$MAVEN_HOME/bin

#GIT Completion and branch name
source $TOOLS_PATH/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
zstyle ':completion:*:*:git:*' script $TOOLS_PATH/git/.git-completion.bash
fpath=($TOOLS_PATH/git $fpath)
autoload -Uz compinit && compinit -u
