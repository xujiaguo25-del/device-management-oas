1. ### 用户接口
   
   - 用户登录
     
     ```url
     POST /user/login
     ```
   
   - 用户登出
     
     ```url
     POST /user/logout
     ```
   
   - 用户管理
     
     - 用户查询
       
       ```url
       GET /user
       ```
     
     - 用户密码重置
       
       ```url
       POST /user/{jobNumber}/password-reset
       ```
     
     - 用户导入(表格)
       
       ```url
       PUT /user/import
       ```
     
     - 用户新增
       
       ```url
       PUT /user
       ```
     
     - 用户信息修改（角色，用户名）
       
       ```url
       PATCH /user/{jobNumber}
       ```
     
     - 用户删除
       
       ```url
       DELETE /user/{jobNumber}
       ```
   
   ---

2. ### 设备管理接口
- <b>设备导入</b>(表格)
  
  ```url
  POST /device/import
  ```

- 设备管理
  
  - 设备查询
    
    ```url
    GET　/device
    
    request:
        pageSize:30,
        pageNum:1,
        data:{
            userInfo:{}
            deviceInfo:{}
        }
    
    ```
  
  - 设备修改
    
    ```url
    PATCH /device/{deviceId}
    ```
  
  - 设备删除
    
    ```url
    DELETE /device/{deviceId}
    ```
  
  - 设备增加
    
    ```url
    POST /device
    ```

   ---

3. ### 抽查接口
   
   - <b>设备抽查（添加记录）</b>
     
     ```url
     POST /inspection
     
     request:
         data:{
            list:[
             userInfo:{'jobNumber':'123'}
             deviceInfo: {
                 'deviceId':1,
                 'startUpAuth':true,
                 'passwordScreenSaver':ture
                 ...
                 },
             ]
         }
     ```
     
     
   
   - <b>设备抽查（添加记录）</b>
     
     ```url
     POST /inspection
     
     request:
         data:{
            list:[
             userInfo:{'jobNumber':'123'}
             deviceInfo: {
                 'deviceId':1,
                 'startUpAuth':true,
                 'passwordScreenSaver':ture
                 ...
                 },
             ]
         }
     ```
   
   - 抽查信息查询
     
     ```url
     GET /inspection
     ```
   
   - 抽查信息导出
     
     ```url
     POST /inspection/export
     ```
   
   ---

4. ### 权限接口
- 设备权限信息查询
  
  ```url
  GET /device-permission
  ```

- 设备权限信息修改
  
  ```url
  PATCH /device-permission/{deviceId}
  ```

- 设备权限清单导出
  
  ```url
  POST /device-permission/export
  ```
  
   ---
5. ### Common
   
   - 获取字典
     
     ```url
     GET /common/dict
     ```
