{ pkgs, ... }: {
  packages = [ pkgs.go ];
  bootstrap = ''
    echo "Env:\n"
    env
    echo "Go Env:\n"
    go env
    echo "Go Install:\n"
    go install golang.org/x/tools/cmd/gonew@latest
    echo "gonew:\n"
    gonew github.com/suzmue/gemini-template/go-gemini gemini-template "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
