autoload -Uz compinit
compinit

zstyle ":completion:*:default" menu select=1

zstyle ":completion:*" insert-tab false
zstyle ":completion:*" keep-prefix
zstyle ":completion:*" matcher-list "m:{[:lower:]}={[:upper:]}" "+m:{[:upper:]}={[:lower:]}"

zstyle ":completion::complete:*" use-cache true
