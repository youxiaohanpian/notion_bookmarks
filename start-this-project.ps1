# 只安装依赖，不清理
Write-Host "开始安装依赖..."
pnpm install

Write-Host "`n依赖安装完成！尝试启动开发服务器..."
pnpm dev