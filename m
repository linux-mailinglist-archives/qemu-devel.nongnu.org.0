Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1616363216
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:53:14 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXr0D-00014I-Of
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lXqz7-0000Wh-4C
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:52:05 -0400
Resent-Date: Sat, 17 Apr 2021 15:52:05 -0400
Resent-Message-Id: <E1lXqz7-0000Wh-4C@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lXqz4-0005fL-Hy
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:52:04 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618689110; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k7gCOdRjYeklaLqnq8ZrtDVbDFLRdvxA+X8j8C2XhOHmww0/QQ0PqyDzC65mmKCtUUa6Snxw3/vwXTvGeysj3Y7QN498D+4ZZZ3nlVJxQJqzraD11PRtna8Dv+XAYlkTKMQcJinLaf6VnZYhpZQCP1Cbw0+I79R03hw3NSqarH4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618689110;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=CE3rJUjOagwrUqZOCR9ZN7VA2XewLAfwtgyuvmKCv8M=; 
 b=kXK9H6Wbe6XOoot3MUYe+OHU2WChoZp0zHLt/dkiDguxYeNGIo7YOwdX9FGOlvKBciuJR7q4E/k2V5bQDzSJVYYDxLSeTflKKIWcVrQ61+DSKpFLbbjjqTeBa+cjdCgv6Y566uMdzoQiiuRWs4zXKrC0NvINvSlOQosT0hcPKHU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618689108865378.9376729270282;
 Sat, 17 Apr 2021 12:51:48 -0700 (PDT)
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
Subject: Re: [PULL 0/7] queue of proposed rc4 fixes
Message-ID: <161868910748.13055.8936381611060034956@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Sat, 17 Apr 2021 12:51:48 -0700 (PDT)
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxNzE5NDIwNS4xNzA1
Ny0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNDE3MTk0MjA1
LjE3MDU3LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnClN1YmplY3Q6IFtQVUxMIDAvN10gcXVl
dWUgb2YgcHJvcG9zZWQgcmM0IGZpeGVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5E
ID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10g
ICAgICAgICBwYXRjaGV3LzIwMjEwNDE3MTk0MjA1LjE3MDU3LTEtcGV0ZXIubWF5ZGVsbEBsaW5h
cm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA0MTcxOTQyMDUuMTcwNTctMS1wZXRlci5tYXlkZWxsQGxp
bmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3MmU2MTJmIGFjY2VsL3Rj
ZzogYXZvaWQgcmUtdHJhbnNsYXRpbmcgb25lLXNob3QgaW5zdHJ1Y3Rpb25zCjA3YWZhZDUgdGFy
Z2V0L2FybTogZHJvcCBDRl9MQVNUX0lPL2RjLT5jb25kanVtcCBjaGVjawo1ZGM3YjlmIGh3L2Fy
bS9hcm1zc2U6IE1ha2UgU1NFLTMwMCB1c2UgQ29ydGV4LU01NQo0MjVkOWZlIGh3L2FybS9hcm1z
c2U6IEdpdmUgU1NFLTMwMCBpdHMgb3duIFByb3BlcnR5IGFycmF5CmVjNTA0N2IgaW5jbHVkZS9x
ZW11L29zZGVwLmg6IE1vdmUgc3lzdGVtIGluY2x1ZGVzIHRvIHRvcAo0MDFmYTY3IG9zZGVwOiBw
cm90ZWN0IHFlbXUvb3NkZXAuaCB3aXRoIGV4dGVybiAiQyIKN2NmMWMyZSBvc2RlcDogaW5jbHVk
ZSBnbGliLWNvbXBhdC5oIGJlZm9yZSBvdGhlciBRRU1VIGhlYWRlcnMKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvNyBDaGVja2luZyBjb21taXQgN2NmMWMyZWZkNzY1IChvc2RlcDogaW5jbHVkZSBn
bGliLWNvbXBhdC5oIGJlZm9yZSBvdGhlciBRRU1VIGhlYWRlcnMpCjIvNyBDaGVja2luZyBjb21t
aXQgNDAxZmE2N2UwMzAzIChvc2RlcDogcHJvdGVjdCBxZW11L29zZGVwLmggd2l0aCBleHRlcm4g
IkMiKQpXQVJOSU5HOiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZv
aWRlZAojODA6IEZJTEU6IGluY2x1ZGUvcWVtdS9jb21waWxlci5oOjE0OgorI2lmZGVmIF9fY3Bs
dXNwbHVzCgpFUlJPUjogc3RvcmFnZSBjbGFzcyBzaG91bGQgYmUgYXQgdGhlIGJlZ2lubmluZyBv
ZiB0aGUgZGVjbGFyYXRpb24KIzgxOiBGSUxFOiBpbmNsdWRlL3FlbXUvY29tcGlsZXIuaDoxNToK
KyNkZWZpbmUgUUVNVV9FWFRFUk5fQyBleHRlcm4gIkMiCgpFUlJPUjogc3RvcmFnZSBjbGFzcyBz
aG91bGQgYmUgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZGVjbGFyYXRpb24KIzgzOiBGSUxFOiBp
bmNsdWRlL3FlbXUvY29tcGlsZXIuaDoxNzoKKyNkZWZpbmUgUUVNVV9FWFRFUk5fQyBleHRlcm4K
CldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVk
CiMxMDY6IEZJTEU6IGluY2x1ZGUvcWVtdS9vc2RlcC5oOjEyMToKKyNpZmRlZiBfX2NwbHVzcGx1
cwoKV0FSTklORzogYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGRlZmluZXMgc2hvdWxkIGJlIGF2b2lk
ZWQKIzExNzogRklMRTogaW5jbHVkZS9xZW11L29zZGVwLmg6NzM1OgorI2lmZGVmIF9fY3BsdXNw
bHVzCgp0b3RhbDogMiBlcnJvcnMsIDMgd2FybmluZ3MsIDU2IGxpbmVzIGNoZWNrZWQKClBhdGNo
IDIvNyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2Ug
ZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIs
IHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy83IENoZWNraW5nIGNvbW1pdCBlYzUw
NDdiNThmZmMgKGluY2x1ZGUvcWVtdS9vc2RlcC5oOiBNb3ZlIHN5c3RlbSBpbmNsdWRlcyB0byB0
b3ApCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9p
ZGVkCiMzNzogRklMRTogaW5jbHVkZS9xZW11L29zZGVwLmg6MTExOgorI2lmIGRlZmluZWQoX19s
aW51eF9fKSAmJiBkZWZpbmVkKF9fc3BhcmNfXykKCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVj
aWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiM0OTogRklMRTogaW5jbHVkZS9xZW11L29z
ZGVwLmg6MTIzOgorI2lmZGVmIF9fQVBQTEVfXwoKdG90YWw6IDAgZXJyb3JzLCAyIHdhcm5pbmdz
LCA1MCBsaW5lcyBjaGVja2VkCgpQYXRjaCAzLzcgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2Ug
cmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9y
dCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4K
NC83IENoZWNraW5nIGNvbW1pdCA0MjVkOWZlNzBjY2UgKGh3L2FybS9hcm1zc2U6IEdpdmUgU1NF
LTMwMCBpdHMgb3duIFByb3BlcnR5IGFycmF5KQo1LzcgQ2hlY2tpbmcgY29tbWl0IDVkYzdiOWY5
ZGI4YiAoaHcvYXJtL2FybXNzZTogTWFrZSBTU0UtMzAwIHVzZSBDb3J0ZXgtTTU1KQo2LzcgQ2hl
Y2tpbmcgY29tbWl0IDA3YWZhZDUwMzExMCAodGFyZ2V0L2FybTogZHJvcCBDRl9MQVNUX0lPL2Rj
LT5jb25kanVtcCBjaGVjaykKNy83IENoZWNraW5nIGNvbW1pdCA3MmU2MTJmZjA5ZjQgKGFjY2Vs
L3RjZzogYXZvaWQgcmUtdHJhbnNsYXRpbmcgb25lLXNob3QgaW5zdHJ1Y3Rpb25zKQo9PT0gT1VU
UFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDQxNzE5NDIw
NS4xNzA1Ny0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

