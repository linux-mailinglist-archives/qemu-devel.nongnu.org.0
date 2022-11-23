Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088F634C5E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 02:11:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxeGU-0007sA-7F; Tue, 22 Nov 2022 20:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1oxeGS-0007rx-OK
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 20:09:24 -0500
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1oxeGQ-0001yO-L2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 20:09:24 -0500
Received: from SJSMAIL01.us.kioxia.com (10.90.133.90) by
 SJSMAIL01.us.kioxia.com (10.90.133.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 22 Nov 2022 17:03:14 -0800
Received: from SJSMAIL01.us.kioxia.com ([::1]) by SJSMAIL01.us.kioxia.com
 ([fe80::f5ad:7ba5:d6cc:6f21%3]) with mapi id 15.01.2375.034; Tue, 22 Nov 2022
 17:03:14 -0800
From: Clay Mayers <Clay.Mayers@kioxia.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Keith Busch
 <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?utf-8?B?UGhsaXBwZSBNYXRoaWV1LURhdWTDqQ==?= <f4bug@amsat.org>, "Dmitry
 Fomichev" <dmitry.fomichev@wdc.com>
Subject: RE: [PATCH V2 0/4] hw/block/nvme: Implement ZNS finish-zone ZDC AEN
Thread-Topic: [PATCH V2 0/4] hw/block/nvme: Implement ZNS finish-zone ZDC AEN
Thread-Index: AQHY5aY4pNtOdbFOA0uMGvVaZoR3h6426JaAgBTxbHA=
Date: Wed, 23 Nov 2022 01:03:13 +0000
Message-ID: <7895469dff664072a802e5db953b3c45@kioxia.com>
References: <20221021231038.1042659-1-clay.mayers@kioxia.com>
 <Y2tnb2AIOX4nyykC@cormorant.local>
In-Reply-To: <Y2tnb2AIOX4nyykC@cormorant.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.93.77.43]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=12.0.68.226; envelope-from=Clay.Mayers@kioxia.com;
 helo=SJSMAIL01.us.kioxia.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

