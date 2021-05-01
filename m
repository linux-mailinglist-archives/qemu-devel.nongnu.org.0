Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A23708CD
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:30:29 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcvJs-00009B-2S
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lcvHa-0007CD-Iq
 for qemu-devel@nongnu.org; Sat, 01 May 2021 15:28:07 -0400
Resent-Date: Sat, 01 May 2021 15:28:06 -0400
Resent-Message-Id: <E1lcvHa-0007CD-Iq@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lcvHW-0006Ub-1y
 for qemu-devel@nongnu.org; Sat, 01 May 2021 15:28:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619897276; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CTBPA0KlkthpnJ0OKOT+zBPke3Ssj33vyf+TSEZ6ntC/162hXKNFT2yGCd6lvLH5v4JxR0an5cxAP2cm50ARbTy+xpqk/8uTtKFoPu8DCeH7zykKAVmCMQpLlnA60TgXt71yXMryh3/silaDQQI9wNGwtWr0g3OXe4E3S7y1GPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619897276;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=VXPTXmnzWvz0RFtXLd6+3vO1AZRRt6nHJ56+omzeh3k=; 
 b=Cd8imV8V5jgHcFmxPseaOmae5+OBQOA6IOJ7bSdGcarpoS9QaLOO+gzPhsLe5RjNg8ufPiY8vtMOIXX2axS6cT2rK3fDzqFIV9ATDo2iwjbWPB+Plq0e9k00SNRWQqY4agM8cRAOyh76CknguiKEkRWiYLG6mcRQK9O40CvESbk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619897274091681.8884152619504;
 Sat, 1 May 2021 12:27:54 -0700 (PDT)
In-Reply-To: <20210501185116.1338875-1-richard.henderson@linaro.org>
Subject: Re: [PULL 0/5] tcg patch queue
Message-ID: <161989727287.4967.13720663282023206964@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Sat, 1 May 2021 12:27:54 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUwMTE4NTExNi4xMzM4
ODc1LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTAx
MTg1MTE2LjEzMzg4NzUtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN1YmplY3Q6IFtQ
VUxMIDAvNV0gdGNnIHBhdGNoIHF1ZXVlCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5E
ID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10g
ICAgICAgICBwYXRjaGV3LzIwMjEwNTAxMTg1MTE2LjEzMzg4NzUtMS1yaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA1MDExODUxMTYuMTMzODg3NS0xLXJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwozZjUy
ZDBkIGRlY29kZXRyZWU6IEV4dGVuZCBhcmd1bWVudCBzZXQgc3ludGF4IHRvIGFsbG93IHR5cGVz
CjJmMTcwYTQgZGVjb2RldHJlZTogQWRkIHN1cHBvcnQgZm9yIDY0LWJpdCBpbnN0cnVjdGlvbnMK
NjU2N2VlZCBkZWNvZGV0cmVlOiBNb3JlIHVzZSBvZiBmLXN0cmluZ3MKOTVjYWNhOCBkZWNvZGV0
cmVlOiBJbnRyb2R1Y2Ugd2hleCBhbmQgd2hleEMgaGVscGVycwpiOWE2NGIxIGV4ZWM6IFJlbW92
ZSBhY2NlbC90Y2cvIGZyb20gaW5jbHVkZSBwYXRocwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS81
IENoZWNraW5nIGNvbW1pdCBiOWE2NGIxM2FkODkgKGV4ZWM6IFJlbW92ZSBhY2NlbC90Y2cvIGZy
b20gaW5jbHVkZSBwYXRocykKMi81IENoZWNraW5nIGNvbW1pdCA5NWNhY2E4MThlMDggKGRlY29k
ZXRyZWU6IEludHJvZHVjZSB3aGV4IGFuZCB3aGV4QyBoZWxwZXJzKQpFUlJPUjogbGluZSBvdmVy
IDkwIGNoYXJhY3RlcnMKIzUyOiBGSUxFOiBzY3JpcHRzL2RlY29kZXRyZWUucHk6NDk1OgorICAg
ICAgICAgICAgICAgIG91dHB1dChpbmQsIGYnaWYgKChpbnNuICYge3doZXhDKGlubmVybWFzayl9
KSA9PSB7d2hleEMoaW5uZXJiaXRzKX0pIHt7XG4nKQoKV0FSTklORzogbGluZSBvdmVyIDgwIGNo
YXJhY3RlcnMKIzUzOiBGSUxFOiBzY3JpcHRzL2RlY29kZXRyZWUucHk6NDk2OgorICAgICAgICAg
ICAgICAgIG91dHB1dChpbmQsIGYnICAgIC8qIHtzdHJfbWF0Y2hfYml0cyhwLmZpeGVkYml0cywg
cC5maXhlZG1hc2spfSAqL1xuJykKCnRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgMTM2IGxp
bmVzIGNoZWNrZWQKClBhdGNoIDIvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy81IENo
ZWNraW5nIGNvbW1pdCA2NTY3ZWVkMDQ0NjEgKGRlY29kZXRyZWU6IE1vcmUgdXNlIG9mIGYtc3Ry
aW5ncykKNC81IENoZWNraW5nIGNvbW1pdCAyZjE3MGE0MDgxOTUgKGRlY29kZXRyZWU6IEFkZCBz
dXBwb3J0IGZvciA2NC1iaXQgaW5zdHJ1Y3Rpb25zKQpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hh
cmFjdGVycwojNzU6IEZJTEU6IHNjcmlwdHMvZGVjb2RldHJlZS5weToyMzY6CisgICAgICAgICAg
ICAgICAgcmV0ID0gZidkZXBvc2l0e2JpdG9wX3dpZHRofSh7cmV0fSwge3Bvc30sIHtiaXRvcF93
aWR0aCAtIHBvc30sIHtleHR9KScKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgNjMgbGlu
ZXMgY2hlY2tlZAoKUGF0Y2ggNC81IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4g
IElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0
byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCjUvNSBDaGVj
a2luZyBjb21taXQgM2Y1MmQwZDk2YzQyIChkZWNvZGV0cmVlOiBFeHRlbmQgYXJndW1lbnQgc2V0
IHN5bnRheCB0byBhbGxvdyB0eXBlcykKVXNlIG9mIHVuaW5pdGlhbGl6ZWQgdmFsdWUgJGFjcGlf
dGVzdGV4cGVjdGVkIGluIHN0cmluZyBlcSBhdCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBsaW5l
IDE1MjkuCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJ
TlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzE1NjogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3Rh
bDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDEyMSBsaW5lcyBjaGVja2VkCgpQYXRjaCA1LzUgaGFz
IHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwph
cmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hF
Q0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQg
ZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDov
L3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA1MDExODUxMTYuMTMzODg3NS0xLXJpY2hhcmQuaGVuZGVy
c29uQGxpbmFyby5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFp
bCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

