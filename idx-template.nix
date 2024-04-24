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
    export GOPATH=$(mktemp -d)
    GOMODCACHE=$(mktemp -d) GOCACHE=$(mktemp -d) go install golang.org/x/tools/cmd/gonew@latest
    echo "gonew:"
    $GOPATH/bin/gonew github.com/suzmue/gemini-template/go-gemini example.com/gemini-template "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
