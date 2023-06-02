---
title: Angular 工作区配置
categories:
  - Angular
tags:
  - Angular
keywords:
  - Angular
  - 工作区
  - 配置
cover: /img/cover/0.jpg
abbrlink: 3154631999
date: '2021-12-24 18:20:08'
---


Angular [工作区](https://angular.cn/guide/glossary#workspace)根目录下的 `angular.json` 文件提供了全工作区级的配置和具体项目的默认配置，供 Angular CLI 中的构建工具和开发工具使用。 此配置中所提供的路径值都是相对于工作区根目录的

## JSON的总体结构

在angular.json的顶层，一些属性用于工作区配置。其中的 `projects` 区则包含其余的针对每个项目的配置项。CLI 在工作区级的默认设置可以被项目级的设置所覆盖，而项目级的设置可以被命令行中的设置所覆盖。

下列属性位于文件的顶层，用于配置工作区。

- `version`：该配置文件的版本。
- `newProjectRoot`：用来创建新工程的位置。绝对路径或相对于工作区目录的路径。
- `defaultProject`：当命令中没有指定参数时，要使用的默认工程名。当你用 `ng new` 在新的工作区中创建新应用时，该应用就会一直作为此工作区的默认项目，除非你到这里修改它。
- `schematics`：一组[原理图](https://angular.cn/guide/glossary#schematic)，用于定制 `ng generate` 子命令在本工作区中的默认选项。参阅[生成器原理图](https://angular.cn/guide/workspace-config#schematics)。
- `projects`：对于工作区中的每个项目（应用或库）都会包含一个子分区，子分区中是每个项目的配置项。

## 项目配置选项

每个项目的 `projects:<project_name>` 下都有以下顶层配置属性。

```json
"my-app": {
  "root": "",
  "sourceRoot": "src",
  "projectType": "application",
  "prefix": "app",
  "schematics": {},
  "architect": {}
}
```

| 属性        | 说明                                                         |
| :--- | :----------------------------------------------------------- |
| root        | 该项目的根文件夹，相对于工作区文件夹的路径。初始应用的值为空，因为它位于工作区的顶层。 |
| sourceRoot  | 该项目源文件的根文件夹。                                     |
| projectType | "application" 或 "library" 之一。应用可以在浏览器中独立运行，而库则不行。 |
| prefix      | Angular 所生成的选择器的前缀字符串。可以自定义它，以作为应用或功能区的标识。 |
| schematics  | 一组原理图（schematic），它可以为该项目自定义 `ng generate` 子命令的默认选项。参见[生成原理图](https://angular.cn/guide/workspace-config#schematics)部分。 |
| architect   | 为本项目的各个构建器目标配置默认值。                         |

