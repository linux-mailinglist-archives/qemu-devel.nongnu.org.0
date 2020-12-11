Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1273D2D6E2D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 03:41:25 +0100 (CET)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knYN0-0001q0-0Y
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 21:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1knYLR-0001E0-TW; Thu, 10 Dec 2020 21:39:45 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1knYLP-0007P7-0d; Thu, 10 Dec 2020 21:39:45 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CsZj93wV2zVn8S;
 Fri, 11 Dec 2020 10:38:37 +0800 (CST)
Received: from DGGEMM422-HUB.china.huawei.com (10.1.198.39) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 11 Dec 2020 10:39:33 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.162]) by
 dggemm422-hub.china.huawei.com ([169.254.138.104]) with mapi id
 14.03.0487.000; Fri, 11 Dec 2020 10:39:28 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH v2 0/5] fix uninitialized variable warning
Thread-Topic: [PATCH v2 0/5] fix uninitialized variable warning
Thread-Index: AQHWuDYXNxoaXglDhk+L5K2ozZGhc6nxWTug
Date: Fri, 11 Dec 2020 02:39:28 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BAEA9AF@dggemm531-mbx.china.huawei.com>
References: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, ganqixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

S2luZGx5IHBpbmchDQoNCkhpIGZvbGtzLA0KIFBhdGNoIDEgdG8gUGF0Y2ggNCBhcmUgbm90IGlu
IHRoZSBxdWV1ZS4gIENvdWxkIHNvbWVvbmUgaGVscCBwaWNrIHRoZW0gdXA/DQoNClBhdGNoMX5Q
YXRjaDQ6DQogIGh3L3JkbWEvcmRtYV9iYWNrZW5kOiBmaXggdW5pbml0aWFsaXplZCB2YXJpYWJs
ZSB3YXJuaW5nIGluDQogICAgcmRtYV9wb2xsX2NxKCkNCiAgdXRpbC9xZW11LXRpbWVyOiBmaXgg
dW5pbml0aWFsaXplZCB2YXJpYWJsZSB3YXJuaW5nIGluDQogICAgdGltZXJfbW9kX2FudGljaXBh
dGVfbnMoKQ0KICB1dGlsL3FlbXUtdGltZXI6IGZpeCB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHdh
cm5pbmcgZm9yIGV4cGlyZV90aW1lDQogIHBsdWdpbnMvbG9hZGVyOiBmaXggdW5pbml0aWFsaXpl
ZCB2YXJpYWJsZSB3YXJuaW5nIGluDQogICAgcGx1Z2luX3Jlc2V0X3VuaW5zdGFsbCgpDQoNClRo
YW5rcywNCkNoZW4gUXVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
Q2hlbnF1biAoa3VobikNCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAxMSwgMjAyMCAxMDoy
MiBQTQ0KPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LXRyaXZpYWxAbm9uZ251Lm9y
Zw0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBaaGFuZ2hhaWxpYW5nDQo+IDx6aGFu
Zy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBnYW5xaXhpbiA8Z2FucWl4aW5AaHVhd2VpLmNv
bT47DQo+IENoZW5xdW4gKGt1aG4pIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT4NCj4gU3ViamVj
dDogW1BBVENIIHYyIDAvNV0gZml4IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUgd2FybmluZw0KPiAN
Cj4gSGkgYWxsLA0KPiAgIFRoZXJlIGFyZSBzb21lIHZhcmlhYmxlcyBpbml0aWFsaXplZCB3YXJu
aW5ncyByZXBvcnRlZCBieSB0aGUgR0NDXzkuMw0KPiBjb21waWxlci4NCj4gVGhpcyBzZXJpYWwg
aGFzIGFkZGVkIHNvbWUgZGVmYXVsdCB2YWx1ZXMgb3IgY2hhbmdlZCB0aGUgYXNzaWdubWVudCBw
bGFjZXMgZm9yDQo+IHRoZSB2YXJpYWJsaWVzIHRvIGZpeCB0aGVtLg0KPiANCj4gdjEtPnYyOg0K
PiAtLXBhdGNoMTogRHJvcCBpdCBiYXNlIG9uIE1heCBGaWxpcHBvdiBjb21tZW50Lg0KPiAtLXBh
dGNoMi0+cGF0Y2gxOiBBZGQgTWFyY2VsIEFwZmVsYmF1bSBhbmQgIFl1dmFsIFNoYWlhIHJldmll
dyBjb21tZW50Lg0KPiAtLXBhdGNoMy0+cGF0Y2gyOiBBZGQgUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgcmV2aWV3IGNvbW1lbnQuDQo+IC0tcGF0Y2g2LT5wYXRjaDU6IEFkZCBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSByZXZpZXcgY29tbWVudC4NCj4gDQo+IA0KPiBDaGVuIFF1biAoNSk6DQo+ICAg
aHcvcmRtYS9yZG1hX2JhY2tlbmQ6IGZpeCB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHdhcm5pbmcg
aW4NCj4gICAgIHJkbWFfcG9sbF9jcSgpDQo+ICAgdXRpbC9xZW11LXRpbWVyOiBmaXggdW5pbml0
aWFsaXplZCB2YXJpYWJsZSB3YXJuaW5nIGluDQo+ICAgICB0aW1lcl9tb2RfYW50aWNpcGF0ZV9u
cygpDQo+ICAgdXRpbC9xZW11LXRpbWVyOiBmaXggdW5pbml0aWFsaXplZCB2YXJpYWJsZSB3YXJu
aW5nIGZvciBleHBpcmVfdGltZQ0KPiAgIHBsdWdpbnMvbG9hZGVyOiBmaXggdW5pbml0aWFsaXpl
ZCB2YXJpYWJsZSB3YXJuaW5nIGluDQo+ICAgICBwbHVnaW5fcmVzZXRfdW5pbnN0YWxsKCkNCj4g
ICBtaWdyYXRpb246IGZpeCB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHdhcm5pbmcgaW4NCj4gICAg
IG1pZ3JhdGVfc2VuZF9ycF9yZXFfcGFnZXMoKQ0KPiANCj4gIGh3L3JkbWEvcmRtYV9iYWNrZW5k
LmMgfCAyICstDQo+ICBtaWdyYXRpb24vbWlncmF0aW9uLmMgIHwgMiArLQ0KPiAgcGx1Z2lucy9s
b2FkZXIuYyAgICAgICB8IDIgKy0NCj4gIHV0aWwvcWVtdS10aW1lci5jICAgICAgfCA4ICsrKy0t
LS0tDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkN
Cj4gDQo+IC0tDQo+IDIuMjcuMA0KDQo=

