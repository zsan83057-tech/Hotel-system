-- 酒店管理系统数据库初始化脚本
-- 注意: 应用使用 JPA ddl-auto=update 自动建表, 本脚本仅需创建数据库
-- 运行前请确认 MySQL 8+ 已启动, 并修改下方密码

CREATE DATABASE IF NOT EXISTS hotel_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE hotel_db;
