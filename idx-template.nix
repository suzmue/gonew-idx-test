{ pkgs, ... }: {
  packages = [ pkgs.go ];
  bootstrap = ''
    env
    go env
    go env -w GOMODCACHE="$PWD/go/pkg/mod"
    go install golang.org/x/tools/cmd/gonew@latest
    gonew github.com/suzmue/gemini-template/go-gemini gemini-template "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
