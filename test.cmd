mysql架构
	server 
		连接器
			连接管理/权限认证
			
			连接对象占用资源过多：
				定期断开长连接
				执行较大操作后，进行mysql_reset_connection
		查询缓存
			query_cache_type: 最好关闭，除非是某些数据配置db.
		分析器
			词法分析
			语法分析
		优化器
			对sql操作进行优化
		执行器
			权限校验
			访问引擎接口
	engine
		负责数据的存储和提取
		innodb/myisam/memory
mysql日志系统
	WAL: write ahead log 
		先写日志，后更新数据库
	redo-log　
		innodb层
		物理层
		环形日志
		write-pos/check-point 
		cash-safe: 即使崩溃，也能进行恢复
		设置innodb_flush_log_at_trx_commit=1,防止日志丢失
	binlog 
		server层
		逻辑层
		追加日志
		设置sync_binlog=1,防止日志丢失

	两阶段提交：
		1.先写redo-log, 进入prepare状态;
		2.然后写binlog
		3.提交事物，进入commit状态
	
		为了保证redo-log和binlog的逻辑一致，状态一致

		

		
		

