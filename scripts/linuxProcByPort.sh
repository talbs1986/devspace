lsof -nP -iTCP:$1 | grep LISTEN
