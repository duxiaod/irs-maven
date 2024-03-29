基于eclipse+maven+ssm+shiro+layui的后台权限管理系统(maven版)

## 优先体验

# irs V1.2

默认账号：admin 密码：123456

访问地址：http://ip:端口/项目根路径

数据库文件在doc目录下

添加用户需要邮件激活：邮件设置在global.properties配置文件中，支持QQ邮箱，自行修改邮箱密钥

## 介绍
irs致力于做更简洁的后台管理系统,完美整合springmvc + spring + shiro + mybatis注释丰富,上手容易

页面使用了layui

## 管理系统功能
1.角色管理 2.管理员管理 3.菜单管理 4.用户管理 5.业务日志 6.SQL、URL和Spring监控 7.轮播图管理（图片的上传与回显）8.集成MyBatis逆向工程

## 项目特点
1. 基于ssm+shiro
2. 后台脚手架，马上上手
3. 完善的日志记录体系，可记录登录日志，业务操作日志(可记录操作前和操作后的数据)，异常日志到数据库
4. 日志删除修改为定时任务(每日21点删除30天以前的日志，配置在global.properties)
5. 新增菜单管理、SQL、URL和Spring监控
6. 轮播图管理（图片的上传与回显）
7. 逆向工程：根据数据库生成pojo和dao（新增），请自行修改配置generatorConfig.xml，配置完运行：com.irs.generator.GeneratorSqlmap.main方法即可。
8. 对多数据源提供支持（使用方法：在controller层使用注解@DataSource(dataSource="数据源名")）
9. 集成接口工具：swagger   访问：http://localhost:8088/swagger-ui.html#/ 或者通过菜单进入
10. 新增ApiController类,方便接口开发


## 踩坑必看
1. 日期类型操作，需要加:@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")。
2. 不需要鉴权的（如：不需要登录的app接口开发。）需要在shiro配置文件（applicationContext-shiro.xml）放行。例如：/account/**=anon  
3. 静态资源放行：shiro放行参考2，springmvc静态资源放行需要设置（springmvc.xml），例如：<mvc:resources location="/css/" mapping="/css/**"/>
4. 部署成功启动不了，请假查build path的maven依赖，保证maven设置正常
5. 启动报错请检查db.properties数据库设置，没有多数据源的设为一致即可
6. oracle包下不到的手动下载，或者不用oracle则去除依赖

## 项目截图
![输入图片说明](https://gitee.com/uploads/images/2018/0325/145022_599a5d05_1045447.png "1.PNG")
![输入图片说明](https://gitee.com/uploads/images/2018/0519/223825_8fe428e9_1045447.png "QQ截1111.png")
![输入图片说明](https://images.gitee.com/uploads/images/2018/0729/145423_ff526c7d_1045447.png "1.png")
![输入图片说明](https://gitee.com/uploads/images/2018/0325/145056_977828e7_1045447.png "3.PNG")
![输入图片说明](https://gitee.com/uploads/images/2018/0325/145107_ad9fcd59_1045447.png "4.png")
![输入图片说明](https://gitee.com/uploads/images/2018/0325/145119_4a25eaf9_1045447.png "5.png")
![输入图片说明](https://gitee.com/uploads/images/2018/0325/145128_3c771dac_1045447.png "6.PNG")
![输入图片说明](https://gitee.com/uploads/images/2018/0325/145138_ba5accbc_1045447.png "7.png")
![输入图片说明](https://gitee.com/uploads/images/2018/0507/114145_ea68ad83_1045447.png "ttt.png")
