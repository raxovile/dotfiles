# Pfad zum Dotfiles-Verzeichnis
$dotfilesDir = "$HOME\dotfiles"           # Anpassen, falls nötig

# Neovim-Konfigurationspfade
$nvimSourceDir = "$dotfilesDir\nvim"
$nvimTargetDir = "$HOME\AppData\Local\nvim"  # Standardpfad für Neovim in Windows

# Git-Konfigurationspfade
$gitConfigSource = "$dotfilesDir\git\.gitconfig"
$gitConfigTarget = "$HOME\.gitconfig"

# Backup-Ordner festlegen
$backupDir = "$HOME\dotfiles_backup"

# Backup-Ordner erstellen, falls er noch nicht existiert
if (!(Test-Path -Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir | Out-Null
}

# Funktion zur Überprüfung, ob ein Symbolischer Link existiert
function Test-SymbolicLink {
    param ($path)
    return (Get-Item -Path $path).Attributes -band [System.IO.FileAttributes]::ReparsePoint
}

# ----------------------
# Neovim-Symbolischen Link erstellen
# ----------------------
if ((Test-Path -Path $nvimTargetDir) -and (Test-SymbolicLink $nvimTargetDir)) {
    Write-Host "Symbolischer Link für Neovim existiert bereits. Überspringe diesen Schritt."
} else {
    if (Test-Path -Path $nvimTargetDir) {
        Write-Host "Sichere existierende Neovim-Konfiguration von $nvimTargetDir nach $backupDir..."
        Move-Item -Path $nvimTargetDir -Destination $backupDir -Force
    }

    Write-Host "Erstelle symbolischen Link für Neovim von $nvimSourceDir → $nvimTargetDir..."
    New-Item -ItemType SymbolicLink -Path $nvimTargetDir -Target $nvimSourceDir | Out-Null
}

# ----------------------
# Git-Symbolischen Link erstellen
# ----------------------
if ((Test-Path -Path $gitConfigTarget) -and (Test-SymbolicLink $gitConfigTarget)) {
    Write-Host "Symbolischer Link für Git-Konfiguration existiert bereits. Überspringe diesen Schritt."
} else {
    if (Test-Path -Path $gitConfigTarget) {
        Write-Host "Sichere existierende Git-Konfiguration von $gitConfigTarget nach $backupDir..."
        Move-Item -Path $gitConfigTarget -Destination $backupDir -Force
    }

    Write-Host "Erstelle symbolischen Link für Git-Config von $gitConfigSource → $gitConfigTarget..."
    New-Item -ItemType SymbolicLink -Path $gitConfigTarget -Target $gitConfigSource | Out-Null
}

Write-Host "Symbolische Links erfolgreich überprüft oder erstellt!"
