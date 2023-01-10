Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7E66447D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEWo-0006J4-Po; Tue, 10 Jan 2023 08:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pFEWk-0006IQ-5o
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:18:54 -0500
Received: from a.mx.secunet.com ([62.96.220.36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pFEWi-0001wW-5G
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:18:53 -0500
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 894FD2049B;
 Tue, 10 Jan 2023 14:18:47 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TopqYA8N048Y; Tue, 10 Jan 2023 14:18:47 +0100 (CET)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 0654420491;
 Tue, 10 Jan 2023 14:18:47 +0100 (CET)
Received: from cas-essen-02.secunet.de (unknown [10.53.40.202])
 by mailout1.secunet.com (Postfix) with ESMTP id EC47E80004A;
 Tue, 10 Jan 2023 14:18:46 +0100 (CET)
Received: from mbx-dresden-01.secunet.de (10.53.40.199) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 10 Jan 2023 14:18:41 +0100
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mbx-dresden-01.secunet.de (10.53.40.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 10 Jan 2023 14:18:46 +0100
Received: from mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75]) by
 mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75%6]) with mapi id
 15.01.2375.034; Tue, 10 Jan 2023 14:18:45 +0100
From: "Ripke, Klaus" <klaus.ripke@secunet.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: [PATCH] usb-ccid: make ids and descriptor configurable
Thread-Topic: [PATCH] usb-ccid: make ids and descriptor configurable
Thread-Index: AQHZJPYRutvGp/ehGk+spkxRFFHkoA==
Date: Tue, 10 Jan 2023 13:18:45 +0000
Message-ID: <47a155d76238fb1bae401dd77428c9125f37e0d2.camel@secunet.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <814A71C4742FA14893276D6B2C5B452F@secunet.com>
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

