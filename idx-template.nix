{ pkgs, ... }: {
  packages = [ pkgs.go ];
  bootstrap = ''
    echo "env:"
    env
    echo "Go Env:"
    go env

    echo "mkdir:"
    pwd
    mkdir "go"
    chmod -R +w "go"
    echo "Go Install:"
    GOPATH='$(pwd)/go' go install golang.org/x/tools/cmd/gonew@latest
    echo "gonew:\n"
    GOPATH='$(pwd)/go' gonew github.com/suzmue/gemini-template/go-gemini gemini-template "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
