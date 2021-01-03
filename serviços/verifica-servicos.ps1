function Loga-Resultado {

    param (
        $servico,
        $estado,
	$mensagem
    )

    write-host ic=$env:computername evento="svcstate" componente=$servico estado=$estado msg=$mensagem
}

# MAIN
# Lê a relação do nome de serviços a testar de servicos.txt (Get-Content),
# obtem os atributos do serviço  (Get-Service),
# para cada objeto de serviço testa se está executando ou não é loga.
Get-Content .\servicos.txt | Get-Service | foreach {
    if ($_.Status -eq "Running") {
        $estado="ok"
        $msg="Servico executando"
    }
    else {
        $estado="critical"
        $msg="Servico parado"
    }
    Loga-Resultado $_.Name $estado $msg
}
