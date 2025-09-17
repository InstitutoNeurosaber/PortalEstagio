# Script para testar a API da NeuroSaber/Cademi diretamente

$apiKey = "f87fe7f3-a1ba-4737-b236-ae2907091bc2"
$baseUrl = "https://painel.neurosaberead.com.br"

Write-Host "=== Teste de Conexão com API NeuroSaber/Cademi ===" -ForegroundColor Cyan
Write-Host ""

# Função para testar endpoint
function Test-Endpoint {
    param(
        [string]$endpoint,
        [string]$authType
    )
    
    Write-Host "Testando: $endpoint" -ForegroundColor Yellow
    Write-Host "Método de autenticação: $authType" -ForegroundColor Gray
    
    $headers = @{
        "Content-Type" = "application/json"
        "Accept" = "application/json"
    }
    
    # Adicionar autenticação baseada no tipo
    switch ($authType) {
        "Bearer" {
            $headers["Authorization"] = "Bearer $apiKey"
        }
        "ApiKey" {
            $headers["X-API-Key"] = $apiKey
        }
    }
    
    try {
        $response = Invoke-RestMethod -Uri "$baseUrl$endpoint" -Method GET -Headers $headers -ErrorAction Stop
        Write-Host "✅ SUCESSO!" -ForegroundColor Green
        Write-Host "Resposta:" -ForegroundColor Gray
        $response | ConvertTo-Json -Depth 3 | Write-Host
        return $true
    }
    catch {
        Write-Host "❌ ERRO: $($_.Exception.Message)" -ForegroundColor Red
        if ($_.Exception.Response) {
            $statusCode = $_.Exception.Response.StatusCode.value__
            Write-Host "Status Code: $statusCode" -ForegroundColor Red
        }
        return $false
    }
    
    Write-Host ""
}

# Testar diferentes combinações
$endpoints = @(
    "/api/alunos",
    "/api/students", 
    "/api/v1/alunos",
    "/api/v1/students",
    "/alunos",
    "/students"
)

$authTypes = @("Bearer", "ApiKey")

$successCount = 0

foreach ($endpoint in $endpoints) {
    foreach ($authType in $authTypes) {
        if (Test-Endpoint -endpoint $endpoint -authType $authType) {
            $successCount++
            Write-Host "Este endpoint e método funcionaram!" -ForegroundColor Green
            Write-Host "Endpoint: $endpoint" -ForegroundColor Cyan
            Write-Host "Auth: $authType" -ForegroundColor Cyan
            break
        }
        Start-Sleep -Seconds 1  # Pequena pausa entre tentativas
    }
    Write-Host "---" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "=== Resumo ===" -ForegroundColor Cyan
Write-Host "Total de combinações testadas: $($endpoints.Count * $authTypes.Count)" -ForegroundColor Gray
Write-Host "Combinações bem-sucedidas: $successCount" -ForegroundColor $(if ($successCount -gt 0) { "Green" } else { "Red" })

# Se nenhuma funcionou, tentar descobrir o formato
if ($successCount -eq 0) {
    Write-Host ""
    Write-Host "=== Tentando descobrir formato da API ===" -ForegroundColor Yellow
    
    # Tentar acessar a raiz da API
    try {
        $rootResponse = Invoke-WebRequest -Uri "$baseUrl/api" -Method GET -Headers @{"Accept" = "application/json"}
        Write-Host "Resposta da raiz da API:" -ForegroundColor Gray
        Write-Host $rootResponse.Content
    }
    catch {
        Write-Host "Não foi possível acessar a raiz da API" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Script concluído!" -ForegroundColor Green