U2lnbmVkLW9mZi1ieTogS2xhdXMgUmlwa2UgPGtsYXVzLnJpcGtlQHNlY3VuZXQuY29tPgoKaHcv
dXNiL2Rldi1zbWFydGNhcmQtcmVhZGVyLmM6ClNldCBzdGF0aWMgdmFsdWVzIGZyb20gZW52IHZh
cnMgUUVNVV9DQ0lEX1ZFTkRPUi9QUk9EVUNUX0lEIGFuZApfREVTQ1JJUFRPUgoKLS0tCsKgaHcv
dXNiL2Rldi1zbWFydGNhcmQtcmVhZGVyLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKyst
LS0KwqAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9ody91c2IvZGV2LXNtYXJ0Y2FyZC1yZWFkZXIuYyBiL2h3L3VzYi9kZXYtc21h
cnRjYXJkLQpyZWFkZXIuYwppbmRleCAyODE2NGQ4OWJlLi4wNjMyYWI0NGM2IDEwMDY0NAotLS0g
YS9ody91c2IvZGV2LXNtYXJ0Y2FyZC1yZWFkZXIuYworKysgYi9ody91c2IvZGV2LXNtYXJ0Y2Fy
ZC1yZWFkZXIuYwpAQCAtMzIzLDcgKzMyMyw3IEBAIHN0cnVjdCBVU0JDQ0lEU3RhdGUgewrCoCAq
wqDCoCAwZGMzOjEwMDQgQXRoZW5hIFNtYXJ0Y2FyZCBTb2x1dGlvbnMsIEluYy4KwqAgKi8KwqAK
LXN0YXRpYyBjb25zdCB1aW50OF90IHFlbXVfY2NpZF9kZXNjcmlwdG9yW10gPSB7CitzdGF0aWMg
dWludDhfdCBxZW11X2NjaWRfZGVzY3JpcHRvcltdID0gewrCoMKgwqDCoMKgwqDCoMKgIC8qIFNt
YXJ0IENhcmQgRGV2aWNlIENsYXNzIERlc2NyaXB0b3IgKi8KwqDCoMKgwqDCoMKgwqDCoCAweDM2
LMKgwqDCoMKgwqDCoCAvKiB1OMKgIGJMZW5ndGg7ICovCsKgwqDCoMKgwqDCoMKgwqAgMHgyMSzC
oMKgwqDCoMKgwqAgLyogdTjCoCBiRGVzY3JpcHRvclR5cGU7IEZ1bmN0aW9uYWwgKi8KQEAgLTQ3
Miw3ICs0NzIsNyBAQCBzdGF0aWMgY29uc3QgVVNCRGVzY0RldmljZSBkZXNjX2RldmljZSA9IHsK
wqDCoMKgwqAgfSwKwqB9OwrCoAotc3RhdGljIGNvbnN0IFVTQkRlc2MgZGVzY19jY2lkID0gewor
c3RhdGljIFVTQkRlc2MgZGVzY19jY2lkID0gewrCoMKgwqDCoCAuaWQgPSB7CsKgwqDCoMKgwqDC
oMKgwqAgLmlkVmVuZG9ywqDCoMKgwqDCoMKgwqDCoMKgID0gQ0NJRF9WRU5ET1JfSUQsCsKgwqDC
oMKgwqDCoMKgwqAgLmlkUHJvZHVjdMKgwqDCoMKgwqDCoMKgwqAgPSBDQ0lEX1BST0RVQ1RfSUQs
CkBAIC0xNDM3LDEyICsxNDM3LDMzIEBAIHN0YXRpYyBQcm9wZXJ0eSBjY2lkX3Byb3BlcnRpZXNb
XSA9IHsKwqDCoMKgwqAgREVGSU5FX1BST1BfRU5EX09GX0xJU1QoKSwKwqB9OwrCoAorc3RhdGlj
IHZvaWQgZW52X3VpbnQxNih1aW50MTZfdCAqdmFsLCBjb25zdCBjaGFyICplbnYpCit7CivCoMKg
wqAgY29uc3QgY2hhciAqc3RyID0gZ2V0ZW52KGVudik7CivCoMKgwqAgaWYgKHN0cikgeworwqDC
oMKgwqDCoMKgwqAgKnZhbCA9IHFlbXVfc3RydG91bChzdHIsIE5VTEwsIDE2KTsKK8KgwqDCoCB9
Cit9CisKwqBzdGF0aWMgdm9pZCBjY2lkX2NsYXNzX2luaXRmbihPYmplY3RDbGFzcyAqa2xhc3Ms
IHZvaWQgKmRhdGEpCsKgewrCoMKgwqDCoCBEZXZpY2VDbGFzcyAqZGMgPSBERVZJQ0VfQ0xBU1Mo
a2xhc3MpOwrCoMKgwqDCoCBVU0JEZXZpY2VDbGFzcyAqdWMgPSBVU0JfREVWSUNFX0NMQVNTKGts
YXNzKTsKwqDCoMKgwqAgSG90cGx1Z0hhbmRsZXJDbGFzcyAqaGMgPSBIT1RQTFVHX0hBTkRMRVJf
Q0xBU1Moa2xhc3MpOwotCivCoMKgwqAgY29uc3QgY2hhciAqZHNjID0gZ2V0ZW52KCJRRU1VX0ND
SURfREVTQ1JJUFRPUiIpOworCivCoMKgwqAgaWYgKGRzYykgeworwqDCoMKgwqDCoMKgwqAgdW5z
aWduZWQgaW50IGlkeCA9IDA7CivCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgdmFsID0gMDsK
K8KgwqDCoMKgwqDCoMKgIGludCBvZmYgPSAwOworwqDCoMKgwqDCoMKgwqAgZm9yICg7IDIgPT0g
c3NjYW5mKGRzYywgIiV1OiV4JW4iLCAmaWR4LCAmdmFsLCAmb2ZmKTsgZHNjICs9Cm9mZikgewor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaWR4IDwgc2l6ZW9mIHFlbXVfY2NpZF9kZXNjcmlw
dG9yKSB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcWVtdV9jY2lkX2Rlc2NyaXB0
b3JbaWR4XSA9IHZhbDsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQorwqDCoMKgwqDCoMKgwqAg
fQorwqDCoMKgIH0KK8KgwqDCoCBlbnZfdWludDE2KCZkZXNjX2NjaWQuaWQuaWRWZW5kb3IsICJR
RU1VX0NDSURfVkVORE9SX0lEIik7CivCoMKgwqAgZW52X3VpbnQxNigmZGVzY19jY2lkLmlkLmlk
UHJvZHVjdCwgIlFFTVVfQ0NJRF9QUk9EVUNUX0lEIik7CsKgwqDCoMKgIHVjLT5yZWFsaXplwqDC
oMKgwqDCoMKgwqAgPSBjY2lkX3JlYWxpemU7CsKgwqDCoMKgIHVjLT5wcm9kdWN0X2Rlc2PCoMKg
ID0gIlFFTVUgVVNCIENDSUQiOwrCoMKgwqDCoCB1Yy0+dXNiX2Rlc2PCoMKgwqDCoMKgwqAgPSAm
ZGVzY19jY2lkOwotLSAKMi4zNC4xCgoKCi0tIApLbGF1cyBSaXBrZQpTZW5pb3IgRGV2ZWxvcGVy
ClB1YmxpYyBBdXRob3JpdGllcyBEaXZpc2lvbgpzZWN1bmV0IFNlY3VyaXR5IE5ldHdvcmtzIEFH
CgpUZWxlZm9uOiAgKzQ5IDIwMSA1NDU0LTI5ODIK

