Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60949653D36
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 10:01:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8HRX-000352-H6; Thu, 22 Dec 2022 04:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Lu.Gao@verisilicon.com>)
 id 1p8HR4-0002yt-IR; Thu, 22 Dec 2022 04:00:19 -0500
Received: from shasxm06.verisilicon.com ([101.89.135.45]
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Lu.Gao@verisilicon.com>)
 id 1p8HR1-0005Pi-7f; Thu, 22 Dec 2022 04:00:17 -0500
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1671699282; h=from:subject:to:date:message-id;
 bh=e0TxbGJmJTuAXeLxcjrnZY7Z6Xz+BF8RQsC4uoyTKzE=;
 b=Vc5pVZwddsGFymAZXvtqX4XsVe0RQOBSrGVk1MeqYFO66oLOeaGMuIopcmgA5MCU7z5n4gzS+VO
 vrw6RYbplD7TEW0kjgBukJ33EnASxo+v0pO729BQy6e06mvgux5rW/pz3WQqaz2Ymo0dy9d+ePfgb
 szb1YsC31EQOnoN2OFk=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([::1]) with mapi id 14.03.0408.000; Thu, 22 Dec
 2022 16:54:40 +0800
From: "Gao, Lu" <Lu.Gao@verisilicon.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>, Bin Meng
 <bin.meng@windriver.com>, "open list:SD (Secure Card)"
 <qemu-block@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>, Prasad J Pandit
 <pjp@fedoraproject.org>
Subject: RE: [PATCH] hw/sd/sdhci: Block Size Register bits [14:12] is lost
Thread-Topic: [PATCH] hw/sd/sdhci: Block Size Register bits [14:12] is lost
Thread-Index: AQHYPOiHQ0Dy2cvFy0+IfX/zeZSb4q04rN6AgUKfInA=
Date: Thu, 22 Dec 2022 08:54:39 +0000
Message-ID: <34781C803212B140A51E6B66D9092E5D01FA5C9937@SHASXM03.verisilicon.com>
References: <20220321055618.4026-1-lu.gao@verisilicon.com>
 <f15d8c9a-2a6f-1126-785f-0176eb78c3ec@amsat.org>
In-Reply-To: <f15d8c9a-2a6f-1126-785f-0176eb78c3ec@amsat.org>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.110.138]
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-25628.004
x-tm-as-result: No--8.913800-0.000000-31
x-tm-as-matchedid: 150567-151186-700225-703140-701090-703503-105250-700954-7
 04706-139006-700523-704186-106660-703408-704318-703880-700535-705249-139010
 -700598-703001-705244-703115-704822-701510-705248-704240-701845-704463-7018
 43-704011-702395-188019-704477-703968-702898-700946-703953-704959-702299-70
 1812-703812-704990-702975-704849-704823-63-148004-148133-20043-42000-4200
 3-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Lu.Gao@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGVsbG8sDQoNCkp1c3Qgd2FudCB0byBjaGVjayB3aGV0aGVyIHdlIGNhbiBoYXZlIGl0IG1lcmdl
