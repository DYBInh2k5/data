--12.	Tìm đơn hang có tiền ship thấp nhất
select * 
from [order]
where shippingfee = (select min(shippingfee) from [Order])
--13.	Tìm doanh thu của từng người bán hang
select  o.SellerID, SellerName,sum(totalmoney) as doanhthu
from [order] o  join Seller s on o.SellerID = s.SellerID
group by o.SellerID,SellerName
--14.	Tìm doanh thu của từng người bang hang trong từng tháng

select  o.SellerID, SellerName,MONTH(o.orderdate) as thang ,year(o.orderdate) as nam,sum(totalmoney) as doanhthu
from [order] o  join Seller s on o.SellerID = s.SellerID
group by o.SellerID, SellerName,MONTH(o.orderdate), year(o.orderdate)

--15.	Tìm thu nhập của từng shipper

select o.ShipperID, ShipperName, sum(shippingfee) as thunhap
from [order] o  join Shipper s on o.ShipperID = s.ShipperID
group by o.ShipperID, ShipperName
--16.	Tìm thu nhập của từng shipper trong từng tháng

select o.ShipperID, ShipperName, MONTH(o.orderdate), year(o.orderdate), sum(shippingfee) as thunhap
from [order] o  join Shipper s on o.ShipperID = s.ShipperID
group by o.ShipperID, ShipperName,MONTH(o.orderdate), year(o.orderdate)
--17.	Tìm shipper có thu nhập <500000 trong tháng 1 năm 2021
select o.ShipperID, ShipperName, sum(shippingfee) as thunhap
from [order] o  join Shipper s on o.ShipperID = s.ShipperID
where MONTH(o.orderdate) =1 and year(o.orderdate)=2021
group by o.ShipperID, ShipperName
having sum(shippingfee) < 50000
--18.	Tìm ngưới mua hang nào đã chi tiền mua hang nhiều nhất

select top 1 with ties o.BuyerID, BuyerName, sum(shippingfee+totalmoney) as sotien
from [order] o  join Buyer s on o.buyerID = s.BuyerID
group by o.BuyerID, BuyerName
order by sotien desc
