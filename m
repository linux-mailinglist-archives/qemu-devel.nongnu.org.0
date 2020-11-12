Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A11F2B0474
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 12:55:12 +0100 (CET)
Received: from localhost ([::1]:37474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdBC3-0007VX-8b
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 06:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kdBB9-0006wV-91; Thu, 12 Nov 2020 06:54:15 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kdBB6-0002UX-H5; Thu, 12 Nov 2020 06:54:14 -0500
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CX0P74cdbzQpjJ;
 Thu, 12 Nov 2020 19:53:47 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.227]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0487.000;
 Thu, 12 Nov 2020 19:53:51 +0800
From: ganqixin <ganqixin@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 2/4] ads7846: put it into the 'display' category
Thread-Topic: [PATCH v2 2/4] ads7846: put it into the 'display' category
Thread-Index: AQHWuMRQVUxO2iZ1pUaFNOTIOGdJN6nD09KAgACG4uA=
Date: Thu, 12 Nov 2020 11:53:46 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065A8BC8@DGGEMI525-MBS.china.huawei.com>
References: <20201111164710.644863-1-ganqixin@huawei.com>
 <20201111164710.644863-3-ganqixin@huawei.com>
 <CAFEAcA85O_q2KzNW1mJevEvM0kO1u0vDgpfVnbFBkk_qovExnw@mail.gmail.com>
In-Reply-To: <CAFEAcA85O_q2KzNW1mJevEvM0kO1u0vDgpfVnbFBkk_qovExnw@mail.gmail.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 06:53:56
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: Thomas Huth <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIg
MTIsIDIwMjAgNzoyMCBQTQ0KPiBUbzogZ2FucWl4aW4gPGdhbnFpeGluQGh1YXdlaS5jb20+DQo+
IENjOiBRRU1VIERldmVsb3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IFFFTVUgVHJpdmlh
bA0KPiA8cWVtdS10cml2aWFsQG5vbmdudS5vcmc+OyBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0
LmNvbT47DQo+IFpoYW5naGFpbGlhbmcgPHpoYW5nLnpoYW5naGFpbGlhbmdAaHVhd2VpLmNvbT47
IE1pY2hhZWwgUy4gVHNpcmtpbg0KPiA8bXN0QHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8
bGF1cmVudEB2aXZpZXIuZXU+OyBNYXJrdXMgQXJtYnJ1c3Rlcg0KPiA8YXJtYnJ1QHJlZGhhdC5j
b20+OyBDaGVucXVuIChrdWhuKSA8a3Vobi5jaGVucXVuQGh1YXdlaS5jb20+Ow0KPiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMi80XSBhZHM3ODQ2OiBwdXQgaXQgaW50byB0aGUgJ2Rpc3BsYXknIGNhdGVnb3J5DQo+
IA0KPiBPbiBUaHUsIDEyIE5vdiAyMDIwIGF0IDA3OjI1LCBHYW4gUWl4aW4gPGdhbnFpeGluQGh1
YXdlaS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVGhlIGNhdGVnb3J5IG9mIHRoZSBhZHM3ODQ2IGRl
dmljZSBpcyBub3Qgc2V0LCBwdXQgaXQgaW50byB0aGUgJ2Rpc3BsYXknDQo+ID4gY2F0ZWdvcnku
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYW4gUWl4aW4gPGdhbnFpeGluQGh1YXdlaS5jb20+
DQo+ID4gLS0tDQo+ID4gIGh3L2Rpc3BsYXkvYWRzNzg0Ni5jIHwgMiArKw0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaHcvZGlzcGxh
eS9hZHM3ODQ2LmMgYi9ody9kaXNwbGF5L2Fkczc4NDYuYyBpbmRleA0KPiA+IDAyMzE2NWIyYTMu
LmI0NTVjYjVhY2QgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvZGlzcGxheS9hZHM3ODQ2LmMNCj4gPiAr
KysgYi9ody9kaXNwbGF5L2Fkczc4NDYuYw0KPiA+IEBAIC0xNjMsMTAgKzE2MywxMiBAQCBzdGF0
aWMgdm9pZCBhZHM3ODQ2X3JlYWxpemUoU1NJU2xhdmUgKmQsIEVycm9yDQo+ID4gKiplcnJwKQ0K
PiA+DQo+ID4gIHN0YXRpYyB2b2lkIGFkczc4NDZfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xh
c3MsIHZvaWQgKmRhdGEpICB7DQo+ID4gKyAgICBEZXZpY2VDbGFzcyAqZGMgPSBERVZJQ0VfQ0xB
U1Moa2xhc3MpOw0KPiA+ICAgICAgU1NJU2xhdmVDbGFzcyAqayA9IFNTSV9TTEFWRV9DTEFTUyhr
bGFzcyk7DQo+ID4NCj4gPiAgICAgIGstPnJlYWxpemUgPSBhZHM3ODQ2X3JlYWxpemU7DQo+ID4g
ICAgICBrLT50cmFuc2ZlciA9IGFkczc4NDZfdHJhbnNmZXI7DQo+ID4gKyAgICBzZXRfYml0KERF
VklDRV9DQVRFR09SWV9ESVNQTEFZLCBkYy0+Y2F0ZWdvcmllcyk7DQo+ID4gIH0NCj4gDQo+IFRo
aXMgaXNuJ3QgYSBkaXNwbGF5LCBkZXNwaXRlIGJlaW5nIGluIGh3L2Rpc3BsYXkuIEl0J3MgYSB0
b3VjaC1zY3JlZW4gY29udHJvbGxlciwNCj4gc28gaXQgb3VnaHQgdG8gYmUgaW4gaHcvaW5wdXQg
YW5kIGJlIERFVklDRV9DQVRFR09SWV9JTlBVVC4NCj4gDQpUaGFua3MgZm9yIHlvdXIgcmVwbHks
IEkgd2lsbCByZWNhdGVnb3JpemUgYWRzNzg0Ni4NCg0KR2FuIFFpeGluDQo=

