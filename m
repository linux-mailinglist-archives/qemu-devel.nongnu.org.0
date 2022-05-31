Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776F5390CD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:34:36 +0200 (CEST)
Received: from localhost ([::1]:51504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw151-0002Ed-0G
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arei.gonglei@huawei.com>)
 id 1nw0fx-00084Q-Gm
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:08:42 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arei.gonglei@huawei.com>)
 id 1nw0fu-0002Xh-LL
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:08:41 -0400
Received: from kwepemi100014.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LC9xW2lhHz1JCT2;
 Tue, 31 May 2022 20:06:55 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 kwepemi100014.china.huawei.com (7.221.188.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 31 May 2022 20:08:33 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2375.024;
 Tue, 31 May 2022 20:08:33 +0800
To: zhenwei pi <pizhenwei@bytedance.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "helei.sig11@bytedance.com"
 <helei.sig11@bytedance.com>, "berrange@redhat.com" <berrange@redhat.com>
Subject: RE: RE: [PATCH v8 1/1] crypto: Introduce RSA algorithm
Thread-Topic: RE: [PATCH v8 1/1] crypto: Introduce RSA algorithm
Thread-Index: AQHYcab+Uy73hbBLQEKRln7LUOEy0K03azTggABMOICAATL30A==
Date: Tue, 31 May 2022 12:08:33 +0000
Message-ID: <39f884dbc25d4b0cbec510ab090e6778@huawei.com>
References: <20220527084734.2649594-1-pizhenwei@bytedance.com>
 <20220527084734.2649594-2-pizhenwei@bytedance.com>
 <848d579e2c504ba493cd57510a7ff3b0@huawei.com>
 <b2ee77ae-2044-32b4-20c5-43fa78e8213c@bytedance.com>
In-Reply-To: <b2ee77ae-2044-32b4-20c5-43fa78e8213c@bytedance.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.11]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=arei.gonglei@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  "Gonglei (Arei)" <arei.gonglei@huawei.com>
From:  "Gonglei (Arei)" via <qemu-devel@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogemhlbndlaSBwaSBbbWFp
bHRvOnBpemhlbndlaUBieXRlZGFuY2UuY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMzEsIDIw
MjIgOTo0OCBBTQ0KPiBUbzogR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29t
Pg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBtc3RAcmVkaGF0LmNvbTsNCj4gdmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IGhlbGVpLnNpZzExQGJ5dGVkYW5j
ZS5jb207DQo+IGJlcnJhbmdlQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFJFOiBbUEFUQ0gg
djggMS8xXSBjcnlwdG86IEludHJvZHVjZSBSU0EgYWxnb3JpdGhtDQo+IA0KPiBPbiA1LzMwLzIy
IDIxOjMxLCBHb25nbGVpIChBcmVpKSB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IHpoZW53ZWkgcGkgW21haWx0bzpwaXpoZW53ZWlA
Ynl0ZWRhbmNlLmNvbV0NCj4gPj4gU2VudDogRnJpZGF5LCBNYXkgMjcsIDIwMjIgNDo0OCBQTQ0K
PiA+PiBUbzogbXN0QHJlZGhhdC5jb207IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdvbmdsZWlAaHVh
d2VpLmNvbT4NCj4gPj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgdmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7DQo+ID4+IGhlbGVpLnNpZzExQGJ5dGVkYW5jZS5j
b207IGJlcnJhbmdlQHJlZGhhdC5jb207IHpoZW53ZWkgcGkNCj4gPj4gPHBpemhlbndlaUBieXRl
ZGFuY2UuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggdjggMS8xXSBjcnlwdG86IEludHJvZHVj
ZSBSU0EgYWxnb3JpdGhtDQo+ID4+DQo+ID4+DQo+ID4gU2tpcC4uLg0KPiA+DQo+ID4+ICtzdGF0
aWMgaW50NjRfdA0KPiA+PiArdmlydGlvX2NyeXB0b19jcmVhdGVfYXN5bV9zZXNzaW9uKFZpcnRJ
T0NyeXB0byAqdmNyeXB0bywNCj4gPj4gKyAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0aW9fY3J5
cHRvX2FrY2lwaGVyX2NyZWF0ZV9zZXNzaW9uX3JlcQ0KPiA+PiAqc2Vzc19yZXEsDQo+ID4+ICsg
ICAgICAgICAgICAgICB1aW50MzJfdCBxdWV1ZV9pZCwgdWludDMyX3Qgb3Bjb2RlLA0KPiA+PiAr
ICAgICAgICAgICAgICAgc3RydWN0IGlvdmVjICppb3YsIHVuc2lnbmVkIGludCBvdXRfbnVtKSB7
DQo+ID4+ICsgICAgVmlydElPRGV2aWNlICp2ZGV2ID0gVklSVElPX0RFVklDRSh2Y3J5cHRvKTsN
Cj4gPj4gKyAgICBDcnlwdG9EZXZCYWNrZW5kU2Vzc2lvbkluZm8gaW5mbyA9IHswfTsNCj4gPj4g
KyAgICBDcnlwdG9EZXZCYWNrZW5kQXN5bVNlc3Npb25JbmZvICphc3ltX2luZm87DQo+ID4+ICsg
ICAgaW50NjRfdCBzZXNzaW9uX2lkOw0KPiA+PiArICAgIGludCBxdWV1ZV9pbmRleDsNCj4gPj4g
KyAgICB1aW50MzJfdCBhbGdvLCBrZXl0eXBlLCBrZXlsZW47DQo+ID4+ICsgICAgZ19hdXRvZnJl
ZSB1aW50OF90ICprZXkgPSBOVUxMOw0KPiA+PiArICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxM
Ow0KPiA+PiArDQo+ID4+ICsgICAgYWxnbyA9IGxkbF9sZV9wKCZzZXNzX3JlcS0+cGFyYS5hbGdv
KTsNCj4gPj4gKyAgICBrZXl0eXBlID0gbGRsX2xlX3AoJnNlc3NfcmVxLT5wYXJhLmtleXR5cGUp
Ow0KPiA+PiArICAgIGtleWxlbiA9IGxkbF9sZV9wKCZzZXNzX3JlcS0+cGFyYS5rZXlsZW4pOw0K
PiA+PiArDQo+ID4+ICsgICAgaWYgKChrZXl0eXBlICE9IFZJUlRJT19DUllQVE9fQUtDSVBIRVJf
S0VZX1RZUEVfUFVCTElDKQ0KPiA+PiArICAgICAgICAgJiYgKGtleXR5cGUgIT0NCj4gVklSVElP
X0NSWVBUT19BS0NJUEhFUl9LRVlfVFlQRV9QUklWQVRFKSkgew0KPiA+PiArICAgICAgICBlcnJv
cl9yZXBvcnQoInVuc3VwcG9ydGVkIGFzeW0ga2V5dHlwZTogJWQiLCBrZXl0eXBlKTsNCj4gPj4g
KyAgICAgICAgcmV0dXJuIC1WSVJUSU9fQ1JZUFRPX05PVFNVUFA7DQo+ID4+ICsgICAgfQ0KPiA+
PiArDQo+ID4+ICsgICAgaWYgKGtleWxlbikgew0KPiA+PiArICAgICAgICBrZXkgPSBnX21hbGxv
YyhrZXlsZW4pOw0KPiA+PiArICAgICAgICBpZiAoaW92X3RvX2J1Zihpb3YsIG91dF9udW0sIDAs
IGtleSwga2V5bGVuKSAhPSBrZXlsZW4pIHsNCj4gPj4gKyAgICAgICAgICAgIHZpcnRpb19lcnJv
cih2ZGV2LCAidmlydGlvLWNyeXB0byBhc3ltIGtleSBpbmNvcnJlY3QiKTsNCj4gPj4gKyAgICAg
ICAgICAgIHJldHVybiAtRUZBVUxUOw0KPiA+DQo+ID4gTWVtb3J5IGxlYWsuDQo+ID4NCj4gPj4g
KyAgICAgICAgfQ0KPiA+PiArICAgICAgICBpb3ZfZGlzY2FyZF9mcm9udCgmaW92LCAmb3V0X251
bSwga2V5bGVuKTsNCj4gPj4gKyAgICB9DQo+ID4+ICsNCj4gPj4gKyAgICBpbmZvLm9wX2NvZGUg
PSBvcGNvZGU7DQo+ID4+ICsgICAgYXN5bV9pbmZvID0gJmluZm8udS5hc3ltX3Nlc3NfaW5mbzsN
Cj4gPj4gKyAgICBhc3ltX2luZm8tPmFsZ28gPSBhbGdvOw0KPiA+PiArICAgIGFzeW1faW5mby0+
a2V5dHlwZSA9IGtleXR5cGU7DQo+ID4+ICsgICAgYXN5bV9pbmZvLT5rZXlsZW4gPSBrZXlsZW47
DQo+ID4+ICsgICAgYXN5bV9pbmZvLT5rZXkgPSBrZXk7DQo+ID4+ICsgICAgc3dpdGNoIChhc3lt
X2luZm8tPmFsZ28pIHsNCj4gPj4gKyAgICBjYXNlIFZJUlRJT19DUllQVE9fQUtDSVBIRVJfUlNB
Og0KPiA+PiArICAgICAgICBhc3ltX2luZm8tPnUucnNhLnBhZGRpbmdfYWxnbyA9DQo+ID4+ICsg
ICAgICAgICAgICBsZGxfbGVfcCgmc2Vzc19yZXEtPnBhcmEudS5yc2EucGFkZGluZ19hbGdvKTsN
Cj4gPj4gKyAgICAgICAgYXN5bV9pbmZvLT51LnJzYS5oYXNoX2FsZ28gPQ0KPiA+PiArICAgICAg
ICAgICAgbGRsX2xlX3AoJnNlc3NfcmVxLT5wYXJhLnUucnNhLmhhc2hfYWxnbyk7DQo+ID4+ICsg
ICAgICAgIGJyZWFrOw0KPiA+PiArDQo+ID4+ICsgICAgLyogVE9ETyBEU0EmRUNEU0EgaGFuZGxp
bmcgKi8NCj4gPj4gKw0KPiA+PiArICAgIGRlZmF1bHQ6DQo+ID4+ICsgICAgICAgIHJldHVybiAt
VklSVElPX0NSWVBUT19FUlI7DQo+ID4+ICsgICAgfQ0KPiA+PiArDQo+ID4+ICsgICAgcXVldWVf
aW5kZXggPSB2aXJ0aW9fY3J5cHRvX3ZxMnEocXVldWVfaWQpOw0KPiA+PiArICAgIHNlc3Npb25f
aWQgPQ0KPiA+PiArIGNyeXB0b2Rldl9iYWNrZW5kX2NyZWF0ZV9zZXNzaW9uKHZjcnlwdG8tPmNy
eXB0b2RldiwNCj4gPj4gJmluZm8sDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICBxdWV1ZV9p
bmRleCwgJmxvY2FsX2Vycik7DQo+ID4+ICsgICAgaWYgKHNlc3Npb25faWQgPCAwKSB7DQo+ID4+
ICsgICAgICAgIGlmIChsb2NhbF9lcnIpIHsNCj4gPj4gKyAgICAgICAgICAgIGVycm9yX3JlcG9y
dF9lcnIobG9jYWxfZXJyKTsNCj4gPj4gKyAgICAgICAgfQ0KPiA+PiArICAgICAgICByZXR1cm4g
LVZJUlRJT19DUllQVE9fRVJSOw0KPiA+PiArICAgIH0NCj4gPj4gKw0KPiA+PiArICAgIHJldHVy
biBzZXNzaW9uX2lkOw0KPiA+DQo+ID4gV2hlcmUgdG8gZnJlZSB0aGUga2V5IGF0IGJvdGggbm9y
bWFsIGFuZCBleGNlcHRpb25hbCBwYXRocz8NCj4gPg0KPiANCj4gSGksIExlaQ0KPiANCj4gVGhl
IGtleSBpcyBkZWNsYXJlZCB3aXRoIGdfYXV0b2ZyZWU6DQo+IGdfYXV0b2ZyZWUgdWludDhfdCAq
a2V5ID0gTlVMTDsNCj4gDQoNCk9LLiBGb3IgdGhlIHBhdGNoOg0KDQpSZXZpZXdlZC1ieTogR29u
Z2xlaSA8YXJlaS5nb25nbGVpQGh1YXdlaS5jb20+DQoNCg0KUmVnYXJkcywNCi1Hb25nbGVpDQog
ICAgDQoNCg==

