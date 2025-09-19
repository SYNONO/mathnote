# 华里士公式中sin与cos积分相等的证明

## 核心问题
为什么 $\int_0^{\frac{\pi}{2}} \sin^n x \, dx = \int_0^{\frac{\pi}{2}} \cos^n x \, dx$？

## 数学证明

**方法**：换元法

设 $I = \int_0^{\frac{\pi}{2}} \sin^n x \, dx$

令 $t = \frac{\pi}{2} - x$，则：
- $x = \frac{\pi}{2} - t$
- $dx = -dt$ 
- 积分限：$x: 0 \to \frac{\pi}{2}$ 对应 $t: \frac{\pi}{2} \to 0$

代入得：
$$I = \int_{\frac{\pi}{2}}^0 \sin^n\left(\frac{\pi}{2} - t\right) (-dt) = \int_0^{\frac{\pi}{2}} \sin^n\left(\frac{\pi}{2} - t\right) dt$$

利用三角恒等式 $\sin\left(\frac{\pi}{2} - t\right) = \cos t$：
$$I = \int_0^{\frac{\pi}{2}} \cos^n t \, dt$$

因此：$\int_0^{\frac{\pi}{2}} \sin^n x \, dx = \int_0^{\frac{\pi}{2}} \cos^n x \, dx$

## 几何解释

**对称性**：在 $[0, \frac{\pi}{2}]$ 区间内
- $\sin x$ 从0增加到1
- $\cos x$ 从1减少到0  
- 两者关于直线 $x = \frac{\pi}{4}$ 对称

**直观理解**：两个函数图像互为镜像，所以积分面积相等。

---

**标签**: #华里士公式 #对称性 #换元法 #三角函数
**难度**: ⭐⭐⭐
