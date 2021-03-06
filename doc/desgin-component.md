
# 核心组件

为保持对spark框架的一致性，采用lambda架构，组件支持序列化，
可以在不同的节点间分布式部署。

组件的工作流程为：
- 输入{训练数据，实际结果}
- 持续计算，获得{评估信息}
- 评估信息达到设定指标，输出{模型}
- 输入{数据}，根据{模型}，获得{预测结果}

在某些情况下，原始的数据根据{查询约束}进行转换，如查询值
的范围，转换为查询类别，此时需要{查询约束}作为上下文

### 算法控制器

算法控制器由{数据，模型，查询约束，预测结果}组成，支持：
- 通过训练，获得模型
- 通过迭代计算，获得预测结果
- 通过多个迭代计算，获得多个预测结果
- 持久化计算结果

### 数据源

考虑数据源对计算的支持，如果是大规模计算，需要内存和磁盘交换，
或无法连续计算，都需要数据源的支持。

数据源包含{训练数据，评估信息，查询约束，实际结果}，支持：
- 读取预训练数据
- 读取训练进度情况（评估信息）

考虑各种数据源的支持
- 数据型
- 流式日志
- 文档（文本、WORD、PDF、HTML、报表）
- 图像/音频/视频

### 算法引擎

算法引擎负责调度，包含{评估信息，查询约束，预测结果，实际结果}，
引擎的作用在于统一化调度接口，支持：
- 训练，输出模型
- 评估，输出评估信息
- 批量评估，输出批量评估信息

### 计算服务

用户的计算需求，与底层的实际运作，会存在一定的区别，如：
请求的计算，可以由多个模型的计算结果组合而成（如按权重组合），
计算服务定义用户的计算请求接口：
- 增补，对查询请求进行修订
- 服务，根据底层的引擎调度结果，完成最终输出

### 数据预处理管道

考虑到数据进入格式的多样化，以及不同计算模型对数据格式的要求
存在差异，以及结果输出时，对数据格式有不同的要求，应当提供
数据预处理管道，满足各种场景。

### 控制组件：引擎

实现类，对算法引擎的实现，核心是训练和评估
- 训练：计算获取模型，并保存
- 部署准备：把{算法，参数，模型}组合并准备持久化
- 模型持久化：考虑模型有单机和多机两种情况，保存的策略不一样（单机训练，多机部署/多机训练，单机部署）
- 评估：调用引擎的评估计算，返回结果，结果可用于保存，方便评估

### 控制组件：评估

评估包含引擎和评估量度(metric)，继承自deployment(deployment extends EngineFactory)

### 量度 Metric

对结果进行评估，包括有平均值、方差、汇集、零值等

### 流程参数

- 标识，记录每一次运行的识别符
- 详细度，设定每一次运行的输出详细度
- 保存，是否保存该次运行的训练模型
- 数据可用性检查，是否对数据的可用性进行检查
- 进度控制，可以设定运行的进度，不需要把整个流程跑完

### 辅助类

包括数据的读入、初始化、格式转换等等功能

### 服务插件

定义引擎的插件接口，可以从持久化介质装载到运行态

### 服务接口热插拔

基于actor系统的服务器实现，可利用actor的可更新功能，实现插件的热插拔
