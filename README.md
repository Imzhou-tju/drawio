# drawio

存放 drawio 绘图资料。

## 目录说明

- `草稿/`：日常绘图草稿
- `终稿/`：已确认完成、需要沉淀的图

## 快速复制草稿到终稿

仓库根目录提供脚本 `copy_to_final.sh`，用于把草稿中画好的文件复制到终稿：

```bash
./copy_to_final.sh 架构图.drawio
./copy_to_final.sh 子目录/流程图.drawio 另一个图.drawio
```

说明：
- 路径相对 `草稿/` 目录
- 会自动创建 `终稿/` 下对应的子目录
- 同名文件会被覆盖
