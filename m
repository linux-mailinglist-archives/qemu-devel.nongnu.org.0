Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD32F2DF3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:33:52 +0100 (CET)
Received: from localhost ([::1]:35508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHvr-0006pN-4A
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kzHHA-00026v-Ds; Tue, 12 Jan 2021 05:51:48 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kzHH5-0005So-Tu; Tue, 12 Jan 2021 05:51:48 -0500
Received: from dggemi401-hub.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DFS626lBgz5GXN;
 Tue, 12 Jan 2021 18:50:34 +0800 (CST)
Received: from DGGEMI421-HUB.china.huawei.com (10.1.199.150) by
 dggemi401-hub.china.huawei.com (10.3.17.134) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 12 Jan 2021 18:51:22 +0800
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.51]) by
 dggemi421-hub.china.huawei.com ([10.1.199.150]) with mapi id 14.03.0509.000;
 Tue, 12 Jan 2021 18:51:13 +0800
From: ganqixin <ganqixin@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 1/2] pl031: Use timer_free() in the finalize function
 to avoid memleaks
Thread-Topic: [PATCH v2 1/2] pl031: Use timer_free() in the finalize
 function to avoid memleaks
Thread-Index: AQHW6Mybnw6580g4mUaCHBiRS8PgJqojQduAgACHiDA=
Date: Tue, 12 Jan 2021 10:51:12 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F49606625E97@DGGEMI525-MBS.china.huawei.com>
References: <20210112101746.379517-1-ganqixin@huawei.com>
 <20210112101746.379517-2-ganqixin@huawei.com>
 <CAFEAcA-68F=NcqS8AyiPTToc7CQyoymPhp3Z77idQkVk7fHYXg@mail.gmail.com>
