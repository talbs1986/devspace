#PATH
export WS_PATH=~/devspace
export TOOLS_PATH=$WS_PATH/tools
export SCRIPTS_PATH=$WS_PATH/scripts
export SRC_PATH=$WS_PATH/src
export M2_HOME=$TOOLS_PATH/apache-maven-3.6.3
export MAVEN_HOME=$TOOLS_PATH/apache-maven-3.6.3
export KAFKA_HOME=$TOOLS_PATH/kafka_2.11-0.10.2.2
export GOPATH=$TOOLS_PATH/go
export GO111MODULE=on
# export GOPRIVATE=
PATH=$PATH:$SCRIPTS_PATH:$TOOLS_PATH/google-cloud-sdk/bin:$GOPATH/bin:$MAVEN_HOME/bin

#GIT COLORS
source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@mbp \w$(__git_ps1)]\$ '