Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D4966C442
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:48:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRhD-0005FK-JX; Mon, 16 Jan 2023 10:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pHRh5-0005F8-3r
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:46:43 -0500
Received: from a.mx.secunet.com ([62.96.220.36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pHRh2-0002w6-IW
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:46:42 -0500
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id C0A27200A7;
 Mon, 16 Jan 2023 16:46:33 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kr_dhlGBOMaI; Mon, 16 Jan 2023 16:46:33 +0100 (CET)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 26FE42007F;
 Mon, 16 Jan 2023 16:46:33 +0100 (CET)
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout1.secunet.com (Postfix) with ESMTP id 1817580004A;
 Mon, 16 Jan 2023 16:46:33 +0100 (CET)
Received: from mbx-dresden-01.secunet.de (10.53.40.199) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 16 Jan 2023 16:46:32 +0100
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mbx-dresden-01.secunet.de (10.53.40.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 16 Jan 2023 16:46:32 +0100
Received: from mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75]) by
 mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75%6]) with mapi id
 15.01.2375.034; Mon, 16 Jan 2023 16:46:31 +0100
From: "Ripke, Klaus" <klaus.ripke@secunet.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "kraxel@redhat.com" <kraxel@redhat.com>, "marcandre.lureau@gmail.com"
 <marcandre.lureau@gmail.com>
Subject: [PATCH] usb-ccid: make ids and descriptor configurable
Thread-Topic: [PATCH] usb-ccid: make ids and descriptor configurable
Thread-Index: AQHZKcG0q3Fh+fkSEUuGnSe3Q7/htw==
Date: Mon, 16 Jan 2023 15:46:31 +0000
Message-ID: <c07957e3813d9d2f84e981bb1b8d99862a2998b9.camel@secunet.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC826F86123BA049A97EF60D01ECC0E0@secunet.com>
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

