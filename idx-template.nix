{ pkgs, ... }: {
  packages = [ pkgs.go ];
  bootstrap = ''
    export GOPATH=$(mktemp -d)
    GOMODCACHE=$(mktemp -d) GOCACHE=$(mktemp -d) go install golang.org/x/tools/cmd/gonew@latest
    $GOPATH/bin/gonew github.com/suzmue/gemini-template/go-gemini example.com/gemini-template "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
