Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B93DEF49
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:49:32 +0200 (CEST)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAunT-0007Uz-BW
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1mAnDb-0003gZ-LQ; Tue, 03 Aug 2021 01:43:59 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:53799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1mAnDX-0001JY-Ra; Tue, 03 Aug 2021 01:43:59 -0400
Content-Language: zh-CN
Content-Type: multipart/alternative;
 boundary="_000_4C23C17B8E87E74E906A25A3254A03F4F2167B21SHASXM06verisil_"
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1627969111; h=from:subject:to:date:message-id;
 bh=fDV2llzy2/3juFxxidCbM/hfRwmEYzS4mhMJjGmPpaA=;
 b=E6yNulbgx/BgLE2u1uf+thlwCCTwpSZlYQUi8tXdxRXpVJz/x38K6U1A7WouVfGr5wE0LFSlF2p
 J3t6WV75jB/0UkEqc3fDQGkYibQWKptNTwLA0kLqkuHdld2O4JAPJ+8uehUNm8SD+DrUFeyMU+n7a
 jB6wP02kibmXpmdxdHc=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([::1]) with mapi id 14.03.0408.000; Tue, 3 Aug 2021
 13:38:30 +0800
From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>, "alistair@alistair23.me" <alistair@alistair23.me>
Subject: [PATCH] hw/dma/pl330: Add memory region to replace default
 address_space_memory
Thread-Topic: [PATCH] hw/dma/pl330: Add memory region to replace default
 address_space_memory
Thread-Index: AQHXiCm49+ngIiAiYE2P0ZLGYFz+rg==
Date: Tue, 3 Aug 2021 05:38:14 +0000
Message-ID: <4C23C17B8E87E74E906A25A3254A03F4F2167B21@SHASXM06.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.44]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--6.325600-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.44;
 envelope-from=Jianxian.Wen@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 03 Aug 2021 09:47:48 -0400
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_4C23C17B8E87E74E906A25A3254A03F4F2167B21SHASXM06verisil_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