U2lnbmVkLW9mZi1ieTogS2xhdXMgUmlwa2UgPGtsYXVzLnJpcGtlQHNlY3VuZXQuY29tPg0KDQpo
dy91c2IvZGV2LXNtYXJ0Y2FyZC1yZWFkZXIuYzoNClNldCBzb21lIHN0YXRpYyB2YWx1ZXMgZnJv
bSBjY2lkX3Byb3BlcnRpZXMuDQoNCi0tLQ0KwqBody91c2IvZGV2LXNtYXJ0Y2FyZC1yZWFkZXIu
YyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQrCoDEgZmlsZSBjaGFu
Z2VkLCAzMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvaHcv
dXNiL2Rldi1zbWFydGNhcmQtcmVhZGVyLmMgYi9ody91c2IvZGV2LXNtYXJ0Y2FyZC0NCnJlYWRl
ci5jDQppbmRleCAyODE2NGQ4OWJlLi40MDAyMTU3NzczIDEwMDY0NA0KLS0tIGEvaHcvdXNiL2Rl
di1zbWFydGNhcmQtcmVhZGVyLmMNCisrKyBiL2h3L3VzYi9kZXYtc21hcnRjYXJkLXJlYWRlci5j
DQpAQCAtMzExLDYgKzMxMSwxMSBAQCBzdHJ1Y3QgVVNCQ0NJRFN0YXRlIHsNCsKgwqDCoMKgIHVp
bnQ4X3TCoCBwb3dlcmVkOw0KwqDCoMKgwqAgdWludDhfdMKgIG5vdGlmeV9zbG90X2NoYW5nZTsN
CsKgwqDCoMKgIHVpbnQ4X3TCoCBkZWJ1ZzsNCivCoMKgwqAgLyogdGhlIGZvbGxvd2luZyBhcmUg
Y29waWVkIHRvIHN0YXRpYyBvbiBpbml0aWFsIHJlYWxpemUgKi8NCivCoMKgwqAgdWludDE2X3Qg
dmVuZG9yOw0KK8KgwqDCoCB1aW50MTZfdCBwcm9kdWN0Ow0KK8KgwqDCoCB1aW50OF90wqAgbWF4
c2xvdDsNCivCoMKgwqAgdWludDhfdMKgIGZlYXQyOw0KwqB9Ow0KwqANCsKgLyoNCkBAIC0zMjMs
NyArMzI4LDExIEBAIHN0cnVjdCBVU0JDQ0lEU3RhdGUgew0KwqAgKsKgwqAgMGRjMzoxMDA0IEF0
aGVuYSBTbWFydGNhcmQgU29sdXRpb25zLCBJbmMuDQrCoCAqLw0KwqANCi1zdGF0aWMgY29uc3Qg
dWludDhfdCBxZW11X2NjaWRfZGVzY3JpcHRvcltdID0gew0KK2VudW0gew0KK8KgwqDCoCBERVND
X01BWFNMT1QgPSA0LA0KK8KgwqDCoCBERVNDX0ZFQVQyID0gNDIgLyogZHdGZWF0dXJlcyBieXRl
IDIgKi8NCit9Ow0KK3N0YXRpYyB1aW50OF90IHFlbXVfY2NpZF9kZXNjcmlwdG9yW10gPSB7DQrC
oMKgwqDCoMKgwqDCoMKgIC8qIFNtYXJ0IENhcmQgRGV2aWNlIENsYXNzIERlc2NyaXB0b3IgKi8N
CsKgwqDCoMKgwqDCoMKgwqAgMHgzNizCoMKgwqDCoMKgwqAgLyogdTjCoCBiTGVuZ3RoOyAqLw0K
wqDCoMKgwqDCoMKgwqDCoCAweDIxLMKgwqDCoMKgwqDCoCAvKiB1OMKgIGJEZXNjcmlwdG9yVHlw
ZTsgRnVuY3Rpb25hbCAqLw0KQEAgLTQ3Miw3ICs0ODEsNyBAQCBzdGF0aWMgY29uc3QgVVNCRGVz
Y0RldmljZSBkZXNjX2RldmljZSA9IHsNCsKgwqDCoMKgIH0sDQrCoH07DQrCoA0KLXN0YXRpYyBj
b25zdCBVU0JEZXNjIGRlc2NfY2NpZCA9IHsNCitzdGF0aWMgVVNCRGVzYyBkZXNjX2NjaWQgPSB7
DQrCoMKgwqDCoCAuaWQgPSB7DQrCoMKgwqDCoMKgwqDCoMKgIC5pZFZlbmRvcsKgwqDCoMKgwqDC
oMKgwqDCoCA9IENDSURfVkVORE9SX0lELA0KwqDCoMKgwqDCoMKgwqDCoCAuaWRQcm9kdWN0wqDC
oMKgwqDCoMKgwqDCoCA9IENDSURfUFJPRFVDVF9JRCwNCkBAIC0xMjk1LDkgKzEzMDQsMTAgQEAg
c3RhdGljIHZvaWQgY2NpZF9jYXJkX3JlYWxpemUoRGV2aWNlU3RhdGUgKnFkZXYsDQpFcnJvciAq
KmVycnApDQrCoMKgwqDCoCBVU0JDQ0lEU3RhdGUgKnMgPSBVU0JfQ0NJRF9ERVYoZGV2KTsNCsKg
wqDCoMKgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOw0KwqANCi3CoMKgwqAgaWYgKGNhcmQtPnNs
b3QgIT0gMCkgew0KLcKgwqDCoMKgwqDCoMKgIGVycm9yX3NldGcoZXJycCwgInVzYi1jY2lkIHN1
cHBvcnRzIG9uZSBzbG90LCBjYW4ndCBhZGQgJWQiLA0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjYXJkLT5zbG90KTsNCivCoMKgwqAgRFBSSU5URihzLCBEX1ZFUkJPU0Us
ICIlczogc2xvdCAlZFxuIiwgX19mdW5jX18sIGNhcmQtPnNsb3QpOw0KK8KgwqDCoCBpZiAoY2Fy
ZC0+c2xvdCA+IHFlbXVfY2NpZF9kZXNjcmlwdG9yW0RFU0NfTUFYU0xPVF0pIHsNCivCoMKgwqDC
oMKgwqDCoCBlcnJvcl9zZXRnKGVycnAsICJ1c2ItY2NpZCBzdXBwb3J0cyAlZCBzbG90LCBjYW4n
dCBhZGQgJWQiLA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxZW11X2Nj
aWRfZGVzY3JpcHRvcltERVNDX01BWFNMT1RdICsgMSwgY2FyZC0NCj5zbG90KTsNCsKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuOw0KwqDCoMKgwqAgfQ0KwqDCoMKgwqAgaWYgKHMtPmNhcmQgIT0gTlVM
TCkgew0KQEAgLTEzMTcsNiArMTMyNywxNCBAQCBzdGF0aWMgdm9pZCBjY2lkX2NhcmRfcmVhbGl6
ZShEZXZpY2VTdGF0ZSAqcWRldiwNCkVycm9yICoqZXJycCkNCsKgc3RhdGljIHZvaWQgY2NpZF9y
ZWFsaXplKFVTQkRldmljZSAqZGV2LCBFcnJvciAqKmVycnApDQrCoHsNCsKgwqDCoMKgIFVTQkND
SURTdGF0ZSAqcyA9IFVTQl9DQ0lEX0RFVihkZXYpOw0KK8KgwqDCoCBzdGF0aWMgaW50IGluaXRp
YWxpemVkOw0KK8KgwqDCoCBpZiAoIWluaXRpYWxpemVkKSB7DQorwqDCoMKgwqDCoMKgwqAgZGVz
Y19jY2lkLmlkLmlkVmVuZG9yID0gcy0+dmVuZG9yOw0KK8KgwqDCoMKgwqDCoMKgIGRlc2NfY2Np
ZC5pZC5pZFByb2R1Y3QgPSBzLT5wcm9kdWN0Ow0KK8KgwqDCoMKgwqDCoMKgIHFlbXVfY2NpZF9k
ZXNjcmlwdG9yW0RFU0NfTUFYU0xPVF0gPSBzLT5tYXhzbG90Ow0KK8KgwqDCoMKgwqDCoMKgIHFl
bXVfY2NpZF9kZXNjcmlwdG9yW0RFU0NfRkVBVDJdID0gcy0+ZmVhdDI7DQorwqDCoMKgwqDCoMKg
wqAgaW5pdGlhbGl6ZWQgPSAhMDsNCivCoMKgwqAgfQ0KwqANCsKgwqDCoMKgIHVzYl9kZXNjX2Ny
ZWF0ZV9zZXJpYWwoZGV2KTsNCsKgwqDCoMKgIHVzYl9kZXNjX2luaXQoZGV2KTsNCkBAIC0xMzM5
LDYgKzEzNTcsOCBAQCBzdGF0aWMgdm9pZCBjY2lkX3JlYWxpemUoVVNCRGV2aWNlICpkZXYsIEVy
cm9yDQoqKmVycnApDQrCoMKgwqDCoCBjY2lkX3Jlc2V0X3BhcmFtZXRlcnMocyk7DQrCoMKgwqDC
oCBjY2lkX3Jlc2V0KHMpOw0KwqDCoMKgwqAgcy0+ZGVidWcgPSBwYXJzZV9kZWJ1Z19lbnYoIlFF
TVVfQ0NJRF9ERUJVRyIsIERfVkVSQk9TRSwgcy0NCj5kZWJ1Zyk7DQorwqDCoMKgIERQUklOVEYo
cywgRF9WRVJCT1NFLCAiY2NpZF9yZWFsaXplICVkICV4ICV4ICV4ICV4XG4iLA0KK8KgwqDCoMKg
wqDCoMKgIGluaXRpYWxpemVkLCBzLT52ZW5kb3IsIHMtPnByb2R1Y3QsIHMtPm1heHNsb3QsIHMt
PmZlYXQyKTsNCsKgfQ0KwqANCsKgc3RhdGljIGludCBjY2lkX3Bvc3RfbG9hZCh2b2lkICpvcGFx
dWUsIGludCB2ZXJzaW9uX2lkKQ0KQEAgLTE0MzQsOSArMTQ1NCwxNCBAQCBzdGF0aWMgY29uc3Qg
Vk1TdGF0ZURlc2NyaXB0aW9uIGNjaWRfdm1zdGF0ZSA9IHsNCsKgDQrCoHN0YXRpYyBQcm9wZXJ0
eSBjY2lkX3Byb3BlcnRpZXNbXSA9IHsNCsKgwqDCoMKgIERFRklORV9QUk9QX1VJTlQ4KCJkZWJ1
ZyIsIFVTQkNDSURTdGF0ZSwgZGVidWcsIDApLA0KK8KgwqDCoCBERUZJTkVfUFJPUF9VSU5UMTYo
InZlbmRvciIsIFVTQkNDSURTdGF0ZSwgdmVuZG9yLA0KQ0NJRF9WRU5ET1JfSUQpLA0KK8KgwqDC
oCBERUZJTkVfUFJPUF9VSU5UMTYoInByb2R1Y3QiLCBVU0JDQ0lEU3RhdGUsIHByb2R1Y3QsDQpD
Q0lEX1BST0RVQ1RfSUQpLA0KK8KgwqDCoCBERUZJTkVfUFJPUF9VSU5UOCgibWF4c2xvdCIsIFVT
QkNDSURTdGF0ZSwgbWF4c2xvdCwgMCksDQorwqDCoMKgIERFRklORV9QUk9QX1VJTlQ4KCJmZWF0
MiIsIFVTQkNDSURTdGF0ZSwgZmVhdDIsIDApLA0KwqDCoMKgwqAgREVGSU5FX1BST1BfRU5EX09G
X0xJU1QoKSwNCsKgfTsNCsKgDQorDQrCoHN0YXRpYyB2b2lkIGNjaWRfY2xhc3NfaW5pdGZuKE9i
amVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkNCsKgew0KwqDCoMKgwqAgRGV2aWNlQ2xhc3Mg
KmRjID0gREVWSUNFX0NMQVNTKGtsYXNzKTsNCi0tIA0KMi4zNC4xDQoNCi0tIA0KS2xhdXMgUmlw
a2UNClNlbmlvciBEZXZlbG9wZXINClB1YmxpYyBBdXRob3JpdGllcyBEaXZpc2lvbg0Kc2VjdW5l
dCBTZWN1cml0eSBOZXR3b3JrcyBBRw0KDQpUZWxlZm9uOiAgKzQ5IDIwMSA1NDU0LTI5ODINCg==

