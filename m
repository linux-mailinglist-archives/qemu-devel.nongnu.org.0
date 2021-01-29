Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D39A308BA2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:38:25 +0100 (CET)
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Xiy-0004EY-AT
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l5Xbt-0006EW-K9; Fri, 29 Jan 2021 12:31:05 -0500
Resent-Date: Fri, 29 Jan 2021 12:31:05 -0500
Resent-Message-Id: <E1l5Xbt-0006EW-K9@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l5Xbq-0006Up-RW; Fri, 29 Jan 2021 12:31:05 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611941449; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PghTGTGJ9DNO7JDViGcoANCCr58XoOxzWFYBrZOLXjjYbosB/gUoHqdDh9W0FWh9hpff9wL3FTwURu0v7QgRuUocW0c4fFQ/xUPLnmMOwjlEwwufKUvnIOzZcc6+Ht+thaFk6ai4ZY4uqxV4JIa8/T9MstfuM1OO3yz4FqhMP1o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1611941449;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=CMY52WhsiPZIxgt+9+8viqotZK8//4O4LvoJ+v8443g=; 
 b=lHvUvp+vo26bvsF06pxN6N2nEhOLW/56XNDy3YsQRXPIPtmepLnbd1eN1GgofaSjSlXAPFy9M3OAQdOLXmCqQyMiKW94skBnC0qGPljuYw6nAMglpWcOKD2B0Hu4jwiQs+bcHC49spCUxs0jEp+1ueOVzRO2PCsR+aU3xeg/2AQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1611941448432230.59390804003237;
 Fri, 29 Jan 2021 09:30:48 -0800 (PST)
