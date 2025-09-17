# ==============================
# Script PowerShell: Subir src, bin y releases a GitHub
# ==============================
$githubUser = "sdorian07"
$repoName = "Lenguajes y Automatas 2"
https://github.com/sdorian07/Lenguajes-y-Automatas-2.git


# Ruta actual (donde están src, bin, releases)
$projectPath = Get-Location

Write-Host "Carpeta actual: $projectPath"

# Inicializar repositorio si no existe
if (!(Test-Path "$projectPath\.git")) {
    git init
    Write-Host "Repositorio Git inicializado"
}

#  Agregar solo las carpetas necesarias
git add .


# Commit inicial
git commit -m "Commit inicial: src, bin y releases"

#  Conectar con GitHub
git remote remove origin 2>$null
git remote add origin $githubUrl

#  Subir a GitHub
git push -u origin main

Write-Host " Proyecto subido correctamente a $githubUrl"
