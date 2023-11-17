{{- if not .interactive -}}
#!/usr/bin/env bash

Z4H_BOOTSTRAPPING=1 exec zsh && exit 0
{{- end -}}