Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99743678151
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 17:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzdG-0004RS-4P; Mon, 23 Jan 2023 11:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pJzdC-0004DK-Rt
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:25:14 -0500
Received: from a.mx.secunet.com ([62.96.220.36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pJzdA-0003ww-EW
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:25:14 -0500
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id AB2EB2049B;
 Mon, 23 Jan 2023 17:25:06 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJp9NjZhmmfk; Mon, 23 Jan 2023 17:25:06 +0100 (CET)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 1360220270;
 Mon, 23 Jan 2023 17:25:06 +0100 (CET)
Received: from cas-essen-02.secunet.de (unknown [10.53.40.202])
 by mailout2.secunet.com (Postfix) with ESMTP id 0456A80004A;
 Mon, 23 Jan 2023 17:25:06 +0100 (CET)
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 23 Jan 2023 17:25:05 +0100
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mbx-essen-02.secunet.de (10.53.40.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 23 Jan 2023 17:25:05 +0100
Received: from mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75]) by
 mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75%6]) with mapi id
 15.01.2375.034; Mon, 23 Jan 2023 17:25:05 +0100
From: "Ripke, Klaus" <klaus.ripke@secunet.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "philmd@linaro.org"
 <philmd@linaro.org>
CC: "kraxel@redhat.com" <kraxel@redhat.com>, "marcandre.lureau@gmail.com"
 <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] usb-ccid: make ids and descriptor configurable
Thread-Topic: [PATCH] usb-ccid: make ids and descriptor configurable
Thread-Index: AQHZKcG0q3Fh+fkSEUuGnSe3Q7/ht66iH5uAgAoKl4A=
Date: Mon, 23 Jan 2023 16:25:05 +0000
Message-ID: <9af0fa866799966fd9a4bcb10898d063db651744.camel@secunet.com>
References: <c07957e3813d9d2f84e981bb1b8d99862a2998b9.camel@secunet.com>
 <cff14816-39eb-db1c-9bda-51cad7fcb7c1@linaro.org>
In-Reply-To: <cff14816-39eb-db1c-9bda-51cad7fcb7c1@linaro.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <5708D6DAF91B0643BE966E49942F105B@secunet.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Received-SPF: pass client-ip=62.96.220.36;
 envelope-from=klaus.ripke@secunet.com; helo=a.mx.secunet.com
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

