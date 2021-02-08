Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD731453B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:05:33 +0100 (CET)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9HTA-0002IL-9f
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l9F9M-0000qi-Ae
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:36:56 -0500
Resent-Date: Mon, 08 Feb 2021 17:36:56 -0500
Resent-Message-Id: <E1l9F9M-0000qi-Ae@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l9F9J-0004r4-Q9
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:36:56 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612823807; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nky4GlqoCJ1rUB8Z2uzwCinCo+1eTyi3ptSi1ZDtTXxQI9kI0ODo9WOQyRTQv7vl6N64nwmIzKQXtkebQJlRMgXF9y1/TpwME8cvRK0tR1SUaerQqO6Ja/x2ELEZ58M6vL3lmG4ldvbBylXlbUSpgdIOjGvpLCJJsaUmZ587vI4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612823807;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=kqeMHzgJpbu7x8ku1V5h1sr9p+V8khxGJ3hYEcPdvwE=; 
 b=XkIL+AMEVRxoJriW2eCcYR7n04dTL74Ba4LxyVgW/UQPVFDKxey2n4qu04POqxSQUPRG2gyEb48l7WQ9s64LP6YOWcIOux6wjc8yrEmYltzkIN5h8i0n/2RTHo15eoH9b9vhZPjqcr8n+tYZ8XBU+IEgnv5Zr5rH19xxrtvMn2g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612823805722452.9587252148366;
 Mon, 8 Feb 2021 14:36:45 -0800 (PST)
In-Reply-To: <161280769492.2878.8851519112088854609.malone@chaenomeles.canonical.com>
Subject: Re: [Bug 1914849] Re: mprotect fails after MacOS 11.2 on arm mac
Message-ID: <161282380486.22934.4276021089068171445@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1914849@bugs.launchpad.net
Date: Mon, 8 Feb 2021 14:36:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjEyODA3Njk0OTIuMjg3OC44
ODUxNTE5MTEyMDg4ODU0NjA5Lm1hbG9uZUBjaGFlbm9tZWxlcy5jYW5vbmljYWwuY29tLwoKCgpI
aSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMu
IFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVz
c2FnZS1pZDogMTYxMjgwNzY5NDkyLjI4NzguODg1MTUxOTExMjA4ODg1NDYwOS5tYWxvbmVAY2hh
ZW5vbWVsZXMuY2Fub25pY2FsLmNvbQpTdWJqZWN0OiBbQnVnIDE5MTQ4NDldIFJlOiBtcHJvdGVj
dCBmYWlscyBhZnRlciBNYWNPUyAxMS4yIG9uIGFybSBtYWMKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMTYxMjgwNzY5NDkyLjI4NzguODg1MTUxOTExMjA4
ODg1NDYwOS5tYWxvbmVAY2hhZW5vbWVsZXMuY2Fub25pY2FsLmNvbSAtPiBwYXRjaGV3LzE2MTI4
MDc2OTQ5Mi4yODc4Ljg4NTE1MTkxMTIwODg4NTQ2MDkubWFsb25lQGNoYWVub21lbGVzLmNhbm9u
aWNhbC5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDEyOTAwNTg0NS40MTYy
NzItMS13dWhhb3RzaEBnb29nbGUuY29tIC0+IHBhdGNoZXcvMjAyMTAxMjkwMDU4NDUuNDE2Mjcy
LTEtd3VoYW90c2hAZ29vZ2xlLmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEw
MjA4MDI0NjI1LjI3MTAxOC0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0Y2hl
dy8yMDIxMDIwODAyNDYyNS4yNzEwMTgtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnCiAt
IFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAyMDgxNjMzMzkuMTE1OTUxNC0xLWJlcnJh
bmdlQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDIwODE2MzMzOS4xMTU5NTE0LTEtYmVycmFu
Z2VAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmYyYzczZDAgbXBy
b3RlY3QgZmFpbHMgYWZ0ZXIgTWFjT1MgMTEuMiBvbiBhcm0gbWFjCgo9PT0gT1VUUFVUIEJFR0lO
ID09PQpFUlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMSBlcnJv
cnMsIDAgd2FybmluZ3MsIDkgbGluZXMgY2hlY2tlZAoKQ29tbWl0IGYyYzczZDAzOTE2YyAobXBy
b3RlY3QgZmFpbHMgYWZ0ZXIgTWFjT1MgMTEuMiBvbiBhcm0gbWFjKSBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBj
b2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcv
bG9ncy8xNjEyODA3Njk0OTIuMjg3OC44ODUxNTE5MTEyMDg4ODU0NjA5Lm1hbG9uZUBjaGFlbm9t
ZWxlcy5jYW5vbmljYWwuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0K
RW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3
Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0
LmNvbQ==

