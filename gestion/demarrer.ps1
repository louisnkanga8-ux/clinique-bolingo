# Ouvre la page HTML locale. Aucun serveur ni PHP requis.
$ErrorActionPreference = 'Stop'
$gestionPage = Join-Path $PSScriptRoot 'html\index.html'
if (-not (Test-Path -LiteralPath $gestionPage -PathType Leaf)) {
  throw 'La page gestion/html/index.html est introuvable.'
}
Invoke-Item -LiteralPath $gestionPage
