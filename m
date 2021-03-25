Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC253496A7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:20:50 +0100 (CET)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSj3-0005Ha-E3
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lPSSt-0002Sw-SP
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:04:09 -0400
Resent-Date: Thu, 25 Mar 2021 12:04:07 -0400
Resent-Message-Id: <E1lPSSt-0002Sw-SP@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lPSSp-00053R-EH
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:04:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616688230; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EezpTuSq8dfPcz60AsSEcYtMRdW2N1Qn6OhN7k5q/Ivnd251ZiAr/sZFj686Em8Buh+IfhqA3Q3hBoeqnBgDiFbshTcOeA6Ig4dLeZGHGa6ufjkNBNWFf64FfpWYYTrjKVZ00nKXe1zHXrNggFBq5UwiOdx+BKHqA9lAczcHBx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616688230;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=o14k+DeebvGCCavQrz7olHrZksQu4MJyoRCLtYYvjy4=; 
 b=hpx6trk1yRKr5c/Gu/e069YeKzVefS9jEKu573rowBv6NBdBjjt29xcdd3ADaEvcvyOzhzSmQYwm7Cc9+JySU4lLFcK0JbLVav19L5nAXu9VG3lbnnq38nGulbX1mmln6JXqValeQBekBZ7BJhY5G6fncg1rfyoXTl773OUk2nI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616688226518953.7300216424114;
 Thu, 25 Mar 2021 09:03:46 -0700 (PDT)
In-Reply-To: <20210325153852.572927-1-vgoyal@redhat.com>
Subject: Re: [PATCH v5 0/5] virtiofsd: Add support to enable/disable posix acls
Message-ID: <161668822522.4923.8894988516068860139@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vgoyal@redhat.com
Date: Thu, 25 Mar 2021 09:03:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, lhenriques@suse.de, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMyNTE1Mzg1Mi41NzI5
MjctMS12Z295YWxAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzI1MTUzODUyLjU3Mjky
Ny0xLXZnb3lhbEByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCB2NSAwLzVdIHZpcnRpb2ZzZDog
QWRkIHN1cHBvcnQgdG8gZW5hYmxlL2Rpc2FibGUgcG9zaXggYWNscwoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwg
ZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRo
bSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09
IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3
ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3Fl
bXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMyNTE1Mzg1Mi41NzI5MjctMS12
Z295YWxAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMzI1MTUzODUyLjU3MjkyNy0xLXZnb3lh
bEByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZWE2MDZkOSB2aXJ0
aW9mc2Q6IFN3aXRjaCBjcmVkcywgZHJvcCBGU0VUSUQgZm9yIHN5c3RlbS5wb3NpeF9hY2xfYWNj
ZXNzIHhhdHRyCmJjOWE4NzcgdmlydGlvZnNkOiBBZGQgc3VwcG9ydCBmb3Igc2V0eGF0dHJfdjIK
ZDI4NDEzZSB2aXJ0aW9mc2Q6IEFkZCBhbiBvcHRpb24gdG8gZW5hYmxlL2Rpc2FibGUgcG9zaXgg
YWNscwoxZWViMTFmIHZpcnRpb2ZzZDogQWRkIGNhcGFiaWxpdHkgdG8gY2hhbmdlL3Jlc3RvcmUg
dW1hc2sKMGIwMmEyNSB2aXJ0aW9mc2Q6IEFkZCB1bWFzayB0byBzZWNjb20gYWxsb3cgbGlzdAoK
PT09IE9VVFBVVCBCRUdJTiA9PT0KMS81IENoZWNraW5nIGNvbW1pdCAwYjAyYTI1MDcwNDggKHZp
cnRpb2ZzZDogQWRkIHVtYXNrIHRvIHNlY2NvbSBhbGxvdyBsaXN0KQoyLzUgQ2hlY2tpbmcgY29t
bWl0IDFlZWIxMWYwMGZkYiAodmlydGlvZnNkOiBBZGQgY2FwYWJpbGl0eSB0byBjaGFuZ2UvcmVz
dG9yZSB1bWFzaykKMy81IENoZWNraW5nIGNvbW1pdCBkMjg0MTNlNjZlNTggKHZpcnRpb2ZzZDog
QWRkIGFuIG9wdGlvbiB0byBlbmFibGUvZGlzYWJsZSBwb3NpeCBhY2xzKQpXQVJOSU5HOiBsaW5l
IG92ZXIgODAgY2hhcmFjdGVycwojMjM5OiBGSUxFOiB0b29scy92aXJ0aW9mc2QvcGFzc3Rocm91
Z2hfbGwuYzozOTU3OgorICAgICAgICBmdXNlX2xvZyhGVVNFX0xPR19FUlIsICJDYW4ndCBlbmFi
bGUgcG9zaXggQUNMcy4geGF0dHJzIGFyZSBkaXNhYmxlZC5cbiIpOwoKdG90YWw6IDAgZXJyb3Jz
LCAxIHdhcm5pbmdzLCAxODUgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy81IGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCjQvNSBDaGVja2luZyBjb21taXQgYmM5YTg3NzZjOTQ3ICh2aXJ0aW9mc2Q6
IEFkZCBzdXBwb3J0IGZvciBzZXR4YXR0cl92MikKNS81IENoZWNraW5nIGNvbW1pdCBlYTYwNmQ5
ZGU4ZjAgKHZpcnRpb2ZzZDogU3dpdGNoIGNyZWRzLCBkcm9wIEZTRVRJRCBmb3Igc3lzdGVtLnBv
c2l4X2FjbF9hY2Nlc3MgeGF0dHIpCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3Ig
YWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzEzNzogRklMRTogdG9vbHMvdmlydGlvZnNkL3Bh
c3N0aHJvdWdoX2xsLmM6MzEzNToKKyAgICAgICAgICAgIGlmIChnYWluX2VmZmVjdGl2ZV9jYXAo
IkZTRVRJRCIpKQpbLi4uXQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA4NiBsaW5lcyBj
aGVja2VkCgpQYXRjaCA1LzUgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMzI1MTUzODUyLjU3
MjkyNy0xLXZnb3lhbEByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdl
LgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9w
YXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxA
cmVkaGF0LmNvbQ==

