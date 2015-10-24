function WVADValue=WVAD(Open,High,Low,Close,Volume,Length)
%----------------此函数用来计算WVAD指标(威廉变异离散量)--------------------
%----------------------------------编写者--------------------------------
%Lian Xiangbin(连长,785674410@qq.com),DUFE,2014
%----------------------------------参考----------------------------------
%[1]百度百科.WVAD词条
%[2]MBA智库百科.WVAD词条
%[3]交易开拓者(TB).公式应用WVAD算法
%[4]同花顺.WVAD指标算法
%----------------------------------简介----------------------------------
%威廉变异离散量又称WVAD(William's Variable Accumulation Distribution)
%指标，由Larry Williams所创。是一种将成交量加权的量价指标。威廉变异离散
%量的主要的理论精髓，在于重视一天中开盘到收盘之间的价位，而将此区域之上的
%价位视为压力，区域之下的价位视为支撑，求取此区域占当天总波动的百分比，以
%便测量当天的成交量中，有多少属于此区域。成为实际有意义的交易量。如果区域
%之上的压力较大，将促使WVAD变成负值，代表卖方的实力强大，此时应该卖出持股。
%如果区域之下的支撑较大，将促使WVAD变成正值，代表买方的实力雄厚，此时应该
%买进股票。WVAD正负之间，强弱一线之隔。非常符合我们推广的东方哲学技术理论，
%由于模拟测试所选用的周期相当长,测试结果也以长周期成绩较佳。因此，建议长
%期投资者适合使用，如同EMV使用法则一样，应该在一定的投资期限内，不断的根
%据WVAD讯号将交易买卖，以求得统计盈亏概率的成果。
%----------------------------------基本用法------------------------------
%1)当WVAD由负值变成正值的一刹那，视为长期的买入点
%2)当WVAD由正值变面负值的一刹那，视为长期的获利点
%----------------------------------调用函数------------------------------
%WVADValue=WVAD(Open,High,Low,Close,Volume,Length)
%----------------------------------参数----------------------------------
%Open-开盘价序列
%High-最高价序列
%Low-最低价序列
%Close-收盘价序列
%Volume-成交量序列
%Length-考虑的周期，常用24个Bar
%----------------------------------输出----------------------------------
%WVADValue-威廉变异离散量

WVADValue=zeros(length(Open),1);
VADValue=(Close-Open)./(High-Low).*Volume;
VADValue(High<=Low)=0;
VADValue(VADValue==inf)=0;
WVADValue=MA(VADValue,Length)*Length/1000;
end

