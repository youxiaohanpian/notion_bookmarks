# Notion 导航站


## 更新说明
🎉更新内容及更新方法见[保姆级教程](https://ezho.top/code/2025/02/21/notion-bookmarks-handbook)

<details>
  <summary> 2025/5/19</summary>
 - 2025/5/19 新增小组件功能，简易时钟/天气/圆形时钟/IP信息/热搜</br>
  <img width="800" alt="demo" src="https://github.com/user-attachments/assets/d81be672-06b9-4df9-b1ec-a80d406284c0" />
  <img width="800" alt="demo" src="https://github.com/user-attachments/assets/31266996-f917-4e6e-8f04-1f6743c9bf32" />
</details>

<details>
  <summary> 2025/3/7</summary>
 - 2025/3/7 新增主题配置，新增赛博朋克主题 </br>
  <img width="800" alt="demo" src="https://github.com/user-attachments/assets/c94456fc-fc4f-4d10-bd64-1a0df53af1ba" />
</details>

## 项目预览
> 🔗 [在线演示](https://portal.ezho.top/)
![项目预览](https://github.com/user-attachments/assets/1d864d20-44b3-4678-b649-6ba96821f1c4)



## 项目简介
这是一个使用 Notion 作为数据库后端的个人导航网站项目。通过 Notion 数据库管理书签和导航链接，并以清晰现代的网页界面呈现。

### 主要特性
- 使用 Notion 作为数据库，无需部署数据库
- 清晰现代的网页界面
- 支持多级分类导航
- 响应式设计，支持桌面和移动端
- 支持多主题切换（简约主题、赛博朋克主题）
- 一键部署到 Vercel

## 快速开始
[保姆级教程](https://ezho.top/code/2025/02/21/notion-bookmarks-handbook)


## 安装问题记录
Node 环境这块确实烦人，尤其是跨平台、包版本不兼容的坑。
在原作者的基础上，简化了安装方式，让我们一起来拥有属于自己的导航站

## 清理环境和执行
```
.\install-deps.ps1
```
## 下次本地运行项目
```
.\start-this-project.ps1
```
---

## 🧹 首先，把环境**干净重装**一遍（推荐）

你可以按下面顺序操作，保证本地干净且装得上：

### ✅ 1. **删除旧依赖和缓存**

```powershell
Remove-Item -Recurse -Force .\node_modules
Remove-Item -Recurse -Force .\pnpm-lock.yaml
```

⚠️ 如果还没用 `pnpm`，也可以先卸载之前可能的全局冲突：

```bash
npm uninstall -g pnpm
```

---

### ✅ 2. **重新安装 `pnpm`（官方推荐）**

```bash
npm install -g pnpm
```

确认是否安装成功：

```bash
pnpm -v
```

---

### ✅ 3. **重新安装依赖**

```bash
pnpm install
```




## ⚙️ 推荐使用的 Node 版本

根据 Notion API 和 Vercel 的兼容情况，建议你用 **Node.js 18.x LTS**。

你可以用 [nvm](https://github.com/coreybutler/nvm-windows)（Windows）切换版本：

```bash
nvm install 18
nvm use 18
```


## 字段整理：

- 链接数据库字段（getLinks）：
    - Name（标题，Title 类型）
    - desc（描述，RichText 类型）
    - URL（网址，URL 类型）
    - category1（一级分类，Select 类型）
    - category2（二级分类，Select 类型）
    - iconfile（图标文件，Files 类型）
    - iconlink（图标链接，URL 类型）
    - Tags（标签，Multi-select 类型）
    - Created（创建时间，Created Time 类型）
- 分类数据库字段（getCategories）：
    - Name（标题，Title 类型）
    - IconName（图标名，RichText 类型）
    - Order（排序，Number 类型）
    - Enabled（启用，Checkbox 类型）
