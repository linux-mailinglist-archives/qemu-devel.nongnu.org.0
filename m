Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793C7520B64
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 04:40:20 +0200 (CEST)
Received: from localhost ([::1]:46198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noFnP-0008Fk-3g
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 22:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Lu.Gao@verisilicon.com>)
 id 1noFmB-0007QZ-Tp; Mon, 09 May 2022 22:39:04 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:47791
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Lu.Gao@verisilicon.com>)
 id 1noFm8-0000Zr-SB; Mon, 09 May 2022 22:39:03 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1652150324; h=from:subject:to:date:message-id;
 bh=xmTYP2gyBpcYotOXr2Ri9mNGCpegRuvWugSaO3Ql2xk=;
 b=bUvFpTHV17EBfv/lo2MAca50e9m6NIYukMS0g/mHgpEeq6+ctXjM/hpnKwaNmCK4Knrv+AakG4b
 6o5ddH8HB1GRHulh6wyxAjBUhPP1gplDrxpYG9hNnETOrBem2dmtO9iFa0S+V50nu2yZt8G570KGw
 /valSNTK0K8rvHw5eGY=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 10 May 2022 10:38:43 +0800
From: "Gao, Lu" <Lu.Gao@verisilicon.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?gb2312?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkqKY=?= <f4bug@amsat.org>, Bin Meng
 <bin.meng@windriver.com>
CC: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>, "open list:SD (Secure
 Card)" <qemu-block@nongnu.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBody9zZC9zZGhjaTogQmxvY2sgU2l6ZSBSZWdpc3Rl?=
 =?gb2312?Q?r_bits_[14:12]_is_lost?=
