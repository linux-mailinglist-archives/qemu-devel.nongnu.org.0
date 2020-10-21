Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72942951FA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 20:06:39 +0200 (CEST)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVIVS-00022m-4V
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 14:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kVISr-000125-JO
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 14:03:58 -0400
Resent-Date: Wed, 21 Oct 2020 14:03:57 -0400
Resent-Message-Id: <E1kVISr-000125-JO@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kVISn-0001kr-F9
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 14:03:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1603303427; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=T+rRBYAPhdMINZ86TJd/aCLOYZjs3sAMao48NFqmd4WXB9D+JJ0Nj9OjaOgxVIxacwzC+oeJ/+qyMUWtFPiDrO4kYsEdFDVes1CVIvOV1EoJ0KwC2kjU8SJ9+Y94Qu+/dmegJoqvp1yNZaLGMbIfRkmtWzY1cR8vlNF6PWPohMQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1603303427;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=a0IJjPYTk99yIKXRIOxiJD6tNvNKOt73vl82HRvbcLo=; 
 b=HINggZn9AJGzw0IggndSs/+K729eXtRApeAlCIzN2l9mj1TJMqgDgjtu+Fm4Py3xO7gRt4xX6Gm2+Zaunv5jwEF1H1beYy/eP7DtV/FafAena9UbDq5keJmcP/SE3m6d7Xj8U6iUZMwVB1iZIs1m0ILvcaYnzOOaifCNWD8hjLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1603303425646430.3900865503083;
 Wed, 21 Oct 2020 11:03:45 -0700 (PDT)
