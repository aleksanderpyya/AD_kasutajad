# Küsime kasutajalt ees- ja perenime
$eesnimi = Read-Host "Sisesta kasutaja eesnimi"
$perenimi = Read-Host "Sisesta kasutaja perenimi"

# Koostame kasutaja täisnime
$kasutajaNimi = "$eesnimi $perenimi"

# Otsime kasutajat Acitve Directoryst
$kasutaja = Get-ADUser -Filter { Displayname -eq $kasutajaNimi }

#Kontrollime, kas kasutaja leiti
if ($kasutaja) { write '$kasutaja leitud'}
    # Kui kasutaja leiti, küsime kasutajalt kinnitust kustutamiseks
    $kinnitus = Read-Host "Kas olete kindel, et soovite kasutaja '$kasutajaNimi' kustutada? (Y/N)"

    if ($kinnitus -eq 'Y' -or $kinnitus -eq 'y') {
        # Kustutame kasutaja
        Remove-ADUser -Identity $kasutaja -Confirm:$false
        Write-Host "Kasutaja '$kasutajaNimi' on edukalt kustutatud."
    } 
    else {
        Write-Host "Kasutaja '$kasutajaNimi' kustutamine tühistati."
    }
else {
    # Kui kasutajat ei leitud, väljastame vastava teate
    Write-Host "Kasutajat '$kasutajaNimi' ei leitud."
}