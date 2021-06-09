Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ABC3A16C7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:13:58 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqyxx-0001AX-T9
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lqyxE-0000Ug-Qw
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:13:12 -0400
Resent-Date: Wed, 09 Jun 2021 10:13:12 -0400
Resent-Message-Id: <E1lqyxE-0000Ug-Qw@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lqyxC-0008Ng-73
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:13:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623247971; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YvV7UcemCwt//e6jjW5Qzn0X7D6/UJu4ou38z8ciUajjPPjKeCjF+YST+rcBUAO7jK1xf+bLyfNeqFE7Ur5IS4SEz6rKeJA5cT0XjQ7H80AjeVe2kfbehHl+rSMtfZRAQ7K3zSeqqQkdDWJVR5Acfj/paa8p2sVrqmlmI/TSn+U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623247971;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=FyJj6mlzaHUk5KslbydafjEd6ht5a1AiLgQPUb/UcGg=; 
 b=kbeCd04QqqihXw4V1N1oNMQ8WnzXu4IjLhfLEgX+07zPwSIslbvDgwcfR5JGCTzRGWyOstichb/p2q7Fmug3h2eI/8wmgyI/UvPH8UUHUqHaAIgW28qMN6UfeNW3UAj7qJEJC7OlUUwkZg8yBjQv6hM/MtCcqGFe5u6mMKp9B3M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 162324796651827.950081271171598;
 Wed, 9 Jun 2021 07:12:46 -0700 (PDT)