RnJvbSBmNzgwYjBlZTJlZTM2YzU2MmFiODE0OTE1ZmZmMGU3MjE3YjI1ZTYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogSmlhbnhpYW4gV2VuIDxqaWFueGlhbi53ZW5AdmVyaXNpbGlj
b24uY29tPg0KRGF0ZTogVHVlLCAzIEF1ZyAyMDIxIDA5OjQ0OjM1ICswODAwDQpTdWJqZWN0OiBb
UEFUQ0hdIGh3L2RtYS9wbDMzMDogQWRkIG1lbW9yeSByZWdpb24gdG8gcmVwbGFjZSBkZWZhdWx0
DQphZGRyZXNzX3NwYWNlX21lbW9yeQ0KDQpQTDMzMCBuZWVkcyBhIG1lbW9yeSByZWdpb24gd2hp
Y2ggY2FuIGNvbm5lY3Qgd2l0aCBTTU1VIHRyYW5zbGF0ZSBJT01NVSByZWdpb24gdG8gc3VwcG9y
dCBTTU1VLg0KDQpTaWduZWQtb2ZmLWJ5OiBKaWFueGlhbiBXZW4gPGppYW54aWFuLndlbkB2ZXJp
c2lsaWNvbi5jb20+DQotLS0NCmh3L2FybS9leHlub3M0MjEwLmMgIHwgIDMgKysrDQpody9hcm0v
eGlsaW54X3p5bnEuYyB8ICAyICsrDQpody9kbWEvcGwzMzAuYyAgICAgICB8IDI0ICsrKysrKysr
KysrKysrKysrKysrLS0tLQ0KMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvaHcvYXJtL2V4eW5vczQyMTAuYyBiL2h3L2FybS9l
eHlub3M0MjEwLmMNCmluZGV4IDVjN2E1MWJiYS4uYWYwZTQ4MjBkIDEwMDY0NA0KLS0tIGEvaHcv
YXJtL2V4eW5vczQyMTAuYw0KKysrIGIvaHcvYXJtL2V4eW5vczQyMTAuYw0KQEAgLTE3MSw4ICsx
NzEsMTEgQEAgc3RhdGljIERldmljZVN0YXRlICpwbDMzMF9jcmVhdGUodWludDMyX3QgYmFzZSwg
cWVtdV9vcl9pcnEgKm9yZ2F0ZSwNCiAgICAgU3lzQnVzRGV2aWNlICpidXNkZXY7DQogICAgIERl
dmljZVN0YXRlICpkZXY7DQogICAgIGludCBpOw0KKyAgICBNZW1vcnlSZWdpb24gKnN5c21lbSA9
IGdldF9zeXN0ZW1fbWVtb3J5KCk7DQogICAgIGRldiA9IHFkZXZfbmV3KCJwbDMzMCIpOw0KKyAg
ICBvYmplY3RfcHJvcGVydHlfc2V0X2xpbmsoT0JKRUNUKGRldiksICJtZW1vcnkiLA0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9CSkVDVChzeXNtZW0pLCAmZXJyb3JfZmF0
YWwpOw0KICAgICBxZGV2X3Byb3Bfc2V0X3VpbnQ4KGRldiwgIm51bV9ldmVudHMiLCBuZXZlbnRz
KTsNCiAgICAgcWRldl9wcm9wX3NldF91aW50OChkZXYsICJudW1fY2hubHMiLCAgOCk7DQogICAg
IHFkZXZfcHJvcF9zZXRfdWludDgoZGV2LCAibnVtX3BlcmlwaF9yZXEiLCAgbnJlcSk7DQpkaWZm
IC0tZ2l0IGEvaHcvYXJtL3hpbGlueF96eW5xLmMgYi9ody9hcm0veGlsaW54X3p5bnEuYw0KaW5k
ZXggMjQ1YWY4MWJiLi5lMGIzYTczYjkgMTAwNjQ0DQotLS0gYS9ody9hcm0veGlsaW54X3p5bnEu
Yw0KKysrIGIvaHcvYXJtL3hpbGlueF96eW5xLmMNCkBAIC0zMTIsNiArMzEyLDggQEAgc3RhdGlj
IHZvaWQgenlucV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkNCiAgICAgc3lzYnVzX2Nvbm5l
Y3RfaXJxKFNZU19CVVNfREVWSUNFKGRldiksIDAsIHBpY1szOS1JUlFfT0ZGU0VUXSk7DQogICAg
IGRldiA9IHFkZXZfbmV3KCJwbDMzMCIpOw0KKyAgICBvYmplY3RfcHJvcGVydHlfc2V0X2xpbmso
T0JKRUNUKGRldiksICJtZW1vcnkiLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE9CSkVDVChhZGRyZXNzX3NwYWNlX21lbSksICZlcnJvcl9mYXRhbCk7DQogICAgIHFkZXZf
cHJvcF9zZXRfdWludDgoZGV2LCAibnVtX2NobmxzIiwgIDgpOw0KICAgICBxZGV2X3Byb3Bfc2V0
X3VpbnQ4KGRldiwgIm51bV9wZXJpcGhfcmVxIiwgIDQpOw0KICAgICBxZGV2X3Byb3Bfc2V0X3Vp
bnQ4KGRldiwgIm51bV9ldmVudHMiLCAgMTYpOw0KZGlmZiAtLWdpdCBhL2h3L2RtYS9wbDMzMC5j
IGIvaHcvZG1hL3BsMzMwLmMNCmluZGV4IDk0NGJhMjk2Yi4uMDY3NDdjYTBiIDEwMDY0NA0KLS0t
IGEvaHcvZG1hL3BsMzMwLmMNCisrKyBiL2h3L2RtYS9wbDMzMC5jDQpAQCAtMjY5LDYgKzI2OSw5
IEBAIHN0cnVjdCBQTDMzMFN0YXRlIHsNCiAgICAgdWludDhfdCBudW1fZmF1bHRpbmc7DQogICAg
IHVpbnQ4X3QgcGVyaXBoX2J1c3lbUEwzMzBfUEVSSVBIX05VTV07DQorICAgIC8qIE1lbW9yeSBy
ZWdpb24gdGhhdCBETUEgb3BlcmF0aW9uIGFjY2VzcyAqLw0KKyAgICBNZW1vcnlSZWdpb24gKm1l
bV9tcjsNCisgICAgQWRkcmVzc1NwYWNlIG1lbV9hczsNCn07DQogI2RlZmluZSBUWVBFX1BMMzMw
ICJwbDMzMCINCkBAIC0xMTA4LDcgKzExMTEsOCBAQCBzdGF0aWMgaW5saW5lIGNvbnN0IFBMMzMw
SW5zbkRlc2MgKnBsMzMwX2ZldGNoX2luc24oUEwzMzBDaGFuICpjaCkNCiAgICAgdWludDhfdCBv
cGNvZGU7DQogICAgIGludCBpOw0KLSAgICBkbWFfbWVtb3J5X3JlYWQoJmFkZHJlc3Nfc3BhY2Vf
bWVtb3J5LCBjaC0+cGMsICZvcGNvZGUsIDEpOw0KKyAgICBhZGRyZXNzX3NwYWNlX3JlYWQoJmNo
LT5wYXJlbnQtPm1lbV9hcywgY2gtPnBjLA0KKyAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRY
QVRUUlNfVU5TUEVDSUZJRUQsICZvcGNvZGUsIDEpOw0KICAgICBmb3IgKGkgPSAwOyBpbnNuX2Rl
c2NbaV0uc2l6ZTsgaSsrKSB7DQogICAgICAgICBpZiAoKG9wY29kZSAmIGluc25fZGVzY1tpXS5v
cG1hc2spID09IGluc25fZGVzY1tpXS5vcGNvZGUpIHsNCiAgICAgICAgICAgICByZXR1cm4gJmlu
c25fZGVzY1tpXTsNCkBAIC0xMTIyLDcgKzExMjYsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcGwz
MzBfZXhlY19pbnNuKFBMMzMwQ2hhbiAqY2gsIGNvbnN0IFBMMzMwSW5zbkRlc2MgKmluc24pDQog
ICAgIHVpbnQ4X3QgYnVmW1BMMzMwX0lOU05fTUFYU0laRV07DQogICAgIGFzc2VydChpbnNuLT5z
aXplIDw9IFBMMzMwX0lOU05fTUFYU0laRSk7DQotICAgIGRtYV9tZW1vcnlfcmVhZCgmYWRkcmVz
c19zcGFjZV9tZW1vcnksIGNoLT5wYywgYnVmLCBpbnNuLT5zaXplKTsNCisgICAgYWRkcmVzc19z
cGFjZV9yZWFkKCZjaC0+cGFyZW50LT5tZW1fYXMsIGNoLT5wYywNCisgICAgICAgICAgICAgICAg
ICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBidWYsIGluc24tPnNpemUpOw0KICAgICBp
bnNuLT5leGVjKGNoLCBidWZbMF0sICZidWZbMV0sIGluc24tPnNpemUgLSAxKTsNCn0NCkBAIC0x
MTg2LDcgKzExOTEsOCBAQCBzdGF0aWMgaW50IHBsMzMwX2V4ZWNfY3ljbGUoUEwzMzBDaGFuICpj
aGFubmVsKQ0KICAgICBpZiAocSAhPSBOVUxMICYmIHEtPmxlbiA8PSBwbDMzMF9maWZvX251bV9m
cmVlKCZzLT5maWZvKSkgew0KICAgICAgICAgaW50IGxlbiA9IHEtPmxlbiAtIChxLT5hZGRyICYg
KHEtPmxlbiAtIDEpKTsNCi0gICAgICAgIGRtYV9tZW1vcnlfcmVhZCgmYWRkcmVzc19zcGFjZV9t
ZW1vcnksIHEtPmFkZHIsIGJ1ZiwgbGVuKTsNCisgICAgICAgIGFkZHJlc3Nfc3BhY2VfcmVhZCgm
cy0+bWVtX2FzLCBxLT5hZGRyLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFU
VFJTX1VOU1BFQ0lGSUVELCBidWYsIGxlbik7DQogICAgICAgICB0cmFjZV9wbDMzMF9leGVjX2N5
Y2xlKHEtPmFkZHIsIGxlbik7DQogICAgICAgICBpZiAodHJhY2VfZXZlbnRfZ2V0X3N0YXRlX2Jh
Y2tlbmRzKFRSQUNFX1BMMzMwX0hFWERVTVApKSB7DQogICAgICAgICAgICAgcGwzMzBfaGV4ZHVt
cChidWYsIGxlbik7DQpAQCAtMTIxNyw3ICsxMjIzLDggQEAgc3RhdGljIGludCBwbDMzMF9leGVj
X2N5Y2xlKFBMMzMwQ2hhbiAqY2hhbm5lbCkNCiAgICAgICAgICAgICBmaWZvX3JlcyA9IHBsMzMw
X2ZpZm9fZ2V0KCZzLT5maWZvLCBidWYsIGxlbiwgcS0+dGFnKTsNCiAgICAgICAgIH0NCiAgICAg
ICAgIGlmIChmaWZvX3JlcyA9PSBQTDMzMF9GSUZPX09LIHx8IHEtPnopIHsNCi0gICAgICAgICAg
ICBkbWFfbWVtb3J5X3dyaXRlKCZhZGRyZXNzX3NwYWNlX21lbW9yeSwgcS0+YWRkciwgYnVmLCBs
ZW4pOw0KKyAgICAgICAgICAgIGFkZHJlc3Nfc3BhY2Vfd3JpdGUoJnMtPm1lbV9hcywgcS0+YWRk
ciwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJ
RUQsIGJ1ZiwgbGVuKTsNCiAgICAgICAgICAgICB0cmFjZV9wbDMzMF9leGVjX2N5Y2xlKHEtPmFk
ZHIsIGxlbik7DQogICAgICAgICAgICAgaWYgKHRyYWNlX2V2ZW50X2dldF9zdGF0ZV9iYWNrZW5k
cyhUUkFDRV9QTDMzMF9IRVhEVU1QKSkgew0KICAgICAgICAgICAgICAgICBwbDMzMF9oZXhkdW1w
KGJ1ZiwgbGVuKTsNCkBAIC0xNTYyLDYgKzE1NjksMTIgQEAgc3RhdGljIHZvaWQgcGwzMzBfcmVh
bGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAiZG1hIiwgUEwzMzBfSU9NRU1fU0laRSk7DQogICAgIHN5c2J1c19pbml0X21taW8o
U1lTX0JVU19ERVZJQ0UoZGV2KSwgJnMtPmlvbWVtKTsNCisgICAgaWYgKCFzLT5tZW1fbXIpIHsN
CisgICAgICAgIGVycm9yX3NldGcoZXJycCwgIidtZW1fbXInIGxpbmsgaXMgbm90IHNldCIpOw0K
KyAgICAgICAgcmV0dXJuOw0KKyAgICB9DQorICAgIGFkZHJlc3Nfc3BhY2VfaW5pdCgmcy0+bWVt
X2FzLCBzLT5tZW1fbXIsICJwbDMzMC1tZW1vcnkiKTsNCisNCiAgICAgcy0+dGltZXIgPSB0aW1l
cl9uZXdfbnMoUUVNVV9DTE9DS19WSVJUVUFMLCBwbDMzMF9leGVjX2N5Y2xlX3RpbWVyLCBzKTsN
CiAgICAgcy0+Y2ZnWzBdID0gKHMtPm1ncl9uc19hdF9yc3QgPyAweDQgOiAwKSB8DQpAQCAtMTY1
Niw2ICsxNjY5LDkgQEAgc3RhdGljIFByb3BlcnR5IHBsMzMwX3Byb3BlcnRpZXNbXSA9IHsNCiAg
ICAgREVGSU5FX1BST1BfVUlOVDgoInJkX3FfZGVwIiwgUEwzMzBTdGF0ZSwgcmRfcV9kZXAsIDE2
KSwNCiAgICAgREVGSU5FX1BST1BfVUlOVDE2KCJkYXRhX2J1ZmZlcl9kZXAiLCBQTDMzMFN0YXRl
LCBkYXRhX2J1ZmZlcl9kZXAsIDI1NiksDQorICAgIERFRklORV9QUk9QX0xJTksoIm1lbW9yeSIs
IFBMMzMwU3RhdGUsIG1lbV9tciwNCisgICAgICAgICAgICAgICAgICAgICBUWVBFX01FTU9SWV9S
RUdJT04sIE1lbW9yeVJlZ2lvbiAqKSwNCisNCiAgICAgREVGSU5FX1BST1BfRU5EX09GX0xJU1Qo
KSwNCn07DQotLQ0K

