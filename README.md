# docker-action-ghcr-publish


### 操作说明（组织）

1. 创建一个 GitHub PAT
 - 前往 https://github.com/settings/tokens

- 创建一个 Token（classic 或 fine-grained）

- 权限包括：

    - write:packages

    - read:packages

    - repo

2. 添加到仓库 Secrets

- 进入仓库 → Settings → Secrets and variables → Actions

- 添加新 secret，名称叫：GHCR_PAT

3. 修改登录用户名
   把 workflow 中的：
    ````
    username: your-github-username
    
    ````
改成你自己的 GitHub 用户名（不是组织名）

### ✅ 构建触发方式
- git push 到 main 分支

- git push 任意以 v 开头的 tag，例如：v1.0.0

- 手动点击 Actions → Run workflow，可输入任意自定义 tag

#### tips
1. 确保你的仓库已经设置了 GitHub Packages 的访问权限。
2. 确保你的仓库已经设置了 GitHub Actions 的权限。
3. 配置模版

```azure
./workflows/docker-publish.yml: 推送image 到个人仓库的模版
./workflows/docker-ghcr.yml: 推送image 到组织仓库的模版

```
