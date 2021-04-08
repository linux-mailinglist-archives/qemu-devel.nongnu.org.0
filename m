Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECE357EB4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:07:37 +0200 (CEST)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQdU-0007rt-4Z
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.chen@h3c.com>) id 1lUQba-0006Xk-1L
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:05:38 -0400
Received: from smtp.h3c.com ([60.191.123.50]:50394 helo=h3cspam02-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.chen@h3c.com>) id 1lUQbU-0001oF-J2
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:05:37 -0400
Received: from DAG2EX07-IDC.srv.huawei-3com.com ([10.8.0.70])
 by h3cspam02-ex.h3c.com with ESMTP id 13894tcP034367
 for <qemu-devel@nongnu.org>; Thu, 8 Apr 2021 17:04:55 +0800 (GMT-8)
 (envelope-from yu.chen@h3c.com)
Received: from DAG2EX10-IDC.srv.huawei-3com.com (10.8.0.73) by
 DAG2EX07-IDC.srv.huawei-3com.com (10.8.0.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 17:04:58 +0800
Received: from DAG2EX10-IDC.srv.huawei-3com.com ([fe80::e886:502d:5063:7e2b])
 by DAG2EX10-IDC.srv.huawei-3com.com ([fe80::e886:502d:5063:7e2b%9])
 with mapi id 15.01.2106.013; Thu, 8 Apr 2021 17:04:58 +0800
From: Yuchen <yu.chen@h3c.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [Qemu-devel][bug] qemu crash when migrate vm and vm's disks
Thread-Topic: [Qemu-devel][bug] qemu crash when migrate vm and vm's disks
Thread-Index: AdcsVGVK04cIqUNMSOKFUq4aiukiMg==
Date: Thu, 8 Apr 2021 09:04:58 +0000
Message-ID: <9cd6ccabceff42f9afbaed917f77c9b2@h3c.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.99.190.44]
x-sender-location: DAG2
Content-Type: multipart/alternative;
 boundary="_000_9cd6ccabceff42f9afbaed917f77c9b2h3ccom_"
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 13894tcP034367
Received-SPF: pass client-ip=60.191.123.50; envelope-from=yu.chen@h3c.com;
 helo=h3cspam02-ex.h3c.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 MIME_CHARSET_FARAWAY=2.45, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_9cd6ccabceff42f9afbaed917f77c9b2h3ccom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

