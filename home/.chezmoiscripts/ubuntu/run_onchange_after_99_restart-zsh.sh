#!/usr/bin/env bash
{{- if not .interactive -}}
Z4H_BOOTSTRAPPING=1 exec zsh && exit 0
{{- else -}}
Z4H_BOOTSTRAPPING=1 exec zsh
{{- end -}}