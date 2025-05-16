# ReadMe



## 功能：

批量clone github repositories



## 准备

- csv文件, 

  homework-collections.csv

  ```csv
  username,id,url
  user1,001,https://github.com/user1/repo1.git
  user2,002,https://github.com/user2/repo2.git
  ```

- 修改 `github_re_batch_clone.bat`中csv文件名

## 注意

- csv,bat 采用UTF-8编码，避免中文名乱码



## 输出

- 用户名+编号命名的文件夹列表
- log.txt: 执行日志
- fatal-log.txt: clone 失败记录