import numpy as np
#import matplotlib as mp
import matplotlib.pyplot as plt

f = open("testfile.txt", "r")
f.readline().split("  ")
#plt.figure(figsize=(9, 3))

#plt.title("HopHacks")
#plt.xlabel("Snoozes")
#plt.ylabel("Hours Per Night")

x = []
S = []
Q = []
H = []

result_array = np.empty((0, 100))
for pow in f:
    j = pow.split()
    x.append(j[3])
    S.append(int(j[2]))
    Q.append(int(j[0]))
    H.append(int(j[1]))

print(x)
figure, axes = plt.subplots(nrows=2, ncols=2)
plt.figure(figsize=(6, 6))
axes[0, 0].plot(S, Q)
axes[0, 0].set_title("Snoozes X Quality")
axes[1, 0].plot(H, Q)
axes[1, 0].set_title("Hours X Quality")
axes[0, 1].plot(x,H)
axes[0, 1].set_title("Date X Hours")
axes[1, 1].plot(S,H)
axes[1, 1].set_title("Snoozes X Hours")
figure.tight_layout()
plt.show()
