Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6992B0094
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:53:00 +0100 (CET)
Received: from localhost ([::1]:40658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd7Pf-0000Yz-8b
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <RockCui-oc@zhaoxin.com>)
 id 1kd7Nr-00087C-LP
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:51:07 -0500
Received: from zxshcas1.zhaoxin.com ([203.148.12.81]:32249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <RockCui-oc@zhaoxin.com>)
 id 1kd7Nm-0008Tl-1U
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:51:07 -0500
Received: from zxbjmbx2.zhaoxin.com (10.29.252.164) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 12 Nov
 2020 15:29:25 +0800
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by zxbjmbx2.zhaoxin.com
 (10.29.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 12 Nov
 2020 15:29:25 +0800
Received: from zxbjmbx1.zhaoxin.com ([fe80::290a:f538:51e7:1416]) by
 zxbjmbx1.zhaoxin.com ([fe80::290a:f538:51e7:1416%16]) with mapi id
 15.01.1979.003; Thu, 12 Nov 2020 15:29:24 +0800
From: RockCui-oc <RockCui-oc@zhaoxin.com>
To: John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBpZGU6ZG8gbm90aGluZyBmb3IgaWRlbnRpZnkgY21k?=
 =?gb2312?Q?_if_no_any_device_attached?=
Thread-Topic: [PATCH] ide:do nothing for identify cmd if no any device attached
Thread-Index: AQHWdEfWn1VcMPOnkU+PO9h+3wgKR6lVN70AgAEW7ACALil7gIBAKUvr
Date: Thu, 12 Nov 2020 07:29:24 +0000
Message-ID: <306775bc63c3417fba11fd93a53e3d32@zhaoxin.com>
References: <20200817033803.14014-1-RockCui-oc@zhaoxin.com>
 <8dbcc856-879a-af83-1a76-a2a875da3699@redhat.com>
 <0347935f-5235-3c61-07cc-fb4435ec45d1@redhat.com>,
 <3fc6d5fa-c305-606a-5e8f-23e90eadd588@redhat.com>
In-Reply-To: <3fc6d5fa-c305-606a-5e8f-23e90eadd588@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.29.8.17]
Content-Type: multipart/alternative;
 boundary="_000_306775bc63c3417fba11fd93a53e3d32zhaoxincom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=203.148.12.81;
 envelope-from=RockCui-oc@zhaoxin.com; helo=ZXSHCAS1.zhaoxin.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 02:29:27
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Cobe Chen\(BJ-RD\)" <CobeChen@zhaoxin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_306775bc63c3417fba11fd93a53e3d32zhaoxincom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgYWxso6wNCg0KDQpBbnkgc3VnZ2VzdGlvbnMgZm9yIHRoaXMgcGF0Y2ijvw0KDQpSb2NrDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IEpvaG4gU25vdyA8anNu
b3dAcmVkaGF0LmNvbT4NCreiy83KsbzkOiAyMDIwxOoxMNTCM8jVIDM6MzcNCsrVvP7IyzogTWF4
IFJlaXR6OyBSb2NrQ3VpLW9jOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCrOty806IFBldGVyIE1h
eWRlbGw7IENvYmUgQ2hlbihCSi1SRCkNCtb3zOI6IFJlOiBbUEFUQ0hdIGlkZTpkbyBub3RoaW5n
IGZvciBpZGVudGlmeSBjbWQgaWYgbm8gYW55IGRldmljZSBhdHRhY2hlZA0KDQpPbiA5LzMvMjAg
Njo0MCBBTSwgTWF4IFJlaXR6IHdyb3RlOg0KPiBPbiAwMi4wOS4yMCAyMDowMiwgSm9obiBTbm93
IHdyb3RlOg0KPj4gKENDIE1heCBmb3IgYmxvY2sgYmFja2VuZCBtb2RlbCBjb25mdXNpb24sIHNl
ZSBiZWxvdykNCj4+DQo+PiBPbiA4LzE2LzIwIDExOjM4IFBNLCB6aGFveGluXFJvY2tDdWlvYyB3
cm90ZToNCj4+PiBUaGlzIHBhdGNoIGlzIGZvciBhdm9pZGluZyB3aW43IElERSBkcml2ZXIgcG9s
bGluZyAweDFmNyB3aGVuDQo+Pj4gbm8gYW55IGRldmljZSBhdHRhY2hlZC4gRHVyaW5nIFdpbjcg
Vk0gYm9vdCBwcm9jZWR1cmUsIGlmIHVzZSB2aXJ0aW8gZm9yDQo+Pj4gZGlzayBhbmQgdGhlcmUg
aXMgbm8gYW55IGRldmljZSBiZSBhdHRhY2hlZCBvbiBoZGEgJiBoZGIsIHRoZSB3aW43IElERQ0K
Pj4+IGRyaXZlcg0KPj4+IHdvdWxkIHBvbGwgMHgxZjcgZm9yIGEgd2hpbGUuIFRoaXMgYWN0aW9u
IG1heSBiZSBzdG9wIHdpbmRvd3MgTE9HTw0KPj4+IGF0b21pYyBmb3INCj4+PiBhIHdoaWxlIHRv
byBvbiBhIHBvb3IgcGVyZm9ybWFuY2UgQ1BVLg0KPj4+DQo+Pg0KPj4gQSBmZXcgcXVlc3Rpb25z
Og0KPj4NCj4+ICgxKSBIb3cgc2xvdyBpcyB0aGUgcHJvYmluZz8NCj4+DQo+PiAoMikgSWYgdGhl
cmUgYXJlIG5vIGRldmljZXMgYXR0YWNoZWQsIHdoeSBkb24ndCB5b3UgcmVtb3ZlIHRoZSBJREUN
Cj4+IGNvbnRyb2xsZXIgc28gdGhhdCBXaW5kb3dzIGRvZXNuJ3QgaGF2ZSB0byBwcm9iZSBpdD8N
Cj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogemhhb3hpblxSb2NrQ3Vpb2MgPFJvY2tDdWktb2NAemhh
b3hpbi5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgaHcvaWRlL2NvcmUuYyB8IDUgKysrLS0NCj4+PiAg
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+DQo+
Pj4gZGlmZiAtLWdpdCBhL2h3L2lkZS9jb3JlLmMgYi9ody9pZGUvY29yZS5jDQo+Pj4gaW5kZXgg
ZDk5N2E3OGU0Ny4uMjZkODZmNGI0MCAxMDA2NDQNCj4+PiAtLS0gYS9ody9pZGUvY29yZS5jDQo+
Pj4gKysrIGIvaHcvaWRlL2NvcmUuYw0KPj4+IEBAIC0yMDczLDggKzIwNzMsOSBAQCB2b2lkIGlk
ZV9leGVjX2NtZChJREVCdXMgKmJ1cywgdWludDMyX3QgdmFsKQ0KPj4+ICAgICAgICBzID0gaWRl
YnVzX2FjdGl2ZV9pZihidXMpOw0KPj4+ICAgICAgICB0cmFjZV9pZGVfZXhlY19jbWQoYnVzLCBz
LCB2YWwpOw0KPj4+ICAgIC0gICAgLyogaWdub3JlIGNvbW1hbmRzIHRvIG5vbiBleGlzdGVudCBz
bGF2ZSAqLw0KPj4+IC0gICAgaWYgKHMgIT0gYnVzLT5pZnMgJiYgIXMtPmJsaykgew0KPg0KPiAo
V2FzIHRoZSBmaXJzdCBvbmUgYmFzaWNhbGx5IG1lYW50IHRvIGJlIKGwcyAhPSAmYnVzLT5pZnNb
MF2hsSwgaS5lLiB0bw0KPiBjaGVjayB0aGF0IHRoaXMgZG9lc26hr3QgZ28gdG8gdGhlIG1hXlcg
cHJpbWFyeT8gIE5vdCB0b28gb2J2aW91cy4pDQo+DQoNClllYWgsIEkgdGhpbmsgaXQgd2FzIG1l
YW50IHRvIHNheToNCg0KaWYgKHMgPT0gYnVzLT5pZnNbMV0gJiYgIXMtPmJsaykNCg0KKEJ1dCBJ
IGRvbid0IGtub3cgd2h5IGl0IHdhcyBpbXBvcnRhbnQgdG8gZ3VhcmQgZGV2aWNlMSBzcGVjaWZp
Y2FsbHkuDQpLbm93bGVkZ2UgbG9zdCB0byB0aGUgc2FuZHMgb2YgdGltZS4pDQoNCkJ5IHRoZSB3
YXksIHRoZSBjb3JyZWN0IHRlcm1zIGFyZSAiZGV2aWNlMCIgYW5kICJkZXZpY2UxIiBhbmQgaGF2
ZSBiZWVuDQpzaW5jZSBhdCBsZWFzdCBBVEEyLiBJIGJlbGlldmUgQVRBMSB1c2VkIHRoZSB0ZXJt
cyAiZGlzazAiIGFuZCAiZGlzazEiLg0KIlByaW1hcnkiIGFuZCAiU2Vjb25kYXJ5IiBhcmUgdXNl
ZCB0byByZWZlciB0byB0aGUgY29udHJvbGxlcnMsIG5vdCB0aGUNCmRldmljZXMuDQoNCi0gUHJp
bWFyeQ0KICAgLSBkZXZpY2UwDQogICAtIGRldmljZTENCi0gU2Vjb25kYXJ5DQogICAtIGRldmlj
ZTANCiAgIC0gZGV2aWNlMQ0KDQpUaGFua3MgZm9yIGNvbWluZyB0byBteSBURUQgdGFsayENCg0K
Pj4+ICsgICAgLyogaWdub3JlIGNvbW1hbmRzIGlmIG5vIGFueSBkZXZpY2UgZXhpc3Qgb3Igbm9u
IGV4aXN0ZW50IHNsYXZlICovDQo+Pj4gKyAgICBpZiAoKCFidXMtPmlmc1swXS5ibGsgJiYgIWJ1
cy0+aWZzWzFdLmJsaykgfHwNCj4+PiArICAgICAgICAocyAhPSBidXMtPmlmcyAmJiAhcy0+Ymxr
KSkgew0KPg0KPiAoTWF5YmUgdGhpcyBjb3VsZCBiZSBpbXByb3ZlZCBoZXJlKQ0KPg0KPj4+ICAg
ICAgICAgICAgcmV0dXJuOw0KPj4+ICAgICAgICB9DQo+Pj4NCj4+DQo+PiBJIHRoaW5rIGl0J3Mg
dGhlIGNhc2UgdGhhdCBFbXB0eSBDRC1ST00gZHJpdmVzIHdpbGwgaGF2ZSBhbiBhbm9ueW1vdXMN
Cj4+IGJsb2NrIGJhY2tlbmQgcmVwcmVzZW50aW5nIHRoZSBlbXB0eSBkcml2ZSwNCj4NCj4gKEFz
IGZhciBhcyBJIHJlbWVtYmVyLCkgeWVzLg0KPg0KPiAoaWRlX2Rldl9pbml0Zm4oKSBlbnN1cmVz
IGFsbCBDRCBkcml2ZXMgaGF2ZSBvbmUsIGV2ZW4gaWYgaXShr3MgZW1wdHkuKQ0KPg0KDQooVGhh
bmtzKQ0KDQo+PiBzbyBJIHN1cHBvc2UgdGhpcyBpcyBtYXliZQ0KPj4gZmluZT8NCj4+DQo+PiBJ
IHN1cHBvc2UgdGhlIGlkZWEgaXMgdGhhdCB3aXRoIG5vIGRyaXZlcyBvbiB0aGUgYnVzIHRoYXQg
aXQncyBmaW5lIHRvDQo+PiBpZ25vcmUgdGhlIHJlZ2lzdGVyIHdyaXRlcywgYXMgdGhlcmUgYXJl
IG5vIGRldmljZXMgdG8gcmVjb3JkIHRob3NlIHdyaXRlcy4NCj4+DQo+PiAoQnV0IHRoZW4sIHdo
eSBkaWQgd2UgZXZlciBvbmx5IGNoZWNrIGRldmljZTE/IC4uLikNCj4+DQo+PiBNYXliZSBiZWZv
cmUgdGhlIGJsb2NrLWJhY2tlbmQgc3BsaXQgd2UgdXNlZCB0byBoYXZlIHRvIGNoZWNrIHRvIHNl
ZSBpZg0KPj4gd2UgaGFkIGF0dGFjaGVkIG1lZGlhIG9yIG5vdCwgYnV0IEkgdGhpbmsgbm93YWRh
eXMgd2Ugc2hvdWxkIGFsd2F5cyBoYXZlDQo+PiBhIGJsayBwb2ludGVyIGlmIHdlIGhhdmUgYSBk
ZXZpY2UgbW9kZWwgaW50ZW5kZWQgdG8gYmUgb3BlcmF0aW5nIGF0IHRoaXMNCj4+IGFkZHJlc3Mu
DQo+DQo+IFRoZSBjaGVjayBpbiBpZGVfZGV2X2luaXRmbigpIGxvb2tzIHRoYXQgd2F5IHRvIG1l
Lg0KPg0KPj4gU28gSSBndWVzcyBpdCBjYW4gYmUgc2ltcGxpZmllZCAuLi4/DQo+Pg0KPj4gaWYg
KCFzLT5ibGspIHsNCj4+ICAgICAgcmV0dXJuOw0KPj4gfQ0KPg0KPiBQcm9iYWJseS4gIEFsdGhv
dWdoIHRoZXJloa9zIGEgZGlmZmVyZW5jZSwgb2YgY291cnNlLCBuYW1lbHkgaWYgeW91IGhhdmUN
Cj4gb25seSBhIHNlY29uZGFyeSBkZXZpY2UgYW5kIHRyeSB0byBhY2Nlc3MgdGhlIHByaW1hcnks
IHRoaXMgc2ltcGxpZmllZA0KPiB2ZXJzaW9uIHdpbGwgYmUgYSBuby1vcCwgd2hlcmVhcyB0aGUg
bW9yZSBjb21wbGljYXRlZCB2ZXJzaW9uIGluIHRoaXMNCj4gcGF0Y2ggd291bGQgc3RpbGwgZ28g
b24uICBJIGRvbqGvdCBrbm93IGhvdyByZWFsIGhhcmR3YXJlIHdvdWxkIGhhbmRsZQ0KPiB0aGF0
IGNhc2UuICBJcyBpdCBldmVuIHBvc3NpYmxlIHRvIGhhdmUganVzdCBhIHNlY29uZGFyeSB3aXRo
IG5vIHByaW1hcnk/DQo+DQoNCkkgdGhpbmsgc28uIEZyb20gd2hhdCBJIHVuZGVyc3RhbmQsIHR3
byBkcml2ZXMgb24gYSBzaW5nbGUgY2hhbm5lbCBib3RoDQpyZWNlaXZlIGFsbCBvZiB0aGUgc2Ft
ZSByZWdpc3RlciB1cGRhdGUgY29tbWFuZHMsIGluY2x1ZGluZyB0aGUgIlNFTEVDVCINCnJlZ2lz
dGVyLCB3aGljaCBoYXMgYSBiaXQgZGV2b3RlZCB0byB3aGljaCBkcml2ZSB3ZSBoYXZlIHNlbGVj
dGVkLg0KDQpXaGVuIHdlIHdyaXRlIHRvIHRoZSBDT01NQU5EIHJlZ2lzdGVyLCBvbmx5IHRoZSBz
ZWxlY3RpdmUgZHJpdmUgc2hvdWxkDQphY3R1YWxseSByZXNwb25kIHRvIGl0Lg0KDQpzbyB3aGF0
IEkgZXhwZWN0IGhhcHBlbnMgb24gcmVhbCBtYWNoaW5lczoNCg0KLSBZb3Ugc2VsZWN0IGRldmlj
ZTANCi0gWW91IHdyaXRlIHRvIGEgYnVuY2ggb2YgcmVnaXN0ZXJzDQotIFlvdSBpc3N1ZSBhIGNv
bW1hbmQNCi0gTm9ib2R5IHJlc3BvbmRzLg0KDQotLWpzDQoNCg==

