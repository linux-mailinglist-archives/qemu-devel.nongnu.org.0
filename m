Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBEC2FA849
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:06:27 +0100 (CET)
Received: from localhost ([::1]:42990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Yv4-0008TX-NL
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l1Ypp-0006xU-Qh
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:01:01 -0500
Resent-Date: Mon, 18 Jan 2021 13:01:01 -0500
Resent-Message-Id: <E1l1Ypp-0006xU-Qh@lists.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l1Ypn-0004CM-0b
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:01:01 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610992852; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hKF/XVnM7MGqcQ3Ot5Z9K08J/RBcVjqsTkT+1G/UhJHeZ15ZlKBKozFb0u+U3WVPoyTzfiUO4APn0HzP7uLMpdwTgF1z/dryf+YN9mRGyQr/BO7KD8gQgjl2oS4tNP9Ua/2yrd2Si/GCR1drXO92JWXGuuAzJQTiK3sh2QTffcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610992852;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lj6gCblDWZbBwnOJ5pod2iuIO1laTZo02tKl+dwsi8Q=; 
 b=PEeNvBLEqGcPuXSuw/cw7iah89Txoo/+y0DJf2O7JKnt9ow44yg3UeomiAhwWu0RC3DizzJrTjnFmULxiDNYo1reqUj5Kw3lwsPy4nUGP6C/iUlfVQDwIpWFKCjen1OlxaDAerWYw5BMPxBaOPUAdJnsO/6YUpUaaP43WZeheB8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610992850246425.67499028054965;
 Mon, 18 Jan 2021 10:00:50 -0800 (PST)
In-Reply-To: <161099084144.30067.897245088295398204.malone@chaenomeles.canonical.com>
Subject: Re: [Bug 1912065] Re: Segfaults in tcg/optimize.c:212 after commit
 7c79721606be11b5bc556449e5bcbc331ef6867d
Message-ID: <161099284929.24279.8861936732715099651@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1912065@bugs.launchpad.net
Date: Mon, 18 Jan 2021 10:00:50 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.54; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o54.zoho.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjEwOTkwODQxNDQuMzAwNjcu
ODk3MjQ1MDg4Mjk1Mzk4MjA0Lm1hbG9uZUBjaGFlbm9tZWxlcy5jYW5vbmljYWwuY29tLwoKCgpI
aSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMu
IFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVz
c2FnZS1pZDogMTYxMDk5MDg0MTQ0LjMwMDY3Ljg5NzI0NTA4ODI5NTM5ODIwNC5tYWxvbmVAY2hh
ZW5vbWVsZXMuY2Fub25pY2FsLmNvbQpTdWJqZWN0OiBbQnVnIDE5MTIwNjVdIFJlOiBTZWdmYXVs
dHMgaW4gdGNnL29wdGltaXplLmM6MjEyIGFmdGVyIGNvbW1pdCA3Yzc5NzIxNjA2YmUxMWI1YmM1
NTY0NDllNWJjYmMzMzFlZjY4NjdkCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAg
ICAgICBwYXRjaGV3LzE2MTA5OTA4NDE0NC4zMDA2Ny44OTcyNDUwODgyOTUzOTgyMDQubWFsb25l
QGNoYWVub21lbGVzLmNhbm9uaWNhbC5jb20gLT4gcGF0Y2hldy8xNjEwOTkwODQxNDQuMzAwNjcu
ODk3MjQ1MDg4Mjk1Mzk4MjA0Lm1hbG9uZUBjaGFlbm9tZWxlcy5jYW5vbmljYWwuY29tCiAtIFt0
YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvY292ZXIuMTYxMDYzODQyOC5naXQuamFnLnJhbWFuQG9y
YWNsZS5jb20gLT4gcGF0Y2hldy9jb3Zlci4xNjEwNjM4NDI4LmdpdC5qYWcucmFtYW5Ab3JhY2xl
LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjBiNzg0MGEgU2VnZmF1bHRzIGlu
IHRjZy9vcHRpbWl6ZS5jOjIxMiBhZnRlciBjb21taXQgN2M3OTcyMTYwNmJlMTFiNWJjNTU2NDQ5
ZTViY2JjMzMxZWY2ODY3ZAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IE1pc3NpbmcgU2ln
bmVkLW9mZi1ieTogbGluZShzKQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxNiBsaW5l
cyBjaGVja2VkCgpDb21taXQgMGI3ODQwYWVjMGQ4IChTZWdmYXVsdHMgaW4gdGNnL29wdGltaXpl
LmM6MjEyIGFmdGVyIGNvbW1pdCA3Yzc5NzIxNjA2YmUxMWI1YmM1NTY0NDllNWJjYmMzMzFlZjY4
NjdkKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2Ug
ZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIs
IHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3Qg
Y29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBh
dApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8xNjEwOTkwODQxNDQuMzAwNjcuODk3MjQ1MDg4Mjk1
Mzk4MjA0Lm1hbG9uZUBjaGFlbm9tZWxlcy5jYW5vbmljYWwuY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