In-Reply-To: <CAFEAcA-68F=NcqS8AyiPTToc7CQyoymPhp3Z77idQkVk7fHYXg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=ganqixin@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Euler Robot <euler.robot@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDEy
LCAyMDIxIDY6MjIgUE0NCj4gVG86IGdhbnFpeGluIDxnYW5xaXhpbkBodWF3ZWkuY29tPg0KPiBD
YzogUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBRRU1VIFRyaXZpYWwN
Cj4gPHFlbXUtdHJpdmlhbEBub25nbnUub3JnPjsgRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24u
ZHJvcGJlYXIuaWQuYXU+Ow0KPiBDaGVucXVuIChrdWhuKSA8a3Vobi5jaGVucXVuQGh1YXdlaS5j
b20+OyBaaGFuZ2hhaWxpYW5nDQo+IDx6aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBF
dWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzJdIHBsMDMxOiBVc2UgdGltZXJfZnJlZSgpIGluIHRoZSBmaW5hbGl6ZSBmdW5jdGlv
biB0bw0KPiBhdm9pZCBtZW1sZWFrcw0KPiANCj4gT24gVHVlLCAxMiBKYW4gMjAyMSBhdCAxMDoy
MCwgR2FuIFFpeGluIDxnYW5xaXhpbkBodWF3ZWkuY29tPiB3cm90ZToNCj4gPg0KPiA+IFdoZW4g
cnVubmluZyBkZXZpY2UtaW50cm9zcGVjdC10ZXN0LCBhIG1lbW9yeSBsZWFrIG9jY3VycmVkIGlu
IHRoZQ0KPiA+IHBsMDMxX2luaXQgZnVuY3Rpb24sIHRoaXMgcGF0Y2ggdXNlIHRpbWVyX2ZyZWUo
KSBpbiB0aGUgZmluYWxpemUgZnVuY3Rpb24gdG8gZml4DQo+IGl0Lg0KPiA+DQo+ID4gQVNBTiBz
aG93cyBtZW1vcnkgbGVhayBzdGFjazoNCj4gPg0KPiA+IERpcmVjdCBsZWFrIG9mIDQ4IGJ5dGUo
cykgaW4gMSBvYmplY3QocykgYWxsb2NhdGVkIGZyb206DQo+ID4gICAgICMwIDB4ZmZmZmFiOTdl
MWYwIGluIF9faW50ZXJjZXB0b3JfY2FsbG9jDQo+ICgvbGliNjQvbGliYXNhbi5zby41KzB4ZWUx
ZjApDQo+ID4gICAgICMxIDB4ZmZmZmFiMjU2ODAwIGluIGdfbWFsbG9jMCAoL2xpYjY0L2xpYmds
aWItMi4wLnNvLjArMHg1NjgwMCkNCj4gPiAgICAgIzIgMHhhYWFiZjU2MjFjZmMgaW4gdGltZXJf
bmV3X2Z1bGwNCj4gcWVtdS9pbmNsdWRlL3FlbXUvdGltZXIuaDo1MjMNCj4gPiAgICAgIzMgMHhh
YWFiZjU2MjFjZmMgaW4gdGltZXJfbmV3IHFlbXUvaW5jbHVkZS9xZW11L3RpbWVyLmg6NTQ0DQo+
ID4gICAgICM0IDB4YWFhYmY1NjIxY2ZjIGluIHRpbWVyX25ld19ucyBxZW11L2luY2x1ZGUvcWVt
dS90aW1lci5oOjU2Mg0KPiA+ICAgICAjNSAweGFhYWJmNTYyMWNmYyBpbiBwbDAzMV9pbml0IHFl
bXUvaHcvcnRjL3BsMDMxLmM6MTk0DQo+ID4gICAgICM2IDB4YWFhYmY2MzM5ZjZjIGluIG9iamVj
dF9pbml0aWFsaXplX3dpdGhfdHlwZQ0KPiBxZW11L3FvbS9vYmplY3QuYzo1MTUNCj4gPiAgICAg
IzcgMHhhYWFiZjYzM2ExZTAgaW4gb2JqZWN0X25ld193aXRoX3R5cGUNCj4gcWVtdS9xb20vb2Jq
ZWN0LmM6NzI5DQo+ID4gICAgICM4IDB4YWFhYmY2Mzc1ZTQwIGluIHFtcF9kZXZpY2VfbGlzdF9w
cm9wZXJ0aWVzDQo+IHFlbXUvcW9tL3FvbS1xbXAtY21kcy5jOjE1Mw0KPiA+ICAgICAjOSAweGFh
YWJmNWE5NTU0MCBpbiBxZGV2X2RldmljZV9oZWxwDQo+IHFlbXUvc29mdG1tdS9xZGV2LW1vbml0
b3IuYzoyODMNCj4gPiAgICAgIzEwIDB4YWFhYmY1YTk2OTQwIGluIHFtcF9kZXZpY2VfYWRkDQo+
IHFlbXUvc29mdG1tdS9xZGV2LW1vbml0b3IuYzo4MDENCj4gPiAgICAgIzExIDB4YWFhYmY1YTk2
ZTcwIGluIGhtcF9kZXZpY2VfYWRkDQo+IHFlbXUvc29mdG1tdS9xZGV2LW1vbml0b3IuYzo5MTYN
Cj4gPiAgICAgIzEyIDB4YWFhYmY1YWMwYTJjIGluIGhhbmRsZV9obXBfY29tbWFuZA0KPiBxZW11
L21vbml0b3IvaG1wLmM6MTEwMA0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IEV1bGVyIFJvYm90IDxl
dWxlci5yb2JvdEBodWF3ZWkuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEdhbiBRaXhpbiA8Z2Fu
cWl4aW5AaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiBDYzogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiA+IC0tLQ0KPiA+ICBody9ydGMvcGwwMzEuYyB8IDkgKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9ody9ydGMvcGwwMzEuYyBiL2h3L3J0Yy9wbDAzMS5jIGluZGV4DQo+ID4gYWU0
N2YwOTYzNS4uZjA5ODFlNmMyMSAxMDA2NDQNCj4gPiAtLS0gYS9ody9ydGMvcGwwMzEuYw0KPiA+
ICsrKyBiL2h3L3J0Yy9wbDAzMS5jDQo+ID4gQEAgLTE5NCw2ICsxOTQsMTQgQEAgc3RhdGljIHZv
aWQgcGwwMzFfaW5pdChPYmplY3QgKm9iaikNCj4gPiAgICAgIHMtPnRpbWVyID0gdGltZXJfbmV3
X25zKHJ0Y19jbG9jaywgcGwwMzFfaW50ZXJydXB0LCBzKTsgIH0NCj4gPg0KPiA+ICtzdGF0aWMg
dm9pZCBwbDAzMV9maW5hbGl6ZShPYmplY3QgKm9iaikgew0KPiA+ICsgICAgUEwwMzFTdGF0ZSAq
cyA9IFBMMDMxKG9iaik7DQo+ID4gKw0KPiA+ICsgICAgdGltZXJfZGVsKHMtPnRpbWVyKTsNCj4g
PiArICAgIHRpbWVyX2ZyZWUocy0+dGltZXIpOw0KPiANCj4gWW91IGRvbid0IG5lZWQgdG8gY2Fs
bCB0aW1lcl9kZWwoKSBiZWZvcmUgdGltZXJfZnJlZSgpIGFueSBtb3JlOg0KPiBzZWUgY29tbWl0
IDVmOGU5M2MzZTI2MmFiLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBJIGRpZG4ndCBu
b3RpY2UgdGhpcyBuZXcgY2hhbmdlLCBJIHdpbGwgcmVzZW5kIHRoZXNlIHBhdGNoZXMgbGF0ZXIu
DQo=

