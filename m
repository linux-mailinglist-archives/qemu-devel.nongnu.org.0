Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF53510AF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:14:15 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsT0-0007H6-Du
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <FelixCui-oc@zhaoxin.com>)
 id 1lRsQo-0004Rl-MP
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:11:58 -0400
Received: from zxshcas2.zhaoxin.com ([203.148.12.82]:12431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <FelixCui-oc@zhaoxin.com>)
 id 1lRsQk-0006eY-DT
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:11:58 -0400
Received: from zxbjmbx3.zhaoxin.com (10.29.252.165) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 1 Apr 2021
 16:04:33 +0800
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by zxbjmbx3.zhaoxin.com
 (10.29.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 1 Apr 2021
 16:04:32 +0800
Received: from zxbjmbx1.zhaoxin.com ([fe80::290a:f538:51e7:1416]) by
 zxbjmbx1.zhaoxin.com ([fe80::290a:f538:51e7:1416%16]) with mapi id
 15.01.2176.009; Thu, 1 Apr 2021 16:04:32 +0800
From: FelixCui-oc <FelixCui-oc@zhaoxin.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Richard Henderson <rth@twiddle.net>, "Eduardo
 Habkost" <ehabkost@redhat.com>, Alex Williamson <alex.williamson@redhat.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIDEvMV0gUmVtb3ZlIGZsYXR2aWV3X3NpbXBsaWZ5KCk=?=
Thread-Topic: [PATCH 1/1] Remove flatview_simplify()
Thread-Index: AQHXJJUNmWq7+sXgIEGGyENb7EfoE6qcNZEAgAAApICAAxkv0Q==
Date: Thu, 1 Apr 2021 08:04:32 +0000
Message-ID: <85fd1a6ae5914aa8b211ba1448c505d6@zhaoxin.com>
References: <20210329121408.17862-1-FelixCui-oc@zhaoxin.com>
 <20210329121408.17862-2-FelixCui-oc@zhaoxin.com>
 <68af8e22-0380-8459-64c9-cbc5051cd04a@linaro.org>,
 <9deccead-1590-0fe3-3c91-9bc6958484c9@redhat.com>
In-Reply-To: <9deccead-1590-0fe3-3c91-9bc6958484c9@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.28.252.238]
Content-Type: multipart/alternative;
 boundary="_000_85fd1a6ae5914aa8b211ba1448c505d6zhaoxincom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=203.148.12.82;
 envelope-from=FelixCui-oc@zhaoxin.com; helo=ZXSHCAS2.zhaoxin.com
