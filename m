Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA117F175
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 09:09:27 +0100 (CET)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBZx8-00083F-OY
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 04:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jBZwH-0007Lu-PZ
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jBZwG-0003dI-GP
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:08:33 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:60858 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jBZwD-0003RY-HD; Tue, 10 Mar 2020 04:08:29 -0400
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id C490AEDDFAFFE63D0BC4;
 Tue, 10 Mar 2020 16:08:24 +0800 (CST)
Received: from DGGEMM511-MBX.china.huawei.com ([169.254.1.115]) by
 DGGEMM401-HUB.china.huawei.com ([10.3.20.209]) with mapi id 14.03.0439.000;
 Tue, 10 Mar 2020 16:08:17 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
Thread-Topic: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
Thread-Index: AQHV8txXWFydji2esEaJwP7bouY1uqg/odiAgAHJJhA=
Date: Tue, 10 Mar 2020 08:08:17 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83B68019B@dggemm511-mbx.china.huawei.com>
References: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
 <CAFEAcA8fnz2oaa-CO-EEK_vQTWfPih4PrAB3i4UUgQpv9Y_4mg@mail.gmail.com>
In-Reply-To: <CAFEAcA8fnz2oaa-CO-EEK_vQTWfPih4PrAB3i4UUgQpv9Y_4mg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.133.205.93]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.255
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
 QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUGV0ZXIgTWF5ZGVsbCBbbWFpbHRv
OnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj5TZW50OiBNb25kYXksIE1hcmNoIDksIDIwMjAg
NzozNiBQTQ0KPlRvOiBDaGVucXVuIChrdWhuKSA8a3Vobi5jaGVucXVuQGh1YXdlaS5jb20+DQo+
Q2M6IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgUUVNVSBUcml2aWFs
IDxxZW11LQ0KPnRyaXZpYWxAbm9uZ251Lm9yZz47IFpoYW5naGFpbGlhbmcgPHpoYW5nLnpoYW5n
aGFpbGlhbmdAaHVhd2VpLmNvbT47DQo+SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT47
IFBldGVyIENodWJiDQo+PHBldGVyLmNodWJiQG5pY3RhLmNvbS5hdT47IHFlbXUtYXJtIDxxZW11
LWFybUBub25nbnUub3JnPjsgRXVsZXINCj5Sb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4N
Cj5TdWJqZWN0OiBSZTogW1BBVENIIHYyXSBody9uZXQvaW14X2ZlYzogd3JpdGUgVEdTUiBhbmQg
VENTUjMgaW4NCj5pbXhfZW5ldF93cml0ZSgpDQo+DQo+T24gVGh1LCA1IE1hciAyMDIwIGF0IDEw
OjUzLCBDaGVuIFF1biA8a3Vobi5jaGVucXVuQGh1YXdlaS5jb20+IHdyb3RlOg0KPj4NCj4+IFRo
ZSBjdXJyZW50IGNvZGUgY2F1c2VzIGNsYW5nIHN0YXRpYyBjb2RlIGFuYWx5emVyIGdlbmVyYXRl
IHdhcm5pbmc6DQo+PiBody9uZXQvaW14X2ZlYy5jOjg1ODo5OiB3YXJuaW5nOiBWYWx1ZSBzdG9y
ZWQgdG8gJ3ZhbHVlJyBpcyBuZXZlciByZWFkDQo+PiAgICAgICAgIHZhbHVlID0gdmFsdWUgJiAw
eDAwMDAwMDBmOw0KPj4gICAgICAgICBeICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fg0KPj4gaHcv
bmV0L2lteF9mZWMuYzo4NjQ6OTogd2FybmluZzogVmFsdWUgc3RvcmVkIHRvICd2YWx1ZScgaXMg
bmV2ZXIgcmVhZA0KPj4gICAgICAgICB2YWx1ZSA9IHZhbHVlICYgMHgwMDAwMDBmZDsNCj4+ICAg
ICAgICAgXiAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn4NCj4+DQo+PiBBY2NvcmRpbmcgdG8gdGhl
IGRlZmluaXRpb24gb2YgdGhlIGZ1bmN0aW9uLCB0aGUgdHdvIOKAnHZhbHVl4oCdDQo+PiBhc3Np
Z25tZW50cyAgc2hvdWxkIGJlIHdyaXR0ZW4gdG8gcmVnaXN0ZXJzLg0KPj4NCj4+IFJlcG9ydGVk
LWJ5OiBFdWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4+IFNpZ25lZC1vZmYt
Ynk6IENoZW4gUXVuIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT4NCj4+IC0tLQ0KPj4gdjEtPnYy
Og0KPj4gICBUaGUgcmVnaXN0ZXIgJ0VORVRfVEdTUicgd3JpdGUtMS10by1jbGVhciB0aW1lciBm
bGFnLg0KPj4gICBUaGUgcmVnaXN0ZXIgJ0VORVRfVENTUm4nIDdiaXQoVEYpIHdyaXRlLTEtdG8t
Y2xlYXIgdGltZXIgZmxhZy4NCj4+IC0tLQ0KPj4gIGh3L25ldC9pbXhfZmVjLmMgfCA2ICsrKyst
LQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2h3L25ldC9pbXhfZmVjLmMgYi9ody9uZXQvaW14X2ZlYy5jIGlu
ZGV4DQo+PiA2YTEyNGExNTRhLi4zMjJjYmRjYzE3IDEwMDY0NA0KPj4gLS0tIGEvaHcvbmV0L2lt
eF9mZWMuYw0KPj4gKysrIGIvaHcvbmV0L2lteF9mZWMuYw0KPj4gQEAgLTg1NSwxMyArODU1LDE1
IEBAIHN0YXRpYyB2b2lkIGlteF9lbmV0X3dyaXRlKElNWEZFQ1N0YXRlICpzLA0KPnVpbnQzMl90
IGluZGV4LCB1aW50MzJfdCB2YWx1ZSkNCj4+ICAgICAgICAgIGJyZWFrOw0KPj4gICAgICBjYXNl
IEVORVRfVEdTUjoNCj4+ICAgICAgICAgIC8qIGltcGxlbWVudCBjbGVhciB0aW1lciBmbGFnICov
DQo+PiAtICAgICAgICB2YWx1ZSA9IHZhbHVlICYgMHgwMDAwMDAwZjsNCj4+ICsgICAgICAgIHMt
PnJlZ3NbaW5kZXhdIF49IHMtPnJlZ3NbaW5kZXhdICYgdmFsdWU7DQo+PiArICAgICAgICBzLT5y
ZWdzW2luZGV4XSAmPSAweDAwMDAwMDBmOw0KPj4gICAgICAgICAgYnJlYWs7DQo+PiAgICAgIGNh
c2UgRU5FVF9UQ1NSMDoNCj4+ICAgICAgY2FzZSBFTkVUX1RDU1IxOg0KPj4gICAgICBjYXNlIEVO
RVRfVENTUjI6DQo+PiAgICAgIGNhc2UgRU5FVF9UQ1NSMzoNCj4+IC0gICAgICAgIHZhbHVlID0g
dmFsdWUgJiAweDAwMDAwMGZkOw0KPj4gKyAgICAgICAgcy0+cmVnc1tpbmRleF0gPSAodmFsdWUg
JiAweDAwMDAwMDgwKSA/ICgweDAwMDAwMDdkICYgdmFsdWUpIDoNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgKHZhbHVlICYgMHgwMDAwMDBmZCk7DQo+PiAgICAgICAgICBicmVhazsNCj4+
ICAgICAgY2FzZSBFTkVUX1RDQ1IwOg0KPj4gICAgICBjYXNlIEVORVRfVENDUjE6DQo+DQo+VGhp
cyBpc24ndCB0aGUgdXN1YWwgd2F5IHRvIHdyaXRlIFcxQyBiZWhhdmlvdXIuDQo+SWYgYWxsIHRo
ZSByZWxldmFudCBiaXRzIGFyZSBXMUMsIGFzIGZvciBUR1NSOg0KPg0KPiAgIHMtPnJlZ3NbaW5k
ZXhdICY9IH4odmFsdWUgJiAweGYpOyAvKiBhbGwgYml0cyBXMUMgKi8NCj4NClllcywgaXQgbG9v
a3MgYmV0dGVyLg0KQnV0IGRvIHdlIG5lZWQgY2xlYXIgdGhlIHJlc2VydmVkIGJpdCAoMzEgLSA0
IGJpdHMpIGV4cGxpY2l0bHkgPw0KDQpXZSBzZWUgdGhhdCBvdGhlciByZWdpc3RlcnMgaGF2ZSBl
eHBsaWNpdGx5IGNsZWFyZWQgdGhlIHJlc2VydmVkIGJpdCwgIHdoaWNoIGFsc28gbWVldHMgdGhl
IEkuTVggZGF0YXNoZWV0IHJlcXVpcmVtZW50cy4NCg0Kcy0+cmVnc1tpbmRleF0gJj0gfih2YWx1
ZSAmIDB4ZikgJiAweGY7ICAgIC8qIDAtMyBiaXRzIFcxQywgNC0zMSByZXNlcnZlZCAgYml0cyB3
cml0ZSB6ZXJvICovDQoNCj5JZiBzb21lIGJ1dCBub3QgYWxsIGJpdHMgYXJlIFcxQywgYXMgZm9y
IFRDU1IqOg0KPg0KWWVzLCAgdGhpcyBwYXRjaCBpcyAganVzdCBvbmx5IFcxQyBmb3IgN2JpdCwg
bm90IGFsbCBiaXRzIGZvciBUQ1NSbi4NCkJ1dCBkbyB3ZSBuZWVkIGNsZWFyIHRoZSByZXNlcnZl
ZCBiaXQgKDMxIC0gOCBiaXRzKSBleHBsaWNpdGx5ID8NCg0KPiAgIHMtPnJlZ3NbaW5kZXhdICY9
IH4odmFsdWUgJiAweDgwKTsgLyogVzFDIGJpdHMgKi8NCg0Kcy0+cmVnc1tpbmRleF0gJj0gfih2
YWx1ZSAmIDB4ODApICAgJiAweGZmIDsgLyogNyBiaXRzICBXMUMsICA4LTMxIHJlc2VydmVkICBi
aXRzIHdyaXRlIHplcm8gKi8NCg0KPiAgIHMtPnJlZ3NbaW5kZXhdICY9IH4weDdkOyAvKiB3cml0
YWJsZSBmaWVsZHMgKi8NCj4gICBzLT5yZWdzW2luZGV4XSB8PSAodmFsdWUgJiAweDdkKTsgDQo+
DQo+dGhhbmtzDQo+LS0gUE1NDQo=

