# 对称性积分公式：xf(sin x)型

## 核心公式

$$\int_0^{\pi} xf(\sin x)dx = \frac{\pi}{2} \int_0^{\pi} f(\sin x)dx$$

其中 $f(x)$ 连续。

## 证明过程

**方法**：换元法利用对称性

设 $I = \int_0^{\pi} xf(\sin x)dx$

令 $t = \pi - x$：
- $x = \pi - t$，$dx = -dt$
- $x: 0 \to \pi$ 对应 $t: \pi \to 0$
- $\sin(\pi - t) = \sin t$

代入得：
$$I = \int_{\pi}^0 (\pi - t)f(\sin(\pi - t))(-dt) = \int_0^{\pi} (\pi - t)f(\sin t)dt$$

$$= \pi\int_0^{\pi} f(\sin t)dt - \int_0^{\pi} tf(\sin t)dt = \pi\int_0^{\pi} f(\sin x)dx - I$$

因此：$2I = \pi\int_0^{\pi} f(\sin x)dx$

所以：$I = \frac{\pi}{2}\int_0^{\pi} f(\sin x)dx$

## 使用条件

1. **积分区间**：必须是 $[0, \pi]$
2. **函数形式**：$xf(\sin x)$ 的形式
3. **连续性**：$f(\sin x)$ 在积分区间上连续

## 典型例题

### 例1：基础应用
$$\int_0^{\pi} x \sin x \, dx = \frac{\pi}{2} \int_0^{\pi} \sin x \, dx = \frac{\pi}{2} \cdot 2 = \pi$$

### 例2：复合函数
$$\int_0^{\pi} \frac{x \sin x}{1 + \cos^2 x} dx = \frac{\pi}{2} \int_0^{\pi} \frac{\sin x}{1 + \cos^2 x} dx$$

右边积分可用换元法：$u = \cos x$，$du = -\sin x \, dx$
$$= \frac{\pi}{2} \int_1^{-1} \frac{-du}{1 + u^2} = \frac{\pi}{2} \int_{-1}^1 \frac{du}{1 + u^2} = \frac{\pi}{2} \cdot \frac{\pi}{2} = \frac{\pi^2}{4}$$

## 几何理解

**对称性原理**：
- $\sin x$ 在 $[0, \pi]$ 上关于 $x = \frac{\pi}{2}$ 对称
- 函数 $xf(\sin x)$ 利用这种对称性简化计算
- 相当于将复杂的"加权积分"转化为简单积分

## 推广形式

类似的对称性公式还有：
- $\int_0^{a} f(x)dx = \int_0^{a} f(a-x)dx$
- $\int_0^{\frac{\pi}{2}} f(\sin x)dx = \int_0^{\frac{\pi}{2}} f(\cos x)dx$

## 解题策略

**识别特征**：
1. 看到 $xf(\sin x)$ 形式
2. 积分区间是 $[0, \pi]$ 
3. 直接应用公式简化

---

**标签**: #对称性积分 #换元法 #三角函数积分 #定积分技巧
**难度**: ⭐⭐⭐⭐