V2hlbiBtaWdyYXRlIHZtIGFuZCB2baGvcyBkaXNrcyB0YXJnZXQgaG9zdCBxZW11IGNyYXNoIGR1
ZSB0byBhbiBpbnZhbGlkIGZyZWUuDQoNCiMwICBvYmplY3RfdW5yZWYgKG9iaj0weDEwMDApIGF0
IC9xZW11LTIuMTIvcnBtYnVpbGQvQlVJTEQvcWVtdS0yLjEyL3FvbS9vYmplY3QuYzo5MjANCiMx
ICAweDAwMDA1NjA0MzRkNzllNzkgaW4gbWVtb3J5X3JlZ2lvbl91bnJlZiAobXI9PG9wdGltaXpl
ZCBvdXQ+KQ0KICAgIGF0IC9xZW11LTIuMTIvcnBtYnVpbGQvQlVJTEQvcWVtdS0yLjEyL21lbW9y
eS5jOjE3MzANCiMyICBmbGF0dmlld19kZXN0cm95ICh2aWV3PTB4NTYwNDM5NjUzODgwKSBhdCAv
cWVtdS0yLjEyL3JwbWJ1aWxkL0JVSUxEL3FlbXUtMi4xMi9tZW1vcnkuYzoyOTINCiMzICAweDAw
MDA1NjA0MzUxNGRmYmUgaW4gY2FsbF9yY3VfdGhyZWFkIChvcGFxdWU9PG9wdGltaXplZCBvdXQ+
KQ0KICAgIGF0IC9xZW11LTIuMTIvcnBtYnVpbGQvQlVJTEQvcWVtdS0yLjEyL3V0aWwvcmN1LmM6
Mjg0DQojNCAgMHgwMDAwN2ZiYzJiMzZmZTI1IGluIHN0YXJ0X3RocmVhZCAoKSBmcm9tIC9saWI2
NC9saWJwdGhyZWFkLnNvLjANCiM1ICAweDAwMDA3ZmJjMmIwOTliYWQgaW4gY2xvbmUgKCkgZnJv
bSAvbGliNjQvbGliYy5zby42DQoNCnRlc3QgYmFzZSBxZW11LTIuMTIuMKOsYnV0IHVzZSBsYXN0
ZXN0IHFlbXUodjYuMC4wLXJjMikgYWxzbyByZXByb2R1Y2UuDQpBcyBmb2xsb3cgcGF0Y2ggY2Fu
IHJlc29sdmUgdGhpcyBwcm9ibGVtOg0KaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRt
bC9xZW11LWRldmVsLzIwMTgtMDcvbXNnMDIyNzIuaHRtbA0KDQpTdGVwcyB0byByZXByb2R1Y2U6
DQooMSkgQ3JlYXRlIFZNICh2aXJzaCBkZWZpbmUpDQooMikgQWRkIDY0IHZpcnRpbyBzY3NpIGRp
c2tzDQooMykgbWlncmF0ZSB2bSBhbmQgdm2hr2Rpc2tzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQqx
vtPKvP68sMbkuL28/rqs09DQwruqyP28r83FtcSxo8Pc0MXPoqOsvfbP3tPat6LLzbj4yc/D5rXY
1rfW0MHQs/YNCrXEuPbIy7vyyLrX6aGjvfvWucjOus7G5Mv7yMvS1MjOus7Qzsq9yrnTw6OosPzA
qLWrsrvP3tPayKuyv7vysr+31rXY0LnCtqGiuLTWxqGiDQq78smit6KjqbG+08q8/tbQtcTQxc+i
oaPI57n7xPq07crVwcuxvtPKvP6jrMfrxPrBory0tee7sLvy08q8/s2o1qq3orz+yMuyosm+s/2x
vg0K08q8/qOhDQpUaGlzIGUtbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlk
ZW50aWFsIGluZm9ybWF0aW9uIGZyb20gTmV3IEgzQywgd2hpY2ggaXMNCmludGVuZGVkIG9ubHkg
Zm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3ZlLiBB
bnkgdXNlIG9mIHRoZQ0KaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbiBpbiBhbnkgd2F5IChp
bmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZCB0bywgdG90YWwgb3IgcGFydGlhbA0KZGlzY2xvc3Vy
ZSwgcmVwcm9kdWN0aW9uLCBvciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4g
dGhlIGludGVuZGVkDQpyZWNpcGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlcg0KYnkgcGhvbmUg
b3IgZW1haWwgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSBpdCENCg==

--_000_9cd6ccabceff42f9afbaed917f77c9b2h3ccom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=CE=A2=C8=ED=D1=C5=BA=DA;
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@=CE=A2=C8=ED=D1=C5=BA=DA";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{mso-style-type:export-only;
	text-align:justify;
	text-justify:inter-ideograph;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">When migrate vm and vm=