Thread-Topic: [PATCH] hw/sd/sdhci: Block Size Register bits [14:12] is lost
Thread-Index: AQHYPOiHQ0Dy2cvFy0+IfX/zeZSb4q0ADs8AgBelF0A=
Date: Tue, 10 May 2022 02:38:42 +0000
Message-ID: <34781C803212B140A51E6B66D9092E5D01A9227952@SHASXM03.verisilicon.com>
References: <20220321055618.4026-1-lu.gao@verisilicon.com> 
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.166.47]
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-25628.004
x-tm-as-result: No--4.710200-0.000000-31
x-tm-as-matchedid: 151186-700225-703140-701090-703503-139703-106230-704010-7
 03408-704706-700273-700523-704186-704318-703880-700535-702880-700598-703001
 -705244-703115-704822-701510-705248-704240-702395-188019-704477-703968-7028
 98-700946-703953-704959-702299-701812-703812-704990-702975-704849-704823-89
 9220-148004-148133-42000-42003
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Lu.Gao@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: 35
X-Spam_score: 3.5
X-Spam_bar: +++
X-Spam_report: (3.5 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGluZw0KDQpodHRwczovL3BhdGNoZXcub3JnL1FFTVUvMjAyMjAzMjEwNTU2MTguNDAyNi0xLWx1
Lmdhb0B2ZXJpc2lsaWNvbi5jb20vDQoNClBsZWFzZSBoZWxwIHJldmlldyB0aGUgcGF0Y2guDQpU
aGFua3MuDQpCLlIuDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBHYW8sIEx1IA0Kt6LL
zcqxvOQ6IE1vbmRheSwgQXByaWwgMjUsIDIwMjIgOTozNSBBTQ0KytW8/sjLOiBHYW8sIEx1OyBx
ZW11LWRldmVsQG5vbmdudS5vcmcNCrOty806IFdlbiwgSmlhbnhpYW47IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZKimOyBCaW4gTWVuZzsgb3BlbiBsaXN0OlNEIChTZWN1cmUgQ2FyZCkNCtb3zOI6ILTw
uLQ6IFtQQVRDSF0gaHcvc2Qvc2RoY2k6IEJsb2NrIFNpemUgUmVnaXN0ZXIgYml0cyBbMTQ6MTJd
IGlzIGxvc3QNCg0KcGluZw0KDQpodHRwczovL3BhdGNoZXcub3JnL1FFTVUvMjAyMjAzMjEwNTU2
MTguNDAyNi0xLWx1Lmdhb0B2ZXJpc2lsaWNvbi5jb20vDQoNClBsZWFzZSBoZWxwIHJldmlldyB0
aGUgcGF0Y2guDQpUaGFua3MuDQpCLlIuDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBH
YW8sIEx1IA0Kt6LLzcqxvOQ6IE1vbmRheSwgTWFyY2ggMjEsIDIwMjIgMTo1NiBQTQ0KytW8/sjL
OiBxZW11LWRldmVsQG5vbmdudS5vcmcNCrOty806IEdhbywgTHU7IFdlbiwgSmlhbnhpYW47IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZKimOyBCaW4gTWVuZzsgb3BlbiBsaXN0OlNEIChTZWN1cmUgQ2Fy
ZCkNCtb3zOI6IFtQQVRDSF0gaHcvc2Qvc2RoY2k6IEJsb2NrIFNpemUgUmVnaXN0ZXIgYml0cyBb
MTQ6MTJdIGlzIGxvc3QNCg0KQmxvY2sgU2l6ZSBSZWdpc3RlciBiaXRzIFsxNDoxMl0gaXMgU0RN
QSBCdWZmZXIgQm91bmRhcnksIGl0IGlzIG1pc3NlZA0KaW4gcmVnaXN0ZXIgd3JpdGUsIGJ1dCBp
dCBpcyBuZWVkZWQgaW4gU0RNQSB0cmFuc2Zlci4gZS5nLiBpdCB3aWxsIGJlDQp1c2VkIGluIHNk
aGNpX3NkbWFfdHJhbnNmZXJfbXVsdGlfYmxvY2tzIHRvIGNhbGN1bGF0ZSBib3VuZGFyeV8gdmFy
aWFibGVzLg0KDQpNaXNzaW5nIHRoaXMgZmllbGQgd2lsbCBjYXVzZSB3cm9uZyBvcGVyYXRpb24g
Zm9yIGRpZmZlcmVudCBTRE1BIEJ1ZmZlcg0KQm91bmRhcnkgc2V0dGluZ3MuDQoNClNpZ25lZC1v
ZmYtYnk6IEx1IEdhbyA8bHUuZ2FvQHZlcmlzaWxpY29uLmNvbT4NClNpZ25lZC1vZmYtYnk6IEpp
YW54aWFuIFdlbiA8amlhbnhpYW4ud2VuQHZlcmlzaWxpY29uLmNvbT4NCi0tLQ0KIGh3L3NkL3Nk
aGNpLmMgfCAxNSArKysrKysrKysrKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2h3L3NkL3NkaGNpLmMgYi9ody9z
ZC9zZGhjaS5jDQppbmRleCBlMGJiYzkwMzQ0Li4zNTBjZWI0ODdkIDEwMDY0NA0KLS0tIGEvaHcv
c2Qvc2RoY2kuYw0KKysrIGIvaHcvc2Qvc2RoY2kuYw0KQEAgLTMyMSw2ICszMjEsOCBAQCBzdGF0
aWMgdm9pZCBzZGhjaV9wb3dlcm9uX3Jlc2V0KERldmljZVN0YXRlICpkZXYpDQogDQogc3RhdGlj
IHZvaWQgc2RoY2lfZGF0YV90cmFuc2Zlcih2b2lkICpvcGFxdWUpOw0KIA0KKyNkZWZpbmUgQkxP
Q0tfU0laRV9NQVNLICg0ICogS2lCIC0gMSkNCisNCiBzdGF0aWMgdm9pZCBzZGhjaV9zZW5kX2Nv
bW1hbmQoU0RIQ0lTdGF0ZSAqcykNCiB7DQogICAgIFNEUmVxdWVzdCByZXF1ZXN0Ow0KQEAgLTM3
MSw3ICszNzMsOCBAQCBzdGF0aWMgdm9pZCBzZGhjaV9zZW5kX2NvbW1hbmQoU0RIQ0lTdGF0ZSAq
cykNCiANCiAgICAgc2RoY2lfdXBkYXRlX2lycShzKTsNCiANCi0gICAgaWYgKCF0aW1lb3V0ICYm
IHMtPmJsa3NpemUgJiYgKHMtPmNtZHJlZyAmIFNESENfQ01EX0RBVEFfUFJFU0VOVCkpIHsNCisg
ICAgaWYgKCF0aW1lb3V0ICYmIChzLT5ibGtzaXplICYgQkxPQ0tfU0laRV9NQVNLKSAmJg0KKyAg
ICAgICAgKHMtPmNtZHJlZyAmIFNESENfQ01EX0RBVEFfUFJFU0VOVCkpIHsNCiAgICAgICAgIHMt
PmRhdGFfY291bnQgPSAwOw0KICAgICAgICAgc2RoY2lfZGF0YV90cmFuc2ZlcihzKTsNCiAgICAg
fQ0KQEAgLTQwNiw3ICs0MDksNiBAQCBzdGF0aWMgdm9pZCBzZGhjaV9lbmRfdHJhbnNmZXIoU0RI
Q0lTdGF0ZSAqcykNCiAvKg0KICAqIFByb2dyYW1tZWQgaS9vIGRhdGEgdHJhbnNmZXINCiAgKi8N
Ci0jZGVmaW5lIEJMT0NLX1NJWkVfTUFTSyAoNCAqIEtpQiAtIDEpDQogDQogLyogRmlsbCBob3N0
IGNvbnRyb2xsZXIncyByZWFkIGJ1ZmZlciB3aXRoIEJMS1NJWkUgYnl0ZXMgb2YgZGF0YSBmcm9t
IGNhcmQgKi8NCiBzdGF0aWMgdm9pZCBzZGhjaV9yZWFkX2Jsb2NrX2Zyb21fY2FyZChTREhDSVN0
YXRlICpzKQ0KQEAgLTExMzcsNyArMTEzOSw4IEBAIHNkaGNpX3dyaXRlKHZvaWQgKm9wYXF1ZSwg
aHdhZGRyIG9mZnNldCwgdWludDY0X3QgdmFsLCB1bnNpZ25lZCBzaXplKQ0KICAgICAgICAgICAg
IHMtPnNkbWFzeXNhZCA9IChzLT5zZG1hc3lzYWQgJiBtYXNrKSB8IHZhbHVlOw0KICAgICAgICAg
ICAgIE1BU0tFRF9XUklURShzLT5zZG1hc3lzYWQsIG1hc2ssIHZhbHVlKTsNCiAgICAgICAgICAg
ICAvKiBXcml0aW5nIHRvIGxhc3QgYnl0ZSBvZiBzZG1hc3lzYWQgbWlnaHQgdHJpZ2dlciB0cmFu
c2ZlciAqLw0KLSAgICAgICAgICAgIGlmICghKG1hc2sgJiAweEZGMDAwMDAwKSAmJiBzLT5ibGtj
bnQgJiYgcy0+Ymxrc2l6ZSAmJg0KKyAgICAgICAgICAgIGlmICghKG1hc2sgJiAweEZGMDAwMDAw
KSAmJiBzLT5ibGtjbnQgJiYNCisgICAgICAgICAgICAgICAgKHMtPmJsa3NpemUgJiBCTE9DS19T
SVpFX01BU0spICYmDQogICAgICAgICAgICAgICAgIFNESENfRE1BX1RZUEUocy0+aG9zdGN0bDEp
ID09IFNESENfQ1RSTF9TRE1BKSB7DQogICAgICAgICAgICAgICAgIGlmIChzLT50cm5tb2QgJiBT
REhDX1RSTlNfTVVMVEkpIHsNCiAgICAgICAgICAgICAgICAgICAgIHNkaGNpX3NkbWFfdHJhbnNm
ZXJfbXVsdGlfYmxvY2tzKHMpOw0KQEAgLTExNTEsNyArMTE1NCwxMSBAQCBzZGhjaV93cml0ZSh2
b2lkICpvcGFxdWUsIGh3YWRkciBvZmZzZXQsIHVpbnQ2NF90IHZhbCwgdW5zaWduZWQgc2l6ZSkN
CiAgICAgICAgIGlmICghVFJBTlNGRVJSSU5HX0RBVEEocy0+cHJuc3RzKSkgew0KICAgICAgICAg
ICAgIHVpbnQxNl90IGJsa3NpemUgPSBzLT5ibGtzaXplOw0KIA0KLSAgICAgICAgICAgIE1BU0tF
RF9XUklURShzLT5ibGtzaXplLCBtYXNrLCBleHRyYWN0MzIodmFsdWUsIDAsIDEyKSk7DQorICAg
ICAgICAgICAgLyoNCisgICAgICAgICAgICAgKiBbMTQ6MTJdIFNETUEgQnVmZmVyIEJvdW5kYXJ5
DQorICAgICAgICAgICAgICogWzExOjAwXSBUcmFuc2ZlciBCbG9jayBTaXplDQorICAgICAgICAg
ICAgICovDQorICAgICAgICAgICAgTUFTS0VEX1dSSVRFKHMtPmJsa3NpemUsIG1hc2ssIGV4dHJh
Y3QzMih2YWx1ZSwgMCwgMTUpKTsNCiAgICAgICAgICAgICBNQVNLRURfV1JJVEUocy0+YmxrY250
LCBtYXNrID4+IDE2LCB2YWx1ZSA+PiAxNik7DQogDQogICAgICAgICAgICAgLyogTGltaXQgYmxv
Y2sgc2l6ZSB0byB0aGUgbWF4aW11bSBidWZmZXIgc2l6ZSAqLw0KLS0gDQoyLjE3LjENCg0K

