{{/*
Expand the name of the chart.
*/}}
{{- define "hcloud-cloud-controller-manager.name" -}}
aws-cloud-controller-manager
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hcloud-cloud-controller-manager.fullname" -}}
hcloud-cloud-controller-manager
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hcloud-cloud-controller-manager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "hcloud-cloud-controller-manager.labels" -}}
helm.sh/chart: {{ include "hcloud-cloud-controller-manager.chart" . }}
{{ include "hcloud-cloud-controller-manager.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.isClusterService }}
kubernetes.io/cluster-service: "true"
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hcloud-cloud-controller-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hcloud-cloud-controller-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Values.isClusterService }}
k8s-app: {{ include "hcloud-cloud-controller-manager.name" . }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "hcloud-cloud-controller-manager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "hcloud-cloud-controller-manager.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
