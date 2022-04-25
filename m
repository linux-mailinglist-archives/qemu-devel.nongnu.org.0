Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79FC50D6A2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 03:36:43 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ninec-00007z-EZ
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 21:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Lu.Gao@verisilicon.com>)
 id 1nind9-0007js-Ft; Sun, 24 Apr 2022 21:35:11 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:48271
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Lu.Gao@verisilicon.com>)
 id 1nind6-00049p-J4; Sun, 24 Apr 2022 21:35:11 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1650850496; h=from:subject:to:date:message-id;
 bh=mSBA5V8WemKQCB/9qC2WBcWoTyw2cofbxrNMeMLp18U=;
 b=Q1bDV1c+tvaGjuOi4pQbLGCUtYlS4U2Iwc1nsb6b2zr6xDzGx5r9BrbDoa9cvrb1+AGjNQ0VJkE
 +ivGM5PB3BDk2kYBE6JrzYuAps6H/VxzJw6H/UC7mJnXQuMI+MZtAmxP4uCh07QBQeIGJAWqm3WYo
 3HGqWaXEDsEh8UyD5G8=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Mon, 25 Apr 2022 09:34:54 +0800
From: "Gao, Lu" <Lu.Gao@verisilicon.com>
To: "Gao, Lu" <Lu.Gao@verisilicon.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBody9zZC9zZGhjaTogQmxvY2sgU2l6ZSBSZWdpc3Rl?=
 =?gb2312?Q?r_bits_[14:12]_is_lost?=
Thread-Topic: [PATCH] hw/sd/sdhci: Block Size Register bits [14:12] is lost
Thread-Index: AQHYPOiHQ0Dy2cvFy0+IfX/zeZSb4q0ADs8A
Date: Mon, 25 Apr 2022 01:34:53 +0000
Message-ID: <34781C803212B140A51E6B66D9092E5D01A9223DE1@SHASXM03.verisilicon.com>
References: <20220321055618.4026-1-lu.gao@verisilicon.com>
In-Reply-To: <20220321055618.4026-1-lu.gao@verisilicon.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.166.42]
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-25628.004
x-tm-as-result: No--4.129300-0.000000-31
x-tm-as-matchedid: 151186-700225-703140-701090-703503-139703-106230-704010-7
 03408-704706-702880-700523-704186-704318-703880-700535-700598-703001-705244
 -703115-704822-701510-705248-704240-702395-188019-704477-703968-702898-7009
 46-703953-704959-702299-701812-703812-704990-702975-704849-704823-899220-63
 -148004-148133-42000-42003-63
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
Cc: Bin Meng <bin.meng@windriver.com>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 =?gb2312?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkqKY=?= <f4bug@amsat.org>,
 "open list:SD \(Secure Card\)" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cGluZw0KDQpodHRwczovL3BhdGNoZXcub3JnL1FFTVUvMjAyMjAzMjEwNTU2MTguNDAyNi0xLWx1
