# 第一步：构建 Go 应用（构建阶段）
FROM golang:1.22 AS builder
  
  # 设置工作目录
WORKDIR /app
  
  # 将 Go 模块文件复制进去并下载依赖
COPY go.mod go.sum ./
RUN go mod download
  
  # 拷贝源代码
COPY . .
  
  # 编译为静态二进制文件（禁用 cgo）
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .
  
  # 第二步：使用更小的镜像运行（运行阶段）
FROM alpine:latest
  
  # 安装必要的 ca-certificates
RUN apk --no-cache add ca-certificates

WORKDIR /root/
  
  # 从构建阶段复制已编译的二进制文件
COPY --from=builder /app/main .
  
  # 设置默认启动命令
CMD ["./main"]
