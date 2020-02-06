Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D8154DA7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:02:33 +0100 (CET)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izoIC-0008KW-94
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1izoGh-0006uC-BV
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1izoGf-0003B3-Uo
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:00:58 -0500
Resent-Date: Thu, 06 Feb 2020 16:00:58 -0500
Resent-Message-Id: <E1izoGf-0003B3-Uo@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1izoGf-0003AI-MV
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:00:57 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1581022840441541.6161552076028;
 Thu, 6 Feb 2020 13:00:40 -0800 (PST)
In-Reply-To: <f6c36298-5e63-f4c6-654c-3b16010ae6da@siemens.com>
Subject: Re: [PATCH] apic: Report current_count via 'info lapic'
Message-ID: <158102283928.19404.10843696482844235037@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jan.kiszka@siemens.com
Date: Thu, 6 Feb 2020 13:00:40 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9mNmMzNjI5OC01ZTYzLWY0YzYt
NjU0Yy0zYjE2MDEwYWU2ZGFAc2llbWVucy5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMg
dG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IK
bW9yZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtQQVRDSF0gYXBpYzogUmVwb3J0IGN1cnJlbnRf
Y291bnQgdmlhICdpbmZvIGxhcGljJwpNZXNzYWdlLWlkOiBmNmMzNjI5OC01ZTYzLWY0YzYtNjU0
Yy0zYjE2MDEwYWU2ZGFAc2llbWVucy5jb20KVHlwZTogc2VyaWVzCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBl
eGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGht
IGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9q
ZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy9mNmMzNjI5OC01ZTYzLWY0YzYt
NjU0Yy0zYjE2MDEwYWU2ZGFAc2llbWVucy5jb20gLT4gcGF0Y2hldy9mNmMzNjI5OC01ZTYzLWY0
YzYtNjU0Yy0zYjE2MDEwYWU2ZGFAc2llbWVucy5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNo
ICd0ZXN0JwoxZjE5ZDVjIGFwaWM6IFJlcG9ydCBjdXJyZW50X2NvdW50IHZpYSAnaW5mbyBsYXBp
YycKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBm
b3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzYyOiBGSUxFOiBody9pbnRjL2FwaWNfY29t
bW9uLmM6MjAyOgorICAgICAgICBpZiAoZCA+PSBzLT5pbml0aWFsX2NvdW50KQpbLi4uXQorICAg
ICAgICBlbHNlClsuLi5dCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDY4IGxpbmVzIGNo
ZWNrZWQKCkNvbW1pdCAxZjE5ZDVjNTFjZTMgKGFwaWM6IFJlcG9ydCBjdXJyZW50X2NvdW50IHZp
YSAnaW5mbyBsYXBpYycpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5E
ID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMg
YXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzL2Y2YzM2Mjk4LTVlNjMtZjRjNi02
NTRjLTNiMTYwMTBhZTZkYUBzaWVtZW5zLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=

