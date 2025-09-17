# build.ps1
# Script para compilar, mover y ejecutar programas en C

# Carpetas
$srcFolder = "src"
$binFolder = "bin"

# Crear carpeta bin si no existe
if (!(Test-Path -Path $binFolder)) {
    New-Item -ItemType Directory -Path $binFolder | Out-Null
}

# Buscar todos los archivos .c en src
$cFiles = Get-ChildItem -Path $srcFolder -Filter *.c

foreach ($file in $cFiles) {
    $exeName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) + ".exe"
    $exePath = Join-Path $binFolder $exeName
    
    Write-Host "Compilando $($file.Name) -> $exeName"
    
    # Compilar con gcc
    gcc $file.FullName -o $exePath
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Compilado correctamente: $exePath"
        
        Write-Host "Ejecutando $exeName..."
        & $exePath
        Write-Host "----------------------------------`n"
    } else {
        Write-Host "Error al compilar $($file.Name)"
    }
}


