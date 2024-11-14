# Pfad zum Dotfiles-Verzeichnis
$dotfilesDir = "$HOME\dotfiles"           # Anpassen, falls nötig

# Neovim-Konfigurationspfade
$nvimSourceDir = "$dotfilesDir\nvim"
$nvimTargetDir = "$HOME\AppData\Local\nvim"  # Standardpfad für Neovim in Windows

# Git-Konfigurationspfade
# #toDo - how to sperate identical and different stuff in gitconfig
# $gitConfigSource = "$dotfilesDir\git\.gitconfig"
# $gitConfigTarget = "$HOME\.gitconfig"

# vim-configurationspath
$vimConfigSource = "$dotfilesDir\vim\_vimrc"
$vimConfigTarget = "$HOME\_vimrc"

# windows terminal configurationspath
$wtConfigSource = "$dotfilesDir\windows_terminal\settings.json"
$wtConfigTarget = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# $raxovile/dotfiles
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
# if ((Test-Path -Path $gitConfigTarget) -and (Test-SymbolicLink $gitConfigTarget)) {
# Write-Host "Symbolischer Link für Git-Konfiguration existiert bereits. Überspringe diesen Schritt."
# } else {
# if (Test-Path -Path $gitConfigTarget) {
# Write-Host "Sichere existierende Git-Konfiguration von $gitConfigTarget nach $backupDir..."
# Move-Item -Path $gitConfigTarget -Destination $backupDir -Force
# }
# 
# Write-Host "Erstelle symbolischen Link für Git-Config von $gitConfigSource → $gitConfigTarget..."
# New-Item -ItemType SymbolicLink -Path $gitConfigTarget -Target $gitConfigSource | Out-Null
# }

# ----------------------
# vim link erstellen
# ----------------------
if ((Test-Path -Path $vimConfigTarget) -and (Test-SymbolicLink $vimConfigTarget)) {
    Write-Host "Symbolischer Link für vim configuration existiert bereits. Überspringe diesen Schritt."
} else {
    if (Test-Path -Path $vimConfigTarget) {
        Write-Host "Sichere existierende vim configuration von $vimConfigTarget nach $backupDir..."
        Move-Item -Path $vimConfigTarget -Destination $backupDir -Force
    }

    Write-Host "Erstelle symbolischen Link für vim configuration von $vimConfigSource → $vimConfigTarget..."
    New-Item -ItemType SymbolicLink -Path $vimConfigTarget -Target $vimConfigSource | Out-Null
}

# ----------------------
# Windows Terminal-Symbolischen Link erstellen
# ----------------------
if ((Test-Path -Path $wtConfigTarget) -and (Test-SymbolicLink $wtConfigTarget)) {
    Write-Host "Symbolischer Link für Windows Terminal existiert bereits. Überspringe diesen Schritt."
} else {
    if (Test-Path -Path $wtConfigTarget) {
        Write-Host "Sichere existierende Windows Terminal-Konfiguration von $wtConfigTarget nach $backupDir..."
        Move-Item -Path $wtConfigTarget -Destination $backupDir -Force
    }

    Write-Host "Erstelle symbolischen Link für Windows Terminal von $wtConfigSource → $wtConfigTarget..."
    New-Item -ItemType SymbolicLink -Path $wtConfigTarget -Target $wtConfigSource | Out-Null
}

Write-Host "Symbolische Links erfolgreich überprüft oder erstellt!"
