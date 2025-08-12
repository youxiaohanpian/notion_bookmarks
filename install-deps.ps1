# 定义项目路径（确保与你的实际路径一致）
$projectPath = "D:\notion_bookmarks"

# 切换到项目目录
Set-Location $projectPath

# 清理旧依赖和锁文件
try {
    Write-Host "正在删除 node_modules 目录..."
    if (Test-Path "node_modules") {
        Remove-Item "node_modules" -Recurse -Force -ErrorAction Stop
    }

    Write-Host "正在删除 pnpm-lock.yaml 文件..."
    if (Test-Path "pnpm-lock.yaml") {
        Remove-Item "pnpm-lock.yaml" -Force -ErrorAction Stop
    }
}
catch {
    Write-Error "清理文件时出错: $_"
    exit 1
}

# 配置 pnpm 禁用符号链接（避免权限问题）
try {
    Write-Host "配置 pnpm 以兼容模式运行..."
    $npmrcPath = Join-Path $projectPath ".npmrc"
    
    # 添加或更新配置（禁用符号链接）
    if (Test-Path $npmrcPath) {
        # 先移除已有配置（如果存在）
        (Get-Content $npmrcPath) | Where-Object { $_ -notmatch "node-linker=hoisted" } | Set-Content $npmrcPath
    }
    Add-Content -Path $npmrcPath -Value "node-linker=hoisted" -Force
}
catch {
    Write-Error "配置 .npmrc 时出错: $_"
    exit 1
}

# 重新安装依赖
try {
    Write-Host "开始安装依赖..."
    pnpm install --force
    if ($LASTEXITCODE -ne 0) {
        throw "pnpm install 执行失败"
    }
}
catch {
    Write-Error "安装依赖时出错: $_"
    exit 1
}

Write-Host "`n依赖安装完成！尝试启动开发服务器..."
pnpm dev