=A1=AFs disks target host qemu crash due to an invalid free.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">#0&nbsp; object_unref (=
obj=3D0x1000) at /qemu-2.12/rpmbuild/BUILD/qemu-2.12/qom/object.c:920<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">#1&nbsp; 0x0000560434d7=
9e79 in memory_region_unref (mr=3D&lt;optimized out&gt;)<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">&nbsp;&nbsp;&nbsp; at /=
qemu-2.12/rpmbuild/BUILD/qemu-2.12/memory.c:1730<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">#2&nbsp; flatview_destr=
oy (view=3D0x560439653880) at /qemu-2.12/rpmbuild/BUILD/qemu-2.12/memory.c:=
292<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">#3&nbsp; 0x000056043514=
dfbe in call_rcu_thread (opaque=3D&lt;optimized out&gt;)<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">&nbsp;&nbsp;&nbsp; at /=
qemu-2.12/rpmbuild/BUILD/qemu-2.12/util/rcu.c:284<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">#4&nbsp; 0x00007fbc2b36=
fe25 in start_thread () from /lib64/libpthread.so.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">#5&nbsp; 0x00007fbc2b09=
9bad in clone () from /lib64/libc.so.6<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">test base qemu-2.12.0</=
span><span style=3D"font-family:&quot;=CE=A2=C8=ED=D1=C5=BA=DA&quot;,sans-s=
erif;color:black">=A3=AC<span lang=3D"EN-US">but use lastest qemu(v6.0.0-rc=
2) also reproduce.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">As follow patch can res=
olve this problem:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black"><a href=3D"https://list=
s.gnu.org/archive/html/qemu-devel/2018-07/msg02272.html">https://lists.gnu.=
org/archive/html/qemu-devel/2018-07/msg02272.html</a>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">Steps to reproduce:<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">(1) Create VM (virsh de=
fine)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">(2) Add 64 virtio scsi =
disks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">(3) migrate vm and vm=
=A1=AFdisks<o:p></o:p></span></p>
</div>
<span style=3D"font-size:7.5pt;font-family:=BB=AA=CE=C4=CF=B8=BA=DA;color:g=
ray"><span lang=3D"EN-US">-------------------------------------------------=
---------------------------------------------------------------------------=
---------<br>
</span>=B1=BE=D3=CA=BC=FE=BC=B0=C6=E4=B8=BD=BC=FE=BA=AC=D3=D0=D0=C2=BB=AA=
=C8=FD=BC=AF=CD=C5=B5=C4=B1=A3=C3=DC=D0=C5=CF=A2=A3=AC=BD=F6=CF=DE=D3=DA=B7=
=A2=CB=CD=B8=F8=C9=CF=C3=E6=B5=D8=D6=B7=D6=D0=C1=D0=B3=F6<span lang=3D"EN-U=
S"><br>
</span>=B5=C4=B8=F6=C8=CB=BB=F2=C8=BA=D7=E9=A1=A3=BD=FB=D6=B9=C8=CE=BA=CE=
=C6=E4=CB=FB=C8=CB=D2=D4=C8=CE=BA=CE=D0=CE=CA=BD=CA=B9=D3=C3=A3=A8=B0=FC=C0=
=A8=B5=AB=B2=BB=CF=DE=D3=DA=C8=AB=B2=BF=BB=F2=B2=BF=B7=D6=B5=D8=D0=B9=C2=B6=
=A1=A2=B8=B4=D6=C6=A1=A2<span lang=3D"EN-US"><br>
</span>=BB=F2=C9=A2=B7=A2=A3=A9=B1=BE=D3=CA=BC=FE=D6=D0=B5=C4=D0=C5=CF=A2=
=A1=A3=C8=E7=B9=FB=C4=FA=B4=ED=CA=D5=C1=CB=B1=BE=D3=CA=BC=FE=A3=AC=C7=EB=C4=
=FA=C1=A2=BC=B4=B5=E7=BB=B0=BB=F2=D3=CA=BC=FE=CD=A8=D6=AA=B7=A2=BC=FE=C8=CB=
=B2=A2=C9=BE=B3=FD=B1=BE<span lang=3D"EN-US"><br>
</span>=D3=CA=BC=FE=A3=A1<span lang=3D"EN-US"><br>
</span></span><span lang=3D"EN-US" style=3D"font-size:7.5pt;font-family:&qu=
ot;Arial&quot;,&quot;sans-serif&quot;;color:gray">This e-mail and its attac=
hments contain confidential information from New H3C, which is
<br>
intended only for the person or entity whose address is listed above. Any u=
se of the
<br>
information contained herein in any way (including, but not limited to, tot=
al or partial
<br>
disclosure, reproduction, or dissemination) by persons other than the inten=
ded <br>
recipient(s) is prohibited. If you receive this e-mail in error, please not=
ify the sender
<br>
by phone or email immediately and delete it!</span>
</body>
</html>

--_000_9cd6ccabceff42f9afbaed917f77c9b2h3ccom_--

