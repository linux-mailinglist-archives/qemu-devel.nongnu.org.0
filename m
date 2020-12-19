Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120492DEDE9
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 10:14:05 +0100 (CET)
Received: from localhost ([::1]:38294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqYJQ-00022m-4h
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 04:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kqYIM-0001e3-OR
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:12:58 -0500
Resent-Date: Sat, 19 Dec 2020 04:12:58 -0500
Resent-Message-Id: <E1kqYIM-0001e3-OR@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kqYIK-0006Ii-G4
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:12:58 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1608369166; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=E/pznDv3gJ3SqQQ6skKGifq/3V7zqjiSHc2+hkb/h2KDnDuQaYPcJ+7QfmOMnkhmVClVuL+j/3OIa23MR+CtnDXPy+Dg0rUJFK43iDu/pi8kiNoQ4JWiMrxXEOhEPdylk6GnXBuQdffp6rLJSaqpDqkCK9+DU1vmL8bmZt3XMhU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1608369166;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=M/Y/cRlIeJuDMqOzuddOxDjD2iwjmebX2tNAXvq+OkE=; 
 b=Lt24GYZW1M5iAivjuzla/OZrrRY0bMl3N6XE79LHfYvmn/cFVqjiq+NfrbRloxLLyC++6+/QFP05N5yLIzrR6ngQjTB+Iqk2OAoPISByEUfd8/Qbe2ypOru4vMET9rej6EmXp3YRIWWHMln/uLAXVWs7KKkbIFHMP25GY8XCZZc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1608369164325139.601752433991;
 Sat, 19 Dec 2020 01:12:44 -0800 (PST)
In-Reply-To: <20201219090637.1700900-1-pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] Cleanup internal WHPX headers
Message-ID: <160836916317.2802.14206275821051568672@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Sat, 19 Dec 2020 01:12:44 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIxOTA5MDYzNy4xNzAw
OTAwLTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMjE5MDkwNjM3LjE3
MDA5MDAtMS1wYm9uemluaUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCAwLzJdIENsZWFudXAg
aW50ZXJuYWwgV0hQWCBoZWFkZXJzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAg
ICAgICBwYXRjaGV3LzIwMjAxMjE5MDkwNjM3LjE3MDA5MDAtMS1wYm9uemluaUByZWRoYXQuY29t
IC0+IHBhdGNoZXcvMjAyMDEyMTkwOTA2MzcuMTcwMDkwMC0xLXBib256aW5pQHJlZGhhdC5jb20K
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphYWRhMWJmIHdocHg6IG1vdmUgaW50ZXJu
YWwgZGVmaW5pdGlvbnMgdG8gd2hweC1pbnRlcm5hbC5oCjJiMDc3MWEgd2hweDogcmVuYW1lIHdo
cC1kaXNwYXRjaCB0byB3aHB4LWludGVybmFsLmgKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMiBD
aGVja2luZyBjb21taXQgMmIwNzcxYWU4YWQwICh3aHB4OiByZW5hbWUgd2hwLWRpc3BhdGNoIHRv
IHdocHgtaW50ZXJuYWwuaCkKV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShz
KSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojNjQ6IApyZW5hbWUgZnJvbSB0YXJn
ZXQvaTM4Ni93aHB4L3docC1kaXNwYXRjaC5oCgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3Ms
IDQ2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoy
LzIgQ2hlY2tpbmcgY29tbWl0IGFhZGExYmYyNjI1NSAod2hweDogbW92ZSBpbnRlcm5hbCBkZWZp
bml0aW9ucyB0byB3aHB4LWludGVybmFsLmgpCkVSUk9SOiBvcGVuIGJyYWNlICd7JyBmb2xsb3dp
bmcgZnVuY3Rpb24gZGVjbGFyYXRpb25zIGdvIG9uIHRoZSBuZXh0IGxpbmUKIzU2OiBGSUxFOiB0
YXJnZXQvaTM4Ni93aHB4L3docHgtYWxsLmM6MTg2OToKK2Jvb2wgd2hweF9hcGljX2luX3BsYXRm
b3JtKHZvaWQpIHsKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgNjMgbGluZXMgY2hlY2tl
ZAoKUGF0Y2ggMi8yIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9
PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMTIxOTA5MDYzNy4xNzAwOTAw
LTEtcGJvbnppbmlAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4K
LS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0
Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJl
ZGhhdC5jb20=