Subject: Re: [PATCH v12 00/12] linux-user: User support for AArch64 BTI
Message-ID: <160330342447.17333.14606008407043150963@66eaa9a8a123>
In-Reply-To: <20201021173749.111103-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Wed, 21 Oct 2020 11:03:45 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 14:03:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTAyMTE3Mzc0OS4xMTEx
MDMtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDEwMjEx
NzM3NDkuMTExMTAzLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTdWJqZWN0OiBbUEFU
Q0ggdjEyIDAwLzEyXSBsaW51eC11c2VyOiBVc2VyIHN1cHBvcnQgZm9yIEFBcmNoNjQgQlRJCgo9
PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+
IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxi
YWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFm
Zjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRj
aGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMDIxMTcz
NzQ5LjExMTEwMy0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIw
MTAyMTE3Mzc0OS4xMTExMDMtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYTI5MDk0YiB0ZXN0cy90Y2cvYWFyY2g2NDogQWRkIGJ0
aSBzbW9rZSB0ZXN0cwpmMThkODdlIGxpbnV4LXVzZXIvZWxmbG9hZDogUGFyc2UgR05VX1BST1BF
UlRZX0FBUkNINjRfRkVBVFVSRV8xX0FORAo3MGJmYzdkIGxpbnV4LXVzZXIvZWxmbG9hZDogUGFy
c2UgTlRfR05VX1BST1BFUlRZX1RZUEVfMCBub3Rlcwo1Njg1NDQ2IGxpbnV4LXVzZXIvZWxmbG9h
ZDogVXNlIEVycm9yIGZvciBsb2FkX2VsZl9pbnRlcnAKODg5MjI3ZCBsaW51eC11c2VyL2VsZmxv
YWQ6IFVzZSBFcnJvciBmb3IgbG9hZF9lbGZfaW1hZ2UKNjQ4ODg0OSBsaW51eC11c2VyL2VsZmxv
YWQ6IE1vdmUgUFRfSU5URVJQIGRldGVjdGlvbiB0byBmaXJzdCBsb29wCmYxNDZjY2QgbGludXgt
dXNlci9lbGZsb2FkOiBBZGp1c3QgaXRlcmF0aW9uIG92ZXIgcGhkcgo5NTMyN2VkIGxpbnV4LXVz
ZXIvZWxmbG9hZDogRml4IGNvZGluZyBzdHlsZSBpbiBsb2FkX2VsZl9pbWFnZQplN2NhZTI4IGxp
bnV4LXVzZXIvZWxmbG9hZDogQXZvaWQgbGVha2luZyBpbnRlcnBfbmFtZSB1c2luZyBHTGliIG1l
bW9yeSBBUEkKM2IyMDQyYyBpbmNsdWRlL2VsZjogQWRkIGRlZmluZXMgcmVsYXRlZCB0byBHTlUg
cHJvcGVydHkgbm90ZXMgZm9yIEFBcmNoNjQKNzcyNzhjYiBsaW51eC11c2VyOiBTZXQgUEFHRV9U
QVJHRVRfMSBmb3IgVEFSR0VUX1BST1RfQlRJCjM2NjEwOWEgbGludXgtdXNlci9hYXJjaDY0OiBS
ZXNldCBidHlwZSBmb3Igc2lnbmFscwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8xMiBDaGVja2lu
ZyBjb21taXQgMzY2MTA5YTQ0NTU3IChsaW51eC11c2VyL2FhcmNoNjQ6IFJlc2V0IGJ0eXBlIGZv
ciBzaWduYWxzKQoyLzEyIENoZWNraW5nIGNvbW1pdCA3NzI3OGNiOTEzMTUgKGxpbnV4LXVzZXI6
IFNldCBQQUdFX1RBUkdFVF8xIGZvciBUQVJHRVRfUFJPVF9CVEkpCjMvMTIgQ2hlY2tpbmcgY29t
bWl0IDNiMjA0MmM3OGU2NiAoaW5jbHVkZS9lbGY6IEFkZCBkZWZpbmVzIHJlbGF0ZWQgdG8gR05V
IHByb3BlcnR5IG5vdGVzIGZvciBBQXJjaDY0KQo0LzEyIENoZWNraW5nIGNvbW1pdCBlN2NhZTI4
M2Y2NTAgKGxpbnV4LXVzZXIvZWxmbG9hZDogQXZvaWQgbGVha2luZyBpbnRlcnBfbmFtZSB1c2lu
ZyBHTGliIG1lbW9yeSBBUEkpCjUvMTIgQ2hlY2tpbmcgY29tbWl0IDk1MzI3ZWQzMjgwZSAobGlu
dXgtdXNlci9lbGZsb2FkOiBGaXggY29kaW5nIHN0eWxlIGluIGxvYWRfZWxmX2ltYWdlKQo2LzEy
IENoZWNraW5nIGNvbW1pdCBmMTQ2Y2NkNTU2ZjQgKGxpbnV4LXVzZXIvZWxmbG9hZDogQWRqdXN0
IGl0ZXJhdGlvbiBvdmVyIHBoZHIpCjcvMTIgQ2hlY2tpbmcgY29tbWl0IDY0ODg4NDkwOTk5ZiAo
bGludXgtdXNlci9lbGZsb2FkOiBNb3ZlIFBUX0lOVEVSUCBkZXRlY3Rpb24gdG8gZmlyc3QgbG9v
cCkKOC8xMiBDaGVja2luZyBjb21taXQgODg5MjI3ZDY3Y2FhIChsaW51eC11c2VyL2VsZmxvYWQ6
IFVzZSBFcnJvciBmb3IgbG9hZF9lbGZfaW1hZ2UpCjkvMTIgQ2hlY2tpbmcgY29tbWl0IDU2ODU0
NDZhYTdhZCAobGludXgtdXNlci9lbGZsb2FkOiBVc2UgRXJyb3IgZm9yIGxvYWRfZWxmX2ludGVy
cCkKMTAvMTIgQ2hlY2tpbmcgY29tbWl0IDcwYmZjN2RjNzk5MCAobGludXgtdXNlci9lbGZsb2Fk
OiBQYXJzZSBOVF9HTlVfUFJPUEVSVFlfVFlQRV8wIG5vdGVzKQoxMS8xMiBDaGVja2luZyBjb21t
aXQgZjE4ZDg3ZTUyOWJjIChsaW51eC11c2VyL2VsZmxvYWQ6IFBhcnNlIEdOVV9QUk9QRVJUWV9B
QVJDSDY0X0ZFQVRVUkVfMV9BTkQpCjEyLzEyIENoZWNraW5nIGNvbW1pdCBhMjkwOTRiNDYyZDgg
KHRlc3RzL3RjZy9hYXJjaDY0OiBBZGQgYnRpIHNtb2tlIHRlc3RzKQpXQVJOSU5HOiBhZGRlZCwg
bW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/
CiMzNzogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CgpFUlJPUjogdXNlIHFlbXVfcmVhbF9ob3N0X3Bh
Z2Vfc2l6ZSBpbnN0ZWFkIG9mIGdldHBhZ2VzaXplKCkKIzE5ODogRklMRTogdGVzdHMvdGNnL2Fh
cmNoNjQvYnRpLTIuYzo4OToKKyAgICB2b2lkICpwID0gbW1hcCgwLCBnZXRwYWdlc2l6ZSgpLAoK
RVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmMgZmlsZXMKIzI0NDogRklMRTog
dGVzdHMvdGNnL2FhcmNoNjQvYnRpLWNydC5pbmMuYzoxMzoKK2ludCBtYWluKHZvaWQpOwoKdG90
YWw6IDIgZXJyb3JzLCAxIHdhcm5pbmdzLCAyNTUgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMTIvMTIg
aGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9y
cwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21t
YW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAxMDIxMTczNzQ5LjExMTEwMy0xLXJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t

