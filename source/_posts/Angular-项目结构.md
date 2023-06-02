---
title: Angular 项目结构
categories:
  - Angular
tags:
  - Angular
keywords:
  - Angular
  - 工作区
  - 结构
  - 项目
abbrlink: 742625435
date: 2021-12-23 10:16:35
top_img:
---


Angular以工作区作为上下文来开发应用。工作区包含一个或多个[项目](https://angular.cn/guide/glossary#project)的文件集。一个项目就是一组包含独立应用或可共享库的文件。Angular CLI 的 `ng new <my-project>` 命令可以创建一个工作区。

## 工作区配置文件

每个工作区中的所有项目共享同一个 [CLI 配置环境](https://angular.cn/guide/workspace-config)。该工作区的顶层包含着全工作区级的配置文件、根应用的配置文件以及一些包含根应用的源文件和测试文件的子文件夹。

| 工作区配置文件 | 用途      |
| :----- | ------------------------------------------------------------ |
| .editorconfig | 代码编辑器的配置。参阅 [EditorConfig](https://editorconfig.org/)。 |
| .gitignore     | 指定 [Git](https://git-scm.com/) 应忽略的不必追踪的文件。    |
| README.md      | 根应用的简介文档.                                            |
| angular.json   | 为工作区中的所有项目指定 CLI 的默认配置，包括 CLI 要用到的构建、启动开发服务器和测试工具的配置项，比如 [TSLint](https://palantir.github.io/tslint/)，[Karma](https://karma-runner.github.io/) 和 [Protractor](http://www.protractortest.org/)。欲知详情，请参阅 [Angular 工作区配置](https://angular.cn/guide/workspace-config) 部分。 |
| package.json   | 配置工作区中所有项目可用的 [npm 包依赖](https://angular.cn/guide/npm-packages)。 |
| src/           | 根项目的源文件。                                             |
| tsconfig.json  | 工作区中所有项目的基本 [TypeScript](https://www.typescriptlang.org/) 配置。所有其它配置文件都继承自这个基本配置。欲知详情，参阅 TypeScript 文档中的 [通过 extends 进行配置继承](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html#configuration-inheritance-with-extends) 部分。 |
| tslint.json    | 工作区中所有项目的默认的 [TSLint](https://palantir.github.io/tslint/) 配置。 |

## 应用项目文件

CLI 命令 `ng new my-app` 会默认创建名为 “my-app” 的工作区文件夹，并在 `src/` 文件夹下为工作区顶层的根应用生成一个新的应用骨架。新生成的应用包含一个根模块的源文件，包括一个根组件及其模板。

当工作区文件结构到位时，可以在命令行中使用 `ng generate` 命令往该应用中添加功能和数据。这个初始的根应用是 CLI 命令的*默认应用*

对于单应用的工作区，工作区的 `src/` 子文件夹包含根应用的源文件（应用逻辑、数据和静态资源）。对于多项目的工作区，`projects/` 文件夹中的其它项目各自包含一个具有相同结构的 `project-name/src/` 子目录。

### 应用源文件

顶层文件 `src/` 为测试并运行应用提供支持。其子文件夹中包含应用源代码和应用的专属配置。

| 应用支持文件  | 目的                                                         |
| :------------ | ------------------------------------------------------------ |
| app/          | 包含定义应用逻辑和数据的组件文件。                           |
| assets/       | 包含要在构建应用时应该按原样复制的图像和其它静态资源文件。   |
| environments/ | 包含特定目标环境的构建配置选项。默认情况下，有一个无名的标准开发环境和一个生产（“prod”）环境。你还可以定义其它的目标环境配置。 |
| favicon.ico   | 用作该应用在标签栏中的图标。                                 |
| index.html    | 提供服务的主要 HTML 页面。CLI 会在构建应用时自动添加所有的 JavaScript 和 CSS 文件，所以通常不用手动添加任何 `<script>` 或 `<link>` 标签。 |
| main.ts       | 应用的主要切入点。用 [JIT 编译器](https://angular.cn/guide/glossary#jit)编译应用，然后引导应用的根模块（AppModule）在浏览器中运行。也可以在不改变任何代码的情况下改用 [AOT 编译器](https://angular.cn/guide/aot-compiler)，只要在 CLI 的 `build` 和 `serve` 命令中加上 `--aot` 标志就可以了。 |
| polyfills.ts  | 为浏览器支持提供了腻子（polyfill）脚本。                     |
| styles.sass   | 列出为项目提供样式的 CSS 文件。该扩展还反映了为该项目配置的样式预处理器。 |
| test.ts       | 单元测试的主入口点，带有一些 Angular 特有的配置。通常不需要编辑这个文件。 |

在 `src/` 文件夹里面，`app/` 文件夹中包含此项目的逻辑和数据。Angular 组件、模板和样式也都在这里。

| `SRC/APP/` 文件           | 用途                                                         |
| ------------------------- | ------------------------------------------------------------ |
| app/app.component.ts      | 为应用的根组件定义逻辑，名为 `AppComponent`。当你向应用中添加组件和服务时，与这个根组件相关联的视图就会成为[视图树](https://angular.cn/guide/glossary#view-hierarchy)的根。 |
| app/app.component.html    | 定义与根组件 `AppComponent` 关联的 HTML 模板。               |
| app/app.component.css     | 为根组件 `AppComponent` 定义了基本的 CSS 样式表。            |
| app/app.component.spec.ts | 为根组件 `AppComponent` 定义了一个单元测试。                 |
| app/app.module.ts         | 定义了名为 `AppModule` 的根模块，它会告诉 Angular 如何组装应用。这里最初只声明一个 `AppComponent`。当你向应用中添加更多组件时，它们也必须在这里声明。 |

### 应用配置文件

根应用的配置文件位于工作区的根目录下。对于多项目工作区，项目专属的配置文件位于项目根目录 `projects/project-name/`。

项目专属的 [TypeScript](https://www.typescriptlang.org/) 配置文件继承自工作区范围内的 `tsconfig.json`，而项目专属的 [TSLint](https://palantir.github.io/tslint/) 配置文件则继承自全工作区级内的 `tslint.json`。

| 应用专属的配置文件 | 用途                                                         |
| ------------------ | ------------------------------------------------------------ |
| .browserslistrc    | 配置各种前端工具之间共享的目标浏览器和 Node.js 版本。        |
| karma.conf.js      | 应用专属的 [Karma](https://karma-runner.github.io/2.0/config/configuration-file.html) 配置。 |
| tsconfig.app.json  | 应用专属的 [TypeScript](https://www.typescriptlang.org/) 配置，包括 TypeScript 和 Angular 模板编译器的选项。参阅 [TypeScript 配置](https://angular.cn/guide/typescript-configuration)。 |
| tsconfig.spec.json | 应用测试的 [TypeScript](https://www.typescriptlang.org/) 配置。参阅 [TypeScript 配置](https://angular.cn/guide/typescript-configuration)。 |
| tslint.json        | 应用专属的 [TSLint](https://palantir.github.io/tslint/) 配置。 |

## 多重项目

多项目工作区适用于对所有 Angular 项目使用单一存储库（单仓库模型）和全局配置的企业。多项目工作区也能为库开发提供支持。

### 建立多项目工作区

如果打算在工作区中包含多个项目，可以在创建工作区时不要自动创建初始应用，并为工作区指定一个唯一的名字。下列命令用于创建一个包含全工作区级配置文件的工作区，但没有根应用。

```bash
ng new my-workspace --create-application false
```

然后，可以使用工作区内唯一的名字来生成应用和库。

```bash
cd my-workspace
ng generate application my-first-app
```

### 多重项目的文件结构

工作区中第一个显式生成的应用会像工作区中的其它项目一样放在 `projects/` 文件夹中。新生成的库也会添加到 `projects/` 下。当你以这种方式创建项目时，工作区的文件结构与[工作区配置文件](https://angular.cn/guide/workspace-config) `angular.json` 中的结构完全一致。

```
my-workspace/
  ...             (workspace-wide config files)
  projects/       (generated applications and libraries)
    my-first-app/ --(an explicitly generated application)
      ...         --(application-specific config)
      src/        --(source and support files for application)
    my-lib/       --(a generated library)
      ...         --(library-specific config)
      src/        --source and support files for library)
```

## 库项目文件

当你使用 CLI 命令（例如 `ng generate library my-lib`）生成一个库时，所生成的文件会放在工作区的 `projects/` 文件夹中。

库和应用不同，它们有自己的 `package.json` 配置文件。在 `projects/` 目录下，`my-lib` 文件夹中包含你的库代码。

| 库的源文件             | 用途                                                         |
| ---------------------- | ------------------------------------------------------------ |
| src/lib                | 包含库项目的逻辑和数据。像应用项目一样，库项目也可以包含组件、服务、模块、指令和管道。 |
| src/test.ts            | 单元测试的主要入口点是一些库专属的配置。通常不用编辑这个文件。 |
| src/public-api.ts      | 指定从库中导出的所有文件。                                   |
| karma.conf.js          | 库专属的 [Karma](https://karma-runner.github.io/2.0/config/configuration-file.html) 配置。 |
| ng-package.json        | 构建库时，[ng-packagr](https://github.com/ng-packagr/ng-packagr) 用到的配置文件。 |
| package.json           | 配置这个库所需的 [npm 包依赖](https://angular.cn/guide/npm-packages)。 |
| tsconfig.lib.json      | 库专属的 [TypeScript](https://www.typescriptlang.org/) 配置，包括 TypeScript 和 Angular 模板编译器选项。参阅 [TypeScript 配置](https://angular.cn/guide/typescript-configuration)。 |
| tsconfig.lib.prod.json | 库专属的 [TypeScript](https://www.typescriptlang.org/) 配置，用于构建生产模式的库。 |
| tsconfig.spec.json     | 测试库时用到的 [TypeScript](https://www.typescriptlang.org/) 配置。 |
| tslint.json            | 库专属的 [TSLint](https://palantir.github.io/tslint/) 配置。 |

