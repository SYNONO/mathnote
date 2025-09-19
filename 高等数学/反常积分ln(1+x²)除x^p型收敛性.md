# 反常积分收敛性判定 - ln(1+x²)/x^p 型

## 题目
讨论积分 $\int_0^{+\infty} \frac{\ln(1+x^2)}{x^p} dx$ $(p > 0)$ 的收敛性。

## 正确解法

### 第一步：分段处理
由于积分区间包含 0 和 ∞ 两个"危险点"，需要分段：
$$\int_0^{+\infty} \frac{\ln(1+x^2)}{x^p} dx = \int_0^1 \frac{\ln(1+x^2)}{x^p} dx + \int_1^{+\infty} \frac{\ln(1+x^2)}{x^p} dx$$

两个积分都必须收敛，原积分才收敛。

---

## 第一部分：瑕积分 $\int_0^1 \frac{\ln(1+x^2)}{x^p} dx$

### 关键：$x \to 0^+$ 时的渐近行为

当 $x \to 0^+$ 时，使用泰勒展开：
$$\ln(1+x^2) = x^2 - \frac{x^4}{2} + \frac{x^6}{3} - \cdots \approx x^2$$

因此：
$$\frac{\ln(1+x^2)}{x^p} \sim \frac{x^2}{x^p} = \frac{1}{x^{p-2}}$$

### 收敛性判定
根据瑕积分判别法：
- $\int_0^1 \frac{1}{x^{p-2}} dx$ 收敛 $\Leftrightarrow p-2 < 1 \Leftrightarrow p < 3$

**结论1**：第一个积分在 $p < 3$ 时收敛。

---

## 第二部分：无穷积分 $\int_1^{+\infty} \frac{\ln(1+x^2)}{x^p} dx$

### 关键：$x \to +\infty$ 时的渐近行为

当 $x \to +\infty$ 时：
$$\ln(1+x^2) = \ln(x^2(1+\frac{1}{x^2})) = \ln x^2 + \ln(1+\frac{1}{x^2}) = 2\ln x + O(\frac{1}{x^2})$$

因此：
$$\frac{\ln(1+x^2)}{x^p} \sim \frac{2\ln x}{x^p}$$

### 收敛性判定的关键引理

**引理**：对于积分 $\int_2^{+\infty} \frac{\ln x}{x^p} dx$
- 当 $p > 1$ 时收敛
- 当 $p \leq 1$ 时发散

**证明**（使用分部积分）：
设 $u = \ln x$，$dv = x^{-p} dx$

当 $p \neq 1$ 时：
$$\int \frac{\ln x}{x^p} dx = \frac{\ln x \cdot x^{1-p}}{1-p} - \int \frac{x^{1-p}}{(1-p)x} dx$$
$$= \frac{x^{1-p}\ln x}{1-p} - \frac{x^{1-p}}{(1-p)^2} + C$$