--_000_306775bc63c3417fba11fd93a53e3d32zhaoxincom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFont&quot;, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D=
"ltr">
<p>Hi all=A3=AC</p>
<p><br>
</p>
<p><span class=3D"tlid-translation translation" lang=3D"en"><span title=3D"=
">Any suggestions</span></span> for this patch=A3=BF<br>
</p>
</div>
<div style=3D"font-size: 12pt; color: rgb(0, 0, 0); font-family: Calibri, H=
elvetica, sans-serif, &quot;EmojiFont&quot;, &quot;Apple Color Emoji&quot;,=
 &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &=
quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<br>
</div>
<div style=3D"font-size: 12pt; color: rgb(0, 0, 0); font-family: Calibri, H=
elvetica, sans-serif, &quot;EmojiFont&quot;, &quot;Apple Color Emoji&quot;,=
 &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &=
quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
Rock<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> John =
Snow &lt;jsnow@redhat.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA10=D4=C23=C8=D5 3:37<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Max Reitz; RockCui-oc; qemu-devel@nongnu.org<br>
<b>=B3=AD=CB=CD:</b> Peter Maydell; Cobe Chen(BJ-RD)<br>
<b>=D6=F7=CC=E2:</b> Re: [PATCH] ide:do nothing for identify cmd if no any =
device attached</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On 9/3/20 6:40 AM, Max Reitz wrote:<br>
&gt; On 02.09.20 20:02, John Snow wrote:<br>
&gt;&gt; (CC Max for block backend model confusion, see below)<br>
&gt;&gt;<br>
&gt;&gt; On 8/16/20 11:38 PM, zhaoxin\RockCuioc wrote:<br>
&gt;&gt;&gt; This patch is for avoiding win7 IDE driver polling 0x1f7 when<=
br>
&gt;&gt;&gt; no any device attached. During Win7 VM boot procedure, if use =
virtio for<br>
&gt;&gt;&gt; disk and there is no any device be attached on hda &amp; hdb, =
the win7 IDE<br>
&gt;&gt;&gt; driver<br>
&gt;&gt;&gt; would poll 0x1f7 for a while. This action may be stop windows =
LOGO<br>
&gt;&gt;&gt; atomic for<br>
&gt;&gt;&gt; a while too on a poor performance CPU.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; A few questions:<br>
&gt;&gt;<br>
&gt;&gt; (1) How slow is the probing?<br>
&gt;&gt;<br>
&gt;&gt; (2) If there are no devices attached, why don't you remove the IDE=
<br>
&gt;&gt; controller so that Windows doesn't have to probe it?<br>
&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: zhaoxin\RockCuioc &lt;RockCui-oc@zhaoxin.com&gt=
;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&nbsp; &nbsp; hw/ide/core.c | 5 &#43;&#43;&#43;--<br>
&gt;&gt;&gt;&nbsp; &nbsp; 1 file changed, 3 insertions(&#43;), 2 deletions(=
-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/hw/ide/core.c b/hw/ide/core.c<br>
&gt;&gt;&gt; index d997a78e47..26d86f4b40 100644<br>
&gt;&gt;&gt; --- a/hw/ide/core.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/hw/ide/core.c<br>
&gt;&gt;&gt; @@ -2073,8 &#43;2073,9 @@ void ide_exec_cmd(IDEBus *bus, uint3=
2_t val)<br>
&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s =3D idebus_active_if(bu=
s);<br>
&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_ide_exec_cmd(bus, s=
, val);<br>
&gt;&gt;&gt;&nbsp; &nbsp; -&nbsp;&nbsp;&nbsp; /* ignore commands to non exi=
stent slave */<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; if (s !=3D bus-&gt;ifs &amp;&amp; !s-&gt;b=
lk) {<br>
&gt; <br>
&gt; (Was the first one basically meant to be =A1=B0s !=3D &amp;bus-&gt;ifs=
[0]=A1=B1, i.e. to<br>
&gt; check that this doesn=A1=AFt go to the ma^W primary?&nbsp; Not too obv=
ious.)<br>
&gt; <br>
<br>
Yeah, I think it was meant to say:<br>
<br>
if (s =3D=3D bus-&gt;ifs[1] &amp;&amp; !s-&gt;blk)<br>
<br>
(But I don't know why it was important to guard device1 specifically. <br>
Knowledge lost to the sands of time.)<br>
<br>
By the way, the correct terms are &quot;device0&quot; and &quot;device1&quo=
t; and have been <br>
since at least ATA2. I believe ATA1 used the terms &quot;disk0&quot; and &q=
uot;disk1&quot;. <br>
&quot;Primary&quot; and &quot;Secondary&quot; are used to refer to the cont=
rollers, not the <br>
devices.<br>
<br>
- Primary<br>
&nbsp;&nbsp; - device0<br>
&nbsp;&nbsp; - device1<br>
- Secondary<br>
&nbsp;&nbsp; - device0<br>
&nbsp;&nbsp; - device1<br>
<br>
Thanks for coming to my TED talk!<br>
<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; /* ignore commands if no any device ex=
ist or non existent slave */<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if ((!bus-&gt;ifs[0].blk &amp;&amp; !b=
us-&gt;ifs[1].blk) ||<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (s !=3D bus-&g=
t;ifs &amp;&amp; !s-&gt;blk)) {<br>
&gt; <br>
&gt; (Maybe this could be improved here)<br>
&gt; <br>
&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn;<br>
&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;<br>
&gt;&gt; I think it's the case that Empty CD-ROM drives will have an anonym=
ous<br>
&gt;&gt; block backend representing the empty drive,<br>
&gt; <br>
&gt; (As far as I remember,) yes.<br>
&gt; <br>
&gt; (ide_dev_initfn() ensures all CD drives have one, even if it=A1=AFs em=
pty.)<br>
&gt; <br>
<br>
(Thanks)<br>
<br>
&gt;&gt; so I suppose this is maybe<br>
&gt;&gt; fine?<br>
&gt;&gt;<br>
&gt;&gt; I suppose the idea is that with no drives on the bus that it's fin=
e to<br>
&gt;&gt; ignore the register writes, as there are no devices to record thos=
e writes.<br>
&gt;&gt;<br>
&gt;&gt; (But then, why did we ever only check device1? ...)<br>
&gt;&gt;<br>
&gt;&gt; Maybe before the block-backend split we used to have to check to s=
ee if<br>
&gt;&gt; we had attached media or not, but I think nowadays we should alway=
s have<br>
&gt;&gt; a blk pointer if we have a device model intended to be operating a=
t this<br>
&gt;&gt; address.<br>
&gt; <br>
&gt; The check in ide_dev_initfn() looks that way to me.<br>
&gt; <br>
&gt;&gt; So I guess it can be simplified ...?<br>
&gt;&gt;<br>
&gt;&gt; if (!s-&gt;blk) {<br>
&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; return;<br>
&gt;&gt; }<br>
&gt; <br>
&gt; Probably.&nbsp; Although there=A1=AFs a difference, of course, namely =
if you have<br>
&gt; only a secondary device and try to access the primary, this simplified=
<br>
&gt; version will be a no-op, whereas the more complicated version in this<=
br>
&gt; patch would still go on.&nbsp; I don=A1=AFt know how real hardware wou=
ld handle<br>
&gt; that case.&nbsp; Is it even possible to have just a secondary with no =
primary?<br>
&gt; <br>
<br>
I think so. From what I understand, two drives on a single channel both <br=
>
receive all of the same register update commands, including the &quot;SELEC=
T&quot; <br>
register, which has a bit devoted to which drive we have selected.<br>
<br>
When we write to the COMMAND register, only the selective drive should <br>
actually respond to it.<br>
<br>
so what I expect happens on real machines:<br>
<br>
- You select device0<br>
- You write to a bunch of registers<br>
- You issue a command<br>
- Nobody responds.<br>
<br>
--js<br>
<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_306775bc63c3417fba11fd93a53e3d32zhaoxincom_--

