Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7B528615
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:57:06 +0200 (CEST)
Received: from localhost ([::1]:41210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbDd-0005CR-Iz
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangliang40@baidu.com>)
 id 1nqaZR-00061Y-QK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:15:35 -0400
Received: from mx21.baidu.com ([220.181.3.85]:33222 helo=baidu.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangliang40@baidu.com>) id 1nqaZK-0000FX-EN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:15:30 -0400
Received: from BC-Mail-Ex11.internal.baidu.com (unknown [172.31.51.51])
 by Forcepoint Email with ESMTPS id 1023731372F36320929D;
 Mon, 16 May 2022 21:15:14 +0800 (CST)
Received: from bjkjy-mail-ex28.internal.baidu.com (172.31.50.44) by
 BC-Mail-Ex11.internal.baidu.com (172.31.51.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Mon, 16 May 2022 21:15:14 +0800
Received: from BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43) by
 bjkjy-mail-ex28.internal.baidu.com (172.31.50.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.18; Mon, 16 May 2022 21:15:09 +0800
Received: from BJHW-MAIL-EX28.internal.baidu.com ([169.254.129.92]) by
 BJHW-MAIL-EX28.internal.baidu.com ([169.254.129.92]) with mapi id
 15.01.2308.020; Mon, 16 May 2022 21:15:09 +0800
From: "Wang,Liang(ACG CCN01)" <wangliang40@baidu.com>
To: "mst@redhat.com" <mst@redhat.com>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] xio3130_downstream: Add ACS (Access Control Services)
 capability
Thread-Topic: [PATCH] xio3130_downstream: Add ACS (Access Control Services)
 capability
Thread-Index: AQHYaSbEC40ux3tuI0mx62i5C8IrJw==
Date: Mon, 16 May 2022 13:15:09 +0000
Message-ID: <41ad928a29254bde80bef091fef72d36@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.14.117.44]
Content-Type: multipart/alternative;
 boundary="_000_41ad928a29254bde80bef091fef72d36baiducom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=220.181.3.85; envelope-from=wangliang40@baidu.com;
 helo=baidu.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 16 May 2022 09:52:48 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_41ad928a29254bde80bef091fef72d36baiducom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

V2hlbiB2ZmlvLXBjaSBkZXZpY2VzIGFyZSBhdHRhY2hlZCB0byB0aGUgZG93bnN0cmVhbSwgcGNp
ZSBhY3MNCg0KY2FwYWJpbGl0eSBtYXkgYmUgbmVlZGVkLCBDb25zaXN0ZW50IHdpdGggcGh5c2lj
YWwgbWFjaGluZS4NCg0KDQpJdCBoYXMgYmVlbiB0ZXN0ZWQgaW4gb3VyIGVudmlyb25tZW50LCBh
bmQgcGNpZSBhY3MgY2FwYWJpbGl0eQ0KDQppcyByZXF1aXJlZCBpbiBzb21lIHNjZW5hcmlvcy4N
Cg0KDQpTaWduZWQtb2ZmLWJ5OiB3YW5nbGlhbmcgPHdhbmdsaWFuZzQwQGJhaWR1LmNvbT4NCg0K
LS0tDQoNCiBody9wY2ktYnJpZGdlL3hpbzMxMzBfZG93bnN0cmVhbS5jIHwgNCArKysrDQoNCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCg0KZGlmZiAtLWdpdCBhL2h3L3BjaS1i
cmlkZ2UveGlvMzEzMF9kb3duc3RyZWFtLmMgYi9ody9wY2ktYnJpZGdlL3hpbzMxMzBfZG93bnN0
cmVhbS5jDQoNCmluZGV4IDA1ZTJiMDZjMGMuLjZhYjEzYjQ3ZTIgMTAwNjQ0DQoNCi0tLSBhL2h3
L3BjaS1icmlkZ2UveGlvMzEzMF9kb3duc3RyZWFtLmMNCg0KKysrIGIvaHcvcGNpLWJyaWRnZS94
aW8zMTMwX2Rvd25zdHJlYW0uYw0KDQpAQCAtNDAsNiArNDAsOCBAQA0KDQogI2RlZmluZSBYSU8z
MTMwX1NTVklEX1NTSUQgICAgICAgICAgICAgIDANCg0KICNkZWZpbmUgWElPMzEzMF9FWFBfT0ZG
U0VUICAgICAgICAgICAgICAweDkwDQoNCiAjZGVmaW5lIFhJTzMxMzBfQUVSX09GRlNFVCAgICAg
ICAgICAgICAgMHgxMDANCg0KKyNkZWZpbmUgWElPMzEzMF9BQ1NfT0ZGU0VUIFwNCg0KKyAgICAg
ICAgKFhJTzMxMzBfQUVSX09GRlNFVCArIFBDSV9FUlJfU0laRU9GKQ0KDQoNCiBzdGF0aWMgdm9p
ZCB4aW8zMTMwX2Rvd25zdHJlYW1fd3JpdGVfY29uZmlnKFBDSURldmljZSAqZCwgdWludDMyX3Qg
YWRkcmVzcywNCg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgdmFsLCBpbnQgbGVuKQ0KDQpAQCAtMTExLDYgKzExMyw4IEBAIHN0YXRpYyB2b2lkIHhp
bzMxMzBfZG93bnN0cmVhbV9yZWFsaXplKFBDSURldmljZSAqZCwgRXJyb3IgKiplcnJwKQ0KDQog
ICAgICAgICBnb3RvIGVycjsNCg0KICAgICB9DQoNCg0KKw0KDQorICAgIHBjaWVfYWNzX2luaXQo
ZCwgWElPMzEzMF9BQ1NfT0ZGU0VUKTsNCg0KICAgICByZXR1cm47DQoNCg0KIGVycjoNCg0KLS0N
Cg0KMi4yNC4zIChBcHBsZSBHaXQtMTI4KQ0KDQo=

