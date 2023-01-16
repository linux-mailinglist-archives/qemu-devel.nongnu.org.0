Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65166B96E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLG7-0005yi-QU; Mon, 16 Jan 2023 03:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1pHLG3-0005xi-1H
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:54:23 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1pHLFz-0006Qk-Ek
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:54:22 -0500
Received: from dggpemm100005.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NwQlR1CnVzJrXP;
 Mon, 16 Jan 2023 16:52:51 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggpemm100005.china.huawei.com (7.185.36.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 16 Jan 2023 16:54:13 +0800
Received: from kwepemm600016.china.huawei.com ([7.193.23.20]) by
 kwepemm600016.china.huawei.com ([7.193.23.20]) with mapi id 15.01.2375.034;
 Mon, 16 Jan 2023 16:54:12 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wubin (H)"
 <wu.wubin@huawei.com>, "Chentao (Boby)" <boby.chen@huawei.com>, "Wanghaibin
 (D)" <wanghaibin.wang@huawei.com>, "Zhangbo (Oscar)"
 <oscar.zhangbo@huawei.com>, "limingwang (A)" <limingwang@huawei.com>, Wangyan
 <wangyan122@huawei.com>, lihuachao <lihuachao1@huawei.com>
Subject: =?gb2312?B?tPC4tDogW1FVRVNUSU9OXSBBYm91dCB2aXJ0aW8gYW5kIGV2ZW50bG9vcA==?=
Thread-Topic: [QUESTION] About virtio and eventloop
Thread-Index: AdkpcTID0pd8MGv+T9eTVpvXILZMZQAFpnOA
Date: Mon, 16 Jan 2023 08:54:12 +0000
Message-ID: <eaf8c15d60264be8b30842c0f62efdca@huawei.com>
References: <63b89ae069d644b897ea97cc41b030ab@huawei.com>
In-Reply-To: <63b89ae069d644b897ea97cc41b030ab@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.224]
Content-Type: multipart/alternative;
 boundary="_000_eaf8c15d60264be8b30842c0f62efdcahuaweicom_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=zhukeqian1@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  zhukeqian <zhukeqian1@huawei.com>
