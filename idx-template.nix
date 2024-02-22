{ pkgs, ... }: {
  packages = [ pkgs.go ];
  bootstrap = ''
    go env -w GOMODCACHE="$HOME/go/pkg/mod"
    go env
    go install golang.org/x/tools/cmd/gonew@latest
    gonew github.com/suzmue/gemini-template/go-gemini gemini-template "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