Lmdhb0B2ZXJpc2lsaWNvbi5jb20vDQoNClBsZWFzZSBoZWxwIHJldmlldyB0aGUgcGF0Y2guDQpU
aGFua3MuDQpCLlIuDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBHYW8sIEx1IA0Kt6LL
zcqxvOQ6IE1vbmRheSwgTWFyY2ggMjEsIDIwMjIgMTo1NiBQTQ0KytW8/sjLOiBxZW11LWRldmVs
QG5vbmdudS5vcmcNCrOty806IEdhbywgTHU7IFdlbiwgSmlhbnhpYW47IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZKimOyBCaW4gTWVuZzsgb3BlbiBsaXN0OlNEIChTZWN1cmUgQ2FyZCkNCtb3zOI6IFtQ
QVRDSF0gaHcvc2Qvc2RoY2k6IEJsb2NrIFNpemUgUmVnaXN0ZXIgYml0cyBbMTQ6MTJdIGlzIGxv
c3QNCg0KQmxvY2sgU2l6ZSBSZWdpc3RlciBiaXRzIFsxNDoxMl0gaXMgU0RNQSBCdWZmZXIgQm91
bmRhcnksIGl0IGlzIG1pc3NlZA0KaW4gcmVnaXN0ZXIgd3JpdGUsIGJ1dCBpdCBpcyBuZWVkZWQg
aW4gU0RNQSB0cmFuc2Zlci4gZS5nLiBpdCB3aWxsIGJlDQp1c2VkIGluIHNkaGNpX3NkbWFfdHJh
bnNmZXJfbXVsdGlfYmxvY2tzIHRvIGNhbGN1bGF0ZSBib3VuZGFyeV8gdmFyaWFibGVzLg0KDQpN
aXNzaW5nIHRoaXMgZmllbGQgd2lsbCBjYXVzZSB3cm9uZyBvcGVyYXRpb24gZm9yIGRpZmZlcmVu
dCBTRE1BIEJ1ZmZlcg0KQm91bmRhcnkgc2V0dGluZ3MuDQoNClNpZ25lZC1vZmYtYnk6IEx1IEdh
byA8bHUuZ2FvQHZlcmlzaWxpY29uLmNvbT4NClNpZ25lZC1vZmYtYnk6IEppYW54aWFuIFdlbiA8
amlhbnhpYW4ud2VuQHZlcmlzaWxpY29uLmNvbT4NCi0tLQ0KIGh3L3NkL3NkaGNpLmMgfCAxNSAr
KysrKysrKysrKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2h3L3NkL3NkaGNpLmMgYi9ody9zZC9zZGhjaS5jDQpp
bmRleCBlMGJiYzkwMzQ0Li4zNTBjZWI0ODdkIDEwMDY0NA0KLS0tIGEvaHcvc2Qvc2RoY2kuYw0K
KysrIGIvaHcvc2Qvc2RoY2kuYw0KQEAgLTMyMSw2ICszMjEsOCBAQCBzdGF0aWMgdm9pZCBzZGhj
aV9wb3dlcm9uX3Jlc2V0KERldmljZVN0YXRlICpkZXYpDQogDQogc3RhdGljIHZvaWQgc2RoY2lf
ZGF0YV90cmFuc2Zlcih2b2lkICpvcGFxdWUpOw0KIA0KKyNkZWZpbmUgQkxPQ0tfU0laRV9NQVNL
ICg0ICogS2lCIC0gMSkNCisNCiBzdGF0aWMgdm9pZCBzZGhjaV9zZW5kX2NvbW1hbmQoU0RIQ0lT
dGF0ZSAqcykNCiB7DQogICAgIFNEUmVxdWVzdCByZXF1ZXN0Ow0KQEAgLTM3MSw3ICszNzMsOCBA
QCBzdGF0aWMgdm9pZCBzZGhjaV9zZW5kX2NvbW1hbmQoU0RIQ0lTdGF0ZSAqcykNCiANCiAgICAg
c2RoY2lfdXBkYXRlX2lycShzKTsNCiANCi0gICAgaWYgKCF0aW1lb3V0ICYmIHMtPmJsa3NpemUg
JiYgKHMtPmNtZHJlZyAmIFNESENfQ01EX0RBVEFfUFJFU0VOVCkpIHsNCisgICAgaWYgKCF0aW1l
b3V0ICYmIChzLT5ibGtzaXplICYgQkxPQ0tfU0laRV9NQVNLKSAmJg0KKyAgICAgICAgKHMtPmNt
ZHJlZyAmIFNESENfQ01EX0RBVEFfUFJFU0VOVCkpIHsNCiAgICAgICAgIHMtPmRhdGFfY291bnQg
PSAwOw0KICAgICAgICAgc2RoY2lfZGF0YV90cmFuc2ZlcihzKTsNCiAgICAgfQ0KQEAgLTQwNiw3
ICs0MDksNiBAQCBzdGF0aWMgdm9pZCBzZGhjaV9lbmRfdHJhbnNmZXIoU0RIQ0lTdGF0ZSAqcykN
CiAvKg0KICAqIFByb2dyYW1tZWQgaS9vIGRhdGEgdHJhbnNmZXINCiAgKi8NCi0jZGVmaW5lIEJM
T0NLX1NJWkVfTUFTSyAoNCAqIEtpQiAtIDEpDQogDQogLyogRmlsbCBob3N0IGNvbnRyb2xsZXIn
cyByZWFkIGJ1ZmZlciB3aXRoIEJMS1NJWkUgYnl0ZXMgb2YgZGF0YSBmcm9tIGNhcmQgKi8NCiBz
dGF0aWMgdm9pZCBzZGhjaV9yZWFkX2Jsb2NrX2Zyb21fY2FyZChTREhDSVN0YXRlICpzKQ0KQEAg
LTExMzcsNyArMTEzOSw4IEBAIHNkaGNpX3dyaXRlKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNl
dCwgdWludDY0X3QgdmFsLCB1bnNpZ25lZCBzaXplKQ0KICAgICAgICAgICAgIHMtPnNkbWFzeXNh
ZCA9IChzLT5zZG1hc3lzYWQgJiBtYXNrKSB8IHZhbHVlOw0KICAgICAgICAgICAgIE1BU0tFRF9X
UklURShzLT5zZG1hc3lzYWQsIG1hc2ssIHZhbHVlKTsNCiAgICAgICAgICAgICAvKiBXcml0aW5n
IHRvIGxhc3QgYnl0ZSBvZiBzZG1hc3lzYWQgbWlnaHQgdHJpZ2dlciB0cmFuc2ZlciAqLw0KLSAg
ICAgICAgICAgIGlmICghKG1hc2sgJiAweEZGMDAwMDAwKSAmJiBzLT5ibGtjbnQgJiYgcy0+Ymxr
c2l6ZSAmJg0KKyAgICAgICAgICAgIGlmICghKG1hc2sgJiAweEZGMDAwMDAwKSAmJiBzLT5ibGtj
bnQgJiYNCisgICAgICAgICAgICAgICAgKHMtPmJsa3NpemUgJiBCTE9DS19TSVpFX01BU0spICYm
DQogICAgICAgICAgICAgICAgIFNESENfRE1BX1RZUEUocy0+aG9zdGN0bDEpID09IFNESENfQ1RS
TF9TRE1BKSB7DQogICAgICAgICAgICAgICAgIGlmIChzLT50cm5tb2QgJiBTREhDX1RSTlNfTVVM
VEkpIHsNCiAgICAgICAgICAgICAgICAgICAgIHNkaGNpX3NkbWFfdHJhbnNmZXJfbXVsdGlfYmxv
Y2tzKHMpOw0KQEAgLTExNTEsNyArMTE1NCwxMSBAQCBzZGhjaV93cml0ZSh2b2lkICpvcGFxdWUs
IGh3YWRkciBvZmZzZXQsIHVpbnQ2NF90IHZhbCwgdW5zaWduZWQgc2l6ZSkNCiAgICAgICAgIGlm
ICghVFJBTlNGRVJSSU5HX0RBVEEocy0+cHJuc3RzKSkgew0KICAgICAgICAgICAgIHVpbnQxNl90
IGJsa3NpemUgPSBzLT5ibGtzaXplOw0KIA0KLSAgICAgICAgICAgIE1BU0tFRF9XUklURShzLT5i
bGtzaXplLCBtYXNrLCBleHRyYWN0MzIodmFsdWUsIDAsIDEyKSk7DQorICAgICAgICAgICAgLyoN
CisgICAgICAgICAgICAgKiBbMTQ6MTJdIFNETUEgQnVmZmVyIEJvdW5kYXJ5DQorICAgICAgICAg
ICAgICogWzExOjAwXSBUcmFuc2ZlciBCbG9jayBTaXplDQorICAgICAgICAgICAgICovDQorICAg
ICAgICAgICAgTUFTS0VEX1dSSVRFKHMtPmJsa3NpemUsIG1hc2ssIGV4dHJhY3QzMih2YWx1ZSwg
MCwgMTUpKTsNCiAgICAgICAgICAgICBNQVNLRURfV1JJVEUocy0+YmxrY250LCBtYXNrID4+IDE2
LCB2YWx1ZSA+PiAxNik7DQogDQogICAgICAgICAgICAgLyogTGltaXQgYmxvY2sgc2l6ZSB0byB0
aGUgbWF4aW11bSBidWZmZXIgc2l6ZSAqLw0KLS0gDQoyLjE3LjENCg0K