From:  zhukeqian via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_eaf8c15d60264be8b30842c0f62efdcahuaweicom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SSBmb3VuZCBibGtfZHJhaW4oKSBpcyBpbnZva2VkIGJ5IHZpcnRpb19ibGtfcmVzZXQoKSwgc28g
b25seSB0aGUgc2Vjb25kIHF1ZXN0aW9uIHJlbWFpbnMgOikuDQoNCreivP7Iyzogemh1a2VxaWFu
IDw+DQq3osvNyrG85DogMjAyM8TqMdTCMTbI1SAxNjoxOA0KytW8/sjLOiAnTWljaGFlbCBTLiBU
c2lya2luJyA8bXN0QHJlZGhhdC5jb20+OyAnU3RlZmFuIEhham5vY3ppJyA8c3RlZmFuaGFAcmVk
aGF0LmNvbT47ICdQZXRlciBNYXlkZWxsJyA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0Ks63L
zTogcWVtdS1kZXZlbEBub25nbnUub3JnOyBXdWJpbiAoSCkgPHd1Lnd1YmluQGh1YXdlaS5jb20+
OyBDaGVudGFvIChCb2J5KSA8Ym9ieS5jaGVuQGh1YXdlaS5jb20+OyBXYW5naGFpYmluIChEKSA8
d2FuZ2hhaWJpbi53YW5nQGh1YXdlaS5jb20+OyBaaGFuZ2JvIChPc2NhcikgPG9zY2FyLnpoYW5n
Ym9AaHVhd2VpLmNvbT47IGxpbWluZ3dhbmcgKEEpIDxsaW1pbmd3YW5nQGh1YXdlaS5jb20+OyBX
YW5neWFuIDx3YW5neWFuMTIyQGh1YXdlaS5jb20+OyBsaWh1YWNoYW8gPGxpaHVhY2hhbzFAaHVh
d2VpLmNvbT4NCtb3zOI6IFtRVUVTVElPTl0gQWJvdXQgdmlydGlvIGFuZCBldmVudGxvb3ANCg0K
SGkgYWxsIG1haW50YWluZXJzIGFuZCBjb21tdW5pdHkgZnJpZW5kcywNCg0KUmVjZW50bHkgSSBh
bSByZXZpZXdpbmcgYW5kIGxlYXJuaW5nIHRoZSB2aXJ0aW8gYW5kIGV2ZW50bG9vcCBpbXBsZW1l
bnRhdGlvbiBvZiBsYXRlc3QgUUVNVSwNCmFuZCBub3cgSSBoYXZlIGEgcXVlc3Rpb25zIGZvciBo
ZWxwOg0KDQpJbiBnZW5lcmFsLCB0aGUgSU8gcmVxdWVzdHMgb2YgdmlydGlvIGlzIHBvcHBlZCBp
biBpb3RocmVhZC9tYWlubG9vcCBhbmQgbWF5IHN1Ym1pdHRlZCB0byChsGFzeW5jIElPDQpFbmdp
bmWhsSAgKGlvX3VyaW5nL2xpbnV4IGFpby90aHJlYWRwb29sKS4gT25jZSB0aGUgSU8gb3BlcmF0
aW9uIGlzIGRvbmUsIHRoZSChsGFzeW5jIElPIGVuZ2luZaGxIHdpbGwgc2VuZCBub3RpZmljYXRp
b24NCnRvIGlvdGhyZWFkL21haW5sb29wIHRocm91Z2ggZXZlbmZkIG9yIGJvdHRvbWhhbGYsIGFu
ZCB0aGUgY29tcGxldGlvbiBhY3Rpb24gZm9yIHRoZSBJTyByZXF1ZXN0IChhZGQgdXNlZCByaW5n
IGFuZA0Kbm90aWZ5IGd1ZXN0KSBpcyBkb25lIGluIGlvdGhyZWFkL21haW5sb29wLg0KDQpBbmQg
bGV0oa9zIGxvb2sgYXQgdGhlIKGwZGVhY3RpdmWhsSBwcm9jZWR1cmUgb2YgdmlydGlvLXBjaSBk
ZXZpY2VzICh3aGVuIGd1ZXN0IHdyaXRlIDAgdG8gIGRldmljZSBzdGF0dXMgb3Igc3lzdGVtDQp0
cmlnZ2VyZWQgcmVzZXQpLCB0aGUgYmFzaWMgcmVxdWlyZW1lbnQgaXMgdGhhdCBkZXZpY2Ugc2hv
dWxkIHN0b3AgaGFuZGxpbmcgSU8gcmVxdWVzdHMgYW5kIGFjY2Vzc2luZyB2aXJ0cXVldWUgYmVm
b3JlDQpyZXR1cm5pbmcgYmFjayB0byBndWVzdCwgYXMgdGhlIGd1ZXN0IG1heSBkZXN0cm95IHZp
cnF1ZXVlICBvbmNlIGRlYWN0aXZhdGlvbiBpcyBkb25lLg0KDQpRRU1VIGludm9rZXMgc3RvcF9p
b2V2ZW50ZmQoKSBjYWxsYmFjayB0byBwZXJmb3JtIGFib3ZlIGFjdGlvbnMuIEl0IHVucmVnaXN0
ZXJzIGlvZXZlbnRmZCBmcm9tIGV2ZW50bG9vcCBhbmQgS1ZNLA0KDQogIDEuICBidXQgSSBjYW6h
r3QgZmluZCBjb2RlIHRoYXQgZW5zdXJpbmcgSU8gb3BlcmF0aW9ucyBpbiChsGFzeW5jIElPIGVu
Z2luZaGxIGFyZSBkb25lLg0KICAyLiAgQW5kIGlmIElPIG9wZXJhdGlvbiBpcyBibG9ja2VkLCBp
cyB2Q1BVIHRocmVhZCB3aWxsIGJsb2NrZWQgd2hlbiBkbyBkZWFjdGl2YXRlPw0KDQpJdKGvcyBn
cmVhdCB0aGF0IGlmIGFueW9uZSBjYW4gaGVscCENCg0KVGhhbmtzLA0KS2VxaWFuDQo=

