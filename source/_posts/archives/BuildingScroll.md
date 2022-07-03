---
title: 建站宝典
description: Ubuntu, Laravel
keywords: Ubuntu, Laravel
top_img: /images/php/PhpCover.png
cover: /images/php/PhpCover.png
tags:
  - 1111
categories:
  - Golang
date: 2022-07-03 17:03:43
updated: 2022-07-03 17:03:43
swiper_index:
swiper_desc:
swiper_cover:
---

## 建站思路
* 采用`hexo`工具与`Butterfly`主题
* 参考[写作宝典](/archives/WritingScroll)本地编写文章
* 包含全局搜索等功能
* 上传至`github`平台
* 自动触发脚本部署至`OSS`

## 准备环境

### Node.js

> 本人采用`Ubuntu20.04`，因此仅以此为例编写文档。其他系统请自行搜索`Node.js & npm`环境部署方法。

* 添加源

```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
```

* 修改为国内镜像（清华大学）

```bash
BASH
sed -i "s/deb.nodesource.com\/node/mirrors.tuna.tsinghua.edu.cn\/nodesource\/deb/g" /etc/apt/sources.list.d/nodesource.list
```

* 更新源

```bash
apt update
```

* 安装

```bash
apt install nodejs npm
```

### 使用 npm 全局安装 Hexo

```bash
npm install -g hexo-cli
```

### 初始化 Hexo 项目

```bash
hexo init {{folder}}
```

```bash
cd {{folder}}
```

```bash
npm install
```

## 站点配置

### .gitignore

在`.gitignore`文件末尾添加编辑器的忽略文件，以`jetbrains`为例子

```bash
sed -i '$a .idea' .gitignore
```

### 站点及作者名称

```yaml  _config.yml
# Site
title: 罐罐头工厂
subtitle: 罐装仙人掌CuratorC
description: php, laravel, golang, C#, Unity, Vue
keywords: 博客, 罐罐头, 罐装仙人掌, 后台, 前端, C#, php, PHP, Golang, Go, golang, Unity, laravel, Laravel, Vue, Ubuntu, MySQL, mysql
author: 罐装仙人掌CuratorC
language: zh-CN
timezone: Asia/Shanghai
```

## 主题配置

### 安装主题与插件

```bash
npm install hexo-theme-butterfly hexo-renderer-pug hexo-renderer-stylus --save
```

### 应用主题

```bash
sed -i 's/landscape/butterfly/g' _config.yml
```

### 发布主题配置文件

```bash
cp node_modules/hexo-theme-butterfly/_config.yml _config.butterfly.yml
```

### 配置信息

> 在`_config.butterfly.yml`中找到并修改以下内容

#### 导航菜单

* 可参考我的导航栏进行配置

```yaml
menu:
  首页: / || fas fa-home
  文章: /archives/ || fas fa-archive
  服务器||fas fa-server:
    Ubunut: /categories/Ubuntu/
  数据库||fas fa-database:
    MySQL: /categories/MySQL/
  后台||fas fa-code:
    PHP: /categories/PHP/
    # Laravel: /categories/Laravel/
    Golang: /categories/Golang/
  前端||fas fa-window-restore:
    # Vue: /categories/Vue/
    Web: /categories/Web/
    # 客户端||fas fa-mug-hot:
    # C#: /categories/CS/
    # Unity: /categories/Unity/
  三方服务: /categories/ThreeParty || fas fa-dice-three
  项目||fas fa-umbrella-beach:
    ggt-coder: /categories/ggt-coder/
    sentry-white: /categories/sentry-white/
```

#### 代码块

```yaml
# 配色风格
highlight_theme: pale night
# 代码是否允许复制
highlight_copy: true
# 代码是否默认隐藏
highlight_shrink: false
# 代码是否自动换行
code_word_wrap: true
# 代码块高度超出折叠
highlight_height_limit: 200
```

#### 联系方式

```yaml
social:
  fas fa-envelope: mailto:mail@curatorc.com || Email
  fab fa-weixin: mailto:mail@curatorc.com || Wechat
  fas fa-mobile: mailto:mail@curatorc.com || Phone
```

#### 主页文章节选

```yaml
# 优先选择description，如果没有配置description，则显示自动节选的内容
index_post_content:
  method: 2
  length: 200
```

#### 顶图配置
```yaml
# Disable all banner image
disable_top_img: false

# The banner image of home page
index_img: /images/home_page_background.png

# If the banner of page not setting, it will show the top_img
default_top_img: /images/home_page_background.png

# The banner image of archive page
archive_img: /images/home_page_background.png

# If the banner of tag page not setting, it will show the top_img
# note: tag page, not tags page (子標籤頁面的 top_img)
tag_img: /images/home_page_background.png

# The banner image of tag page
# format:
#  - tag name: xxxxx
tag_per_img:

# If the banner of category page not setting, it will show the top_img
# note: category page, not categories page (子分類頁面的 top_img)
category_img: /images/home_page_background.png

# The banner image of category page
# format:
#  - category name: xxxxx
category_per_img:
  Ubunut: /images/ubuntu/ubuntu-top-image.png
  MySQL: /images/mysql/mysql-top-image.png
  PHP: /images/php/php-top-image.png
  Laravel: /images/laravel/laravel-top-image.png
  Golang: /images/golang/golang-top-image.png
  Vue: /images/vue/vue-top-image.png
  Web: /images/web/web-top-image.jpg
  ThreeParty: /images/three-party/three-party-top-image.jpg
#  C#: /client/cs/
#  Unity: /client/unity/
#  ggt-coder: /projects/ggt-coder/
#  ggt-sentry-white: /projects/ggt-sentry-white/

```

#### 默认封面

```yaml
cover:
  ...
  default_cover:
    - /images/default/cover1.png
    - /images/default/cover2.png
    - /images/default/cover3.png
```

#### 文章页相关配置
```yaml
post_meta:
  page:
    date_type: updated
    ...
  post:
    ...
    label: false
```

### 附加页面

#### 标签页

* 新建标签文件

```bash
hexo new page tags
```

* 打开文件`source/tags/index.md`，并将以下模板复制其中

```markdown
---
title: 标签
date: 2018-01-05 00:00:00
type: "tags"
---
```

#### 分类页

* 新建分类文件

```bash
hexo new page categories
```

* 打开文件`source/tags/index.md`，并将以下模板复制其中

```markdown
---
title: 分类
date: 2018-01-05 00:00:00
type: "categories"
---
```

#### 404页

打开主题配置文件，找到`error_404`并修改`enable`参数为`true`

```yaml  _config.butterfly.yml
error_404:
  enable: true
```

### 文章 Front-matter 模板

* 新建文件

```bash
touch scaffolds/butt.md
```

* 打开文件`scaffolds/butt.md`，并将以下模板复制其中

```markdown
---

[comment]: <> (标题)
title: {{ title }}

[comment]: <> (编写日期)
date: {{ date }}

[comment]: <> (更新日期)
updated: {{ date }}

[comment]: <> (置顶优先级)
sticky: 5

[comment]: <> (简述)
description: {{ description }}

[comment]: <> (SEO 关键字)
keywords: {{ keywords }}

[comment]: <> (顶图)
top_img: {{ top_img }}

[comment]: <> (封面)
cover: {{ cover }}

[comment]: <> (标签)
tags:
    - {{ tag }}

[comment]: <> (分类)
categories:
    - {{ category }}

[comment]: <> (文章展示优先级)
swiper_index:

[comment]: <> (文章展示优先级)
swiper_desc:

[comment]: <> (文章展示优先级)
swiper_cover:

---
```