SGkgUGhpbGlwcGUsDQoNCnNvIEkgZ3Vlc3MgaXQncyByZWplY3RlZC4gQW55IHN1Z2dlc3Rpb25z
Pw0KDQpUSUEgS2xhdXMNCg0KT24gVHVlLCAyMDIzLTAxLTE3IGF0IDA4OjA0ICswMTAwLCBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gSGkgS2xhdXMsDQo+IA0KPiBPbiAxNi8xLzIz
IDE2OjQ2LCBSaXBrZSwgS2xhdXMgd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogS2xhdXMgUmlw
a2UgPGtsYXVzLnJpcGtlQHNlY3VuZXQuY29tPg0KPiA+IA0KPiA+IGh3L3VzYi9kZXYtc21hcnRj
YXJkLXJlYWRlci5jOg0KPiA+IFNldCBzb21lIHN0YXRpYyB2YWx1ZXMgZnJvbSBjY2lkX3Byb3Bl
cnRpZXMuDQo+ID4gDQo+ID4gLS0tDQo+ID4gwqDCoGh3L3VzYi9kZXYtc21hcnRjYXJkLXJlYWRl
ci5jIHwgMzUNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+IMKg
wqAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvaHcvdXNiL2Rldi1zbWFydGNhcmQtcmVhZGVyLmMgYi9ody91c2Iv
ZGV2LXNtYXJ0Y2FyZC0NCj4gPiByZWFkZXIuYw0KPiA+IGluZGV4IDI4MTY0ZDg5YmUuLjQwMDIx
NTc3NzMgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvdXNiL2Rldi1zbWFydGNhcmQtcmVhZGVyLmMNCj4g
PiArKysgYi9ody91c2IvZGV2LXNtYXJ0Y2FyZC1yZWFkZXIuYw0KPiA+IEBAIC0zMTEsNiArMzEx
LDExIEBAIHN0cnVjdCBVU0JDQ0lEU3RhdGUgew0KPiA+IMKgwqDCoMKgwqAgdWludDhfdMKgIHBv
d2VyZWQ7DQo+ID4gwqDCoMKgwqDCoCB1aW50OF90wqAgbm90aWZ5X3Nsb3RfY2hhbmdlOw0KPiA+
IMKgwqDCoMKgwqAgdWludDhfdMKgIGRlYnVnOw0KPiA+ICvCoMKgwqAgLyogdGhlIGZvbGxvd2lu
ZyBhcmUgY29waWVkIHRvIHN0YXRpYyBvbiBpbml0aWFsIHJlYWxpemUgKi8NCj4gPiArwqDCoMKg
IHVpbnQxNl90IHZlbmRvcjsNCj4gPiArwqDCoMKgIHVpbnQxNl90IHByb2R1Y3Q7DQo+ID4gK8Kg
wqDCoCB1aW50OF90wqAgbWF4c2xvdDsNCj4gPiArwqDCoMKgIHVpbnQ4X3TCoCBmZWF0MjsNCj4g
PiDCoMKgfTsNCj4gPiDCoCANCj4gPiDCoMKgLyoNCj4gPiBAQCAtMzIzLDcgKzMyOCwxMSBAQCBz
dHJ1Y3QgVVNCQ0NJRFN0YXRlIHsNCj4gPiDCoMKgICrCoMKgIDBkYzM6MTAwNCBBdGhlbmEgU21h
cnRjYXJkIFNvbHV0aW9ucywgSW5jLg0KPiA+IMKgwqAgKi8NCj4gPiDCoCANCj4gPiAtc3RhdGlj
IGNvbnN0IHVpbnQ4X3QgcWVtdV9jY2lkX2Rlc2NyaXB0b3JbXSA9IHsNCj4gPiArZW51bSB7DQo+
ID4gK8KgwqDCoCBERVNDX01BWFNMT1QgPSA0LA0KPiA+ICvCoMKgwqAgREVTQ19GRUFUMiA9IDQy
IC8qIGR3RmVhdHVyZXMgYnl0ZSAyICovDQo+ID4gK307DQo+ID4gK3N0YXRpYyB1aW50OF90IHFl
bXVfY2NpZF9kZXNjcmlwdG9yW10gPSB7DQo+IA0KPiBJZiB5b3UgY3JlYXRlIDIgZGV2aWNlcyB3
aXRoIGRpZmZlcmVudCBwcm9wZXJ0aWVzLCB0aGUNCj4gZmlyc3QgZ2V0cyBpdHMgcHJvcGVydGll
cyBvdmVyd3JpdHRlbiB3aXRoIHRoZSBzZWNvbmQncw0KPiBvbmVzLg0KPiANCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqAgLyogU21hcnQgQ2FyZCBEZXZpY2UgQ2xhc3MgRGVzY3JpcHRvciAqLw0KPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoCAweDM2LMKgwqDCoMKgwqDCoCAvKiB1OMKgIGJMZW5ndGg7ICov
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIDB4MjEswqDCoMKgwqDCoMKgIC8qIHU4wqAgYkRlc2Ny
aXB0b3JUeXBlOyBGdW5jdGlvbmFsICovDQo+ID4gQEAgLTQ3Miw3ICs0ODEsNyBAQCBzdGF0aWMg
Y29uc3QgVVNCRGVzY0RldmljZSBkZXNjX2RldmljZSA9IHsNCj4gPiDCoMKgwqDCoMKgIH0sDQo+
ID4gwqDCoH07DQo+ID4gwqAgDQo+ID4gLXN0YXRpYyBjb25zdCBVU0JEZXNjIGRlc2NfY2NpZCA9
IHsNCj4gPiArc3RhdGljIFVTQkRlc2MgZGVzY19jY2lkID0gew0KPiA+IMKgwqDCoMKgwqAgLmlk
ID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCAuaWRWZW5kb3LCoMKgwqDCoMKgwqDCoMKgwqAg
PSBDQ0lEX1ZFTkRPUl9JRCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgLmlkUHJvZHVjdMKgwqDC
oMKgwqDCoMKgwqAgPSBDQ0lEX1BST0RVQ1RfSUQsDQo+ID4gQEAgLTEyOTUsOSArMTMwNCwxMCBA
QCBzdGF0aWMgdm9pZCBjY2lkX2NhcmRfcmVhbGl6ZShEZXZpY2VTdGF0ZQ0KPiA+ICpxZGV2LA0K
PiA+IEVycm9yICoqZXJycCkNCj4gPiDCoMKgwqDCoMKgIFVTQkNDSURTdGF0ZSAqcyA9IFVTQl9D
Q0lEX0RFVihkZXYpOw0KPiA+IMKgwqDCoMKgwqAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7DQo+
ID4gwqAgDQo+ID4gLcKgwqDCoCBpZiAoY2FyZC0+c2xvdCAhPSAwKSB7DQo+ID4gLcKgwqDCoMKg
wqDCoMKgIGVycm9yX3NldGcoZXJycCwgInVzYi1jY2lkIHN1cHBvcnRzIG9uZSBzbG90LCBjYW4n
dCBhZGQNCj4gPiAlZCIsDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjYXJkLT5zbG90KTsNCj4gPiArwqDCoMKgIERQUklOVEYocywgRF9WRVJCT1NFLCAiJXM6IHNs
b3QgJWRcbiIsIF9fZnVuY19fLCBjYXJkLT5zbG90KTsNCj4gPiArwqDCoMKgIGlmIChjYXJkLT5z
bG90ID4gcWVtdV9jY2lkX2Rlc2NyaXB0b3JbREVTQ19NQVhTTE9UXSkgew0KPiA+ICvCoMKgwqDC
oMKgwqDCoCBlcnJvcl9zZXRnKGVycnAsICJ1c2ItY2NpZCBzdXBwb3J0cyAlZCBzbG90LCBjYW4n
dCBhZGQNCj4gPiAlZCIsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBxZW11X2NjaWRfZGVzY3JpcHRvcltERVNDX01BWFNMT1RdICsgMSwgY2FyZC0NCj4gPiA+IHNs
b3QpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+ID4gwqDCoMKgwqDCoCB9DQo+
ID4gwqDCoMKgwqDCoCBpZiAocy0+Y2FyZCAhPSBOVUxMKSB7DQo+ID4gQEAgLTEzMTcsNiArMTMy
NywxNCBAQCBzdGF0aWMgdm9pZCBjY2lkX2NhcmRfcmVhbGl6ZShEZXZpY2VTdGF0ZQ0KPiA+ICpx
ZGV2LA0KPiA+IEVycm9yICoqZXJycCkNCj4gPiDCoMKgc3RhdGljIHZvaWQgY2NpZF9yZWFsaXpl
KFVTQkRldmljZSAqZGV2LCBFcnJvciAqKmVycnApDQo+ID4gwqDCoHsNCj4gPiDCoMKgwqDCoMKg
IFVTQkNDSURTdGF0ZSAqcyA9IFVTQl9DQ0lEX0RFVihkZXYpOw0KPiA+ICvCoMKgwqAgc3RhdGlj
IGludCBpbml0aWFsaXplZDsNCj4gPiArwqDCoMKgIGlmICghaW5pdGlhbGl6ZWQpIHsNCj4gPiAr
wqDCoMKgwqDCoMKgwqAgZGVzY19jY2lkLmlkLmlkVmVuZG9yID0gcy0+dmVuZG9yOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoCBkZXNjX2NjaWQuaWQuaWRQcm9kdWN0ID0gcy0+cHJvZHVjdDsNCj4gPiAr
wqDCoMKgwqDCoMKgwqAgcWVtdV9jY2lkX2Rlc2NyaXB0b3JbREVTQ19NQVhTTE9UXSA9IHMtPm1h
eHNsb3Q7DQo+ID4gK8KgwqDCoMKgwqDCoMKgIHFlbXVfY2NpZF9kZXNjcmlwdG9yW0RFU0NfRkVB
VDJdID0gcy0+ZmVhdDI7DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGluaXRpYWxpemVkID0gITA7DQo+
ID4gK8KgwqDCoCB9DQo+ID4gwqAgDQo+ID4gwqDCoMKgwqDCoCB1c2JfZGVzY19jcmVhdGVfc2Vy
aWFsKGRldik7DQo+ID4gwqDCoMKgwqDCoCB1c2JfZGVzY19pbml0KGRldik7DQo+ID4gQEAgLTEz
MzksNiArMTM1Nyw4IEBAIHN0YXRpYyB2b2lkIGNjaWRfcmVhbGl6ZShVU0JEZXZpY2UgKmRldiwN
Cj4gPiBFcnJvcg0KPiA+ICoqZXJycCkNCj4gPiDCoMKgwqDCoMKgIGNjaWRfcmVzZXRfcGFyYW1l
dGVycyhzKTsNCj4gPiDCoMKgwqDCoMKgIGNjaWRfcmVzZXQocyk7DQo+ID4gwqDCoMKgwqDCoCBz
LT5kZWJ1ZyA9IHBhcnNlX2RlYnVnX2VudigiUUVNVV9DQ0lEX0RFQlVHIiwgRF9WRVJCT1NFLCBz
LQ0KPiA+ID4gZGVidWcpOw0KPiA+ICvCoMKgwqAgRFBSSU5URihzLCBEX1ZFUkJPU0UsICJjY2lk
X3JlYWxpemUgJWQgJXggJXggJXggJXhcbiIsDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGluaXRpYWxp
emVkLCBzLT52ZW5kb3IsIHMtPnByb2R1Y3QsIHMtPm1heHNsb3QsIHMtPmZlYXQyKTsNCj4gPiDC
oMKgfQ0KPiA+IMKgIA0KPiA+IMKgwqBzdGF0aWMgaW50IGNjaWRfcG9zdF9sb2FkKHZvaWQgKm9w
YXF1ZSwgaW50IHZlcnNpb25faWQpDQo+ID4gQEAgLTE0MzQsOSArMTQ1NCwxNCBAQCBzdGF0aWMg
Y29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIGNjaWRfdm1zdGF0ZQ0KPiA+ID0gew0KPiA+IMKgIA0K
PiA+IMKgwqBzdGF0aWMgUHJvcGVydHkgY2NpZF9wcm9wZXJ0aWVzW10gPSB7DQo+ID4gwqDCoMKg
wqDCoCBERUZJTkVfUFJPUF9VSU5UOCgiZGVidWciLCBVU0JDQ0lEU3RhdGUsIGRlYnVnLCAwKSwN
Cj4gPiArwqDCoMKgIERFRklORV9QUk9QX1VJTlQxNigidmVuZG9yIiwgVVNCQ0NJRFN0YXRlLCB2
ZW5kb3IsDQo+ID4gQ0NJRF9WRU5ET1JfSUQpLA0KPiA+ICvCoMKgwqAgREVGSU5FX1BST1BfVUlO
VDE2KCJwcm9kdWN0IiwgVVNCQ0NJRFN0YXRlLCBwcm9kdWN0LA0KPiA+IENDSURfUFJPRFVDVF9J
RCksDQo+ID4gK8KgwqDCoCBERUZJTkVfUFJPUF9VSU5UOCgibWF4c2xvdCIsIFVTQkNDSURTdGF0
ZSwgbWF4c2xvdCwgMCksDQo+ID4gK8KgwqDCoCBERUZJTkVfUFJPUF9VSU5UOCgiZmVhdDIiLCBV
U0JDQ0lEU3RhdGUsIGZlYXQyLCAwKSwNCj4gPiDCoMKgwqDCoMKgIERFRklORV9QUk9QX0VORF9P
Rl9MSVNUKCksDQo+ID4gwqDCoH07DQo+ID4gwqAgDQo+ID4gKw0KPiA+IMKgwqBzdGF0aWMgdm9p
ZCBjY2lkX2NsYXNzX2luaXRmbihPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEpDQo+ID4g
wqDCoHsNCj4gPiDCoMKgwqDCoMKgIERldmljZUNsYXNzICpkYyA9IERFVklDRV9DTEFTUyhrbGFz
cyk7DQo+IA0KDQotLSANCktsYXVzIFJpcGtlDQpTZW5pb3IgRGV2ZWxvcGVyDQpQdWJsaWMgQXV0
aG9yaXRpZXMgRGl2aXNpb24NCnNlY3VuZXQgU2VjdXJpdHkgTmV0d29ya3MgQUcNCg0KVGVsZWZv
bjogICs0OSAyMDEgNTQ1NC0yOTgyDQo=