ZD8gQW55IG90aGVyIGNvbW1lbnRzPw0KDQpUaGFua3MgYSBsb3QhDQpCLlIuDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSBbbWFpbHRv
OnBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kNClNlbnQ6IFR1ZXNkYXksIE1heSAzMSwgMjAyMiA2OjA5IFBNDQpUbzog
R2FvLCBMdTsgcWVtdS1kZXZlbEBub25nbnUub3JnDQpDYzogV2VuLCBKaWFueGlhbjsgQmluIE1l
bmc7IG9wZW4gbGlzdDpTRCAoU2VjdXJlIENhcmQpOyBBbGV4YW5kZXIgQnVsZWtvdjsgUHJhc2Fk
IEogUGFuZGl0DQpTdWJqZWN0OiBSZTogW1BBVENIXSBody9zZC9zZGhjaTogQmxvY2sgU2l6ZSBS
ZWdpc3RlciBiaXRzIFsxNDoxMl0gaXMgbG9zdA0KDQpPbiAyMS8zLzIyIDA2OjU2LCBMdSBHYW8g
d3JvdGU6DQo+IEJsb2NrIFNpemUgUmVnaXN0ZXIgYml0cyBbMTQ6MTJdIGlzIFNETUEgQnVmZmVy
IEJvdW5kYXJ5LCBpdCBpcyBtaXNzZWQNCj4gaW4gcmVnaXN0ZXIgd3JpdGUsIGJ1dCBpdCBpcyBu
ZWVkZWQgaW4gU0RNQSB0cmFuc2Zlci4gZS5nLiBpdCB3aWxsIGJlDQo+IHVzZWQgaW4gc2RoY2lf
c2RtYV90cmFuc2Zlcl9tdWx0aV9ibG9ja3MgdG8gY2FsY3VsYXRlIGJvdW5kYXJ5XyB2YXJpYWJs
ZXMuDQo+IA0KPiBNaXNzaW5nIHRoaXMgZmllbGQgd2lsbCBjYXVzZSB3cm9uZyBvcGVyYXRpb24g
Zm9yIGRpZmZlcmVudCBTRE1BIEJ1ZmZlcg0KPiBCb3VuZGFyeSBzZXR0aW5ncy4NCg0KRml4ZXM6
IGQ3ZGZjYTA4MDcgKCJody9zZGhjaTogaW50cm9kdWNlIHN0YW5kYXJkIFNEIGhvc3QgY29udHJv
bGxlciIpDQpGaXhlczogZGZiYTk5ZjE3ZiAoImh3L3NkaGNpOiBGaXggRE1BIFRyYW5zZmVyIEJs
b2NrIFNpemUgZmllbGQiKQ0KDQpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PGY0YnVnQGFtc2F0Lm9yZz4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBMdSBHYW8gPGx1Lmdhb0B2ZXJp
c2lsaWNvbi5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEppYW54aWFuIFdlbiA8amlhbnhpYW4ud2Vu
QHZlcmlzaWxpY29uLmNvbT4NCj4gLS0tDQo+ICAgaHcvc2Qvc2RoY2kuYyB8IDE1ICsrKysrKysr
KysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3NkL3NkaGNpLmMgYi9ody9zZC9zZGhjaS5jDQo+
IGluZGV4IGUwYmJjOTAzNDQuLjM1MGNlYjQ4N2QgMTAwNjQ0DQo+IC0tLSBhL2h3L3NkL3NkaGNp
LmMNCj4gKysrIGIvaHcvc2Qvc2RoY2kuYw0KPiBAQCAtMzIxLDYgKzMyMSw4IEBAIHN0YXRpYyB2
b2lkIHNkaGNpX3Bvd2Vyb25fcmVzZXQoRGV2aWNlU3RhdGUgKmRldikNCj4gICANCj4gICBzdGF0
aWMgdm9pZCBzZGhjaV9kYXRhX3RyYW5zZmVyKHZvaWQgKm9wYXF1ZSk7DQo+ICAgDQo+ICsjZGVm
aW5lIEJMT0NLX1NJWkVfTUFTSyAoNCAqIEtpQiAtIDEpDQo+ICsNCj4gICBzdGF0aWMgdm9pZCBz
ZGhjaV9zZW5kX2NvbW1hbmQoU0RIQ0lTdGF0ZSAqcykNCj4gICB7DQo+ICAgICAgIFNEUmVxdWVz
dCByZXF1ZXN0Ow0KPiBAQCAtMzcxLDcgKzM3Myw4IEBAIHN0YXRpYyB2b2lkIHNkaGNpX3NlbmRf
Y29tbWFuZChTREhDSVN0YXRlICpzKQ0KPiAgIA0KPiAgICAgICBzZGhjaV91cGRhdGVfaXJxKHMp
Ow0KPiAgIA0KPiAtICAgIGlmICghdGltZW91dCAmJiBzLT5ibGtzaXplICYmIChzLT5jbWRyZWcg
JiBTREhDX0NNRF9EQVRBX1BSRVNFTlQpKSB7DQo+ICsgICAgaWYgKCF0aW1lb3V0ICYmIChzLT5i
bGtzaXplICYgQkxPQ0tfU0laRV9NQVNLKSAmJg0KPiArICAgICAgICAocy0+Y21kcmVnICYgU0RI
Q19DTURfREFUQV9QUkVTRU5UKSkgew0KPiAgICAgICAgICAgcy0+ZGF0YV9jb3VudCA9IDA7DQo+
ICAgICAgICAgICBzZGhjaV9kYXRhX3RyYW5zZmVyKHMpOw0KPiAgICAgICB9DQo+IEBAIC00MDYs
NyArNDA5LDYgQEAgc3RhdGljIHZvaWQgc2RoY2lfZW5kX3RyYW5zZmVyKFNESENJU3RhdGUgKnMp
DQo+ICAgLyoNCj4gICAgKiBQcm9ncmFtbWVkIGkvbyBkYXRhIHRyYW5zZmVyDQo+ICAgICovDQo+
IC0jZGVmaW5lIEJMT0NLX1NJWkVfTUFTSyAoNCAqIEtpQiAtIDEpDQo+ICAgDQo+ICAgLyogRmls
bCBob3N0IGNvbnRyb2xsZXIncyByZWFkIGJ1ZmZlciB3aXRoIEJMS1NJWkUgYnl0ZXMgb2YgZGF0
YSBmcm9tIGNhcmQgKi8NCj4gICBzdGF0aWMgdm9pZCBzZGhjaV9yZWFkX2Jsb2NrX2Zyb21fY2Fy
ZChTREhDSVN0YXRlICpzKQ0KPiBAQCAtMTEzNyw3ICsxMTM5LDggQEAgc2RoY2lfd3JpdGUodm9p
ZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0LCB1aW50NjRfdCB2YWwsIHVuc2lnbmVkIHNpemUpDQo+
ICAgICAgICAgICAgICAgcy0+c2RtYXN5c2FkID0gKHMtPnNkbWFzeXNhZCAmIG1hc2spIHwgdmFs
dWU7DQo+ICAgICAgICAgICAgICAgTUFTS0VEX1dSSVRFKHMtPnNkbWFzeXNhZCwgbWFzaywgdmFs
dWUpOw0KPiAgICAgICAgICAgICAgIC8qIFdyaXRpbmcgdG8gbGFzdCBieXRlIG9mIHNkbWFzeXNh
ZCBtaWdodCB0cmlnZ2VyIHRyYW5zZmVyICovDQo+IC0gICAgICAgICAgICBpZiAoIShtYXNrICYg
MHhGRjAwMDAwMCkgJiYgcy0+YmxrY250ICYmIHMtPmJsa3NpemUgJiYNCj4gKyAgICAgICAgICAg
IGlmICghKG1hc2sgJiAweEZGMDAwMDAwKSAmJiBzLT5ibGtjbnQgJiYNCj4gKyAgICAgICAgICAg
ICAgICAocy0+Ymxrc2l6ZSAmIEJMT0NLX1NJWkVfTUFTSykgJiYNCj4gICAgICAgICAgICAgICAg
ICAgU0RIQ19ETUFfVFlQRShzLT5ob3N0Y3RsMSkgPT0gU0RIQ19DVFJMX1NETUEpIHsNCj4gICAg
ICAgICAgICAgICAgICAgaWYgKHMtPnRybm1vZCAmIFNESENfVFJOU19NVUxUSSkgew0KPiAgICAg
ICAgICAgICAgICAgICAgICAgc2RoY2lfc2RtYV90cmFuc2Zlcl9tdWx0aV9ibG9ja3Mocyk7DQo+
IEBAIC0xMTUxLDcgKzExNTQsMTEgQEAgc2RoY2lfd3JpdGUodm9pZCAqb3BhcXVlLCBod2FkZHIg
b2Zmc2V0LCB1aW50NjRfdCB2YWwsIHVuc2lnbmVkIHNpemUpDQo+ICAgICAgICAgICBpZiAoIVRS
QU5TRkVSUklOR19EQVRBKHMtPnBybnN0cykpIHsNCj4gICAgICAgICAgICAgICB1aW50MTZfdCBi
bGtzaXplID0gcy0+Ymxrc2l6ZTsNCj4gICANCj4gLSAgICAgICAgICAgIE1BU0tFRF9XUklURShz
LT5ibGtzaXplLCBtYXNrLCBleHRyYWN0MzIodmFsdWUsIDAsIDEyKSk7DQo+ICsgICAgICAgICAg
ICAvKg0KPiArICAgICAgICAgICAgICogWzE0OjEyXSBTRE1BIEJ1ZmZlciBCb3VuZGFyeQ0KPiAr
ICAgICAgICAgICAgICogWzExOjAwXSBUcmFuc2ZlciBCbG9jayBTaXplDQo+ICsgICAgICAgICAg
ICAgKi8NCj4gKyAgICAgICAgICAgIE1BU0tFRF9XUklURShzLT5ibGtzaXplLCBtYXNrLCBleHRy
YWN0MzIodmFsdWUsIDAsIDE1KSk7DQo+ICAgICAgICAgICAgICAgTUFTS0VEX1dSSVRFKHMtPmJs
a2NudCwgbWFzayA+PiAxNiwgdmFsdWUgPj4gMTYpOw0KPiAgIA0KPiAgICAgICAgICAgICAgIC8q
IExpbWl0IGJsb2NrIHNpemUgdG8gdGhlIG1heGltdW0gYnVmZmVyIHNpemUgKi8NCg0K