PiBGcm9tOiBLbGF1cyBKZW5zZW4gPGl0c0BpcnJlbGV2YW50LmRrPg0KPiBTZW50OiBXZWRuZXNk
YXksIE5vdmVtYmVyIDksIDIwMjIgMTI6NDAgQU0NCj4gDQo+IE9uIE9jdCAyMSAxNjoxMCwgY2xh
eS5tYXllcnNAa2lveGlhLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBDbGF5IE1heWVycyA8Y2xheS5t
YXllcnNAa2lveGlhLmNvbT4NCj4gPg0KPiA+IFpOUyBjb250cm9sbGVycyBoYXZlIHRoZSBvcHRp
b24gdG8gbGltaXQgdGhlIHRpbWUgYSB6b25lIGNhbiByZW1haW4gaW4NCj4gPiB0aGUgYWN0aXZl
IHN0YXRlLiAgSXQgYmVnaW5zIHdpdGggYSBiYWNrZ3JvdW5kIHByb2Nlc3MgaW4gdGhlIGNvbnRy
b2xsZXINCj4gPiBzZXR0aW5nIHRoZSBmaW5pc2gtem9uZS1yZWNvbW1lbmRlZCBGWlIgYXR0cmli
dXRlIGZvciBhIHpvbmUuICBBcyBwYXJ0IG9mDQo+ID4gc2V0dGluZyB0aGlzIGF0dHJpYnV0ZSwg
dGhlIHpvbmUncyBpZCBpcyBhZGRlZCB0byB0aGUgbmFtZXNwYWNlJ3MNCj4gPiB6b25lLWRlc2Ny
aXB0b3ItY2hhbmdlZCAoWkRDKSBsb2cgcGFnZS4gSWYgZW5hYmxlZCwgaXRlbXMgYWRkZWQgdG8g
dGhlDQo+ID4gWkRDIGxvZyBwYWdlIGdlbmVyYXRlIGEgWkRDICJhc3luY2hyb25vdXMgZXZlbnQg
bm90aWZpY2F0aW9uIiBBRU4uDQo+IE9wdGlvbmFsbHksDQo+ID4gdGhlIGNvbnRyb2wgY2FuIGlu
ZHVjZSBhICJ6b25lIGV4Y3Vyc2lvbiIgZm9yY2luZyB0aGUgem9uZSBpbnRvIHRoZSBmaW5pc2hl
ZA0KPiA+IHN0YXRlIHRoYXQgYWxzbyBnZW5lcmF0ZXMgYSBaREMgZXZlbnQuDQo+ID4NCj4gPiBa
b25lIGVuYWJsZWQgYXBwbGljYXRpb25zIG5lZWQgdG8gcHJvcGVybHkgaGFuZGxlIFpEQyBldmVu
dHMuIEluIGEgcmVhbA0KPiBkZXZpY2UsDQo+ID4gdGhlIHRpbWVvdXQgaXMgbWFueSBob3VycyBt
YWtpbmcgdGVzdGluZyBhbiBhcHBsaWNhdGlvbiBkaWZmaWN1bHQuDQo+ID4gSW1wbGVtZW50ZWQg
aXMgdGhlIGdlbmVyYXRpb24gb2YgRlpSIFpEQyBldmVudHMgdG8gc3BlZWQgdXAgTy9TIGFuZA0K
PiBhcHBsaWNhdGlvbg0KPiA+IHRlc3RpbmcuDQo+ID4NCj4gPiBBZGRlZCB0byB0aGUgem9uZWQg
TlZNZSBjb21tYW5kIHNldCBpcyBhbiBvcHRpb25hbCwgcGVyLW5hbWVzcGFjZSB0aW1lcg0KPiA+
ICh6b25lZC5maW5pc2hfdGltZSkgdG8gc2V0IHRoZSBGWlIgYXR0ciBmb3IgbG9uZy1saXZlZCBh
Y3RpdmUgem9uZXM7IEEgcGVyDQo+ID4gbmFtZXNwYWNlIFpEQyBsb2cgcGFnZTsgQUVOIHJlc3Vs
dHMgdG8gaW5jbHVkaW5nIENRRS5EVzEgKHRoZSBOU0lEIG9mIHRoZQ0KPiBaREMNCj4gPiBBRU4p
IGFuZCBnZW5lcmF0aW5nIGEgWkRDIEFFTiBpZiBpdCdzIGJlZW4gZW5hYmxlZC4gWm9uZSBleGN1
cnNpb25zIGFyZSBub3QNCj4gPiBtb2RlbGVkLg0KPiA+DQo+ID4gU2VlIHNlY3Rpb24gNS41IG9m
IHRoZSBOVk1lIFpvbmVkIE5hbWVzcGFjZSBDb21tYW5kIFNldCBTcGVjaWZpY2F0aW9uDQo+IHYx
LjENCj4gPiBmb3IgbW9yZSBkZXRhaWxzLg0KPiA+DQo+ID4gQ2hhbmdlcyBzaW5jZSB2MQ0KPiA+
IC0gRml4ZWQgb2Zmc2V0IGxlbmd0aCBjaGVja2luZyBpbiB6ZGMgbG9nIHBhZ2UNCj4gPiAtIE1v
dmVkIHpkY19ldmVudF9xdWV1ZWQgdG8gdGhlIHBhdGNoIDQNCj4gPiAtIFVud2F0Y2hlZCB6ZGMg
ZXZlbnRzIGluIG52bWVfZXhpdCgpDQo+ID4NCj4gPiBDbGF5IE1heWVycyAoNCk6DQo+ID4gICBo
dy9ibG9jay9udm1lOiBhZGQgWk9ORV9GSU5JU0hfUkVDT01NRU5ERUQgZnVuY3Rpb25hbGl0eQ0K
PiA+ICAgaHcvYmxvY2svbnZtZTogYWRkIHpvbmUgZGVzY3JpcHRvciBjaGFuZ2VkIGxvZyBwYWdl
DQo+ID4gICBody9ibG9jay9udm1lOiBzdXBwbHkgZHcxIGZvciBhZW4gcmVzdWx0DQo+ID4gICBo
dy9ibG9jay9udm1lOiBhZGQgem9uZSBkZXNjcmlwdG9yIGNoYW5nZWQgQUVODQo+ID4NCj4gPiAg
ZG9jcy9zeXN0ZW0vZGV2aWNlcy9udm1lLnJzdCB8ICAgNSArDQo+ID4gIGh3L252bWUvY3RybC5j
ICAgICAgICAgICAgICAgfCAxNzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0N
Cj4gPiAgaHcvbnZtZS9ucy5jICAgICAgICAgICAgICAgICB8ICAxNSArKysNCj4gPiAgaHcvbnZt
ZS9udm1lLmggICAgICAgICAgICAgICB8ICAzNyArKysrKysrLQ0KPiA+ICBody9udm1lL3RyYWNl
LWV2ZW50cyAgICAgICAgIHwgICAzICstDQo+ID4gIGluY2x1ZGUvYmxvY2svbnZtZS5oICAgICAg
ICAgfCAgMTQgKystDQo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgMjMzIGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjI3LjANCj4gPg0KPiANCj4gTmljZSB3
b3JrIENsYXkhDQoNClRoYW5rcyEgSSB0aGluayB5b3UgaGFkIGltcGxlbWVudGVkIGV4Y3Vyc2lv
bnMgYXQgb25lIHBvaW50IGFuZCBJJ20NCm5vdCBzdXJlIHdoeSBpdCBkaWRuJ3QgbWFrZSBpdCBp
bi4gSSBvcmlnaW5hbGx5IGxlZnQgb3V0IGV4Y3Vyc2lvbnMgYmVjYXVzZQ0KYWxsIEkgbmVlZGVk
IHdhcyB0aGUgQUVOIHRvIHRlc3QgbXkgTGludXggcGF0Y2guICBJIGhhdmUgYSBWMyBpbiB0aGUg
d29ya3MNCndpdGggZXhjdXJzaW9ucyBzbyBJIGNhbiB0ZXN0IHdoYXQgaGFwcGVucyB0byBsaWJ6
YmQgYXBwbGljYXRpb25zLiBJIGNhbid0DQp0ZWxsIGlmIHRoZXJlIGlzIHJlYWwgaW50ZXJlc3Qg
aW4gdGhpcyBidXQgSSd2ZSB0ZXN0ZWQgcm9ja3NEQiB1c2luZyB6ZW5mcyBhbmQNCml0IGhhcyBk
aWZmaWN1bHRpZXMgd2l0aCB6b25lIGV4Y3Vyc2lvbnMuICBXaGF0IEkgZG9uJ3Qga25vdyBpcyBp
ZiBleGN1cnNpb25zDQphcmUgYSBjb3JuZXIgY2FzZSBvciBub3QgLSBpbiBteSB3b3JsZCwgdGhl
eSBhcmUgbm90Lg0KDQo+IA0KPiBTZXJpZXMgbG9va3MgZ29vZCB0byBtZSwNCj4gDQo+IFJldmll
d2VkLWJ5OiBLbGF1cyBKZW5zZW4gPGsuamVuc2VuQHNhbXN1bmcuY29tPg0K

