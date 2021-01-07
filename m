Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2232ECDE8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:34:44 +0100 (CET)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSct-0007tY-5I
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kxSZP-0004hk-3M
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:31:08 -0500
Resent-Date: Thu, 07 Jan 2021 05:31:07 -0500
Resent-Message-Id: <E1kxSZP-0004hk-3M@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kxSZL-0001Zx-KH
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:31:06 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610015451; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nILOfuWjNfcR4rmuQTHxJ3zHHRKwDIs9BJLTZxki1j2j2pcsdPmT8aj8jfGW0iVI8F6P6iXJmvMXqM23MmsffYiTNzO7gSkyKlIa5bymXYkkjnC8saToSoNnqGIMdF3KKKnHT/LCiZmYMVuJutL/NqAf0UAkBNIwydrd3FToC70=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610015451;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=kbiZk1plyxr1hbzb1oFIrBKuekKWtvWhgp+SaUvjz2A=; 
 b=bw1SVRE4nOGPmh1c5EgVD64vJurfp1ifTo6DHm0B1SqSMAItCA+hCzaZgnHUna+Y4cj75DHTzFeJc6IjziHMNYUXZwYQhqcbnsMrfAJU4Vj9QphHr7uo7h0kxqVh+mUWegvTi71KmqxoAfw/wB3Qwl8BfjkPg5CDDp2zKPhcRTs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610015445946673.8871697688121;
 Thu, 7 Jan 2021 02:30:45 -0800 (PST)
In-Reply-To: <20210107101919.80-1-luoyonggang@gmail.com>
Subject: Re: [PATCH v4 0/5] Misc meson fixes along test-vmstate fixes
Message-ID: <161001544401.500.944440260972082500@5f806b4aa85b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: luoyonggang@gmail.com
Date: Thu, 7 Jan 2021 02:30:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
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
Cc: pbonzini@redhat.com, sunilmut@microsoft.com, emaste@freebsd.org,
 qemu-devel@nongnu.org, luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEwNzEwMTkxOS44MC0x
LWx1b3lvbmdnYW5nQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMTA3MTAxOTE5LjgwLTEt
bHVveW9uZ2dhbmdAZ21haWwuY29tClN1YmplY3Q6IFtQQVRDSCB2NCAwLzVdIE1pc2MgbWVzb24g
Zml4ZXMgYWxvbmcgdGVzdC12bXN0YXRlIGZpeGVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFn
IHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMTA3MDcyOTMzLjM4Mjg0NTAtMS1mNGJ1Z0BhbXNh
dC5vcmcgLT4gcGF0Y2hldy8yMDIxMDEwNzA3MjkzMy4zODI4NDUwLTEtZjRidWdAYW1zYXQub3Jn
CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAxMDcxMDE5MTkuODAtMS1sdW95b25n
Z2FuZ0BnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDIxMDEwNzEwMTkxOS44MC0xLWx1b3lvbmdnYW5n
QGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmQ5M2Q4M2Mgd2hweDog
bW92ZSB3aHB4X2xhcGljX3N0YXRlIGZyb20gaGVhZGVyIHRvIGMgZmlsZQo1MzhmMzA3IHdocHg6
IEZpeGVzIGluY2x1ZGUgb2Ygd2hwLWRpc3BhdGNoLmggaW4gd2hweC5oCjA2NzUwMWQgbWFpbnRh
aW5lcnM6IEFkZCBtZSBhcyBXaW5kb3dzIEhvc3RlZCBDb250aW51b3VzIEludGVncmF0aW9uIG1h
aW50YWluZXIKZjQxNDA5ZCBjaXJydXMvbXN5czI6IENhY2hlIG1zeXMyIG1pbmd3IGluIGEgYmV0
dGVyIHdheS4KOTlhY2IzZCBjaXJydXMvbXN5czI6IEV4aXQgcG93ZXJzaGVsbCB3aXRoICRMYXN0
RXhpdENvZGUKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvNSBDaGVja2luZyBjb21taXQgOTlhY2Iz
ZDdjMzMzIChjaXJydXMvbXN5czI6IEV4aXQgcG93ZXJzaGVsbCB3aXRoICRMYXN0RXhpdENvZGUp
CjIvNSBDaGVja2luZyBjb21taXQgZjQxNDA5ZDZkNWYxIChjaXJydXMvbXN5czI6IENhY2hlIG1z
eXMyIG1pbmd3IGluIGEgYmV0dGVyIHdheS4pCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMx
NDI6IEZJTEU6IC5jaXJydXMueW1sOjE0MToKKyAgICAgICAgZGVsIC1Gb3JjZSAtUmVjdXJzZSAt
RXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZSBjOlx0b29sc1xtc3lzNjQgJAoKdG90YWw6IDEg
ZXJyb3JzLCAwIHdhcm5pbmdzLCAxNDAgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi81IGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCgozLzUgQ2hlY2tpbmcgY29tbWl0IDA2NzUwMWQ3NTg2ZCAobWFp
bnRhaW5lcnM6IEFkZCBtZSBhcyBXaW5kb3dzIEhvc3RlZCBDb250aW51b3VzIEludGVncmF0aW9u
IG1haW50YWluZXIpCjQvNSBDaGVja2luZyBjb21taXQgNTM4ZjMwNzJmYzE0ICh3aHB4OiBGaXhl
cyBpbmNsdWRlIG9mIHdocC1kaXNwYXRjaC5oIGluIHdocHguaCkKNS81IENoZWNraW5nIGNvbW1p
dCBkOTNkODNjOWY4ZGIgKHdocHg6IG1vdmUgd2hweF9sYXBpY19zdGF0ZSBmcm9tIGhlYWRlciB0
byBjIGZpbGUpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNv
ZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzIwMjEwMTA3MTAxOTE5LjgwLTEtbHVveW9uZ2dhbmdAZ21haWwuY29tL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