X-Spam_score_int: 38
X-Spam_score: 3.8
X-Spam_bar: +++
X-Spam_report: (3.8 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45, SPF_HELO_NONE=0.001,
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
Cc: RaymondPang-oc <RaymondPang-oc@zhaoxin.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "CobeChen-oc@zhaoxin.com" <CobeChen-oc@zhaoxin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_85fd1a6ae5914aa8b211ba1448c505d6zhaoxincom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

PlRoYXQgc2FpZCwgcGVyaGFwcyBpdCdzIGJldHRlciB0byBrZWVwIHRoZSBzaW1wbGlmaWNhdGlv
biB3aXRoaW4gYQ0KPnBhZ2Utc2l6ZWQgcmFuZ2UsIHRvIGF2b2lkIGludHJvZHVjaW5nIHN1YnBh
Z2VzIHVubmVjZXNzYXJpbHkuDQoNCg0KaGkgIHBhb2xvLA0KDQogICAgICAgICAgICAgICBUaGUg
c2l6ZXMgb2YgYWxsIGZsYXRyYW5nZXMgbWVyZ2VkIGJ5IGZsYXR2aWV3X3NpbXBsaWZ5KCkgYXJl
IHBhZ2UgYWxpZ25lZC4NCg0KICAgICAgICAgICAgICAgIEZsYXR2aWV3X3NpbXBsaWZ5KCkgc2Vl
bXMgdG8gaGF2ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZG8gc29tZSBtZXJnaW5nIGFjdGlvbnMgb25s
eSB3aGVuDQoNCiAgICAgICAgICAgICAgICBzdGFydGluZyB0aGUgdmlydHVhbCBtYWNoaW5lLg0K
DQogICAgICAgICAgICAgICAgV2UgY2FuIHRlbXBvcmFyaWx5IHJlbW92ZSBmbGF0dmlld19zaW1w
bGlmeSgpLg0KDQoNClRoYW5rcw0KDQpGZWxpeGN1aQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0Kt6K8/sjLOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0K
t6LLzcqxvOQ6IDIwMjHE6jPUwjMxyNUgMDozNTo0OQ0KytW8/sjLOiBSaWNoYXJkIEhlbmRlcnNv
bjsgRmVsaXhDdWktb2M7IFJpY2hhcmQgSGVuZGVyc29uOyBFZHVhcmRvIEhhYmtvc3Q7IEFsZXgg
V2lsbGlhbXNvbg0Ks63LzTogUmF5bW9uZFBhbmctb2M7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsg
Q29iZUNoZW4tb2NAemhhb3hpbi5jb20NCtb3zOI6IFJlOiBbUEFUQ0ggMS8xXSBSZW1vdmUgZmxh
dHZpZXdfc2ltcGxpZnkoKQ0KDQpPbiAzMC8wMy8yMSAxODozMywgUmljaGFyZCBIZW5kZXJzb24g
d3JvdGU6DQo+DQo+PiBGbGF0dmlld19zaW1wbGlmeSgpIGNhbiBtZXJnZSBtYW55IHNtYWxsIG1l
bW9yeSByYW5nZXMNCj4+IGludG8gYSBsYXJnZSBvbmUgYW5kIGNvbnRhaW5zIEVIQ0kgZG1hIGJ1
ZmZlcnMuDQo+PiBGb3IgZXhhbXBsZSx0aGUgbWVyZ2VkIHJhbmdlIG1heWJlMHhjMDAwMC0weGJm
ZmZmZmZmLg0KPj4gV2hlbiBzZWFiaW9zIHdyaXRlIFBBTSByZWdpc3RlciB0byBjaGFuZ2UgdGhl
IHByb3BlcnRpZXMNCj4+IG9mIHBhcnQgb2YgdGhlIG1lcmdlZCByYW5nZSBmcm9tIFJXIHRvIHJl
YWRvbmx5LA0KPj4gdGhpcyBhY3Rpb24gY2F1c2UgdGhlIG1lcmdlZCBJT1ZBIG1hcHBpbmcgd2ls
bCBiZQ0KPj4gdW5tYXBwZWQuQnV0IEVIQ0kgZGV2aWNlIHN0aWxsIHNlbmQgRE1BIGN5Y2xlcw0K
Pj4gYW5kIHRoZW4gSU9NTVUgYmxvY2tzIHRoZSBETUEgY3ljbGVzIG9mIEVIQ0kgZGV2aWNlLg0K
Pg0KPiBZb3UndmUgZGVzY3JpYmVkIHRoZSBwcm9ibGVtLCBhbmQgaXQgaXMgcXVpdGUgb2J2aW91
c2x5ICpub3QqIGluIG1lbW9yeS5jLg0KDQpXZWxsLCBzb3J0IG9mLg0KDQpUaGUgcHJvYmxlbSBp
cyB0aGF0IG5laXRoZXIgVkZJTyBub3IgS1ZNIHN1cHBvcnQgYXRvbWljYWxseSBzd2l0Y2hpbmcN
CnRoZSBtZW1vcnkgbWFwLiAgRm9yIEtWTSB0aGF0IHdvdWxkIGJlIHBvc3NpYmxlLCBmb3IgVkZJ
TyBiYXNlZCBvbiBwYXN0DQpkaXNjdXNzaW9uIGl0IHdvdWxkIGJlIG11Y2ggaGFyZGVyLiAgUmVt
b3ZpbmcgZmxhdHZpZXdfc2ltcGxpZnkoKSBzZWVtcw0KdG8gYmUgdGhlIGVhc2llc3Qgd2F5IHRv
IGJ5cGFzcyB0aGUgaXNzdWUuDQoNClRoYXQgc2FpZCwgcGVyaGFwcyBpdCdzIGJldHRlciB0byBr
ZWVwIHRoZSBzaW1wbGlmaWNhdGlvbiB3aXRoaW4gYQ0KcGFnZS1zaXplZCByYW5nZSwgdG8gYXZv
aWQgaW50cm9kdWNpbmcgc3VicGFnZXMgdW5uZWNlc3NhcmlseS4NCg0KUGFvbG8NCg0K

--_000_85fd1a6ae5914aa8b211ba1448c505d6zhaoxincom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">&gt;That said, perh=
aps it's better to keep the simplification within a&nbsp;</span><br style=
=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI&quot;,&quot;M=
icrosoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=CC=E5,sans-seri=
f,serif,EmojiFont; font-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI&qu=
ot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=CC=
=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">&gt;page-sized range, =
to avoid introducing subpages unnecessarily.</span><br>
</p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px"><br>
</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">hi&nbsp; paolo,</sp=
an></p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;The sizes of all flatranges merged by f=
latview_simplify() are page aligned.</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Flatview_simplify() seems to have the =
opportunity to do some merging actions only when&nbsp;</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; starting the virtual machine.</span></=
p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; We can temporarily remove flatview_sim=
plify().</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px"><br>
</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">Thanks</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:&quot;Microsoft YaHei UI=
&quot;,&quot;Microsoft YaHei&quot;,=CE=A2=C8=ED=D1=C5=BA=DA,SimSun,=CB=CE=
=CC=E5,sans-serif,serif,EmojiFont; font-size:13.3333px">Felixcui</span></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Paolo=
 Bonzini &lt;pbonzini@redhat.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2021=C4=EA3=D4=C231=C8=D5 0:35:49<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Richard Henderson; FelixCui-oc; Richard Henderso=
n; Eduardo Habkost; Alex Williamson<br>
<b>=B3=AD=CB=CD:</b> RaymondPang-oc; qemu-devel@nongnu.org; CobeChen-oc@zha=
oxin.com<br>
<b>=D6=F7=CC=E2:</b> Re: [PATCH 1/1] Remove flatview_simplify()</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On 30/03/21 18:33, Richard Henderson wrote:<br>
&gt; <br>
&gt;&gt; Flatview_simplify() can merge many small memory ranges<br>
&gt;&gt; into a large one and contains EHCI dma buffers.<br>
&gt;&gt; For example,the merged range maybe0xc0000-0xbfffffff.<br>
&gt;&gt; When seabios write PAM register to change the properties<br>
&gt;&gt; of part of the merged range from RW to readonly,<br>
&gt;&gt; this action cause the merged IOVA mapping will be<br>
&gt;&gt; unmapped.But EHCI device still send DMA cycles<br>
&gt;&gt; and then IOMMU blocks the DMA cycles of EHCI device.<br>
&gt; <br>
&gt; You've described the problem, and it is quite obviously *not* in memor=
y.c.<br>
<br>
Well, sort of.<br>
<br>
The problem is that neither VFIO nor KVM support atomically switching <br>
the memory map.&nbsp; For KVM that would be possible, for VFIO based on pas=
t <br>
discussion it would be much harder.&nbsp; Removing flatview_simplify() seem=
s <br>
to be the easiest way to bypass the issue.<br>
<br>
That said, perhaps it's better to keep the simplification within a <br>
page-sized range, to avoid introducing subpages unnecessarily.<br>
<br>
Paolo<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_85fd1a6ae5914aa8b211ba1448c505d6zhaoxincom_--

