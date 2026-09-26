<div align="center">

# 云栖酒店 · 酒店管理系统

一个前后端分离的全栈酒店管理系统：**管理后台 + 前台工作台 + 顾客官网** 三个前端入口，共享一套 Spring Boot 后端服务。

![Vue](https://img.shields.io/badge/Vue-3.5-42b883?logo=vuedotjs&logoColor=white)
![Vite](https://img.shields.io/badge/Vite-5.4-646cff?logo=vite&logoColor=white)
![Naive UI](https://img.shields.io/badge/Naive%20UI-2.40-18a058)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3.5-6db33f?logo=springboot&logoColor=white)
![Java](https://img.shields.io/badge/Java-21-f89820)
![MySQL](https://img.shields.io/badge/MySQL-8-4479a1?logo=mysql&logoColor=white)
![JWT](https://img.shields.io/badge/Auth-JWT-d63aff)

开箱即用 · 种子数据自动初始化 · 三端角色权限隔离

</div>

---

## ✨ 项目简介

「云栖酒店」是一个面向中小型酒店的完整业务系统，覆盖从**房型上架 → 在线预订 → 前台入住 → 记账消费 → 退房结账 → 会员运营**的全流程。三种角色各有一个独立前端界面：

| 入口 | 角色 | 体验地址（本地启动后） |
| --- | --- | --- |
| 🛠 管理后台 | `ADMIN` 管理员 | http://localhost:5173/admin |
| 🏨 前台工作台 | `RECEPTIONIST` 前台接待 | http://localhost:5173/reception |
| 🏡 顾客官网 | `CUSTOMER` 顾客会员 | http://localhost:5173/ |

- 登录后按角色自动跳转到对应入口，路由 + 接口双层权限校验
- 首次启动自动建库建表并写入演示数据，**零配置即可完整体验**
- 登录页内置「演示账号」一键填充按钮，官网支持自助注册会员

## 🖥 界面预览

<!-- 建议截图后放入 docs/screenshots/ 目录，并将下方占位注释替换为真实图片：
| 顾客官网首页 | 前台房态看板 | 管理后台仪表盘 |
| --- | --- | --- |
| ![](docs/screenshots/web-home.png) | ![](docs/screenshots/reception-board.png) | ![](docs/screenshots/admin-dashboard.png) |
-->

## 🚀 功能亮点

**管理后台（9 个模块）**
- 📊 经营仪表盘：今日经营数据 + 7 日营收趋势图（ECharts）
- 🛏 房型 / 房间管理：房型 CRUD 与上下架，房间 CRUD 与状态维护
- 📋 订单管理：全量订单查询、确认 / 取消 / 强制离店
- 👥 客户管理：客户档案、会员等级与积分
- 🧾 账单管理：账单查询与退款
- 🎁 优惠活动：折扣 / 立减活动创建与生效范围配置
- 📈 经营报表：营收趋势、房型销售占比、订单与会员分布（ECharts）
- 👤 员工账号：账号 CRUD、重置密码、启用 / 禁用

**前台工作台（房态看板驱动）**
- 🟩 房间格子视图，五种房态一目了然（空闲 / 入住 / 已预订 / 清洁 / 维修）
- 🚶 散客直接入住：选房型自动算价、自动分配房间、收押金
- 🔑 订单确认、办理入住、续住
- 💰 退房结账：房费 + 额外消费 − 押金自动结算，多支付方式收款

**顾客官网**
- 🏡 酒店首页与房型展示（Unspalsh 图片、价格、面积、床型）
- 📅 在线预订：日期选择 → 实时可用房型 → 会员折扣 + 促销价自动计算
- 📦 我的订单：查看、取消预订

**业务规则内置**
- 会员四级（普通 / 银卡 / 金卡 / 铂金），累计消费自动升级，消费 1 元 = 1 积分
- 促销活动自动叠加（折扣型 `DISCOUNT_PERCENT` / 立减型 `DISCOUNT_FIXED`）
- 退房后自动记账：客户累计消费、积分、等级实时更新

## 🏗 系统架构

```
┌───────────────────────┐        ┌──────────────────────┐        ┌──────────┐
│   Vue 3 SPA（三端合一） │  REST  │  Spring Boot 3（Java 21）│  JPA   │  MySQL 8 │
│  ┌─────┐ ┌─────────┐  │ ─────▶ │  ┌────────────────┐  │ ─────▶ │ hotel_db │
│  │ 官网 │ │ 前台/管理 │  │  JSON  │  │ Security + JWT │  │        └──────────┘
│  └─────┘ └─────────┘  │        │  │ 接口级角色鉴权    │  │
│  Pinia · Router 守卫   │        │  └────────────────┘  │
└───────────────────────┘        └──────────────────────┘
```

- 后端接口按角色分区：`/api/admin/**`（管理员）、`/api/reception/**`（管理员 + 前台）、`/api/web/**`（公开 + 顾客），由 Spring Security 过滤器按 JWT 角色校验
- JWT 默认 24 小时有效，前端 Axios 拦截器自动携带 token，401 自动跳登录
- JPA `ddl-auto=update` 自动建表，`createDatabaseIfNotExist=true` 自动建库

## 🛠 技术栈

| 层 | 技术 |
| --- | --- |
| 后端 | Spring Boot 3.3 · Spring Security · JWT (jjwt 0.12) · Spring Data JPA · Validation |
| 数据库 | MySQL 8+（自动建库建表） |
| 前端 | Vue 3 · Vite 5 · Naive UI · Pinia · Vue Router · Axios · ECharts · Day.js |

## ⚡ 快速启动

### 1. 准备环境

- JDK 21+、Maven 3.9+、Node.js 18+
- MySQL 8 已启动

### 2. 配置数据库

修改 `backend/src/main/resources/application.yml` 中的数据库账号密码：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/hotel_db?...
    username: root      # 改成你的 MySQL 账号
    password: 123456    # 改成你的 MySQL 密码
```

> 无需手动建表：JPA 会自动建库建表，首次启动自动写入演示数据（4 个房型、20 间客房、演示账号与订单）。
> 想清空演示数据重新生成，删除 `hotel_db` 库后重启即可；也可手动执行 `database.sql`。

### 3. 启动后端

```powershell
cd backend
mvn spring-boot:run
```

后端启动于 http://localhost:8080

### 4. 启动前端

```powershell
cd frontend
npm install
npm run dev
```

浏览器访问 http://localhost:5173 （已配置 Vite 代理，`/api` 自动转发到 8080）。

## 🔑 演示账号（种子数据内置）

| 角色 | 用户名 | 密码 | 登录后进入 |
| --- | --- | --- | --- |
| 管理员 | `admin` | `admin123` | 管理后台 `/admin` |
| 前台接待 | `front` | `front123` | 前台工作台 `/reception` |
| 顾客会员 | `guest` | `guest123` | 顾客官网 `/` |

> 登录页提供「演示账号」一键填充按钮；顾客官网支持自助注册。

## 🗺 页面入口

| 入口 | 地址 | 说明 |
| --- | --- | --- |
| 顾客官网 | `/` | 首页、房型浏览、在线预订、我的订单 |
| 管理后台 | `/admin` | 需 `ADMIN` 角色 |
| 前台工作台 | `/reception` | 需 `ADMIN` / `RECEPTIONIST` 角色 |
| 登录页 | `/login` | 按角色自动跳转对应入口 |

## 🔄 核心业务流程

1. **官网预订**：顾客注册登录 → 选择房型与日期 → 提交预订（`PENDING`，自动计算会员折扣与促销价）→ 前台 / 管理员确认（`CONFIRMED`）
2. **前台办理入住**：房态看板点「散客入住」，或对已确认订单「办理入住」→ 分配房间、收押金 → 房间变 `OCCUPIED`，生成账单
3. **入住期间**：看板点击入住房间 → 记额外消费、续住
4. **退房结账**：看板点击房间「退房结账」→ 房费 + 消费 − 押金 = 应收 → 选择支付方式收款 → 房间变 `CLEANING`，订单 `CHECKED_OUT`，客户累计消费 / 积分 / 等级自动更新

## 📋 业务规则

- **会员折扣**：普通 10 折 / 银卡 9.5 折 / 金卡 9 折 / 铂金 8.5 折；累计消费满 5000 / 10000 / 20000 自动升级，消费 1 元 = 1 积分
- **促销活动**：折扣（0.85 = 85 折）、每晚立减；可指定房型或全部；官网与前台预订自动生效
- **房态**：空闲 / 入住中 / 已预订 / 清洁中 / 维修中
- **订单状态**：待确认 → 已确认 → 已入住 → 已离店 / 已取消
- **权限**：接口级角色控制，JWT 24 小时有效

## 📦 目录结构

```
hotel-system/
├── backend/                          # Spring Boot 3 后端
│   └── src/main/java/com/hotel/
│       ├── config/                   # Security 配置、种子数据初始化
│       ├── security/                 # JWT 工具、过滤器、UserDetails
│       ├── common/                   # 统一响应、异常处理、分页
│       ├── entity/                   # 实体与枚举
│       ├── repository/               # JPA 数据访问
│       ├── service/                  # 业务逻辑
│       ├── controller/               # 接口层（admin / reception / web）
│       └── dto/                      # 请求对象
├── frontend/                         # Vue 3 前端（三端合一，路由区分）
│   └── src/
│       ├── views/web/                # 顾客官网页面
│       ├── views/admin/              # 管理端页面
│       ├── views/reception/          # 前台端页面
│       ├── layouts/                  # 三端布局
│       ├── api/                      # Axios 封装与接口定义
│       ├── router/                   # 路由 + 角色守卫
│       └── stores/                   # Pinia 登录状态
├── database.sql                      # 建库脚本（可选，应用会自动建库建表）
└── README.md
```

## 🚢 生产部署

```powershell
cd backend
mvn package -DskipTests          # 产物：target/hotel-backend-1.0.0.jar

cd frontend
npm run build                    # 产物：frontend/dist
```

将 `dist` 部署到 Nginx，并反向代理 `/api` 到后端 8080 端口。

> ⚠️ 部署前请务必修改 `application.yml` 中的 `jwt.secret` 与数据库密码。

## ❓ 常见问题

| 问题 | 解决办法 |
| --- | --- |
| 后端启动报数据库连接失败 | 确认 MySQL 已启动，`application.yml` 账号密码正确 |
| 前端接口 404 | 确认后端已启动，开发环境走 Vite 代理（端口 5173） |
| 端口冲突 | 后端改 `server.port`；前端改 `vite.config.js` 的 `server.port` |
| 想重置演示数据 | 删除 `hotel_db` 库重启后端，自动重新初始化 |
| 登录后无权限进入某页面 | 路由按角色拦截，换对应演示账号登录（见上表） |

## 📄 License

本项目暂未指定开源协议。如需开源发布，请添加 `LICENSE` 文件并选择合适的协议（如 MIT / Apache-2.0）。
