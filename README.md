# attribute-filter-policy

这个仓库提供了上海教育认证中心推荐的 `attribute-filter.xml` 策略，并随时保持更新。

如果您希望与认证中心推荐的策略保持同步的话，可以参考一下使用说明来自动同步策略。

## 使用说明
### 备份现有的配置
```
cp /opt/shibboleth-idp/conf/attribute-filter.xml /opt/shibboleth-idp/conf/attribute-filter.xml.bak
```

### 拉取仓库
```
[root@idp /]# cd /home/
[root@idp home]# git clone https://github.com/shanghai-edu/attribute-filter-policy.git
正克隆到 'attribute-filter-policy'...
remote: Enumerating objects: 10, done.
remote: Counting objects: 100% (10/10), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 10 (delta 1), reused 7 (delta 1), pack-reused 0
Unpacking objects: 100% (10/10), done.
[root@idp home]# 
```
### 尝试手动执行脚本
```
[root@idp conf]# /home/attribute-filter-policy/update_policy.sh     
Already up-to-date.
Configuration reloaded for 'shibboleth.AttributeFilterService'
```
应该会看到 `Configuration reloaded for 'shibboleth.AttributeFilterService'` 的提示

### 放入定时任务
```
15 3 * * * (/home/attribute-filter-policy/update_policy.sh) > /tmp/update_policy.log 2>&1
```

后续每天夜里应该都会自动同步策略了，也可以根据实际需要将定时任务的周期进一步放短或者放长。