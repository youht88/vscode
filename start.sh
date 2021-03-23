nohup /opt/vscode/code-server --port $PORT --host 0.0.0.0 --auth password > run.log 2>&1 &
echo $! > save_pid.txt