--_000_4C23C17B8E87E74E906A25A3254A03F4F2167B21SHASXM06verisil_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">From f780b0ee2ee36c562ab814915fff0e7217b25e63 Mon Sep =
17 00:00:00 2001</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">From: Jianxian Wen &lt;jianxian.wen@verisilicon.com&gt=
;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">Date: Tue, 3 Aug 2021 09:44:35 &#43;0800</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">Subject: [PATCH] hw/dma/pl330: Add memory region to re=
place default</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">address_space_memory</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">PL330 needs a memory region which can connect with SMM=
U translate IOMMU region to support SMMU.</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">Signed-off-by: Jianxian Wen &lt;jianxian.wen@verisilic=
on.com&gt;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">---</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">hw/arm/exynos4210.c&nbsp; |&nbsp; 3 &#43;&#43;&#43;</s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">hw/arm/xilinx_zynq.c |&nbsp; 2 &#43;&#43;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">hw/dma/pl330.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2=
4 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;----</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">3 files changed, 25 insertions(&#43;), 4 deletions(-)<=
/span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c=
</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">index 5c7a51bba..af0e4820d 100644</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">--- a/hw/arm/exynos4210.c</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&#43;&#43; b/hw/arm/exynos4210.c</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -171,8 &#43;171,11 @@ static DeviceState *pl330_cre=
ate(uint32_t base, qemu_or_irq *orgate,</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; SysBusDevice *busdev;</span><=
/p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; DeviceState *dev;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; int i;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; MemoryRegion *sysmem =3D get_s=
ystem_memory();</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dev =3D qdev_new(&quot;p=
l330&quot;);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; object_property_set_link(OBJEC=
T(dev), &quot;memory&quot;,</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; OBJECT(sysmem), &amp;error_fatal);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_prop_set_uint8(dev, &quo=
t;num_events&quot;, nevents);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_prop_set_uint8(dev, &quo=
t;num_chnls&quot;,&nbsp; 8);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_prop_set_uint8(dev, &quo=
t;num_periph_req&quot;,&nbsp; nreq);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq=
.c</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">index 245af81bb..e0b3a73b9 100644</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">--- a/hw/arm/xilinx_zynq.c</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&#43;&#43; b/hw/arm/xilinx_zynq.c</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -312,6 &#43;312,8 @@ static void zynq_init(MachineS=
tate *machine)</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; sysbus_connect_irq(SYS_BUS_DE=
VICE(dev), 0, pic[39-IRQ_OFFSET]);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dev =3D qdev_new(&quot;p=
l330&quot;);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; object_property_set_link(OBJEC=
T(dev), &quot;memory&quot;,</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; OBJECT(address_space_mem), &amp;error_fatal);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_prop_set_uint8(dev, &quo=
t;num_chnls&quot;,&nbsp; 8);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_prop_set_uint8(dev, &quo=
t;num_periph_req&quot;,&nbsp; 4);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_prop_set_uint8(dev, &quo=
t;num_events&quot;,&nbsp; 16);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c</span></p=
>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">index 944ba296b..06747ca0b 100644</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">--- a/hw/dma/pl330.c</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&#43;&#43; b/hw/dma/pl330.c</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -269,6 &#43;269,9 @@ struct PL330State {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; uint8_t num_faulting;</span><=
/p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; uint8_t periph_busy[PL330_PER=
IPH_NUM];</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; /* Memory region that DMA oper=
ation access */</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; MemoryRegion *mem_mr;</span></=
p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; AddressSpace mem_as;</span></p=
>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">};</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;#define TYPE_PL330 &quot;pl330&quot;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -1108,7 &#43;1111,8 @@ static inline const PL330Ins=
nDesc *pl330_fetch_insn(PL330Chan *ch)</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; uint8_t opcode;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; int i;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp; dma_memory_read(&amp;address_space=
_memory, ch-&gt;pc, &amp;opcode, 1);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; address_space_read(&amp;ch-&gt=
;parent-&gt;mem_as, ch-&gt;pc,</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; MEMTXATTRS_UNSPECIFIED, &amp;opcode, 1);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; insn_desc[i].si=
ze; i&#43;&#43;) {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((=
opcode &amp; insn_desc[i].opmask) =3D=3D insn_desc[i].opcode) {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; return &amp;insn_desc[i];</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -1122,7 &#43;1126,8 @@ static inline void pl330_exe=
c_insn(PL330Chan *ch, const PL330InsnDesc *insn)</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; uint8_t buf[PL330_INSN_MAXSIZ=
E];</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assert(insn-&gt;size &lt=
;=3D PL330_INSN_MAXSIZE);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp; dma_memory_read(&amp;address_space=
_memory, ch-&gt;pc, buf, insn-&gt;size);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; address_space_read(&amp;ch-&gt=
;parent-&gt;mem_as, ch-&gt;pc,</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; MEMTXATTRS_UNSPECIFIED, buf, insn-&gt;size);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; insn-&gt;exec(ch, buf[0], &am=
p;buf[1], insn-&gt;size - 1);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">}</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -1186,7 &#43;1191,8 @@ static int pl330_exec_cycle(=
PL330Chan *channel)</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; if (q !=3D NULL &amp;&amp; q-=
&gt;len &lt;=3D pl330_fifo_num_free(&amp;s-&gt;fifo)) {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int l=
en =3D q-&gt;len - (q-&gt;addr &amp; (q-&gt;len - 1));</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_memory=
_read(&amp;address_space_memory, q-&gt;addr, buf, len);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addres=
s_space_read(&amp;s-&gt;mem_as, q-&gt;addr,</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEMTXATTRS_UNSPECIFIED, buf, len);</=
span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace=
_pl330_exec_cycle(q-&gt;addr, len);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (t=
race_event_get_state_backends(TRACE_PL330_HEXDUMP)) {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; pl330_hexdump(buf, len);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -1217,7 &#43;1223,8 @@ static int pl330_exec_cycle(=
PL330Chan *channel)</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; fifo_res =3D pl330_fifo_get(&amp;s-&gt;fifo, buf, len, q=
-&gt;tag);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (f=
ifo_res =3D=3D PL330_FIFO_OK || q-&gt;z) {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; dma_memory_write(&amp;address_space_memory, q-&gt;addr, buf, =
len);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; address_space_write(&amp;s-&gt;mem_as, q-&gt;addr,</span>=
</p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEMTXATTRS_U=
NSPECIFIED, buf, len);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; trace_pl330_exec_cycle(q-&gt;addr, len);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP))=
 {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pl330_hexdump(buf, len);</span><=
/p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -1562,6 &#43;1569,12 @@ static void pl330_realize(D=
eviceState *dev, Error **errp)</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;dma&quot;, PL330_IOMEM_SIZE);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; sysbus_init_mmio(SYS_BUS_DEVI=
CE(dev), &amp;s-&gt;iomem);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; if (!s-&gt;mem_mr) {</span></p=
>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_=
setg(errp, &quot;'mem_mr' link is not set&quot;);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; }</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; address_space_init(&amp;s-&gt;=
mem_as, s-&gt;mem_mr, &quot;pl330-memory&quot;);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;timer =3D timer_new_ns(=
QEMU_CLOCK_VIRTUAL, pl330_exec_cycle_timer, s);</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s-&gt;cfg[0] =3D (s-&gt;=
mgr_ns_at_rst ? 0x4 : 0) |</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">@@ -1656,6 &#43;1669,9 @@ static Property pl330_proper=
ties[] =3D {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp; &nbsp;&nbsp;&nbsp;DEFINE_PROP_UINT8(&quot;rd_q_=
dep&quot;, PL330State, rd_q_dep, 16),</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; DEFINE_PROP_UINT16(&quot;data=
_buffer_dep&quot;, PL330State, data_buffer_dep, 256),</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; DEFINE_PROP_LINK(&quot;memory&=
quot;, PL330State, mem_mr,</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TYP=
E_MEMORY_REGION, MemoryRegion *),</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&#43;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">&nbsp;&nbsp; &nbsp;&nbsp;DEFINE_PROP_END_OF_LIST(),</s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">};</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; text-align: justi=
fy; font-size: 10.5pt; font-family: Calibri, sans-serif;">
<span lang=3D"EN-US">--</span></p>
</div>
</body>
</html>

--_000_4C23C17B8E87E74E906A25A3254A03F4F2167B21SHASXM06verisil_--

