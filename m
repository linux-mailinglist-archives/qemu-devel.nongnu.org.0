Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8272B18BE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:04:58 +0100 (CET)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVwv-0000d3-Ni
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kdVw0-00005W-9e; Fri, 13 Nov 2020 05:04:00 -0500
Resent-Date: Fri, 13 Nov 2020 05:04:00 -0500
Resent-Message-Id: <E1kdVw0-00005W-9e@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kdVvy-0007NE-0z; Fri, 13 Nov 2020 05:03:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605261826; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=beQ3rdjjeac4ndUwDXuIJBGKwi+wmIm7Ele+U9B4/XaonH61zZ7OZFoSeM56FRHE2qwXRowjY6dRLOohA+q9bpomlqDe0YcrJWNp1Dlck0D4wEhWU8UFoyur1rKIUZ5QXzEU4VCc/HcxlSlrbacp5TDWFP/dVI0nM+kWH9T2xPk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605261826;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=FUyGytY747J/LbYBn2NEVzhrfspVgSXmbCq4ebzOR3Q=; 
 b=KcwRCenTR5xnWwRkjF2OJHw7idPcHyv8JDdkJHSZsgOYzyXzxDnkkAcxunKf2tLB7mD5dNeuF6f59TyN5eVRX5iNV2X4AjW/jWnedT733rbij/YgXy1y5Z9a9CbGQK7AWk/WoNljbedkPN0cWbZMlRSVCfj9f/21GXJPdk4OKKQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605261823658567.6311255573683;
 Fri, 13 Nov 2020 02:03:43 -0800 (PST)
Subject: Re: [PATCH] arm/monitor: Add support for 'info tlb' command
Message-ID: <160526182226.299.8065611801210943029@d9ec01ea6314>
In-Reply-To: <20201113095854.67668-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: changbin.du@gmail.com
Date: Fri, 13 Nov 2020 02:03:43 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 05:03:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: changbin.du@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExMzA5NTg1NC42NzY2
OC0xLWNoYW5nYmluLmR1QGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAyMDExMTMwOTU4NTQuNjc2NjgtMS1jaGFuZ2Jp
bi5kdUBnbWFpbC5jb20KVHlwZTogc2VyaWVzClN1YmplY3Q6IFtQQVRDSF0gYXJtL21vbml0b3I6
IEFkZCBzdXBwb3J0IGZvciAnaW5mbyB0bGInIGNvbW1hbmQKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDExMTMwOTU4NTQuNjc2NjgtMS1jaGFuZ2Jp
bi5kdUBnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDIwMTExMzA5NTg1NC42NzY2OC0xLWNoYW5nYmlu
LmR1QGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmEzM2U2ZTcgYXJt
L21vbml0b3I6IEFkZCBzdXBwb3J0IGZvciAnaW5mbyB0bGInIGNvbW1hbmQKCj09PSBPVVRQVVQg
QkVHSU4gPT09CldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMxNDE6IEZJTEU6IHRh
cmdldC9hcm0vbW9uaXRvci5jOjI2NzoKK3ByaW50X3B0ZV9scGFlKE1vbml0b3IgKm1vbiwgdWlu
dDMyX3QgdGFibGVhdHRycywgaW50IHZhX2JpdHMsIHRhcmdldF91bG9uZyB2YWRkciwKCkVSUk9S
OiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJz0nIChjdHg6VnhXKQojMTc0OiBGSUxFOiB0
YXJnZXQvYXJtL21vbml0b3IuYzozMDA6CisgICAgaW50IHB0c2hpZnQ9IHBnX3NoaWZ0ICsgKG1h
eF9sZXZlbCAtIGN1cl9sZXZlbCkgKiBzdHJpZGU7CiAgICAgICAgICAgICAgICBeCgpXQVJOSU5H
OiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMTk1OiBGSUxFOiB0YXJnZXQvYXJtL21vbml0b3Iu
YzozMjE6CisgICAgICAgICAgICBwcmludF9wdGVfbHBhZShtb24sIHRhYmxlYXR0cnMsIHZhX2Jp
dHMsIHZzdGFydCwgcGFkZHIsIHBnc2l6ZSwgcHRlKTsKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBj
aGFyYWN0ZXJzCiMyNjg6IEZJTEU6IHRhcmdldC9hcm0vbW9uaXRvci5jOjM5NDoKKyAgICAgICAg
ICAgIHdhbGtfcHRlX2xwYWUobW9uLCB0cnVlLCAwLCBiYXNlLCB2c3RhcnQsIGN1cl9sZXZlbCwg
c3RyaWRlLCB2YV9iaXRzKTsKCnRvdGFsOiAxIGVycm9ycywgMyB3YXJuaW5ncywgMjYyIGxpbmVz
IGNoZWNrZWQKCkNvbW1pdCBhMzNlNmU3ZTBlZGQgKGFybS9tb25pdG9yOiBBZGQgc3VwcG9ydCBm
b3IgJ2luZm8gdGxiJyBjb21tYW5kKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VU
UFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMTExMzA5NTg1
NC42NzY2OC0xLWNoYW5nYmluLmR1QGdtYWlsLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=