In-Reply-To: <cover.1623027729.git.huangy81@chinatelecom.cn>
Subject: Re: [PATCH v3 0/7] support dirtyrate at the granualrity of vcpu  
Message-ID: <162324796495.6796.6388629473224433111@d310de11c650>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: huangy81@chinatelecom.cn
Date: Wed, 9 Jun 2021 07:12:46 -0700 (PDT)
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
Cc: ehabkost@redhat.com, quintela@redhat.com, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, peterx@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjIzMDI3NzI5Lmdp
dC5odWFuZ3k4MUBjaGluYXRlbGVjb20uY24vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiBjb3Zlci4xNjIzMDI3NzI5
LmdpdC5odWFuZ3k4MUBjaGluYXRlbGVjb20uY24KU3ViamVjdDogW1BBVENIIHYzIDAvN10gc3Vw
cG9ydCBkaXJ0eXJhdGUgYXQgdGhlIGdyYW51YWxyaXR5IG9mIHZjcHUgIAoKPT09IFRFU1QgU0NS
SVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwg
fHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29y
aXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4K
PT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFk
ZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkYjI1NTM3
IG1pZ3JhdGlvbi9kaXJ0eXJhdGU6IGltcGxlbWVudCBkaXJ0eS1yaW5nIGRpcnR5cmF0ZSBjYWxj
dWxhdGlvbgo3MjBmOTIzIG1lbW9yeTogbWFrZSBnbG9iYWxfZGlydHlfbG9nIGEgYml0bWFzawph
MzMyM2ZkIG1pZ3JhdGlvbi9kaXJ0eXJhdGU6IGFkanVzdCBzdHJ1Y3QgRGlydHlSYXRlU3RhdAow
NGIxNmJkIG1pZ3JhdGlvbi9kaXJ0eXJhdGU6IGFkZCBwZXItdmNwdSBvcHRpb24gZm9yIGNhbGMt
ZGlydHktcmF0ZQowZWM2OTA5IEtWTTogaW50cm9kdWNlIGRpcnR5X3BhZ2VzIGFuZCBrdm1fZGly
dHlfcmluZ19lbmFibGVkCjg4Mjg3NTcgaG1wOiBBZGQgImNhbGNfZGlydHlfcmF0ZSIgYW5kICJp
bmZvIGRpcnR5X3JhdGUiIGNtZHMKZGQ0MzQyYyBtaWdyYXRpb24vZGlydHlyYXRlOiBtYWtlIHNh
bXBsZSBwYWdlIGNvdW50IGNvbmZpZ3VyYWJsZQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS83IENo
ZWNraW5nIGNvbW1pdCBkZDQzNDJjM2VjMmYgKG1pZ3JhdGlvbi9kaXJ0eXJhdGU6IG1ha2Ugc2Ft
cGxlIHBhZ2UgY291bnQgY29uZmlndXJhYmxlKQoyLzcgQ2hlY2tpbmcgY29tbWl0IDg4Mjg3NTdl
MGIwZSAoaG1wOiBBZGQgImNhbGNfZGlydHlfcmF0ZSIgYW5kICJpbmZvIGRpcnR5X3JhdGUiIGNt
ZHMpCjMvNyBDaGVja2luZyBjb21taXQgMGVjNjkwOWI1NWY2IChLVk06IGludHJvZHVjZSBkaXJ0
eV9wYWdlcyBhbmQga3ZtX2RpcnR5X3JpbmdfZW5hYmxlZCkKNC83IENoZWNraW5nIGNvbW1pdCAw
NGIxNmJkOWIyMzYgKG1pZ3JhdGlvbi9kaXJ0eXJhdGU6IGFkZCBwZXItdmNwdSBvcHRpb24gZm9y
IGNhbGMtZGlydHktcmF0ZSkKRVJST1I6IEVycm9yIG1lc3NhZ2VzIHNob3VsZCBub3QgY29udGFp
biBuZXdsaW5lcwojNDI6IEZJTEU6IG1pZ3JhdGlvbi9kaXJ0eXJhdGUuYzo0Mjc6CisgICAgICAg
ICAgICAgICAgICAgICAgICAgIm9ubHkgb25lIG9mIHRoZW4gY2FuIGJlIHNwZWNpZmllZCFcbiIp
OwoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxNTggbGluZXMgY2hlY2tlZAoKUGF0Y2gg
NC83IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBl
cnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwg
c2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo1LzcgQ2hlY2tpbmcgY29tbWl0IGEzMzIz
ZmRkZWNkOSAobWlncmF0aW9uL2RpcnR5cmF0ZTogYWRqdXN0IHN0cnVjdCBEaXJ0eVJhdGVTdGF0
KQo2LzcgQ2hlY2tpbmcgY29tbWl0IDcyMGY5MjNmZWMwZCAobWVtb3J5OiBtYWtlIGdsb2JhbF9k
aXJ0eV9sb2cgYSBiaXRtYXNrKQpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICc8
PCcgKGN0eDpWeFYpCiMzNjogRklMRTogaW5jbHVkZS9leGVjL21lbW9yeS5oOjU4OgorI2RlZmlu
ZSBHTE9CQUxfRElSVFlfTUlHUkFUSU9OICAoMVU8PDApCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4KCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJzw8JyAo
Y3R4OlZ4VikKIzM3OiBGSUxFOiBpbmNsdWRlL2V4ZWMvbWVtb3J5Lmg6NTk6CisjZGVmaW5lIEdM
T0JBTF9ESVJUWV9ESVJUWV9SQVRFICgxVTw8MSkKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCAxNDUgbGluZXMgY2hlY2tl
ZAoKUGF0Y2ggNi83IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo3LzcgQ2hlY2tpbmcgY29t
bWl0IGRiMjU1Mzc5ZTc0NiAobWlncmF0aW9uL2RpcnR5cmF0ZTogaW1wbGVtZW50IGRpcnR5LXJp
bmcgZGlydHlyYXRlIGNhbGN1bGF0aW9uKQpFUlJPUjogZG8gbm90IGluaXRpYWxpc2UgZ2xvYmFs
cyB0byAwIG9yIE5VTEwKIzc1OiBGSUxFOiBtaWdyYXRpb24vZGlydHlyYXRlLmM6NDc6Citib29s
IHJlZ2lzdGVyX3Bvd2VyZG93bl9jYWxsYmFjayA9IGZhbHNlOwoKV0FSTklORzogQmxvY2sgY29t
bWVudHMgdXNlIGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRlIGxpbmUKIzIwODogRklMRTogbWln
cmF0aW9uL2RpcnR5cmF0ZS5jOjQzNzoKKyAgICAvKiBtaWdyYXRpb24gaXMgaW4gcHJvY2Vzcywg
ZG8gbm90IHN0b3AgZGlydHkgbG9nZ2luZywKCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBh
IHRyYWlsaW5nICovIG9uIGEgc2VwYXJhdGUgbGluZQojMjA5OiBGSUxFOiBtaWdyYXRpb24vZGly
dHlyYXRlLmM6NDM4OgorICAgICAqIGp1c3QgY2xlYXIgdGhlIEdMT0JBTF9ESVJUWV9ESVJUWV9S
QVRFIGJpdCAqLwoKdG90YWw6IDEgZXJyb3JzLCAyIHdhcm5pbmdzLCAzMjIgbGluZXMgY2hlY2tl
ZAoKUGF0Y2ggNy83IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9
PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy9jb3Zlci4xNjIzMDI3NzI5LmdpdC5o
dWFuZ3k4MUBjaGluYXRlbGVjb20uY24vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2Uu
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3Bh
dGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBy
ZWRoYXQuY29t

