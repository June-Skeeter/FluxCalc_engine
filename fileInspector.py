import numpy as np

df = np.fromfile('custom/binData/2024-04-03T123000_LI-7200.bin',dtype='float32')
print('{:f}'.format(df[0]))
print('{:f}'.format(df[1]))
df = df.reshape(-1,36000)
print(df.shape)
for i in range(df.shape[0]):
    print(df[i])