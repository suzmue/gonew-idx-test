{ pkgs, ... }: {
  packages = [ pkgs.go ];
  bootstrap = ''
    echo "Env:"
    env
    echo "Go Env:"
    go env
    whoami
    echo "Mkdir:"
    mkdir $WS_NAME/go
    echo "Go Install:"
    GOPATH='$WS_NAME/go' go install golang.org/x/tools/cmd/gonew@latest
    echo "gonew:\n"
    GOPATH='$WS_NAME/go' gonew github.com/suzmue/gemini-template/go-gemini gemini-template "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
