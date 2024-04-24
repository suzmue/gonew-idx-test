{ pkgs, ... }: {
  packages = [ pkgs.go ];
  bootstrap = ''
    echo "Env:"
    env
    echo "Go Env:"
    go env
    whoami
    echo "Mkdir:"
    mkdir gopath
    echo "Go Install:"
    GOPATH='/gopath' go install golang.org/x/tools/cmd/gonew@latest
    echo "gonew:\n"
    gonew github.com/suzmue/gemini-template/go-gemini gemini-template "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