--_000_41ad928a29254bde80bef091fef72d36baiducom_
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
<p></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">W=
hen vfio-pci devices are attached to the downstream, pcie acs</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">c=
apability may be needed, Consistent with physical machine.</span></p>
<p class=3D"p2" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo; min-height: 13px;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
/span><br>
</p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">I=
t has been tested in our environment, and pcie acs capability</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">i=
s required in some scenarios.</span></p>
<p class=3D"p2" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo; min-height: 13px;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
/span><br>
</p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">S=
igned-off-by: wangliang &lt;wangliang40@baidu.com&gt;</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">-=
--</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;</span>hw/pci-bridge/xio3130_dow=
nstream.c | 4 &#43;&#43;&#43;&#43;</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;</span>1 file changed, 4 inserti=
ons(&#43;)</span></p>
<p class=3D"p2" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo; min-height: 13px;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
/span><br>
</p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">d=
iff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_down=
stream.c</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">i=
ndex 05e2b06c0c..6ab13b47e2 100644</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">-=
-- a/hw/pci-bridge/xio3130_downstream.c</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">&=
#43;&#43;&#43; b/hw/pci-bridge/xio3130_downstream.c</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">@=
@ -40,6 &#43;40,8 @@</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;</span>#define XIO3130_SSVID_SSI=
D<span class=3D"Apple-converted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
</span>0</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;</span>#define XIO3130_EXP_OFFSE=
T<span class=3D"Apple-converted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
</span>0x90</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;</span>#define XIO3130_AER_OFFSE=
T<span class=3D"Apple-converted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
</span>0x100</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">&=
#43;#define XIO3130_ACS_OFFSET \</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">&=
#43;<span class=3D"Apple-converted-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span>(XIO3130_AER_OFFSET &#43; PCI_ERR_SIZEOF)</span></p>
<p class=3D"p2" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo; min-height: 13px;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
/span><br>
</p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;</span>static void xio3130_downs=
tream_write_config(PCIDevice *d, uint32_t address,</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span>uint32_t val, int len)</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">@=
@ -111,6 &#43;113,8 @@ static void xio3130_downstream_realize(PCIDevice *d,=
 Error **errp)</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
</span>goto err;</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;&nbsp; &nbsp;
</span>}</span></p>
<p class=3D"p2" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo; min-height: 13px;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
/span><br>
</p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">&=
#43;</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">&=
#43;<span class=3D"Apple-converted-space">&nbsp; &nbsp;
</span>pcie_acs_init(d, XIO3130_ACS_OFFSET);</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;&nbsp; &nbsp;
</span>return;</span></p>
<p class=3D"p2" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo; min-height: 13px;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
/span><br>
</p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;"><=
span class=3D"Apple-converted-space">&nbsp;</span>err:</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">-=
-</span></p>
<p class=3D"p1" style=3D"margin-right: 0px; margin-left: 0px; font-variant-=
numeric: normal; font-variant-east-asian: normal; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo;">
<span class=3D"s1" style=3D"font-variant-ligatures: no-common-ligatures;">2=
.24.3 (Apple Git-128)</span></p>
<br>
<p></p>
</div>
</body>
</html>

--_000_41ad928a29254bde80bef091fef72d36baiducom_--

