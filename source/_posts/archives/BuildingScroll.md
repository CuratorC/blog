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

[//]: # (* 修改为国内镜像（清华大学）)

[//]: # ()
[//]: # (```bash)

[//]: # (sed -i "s/deb.nodesource.com\/node/mirrors.tuna.tsinghua.edu.cn\/nodesource\/deb/g" /etc/apt/sources.list.d/nodesource.list)

[//]: # (```)

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

#### 文章过期提醒

```yaml
noticeOutdate:
  enable: true
  style: simple # style: simple/flat
  limit_day: 365 # When will it be shown
  position: top # position: top/bottom
  message_prev: 这篇上古文章出土于
  message_next: 天前，食用前请核对当前环境是否匹配。
```

#### 头像配置

```yaml
avatar:
  img: /image/avatar.jpg
  effect: false
```

#### 侧边栏配置

```yaml
aside:
  ...
  card_author:
    ...
    button:
    ...
    link: https://github.com/CuratorC
  card_announcement:
    ...
    content: 任何需要请邮箱联系：mail@curatorc.com
```

#### 页脚配置

```yaml
footer:
  owner:
    enable: true
    since: 2020
  custom_text: 愿你始终如一<br/><a href="https://beian.miit.gov.cn"><span>备案号：晋ICP备18007174号</span></a>
  copyright: false # Copyright of theme and framework
```

#### 网站运营日期

```yaml
runtimeshow:
  enable: true
  publish_date: 2020/07/18
```

#### 允许复制

```yaml
copy:
  enable: true
  copyright:
    enable: false
    limit_count: 9999
```

#### 绘图

```yaml
mermaid:
  enable: true
```

#### 评论

遵循 [gitalk](https://github.com/gitalk/gitalk/blob/master/readme-cn.md) 的指示去获取你的 github Oauth 应用的 client id 和 secret 值。以及查看它的相关配置説明。

```yaml
comments:
  # Up to two comments system, the first will be shown as default
  # Choose: Disqus/Disqusjs/Livere/Gitalk/Valine/Waline/Utterances/Facebook Comments/Twikoo/Giscus/Remark42
  use: Gitalk
  text: false # Display the comment name next to the button
  # lazyload: The comment system will be load when comment element enters the browser's viewport.
  # If you set it to true, the comment count will be invalid
  lazyload: false
  count: false # Display comment count in post's top_img
  card_post_count: false # Display comment count in Home Page
  ...
# gitalk
# https://github.com/gitalk/gitalk
gitalk:
  client_id: {{client_id}}
  client_secret: {{client_secret}}
  repo: {{client_repo}}
  owner: CuratorC
  admin: ['CuratorC']
  option:
```

#### 本地搜索

安装插件

```bash
npm install hexo-generator-search --save
```

修改配置

```yaml
local_search:
  enable: true
  preload: true
```

#### 谷歌统计

* 登录谷歌分析的官方网站
* 找到你的谷歌分析的跟踪 ID

```yaml
# Google Analytics
# https://analytics.google.com/analytics/web/
google_analytics: XX-XXXXXXXXXX
```

#### 彩带背景

```yaml
# canvas_ribbon (靜止彩帶背景)
# See: https://github.com/hustcc/ribbon.js
canvas_ribbon:
  enable: true
  size: 150
  alpha: 0.6
  zIndex: -1
  click_to_change: true
  mobile: true
```

#### 页面美化

```yaml
# 美化页面显示
beautify:
  enable: true
  field: site # site/post
  title-prefix-icon: '\f0c1'
  title-prefix-icon-color: "#F47466"
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

[comment]: <> (数学公式)
katex: false

---
```
