# 1. Make sure the Microsoft App Installer is installed:
#    https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1
# 2. Edit the list of apps to install.
# 3. Run this script as administrator.

Write-Output "Installing Apps"
$apps = @(
    # Windows Core Tools
    @{name = "Microsoft.dotnet" },
    @{name = "Microsoft.DotNet.SDK.6" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.PowerToys" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "Microsoft.WindowsTerminal" },

    # Misc Utils
    @{name = "7zip.7zip" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "GnuPG.Gpg4win" },
    @{name = "Greenshot.Greenshot" },    
    @{name = "NickeManarin.ScreenToGif" },
    @{name = "Notepad++.Notepad++" },
    @{name = "VideoLAN.VLC" },
    @{name = "WinDirStat.WinDirStat" },
    @{name = "StefansTools.grepWin" },
    @{name = "Zoom.Zoom" },
    @{name = "Microsoft.Teams" },
    @{name = "Dropbox.Dropbox" },
    @{name = "Microsoft.OneDrive" },
    @{name = "Box.Box" },
    
    # Network/Internet Tools
    @{name = "PuTTY.PuTTY" },
    @{name = "mRemoteNG.mRemoteNG" },
    # @{name = "Devolutions.RemoteDesktopManagerFree" },
    @{name = "TimKosse.FileZilla.Client" },
    
    # Browsers
    @{name = "Google.Chrome" },
    @{name = "Mozilla.Firefox.DeveloperEdition" },
    @{name = "Mozilla.Firefox" },
    @{name = "Brave.Brave" },

    # Office
    @{name = "TheDocumentFoundation.LibreOffice" },
    @{name = "TheDocumentFoundation.LibreOffice.HelpPack" },
    @{name = "Inkscape.Inkscape" },
    @{name = "JohnMacFarlane.Pandoc" },
    @{name = "GIMP.GIMP" },
    @{name = "OpenShot.OpenShot" },
    @{name = "Sigil-Ebook.Sigil" },

    # Dev Tools
    @{name = "Git.Git" },
    @{name = "Axosoft.GitKraken" },
    @{name = "TortoiseGit.TortoiseGit" },
    @{name = "KDE.KDiff3" },
    @{name = "Microsoft.VisualStudio.2022.Community" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "JetBrains.Toolbox" },
    @{name = "OpenJS.NodeJS.LTS" },
    @(name = "AdoptOpenJDK.OpenJDK.16" },
    @{name = "LINQPad.LINQPad.5" },
    @{name = "LINQPad.LINQPad.6" },
    # @{name = "Microsoft.AzureDataStudio" }, # Included with SSMS
    @{name = "Microsoft.SQLServerManagementStudio" }, # Includes AzureDataStudio
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
    }
    else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}