--_000_eaf8c15d60264be8b30842c0f62efdcahuaweicom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:136798337;
	mso-list-type:hybrid;
	mso-list-template-ids:-679561616 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:497497949;
	mso-list-template-ids:783564272;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I found blk_drain() is invoked by virtio_blk_reset()=
, so only the second question remains :).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><b><span la=
ng=3D"ZH-CN" style=3D"font-family:=B5=C8=CF=DF">=B7=A2=BC=FE=C8=CB</span></=
b><b><span style=3D"font-family:=B5=C8=CF=DF">:</span></b><span style=3D"fo=
nt-family:=B5=C8=CF=DF"> zhukeqian &lt;&gt;
<br>
<b><span lang=3D"ZH-CN">=B7=A2=CB=CD=CA=B1=BC=E4</span>:</b> 2023<span lang=
=3D"ZH-CN">=C4=EA</span>1<span lang=3D"ZH-CN">=D4=C2</span>16<span lang=3D"=
ZH-CN">=C8=D5</span> 16:18<br>
<b><span lang=3D"ZH-CN">=CA=D5=BC=FE=C8=CB</span>:</b> 'Michael S. Tsirkin'=
 &lt;mst@redhat.com&gt;; 'Stefan Hajnoczi' &lt;stefanha@redhat.com&gt;; 'Pe=
ter Maydell' &lt;peter.maydell@linaro.org&gt;<br>
<b><span lang=3D"ZH-CN">=B3=AD=CB=CD</span>:</b> qemu-devel@nongnu.org; Wub=
in (H) &lt;wu.wubin@huawei.com&gt;; Chentao (Boby) &lt;boby.chen@huawei.com=
&gt;; Wanghaibin (D) &lt;wanghaibin.wang@huawei.com&gt;; Zhangbo (Oscar) &l=
t;oscar.zhangbo@huawei.com&gt;; limingwang (A) &lt;limingwang@huawei.com&gt=
;;
 Wangyan &lt;wangyan122@huawei.com&gt;; lihuachao &lt;lihuachao1@huawei.com=
&gt;<br>
<b><span lang=3D"ZH-CN">=D6=F7=CC=E2</span>:</b> [QUESTION] About virtio an=
d eventloop<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><o:p>&nbsp;=
</o:p></p>
<p class=3D"MsoNormal">Hi all maintainers and community friends,<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Recently I am reviewing and learning the virtio and =
eventloop implementation of latest QEMU,<o:p></o:p></p>
<p class=3D"MsoNormal">and now I have a questions for help:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In general, the IO requests of virtio is popped in i=
othread/mainloop and may submitted to =A1=B0async IO<o:p></o:p></p>
<p class=3D"MsoNormal">Engine=A1=B1 &nbsp;(io_uring/linux aio/threadpool). =
Once the IO operation is done, the =A1=B0async IO engine=A1=B1 will send no=
tification<o:p></o:p></p>
<p class=3D"MsoNormal">to iothread/mainloop through evenfd or bottomhalf, a=
nd the completion action for the IO request (add used ring and<o:p></o:p></=
p>
<p class=3D"MsoNormal">notify guest) is done in iothread/mainloop.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And let=A1=AFs look at the =A1=B0deactive=A1=B1 proc=
edure of virtio-pci devices (when guest write 0 to &nbsp;device status or s=
ystem<o:p></o:p></p>
<p class=3D"MsoNormal">triggered reset), the basic requirement is that devi=
ce should stop handling IO requests and accessing virtqueue before<o:p></o:=
p></p>
<p class=3D"MsoNormal">returning back to guest, as the guest may destroy vi=
rqueue &nbsp;once deactivation is done.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">QEMU invokes stop_ioeventfd() callback to perform ab=
ove actions. It unregisters ioeventfd from eventloop and KVM,<o:p></o:p></p=
>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo3">but I can=A1=AFt find code that ensuring
<b>IO operations in =A1=B0async IO engine=A1=B1</b> are done.&nbsp;&nbsp; <=
o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-=
list:l0 level1 lfo3">And if IO operation is blocked, is vCPU thread will bl=
ocked when do deactivate?<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It=A1=AFs great that if anyone can help!<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">Keqian<o:p></o:p></p>
</div>
</body>
</html>

--_000_eaf8c15d60264be8b30842c0f62efdcahuaweicom_--

