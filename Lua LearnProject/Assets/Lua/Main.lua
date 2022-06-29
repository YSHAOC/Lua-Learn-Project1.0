print("准备就绪")
--初始化所有准备好的类别名
require("InitClass")


--初始化数据

--道具表信息
require("ItemData")
--玩家信息
--1.单机游戏 （从本地读取） 本地存储有几种方式 PlayerPrefs 和 Json 和 2进制
--2.网络游戏  (从服务器读取)
require("PlayerData")
PlayerData:Init()


--之后的逻辑可以直接使用
require("BasePanel")

require("MainPanel")
require("BagPanel")
require("ItemGrid")

MainPanel:ShowMe("MainPanel")