In-Reply-To: <20210129165030.640169-1-vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
Message-ID: <161194144692.29163.3534650626852021194@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vsementsov@virtuozzo.com
Date: Fri, 29 Jan 2021 09:30:48 -0800 (PST)
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEyOTE2NTAzMC42NDAx
NjktMS12c2VtZW50c292QHZpcnR1b3p6by5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMg
dG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IK
bW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDEyOTE2NTAz
MC42NDAxNjktMS12c2VtZW50c292QHZpcnR1b3p6by5jb20KU3ViamVjdDogW1BBVENIIDAvN10g
cWNvdzI6IGNvbXByZXNzZWQgd3JpdGUgY2FjaGUKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAgIDUxMDFk
MDAuLjM3MDFjMDcgIG1hc3RlciAgICAgLT4gbWFzdGVyCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBh
dGNoZXcvMjAyMTAxMjkxMTAwMTIuODY2MC0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZyAtPiBw
YXRjaGV3LzIwMjEwMTI5MTEwMDEyLjg2NjAtMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcKICog
W25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDEyOTE2NTAzMC42NDAxNjktMS12c2VtZW50
c292QHZpcnR1b3p6by5jb20gLT4gcGF0Y2hldy8yMDIxMDEyOTE2NTAzMC42NDAxNjktMS12c2Vt
ZW50c292QHZpcnR1b3p6by5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkNzc4
M2E0IHNpbXBsZWJlbmNoL2JlbmNoLWJhY2t1cDogYWRkIHRhcmdldC1jYWNoZSBhcmd1bWVudApk
ZGY0NDQyIHNpbXBsZWJlbmNoL2JlbmNoLWJhY2t1cDogYWRkIC0tY29tcHJlc3NlZCBvcHRpb24K
NDdlZTYyNyBzaW1wbGViZW5jaDogYmVuY2hfb25lKCk6IHN1cHBvcnQgY291bnQ9MQoyYjgwZTMz
IHNpbXBsZWJlbmNoOiBiZW5jaF9vbmUoKTogYWRkIHNsb3dfbGltaXQgYXJndW1lbnQKYWNmMmZi
NiBibG9jay9xY293MjogdXNlIGNvbXByZXNzZWQgd3JpdGUgY2FjaGUKZDk2ZTM1ZiBibG9jay9x
Y293MjogaW50cm9kdWNlIGNhY2hlIGZvciBjb21wcmVzc2VkIHdyaXRlcwowZDAwOWUxIHFlbXUv
cXVldWU6IGFkZCBzb21lIHVzZWZ1bCBRTElTVF8gYW5kIFFUQUlMUV8gbWFjcm9zCgo9PT0gT1VU
UFVUIEJFR0lOID09PQoxLzcgQ2hlY2tpbmcgY29tbWl0IDBkMDA5ZTE2MjgwZCAocWVtdS9xdWV1
ZTogYWRkIHNvbWUgdXNlZnVsIFFMSVNUXyBhbmQgUVRBSUxRXyBtYWNyb3MpCkVSUk9SOiBzcGFj
ZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6V3hWKQojMjU6IEZJTEU6IGluY2x1ZGUv
cWVtdS9xdWV1ZS5oOjE3NzoKKyAgICB0eXBlb2YoKlFMSVNUX0ZJUlNUKGhlYWQpKSAqcWZmc192
YXIsICpxZmZzX25leHRfdmFyOyAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCgpXQVJOSU5HOiBCbG9jayBjb21tZW50cyB1c2UgYSBsZWFkaW5nIC8qIG9u
IGEgc2VwYXJhdGUgbGluZQojMjk6IEZJTEU6IGluY2x1ZGUvcWVtdS9xdWV1ZS5oOjE4MToKK30g
d2hpbGUgKC8qQ09OU1RDT05EKi8wKQoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhh
dCAnKicgKGN0eDpXeFYpCiMzOTogRklMRTogaW5jbHVkZS9xZW11L3F1ZXVlLmg6NTAxOgorICAg
IHR5cGVvZigqUVRBSUxRX0ZJUlNUKGhlYWQpKSAqcWZmc192YXIsICpxZmZzX25leHRfdmFyOyAg
ICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpXQVJOSU5H
OiBCbG9jayBjb21tZW50cyB1c2UgYSBsZWFkaW5nIC8qIG9uIGEgc2VwYXJhdGUgbGluZQojNDM6
IEZJTEU6IGluY2x1ZGUvcWVtdS9xdWV1ZS5oOjUwNToKK30gd2hpbGUgKC8qQ09OU1RDT05EKi8w
KQoKdG90YWw6IDIgZXJyb3JzLCAyIHdhcm5pbmdzLCAyNiBsaW5lcyBjaGVja2VkCgpQYXRjaCAx
LzcgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjIvNyBDaGVja2luZyBjb21taXQgZDk2ZTM1
ZjE1NDRmIChibG9jay9xY293MjogaW50cm9kdWNlIGNhY2hlIGZvciBjb21wcmVzc2VkIHdyaXRl
cykKV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJ
TkVSUyBuZWVkIHVwZGF0aW5nPwojMzQ6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKdG90YWw6IDAg
ZXJyb3JzLCAxIHdhcm5pbmdzLCA4MTYgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi83IGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCjMvNyBDaGVja2luZyBjb21taXQgYWNmMmZiNjBkNWMyIChibG9j
ay9xY293MjogdXNlIGNvbXByZXNzZWQgd3JpdGUgY2FjaGUpCjQvNyBDaGVja2luZyBjb21taXQg
MmI4MGUzMzRiMzAwIChzaW1wbGViZW5jaDogYmVuY2hfb25lKCk6IGFkZCBzbG93X2xpbWl0IGFy
Z3VtZW50KQo1LzcgQ2hlY2tpbmcgY29tbWl0IDQ3ZWU2Mjc2ODMxNyAoc2ltcGxlYmVuY2g6IGJl
bmNoX29uZSgpOiBzdXBwb3J0IGNvdW50PTEpCjYvNyBDaGVja2luZyBjb21taXQgZGRmNDQ0MjBh
OWU4IChzaW1wbGViZW5jaC9iZW5jaC1iYWNrdXA6IGFkZCAtLWNvbXByZXNzZWQgb3B0aW9uKQo3
LzcgQ2hlY2tpbmcgY29tbWl0IGQ3NzgzYTQ1ZWU3YiAoc2ltcGxlYmVuY2gvYmVuY2gtYmFja3Vw
OiBhZGQgdGFyZ2V0LWNhY2hlIGFyZ3VtZW50KQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDEyOTE2NTAzMC42NDAxNjktMS12c2VtZW50c292
QHZpcnR1b3p6by5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFp
bCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

