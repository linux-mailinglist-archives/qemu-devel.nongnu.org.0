Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875CB3AB4D7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:34:04 +0200 (CEST)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lts9j-0003RB-GT
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lts49-0002pz-4R
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:28:17 -0400
Resent-Date: Thu, 17 Jun 2021 09:28:17 -0400
Resent-Message-Id: <E1lts49-0002pz-4R@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lts46-0000EF-Mw
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:28:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623936468; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DBlJuPZZINjqE/PrddHo5RRN9wJ1lOLAGF2ieJ5Ms4MmrPRXN4txjSjY3Rou/g4IgiDZS9qbQHVYOsVMlCBfst4PrSzvqmrZoZlPS56C+mnBQuOvjD1rZmRVLAfppnofZdX/feDwQ5wVqz+GuFb+6Q3wfydtSGTNZ0LVCrmFk+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623936468;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=SgpNFcXjUtWc4QCXw8SaXBxCNVcyW7+Jt8hWgsAuOvk=; 
 b=LE+CKvx/xogO1YdYAtCa4AqLDKwAEVCwLlXxhhaRu2wNAy1YyvzDOro329aUwt2oIy2jwW9L7/LWTj7LjnXy6sQmfaCUTJQibl90AyAOM1+q0nUXtXV5o59lz1c4SO/E4q6CRcz1q+PlENUZbt12MKPoE9HiZ93UBqMzPyZ1KZ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623936466933706.7092838288912;
 Thu, 17 Jun 2021 06:27:46 -0700 (PDT)
In-Reply-To: <cover.1623934182.git.huangy81@chinatelecom.cn>
Subject: Re: [PATCH v5 0/6] support dirtyrate at the granualrity of vcpu 
Message-ID: <162393646568.30552.12017277222021052187@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: huangy81@chinatelecom.cn
Date: Thu, 17 Jun 2021 06:27:46 -0700 (PDT)
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
 zhengchuan@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjIzOTM0MTgyLmdp
dC5odWFuZ3k4MUBjaGluYXRlbGVjb20uY24vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiBjb3Zlci4xNjIzOTM0MTgy
LmdpdC5odWFuZ3k4MUBjaGluYXRlbGVjb20uY24KU3ViamVjdDogW1BBVENIIHY1IDAvNl0gc3Vw
cG9ydCBkaXJ0eXJhdGUgYXQgdGhlIGdyYW51YWxyaXR5IG9mIHZjcHUgCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8
fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3Jp
dGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9
PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRl
ZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3Qv
cWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3L2NvdmVyLjE2MjM5MzQxODIuZ2l0Lmh1
YW5neTgxQGNoaW5hdGVsZWNvbS5jbiAtPiBwYXRjaGV3L2NvdmVyLjE2MjM5MzQxODIuZ2l0Lmh1
YW5neTgxQGNoaW5hdGVsZWNvbS5jbgpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjdj
MzgwNmYgbWlncmF0aW9uL2RpcnR5cmF0ZTogaW1wbGVtZW50IGRpcnR5LXJpbmcgZGlydHlyYXRl
IGNhbGN1bGF0aW9uCmRlMTdkODYgbWlncmF0aW9uL2RpcnR5cmF0ZTogbW92ZSBpbml0IHN0ZXAg
b2YgY2FsY3VsYXRpb24gdG8gbWFpbiB0aHJlYWQKYmNkYWI5YyBtaWdyYXRpb24vZGlydHlyYXRl
OiBhZGp1c3Qgb3JkZXIgb2YgcmVnaXN0ZXJpbmcgdGhyZWFkCjdkZjk4N2MgbWlncmF0aW9uL2Rp
cnR5cmF0ZTogaW50cm9kdWNlIHN0cnVjdCBhbmQgYWRqdXN0IERpcnR5UmF0ZVN0YXQKNGNiMjA2
OSBtZW1vcnk6IG1ha2UgZ2xvYmFsX2RpcnR5X3RyYWNraW5nIGEgYml0bWFzawoxZWFmMDg1IG1l
bW9yeTogcmVuYW1lIGdsb2JhbF9kaXJ0eV9sb2cgdG8gZ2xvYmFsX2RpcnR5X3RyYWNraW5nCgo9
PT0gT1VUUFVUIEJFR0lOID09PQoxLzYgQ2hlY2tpbmcgY29tbWl0IDFlYWYwODVmOWEyNCAobWVt
b3J5OiByZW5hbWUgZ2xvYmFsX2RpcnR5X2xvZyB0byBnbG9iYWxfZGlydHlfdHJhY2tpbmcpCjIv
NiBDaGVja2luZyBjb21taXQgNGNiMjA2OTBlZTA1IChtZW1vcnk6IG1ha2UgZ2xvYmFsX2RpcnR5
X3RyYWNraW5nIGEgYml0bWFzaykKMy82IENoZWNraW5nIGNvbW1pdCA3ZGY5ODdjYzg4YzggKG1p
Z3JhdGlvbi9kaXJ0eXJhdGU6IGludHJvZHVjZSBzdHJ1Y3QgYW5kIGFkanVzdCBEaXJ0eVJhdGVT
dGF0KQo0LzYgQ2hlY2tpbmcgY29tbWl0IGJjZGFiOWM3MjBiMiAobWlncmF0aW9uL2RpcnR5cmF0
ZTogYWRqdXN0IG9yZGVyIG9mIHJlZ2lzdGVyaW5nIHRocmVhZCkKNS82IENoZWNraW5nIGNvbW1p
dCBkZTE3ZDg2MzBkMmYgKG1pZ3JhdGlvbi9kaXJ0eXJhdGU6IG1vdmUgaW5pdCBzdGVwIG9mIGNh
bGN1bGF0aW9uIHRvIG1haW4gdGhyZWFkKQo2LzYgQ2hlY2tpbmcgY29tbWl0IDdjMzgwNmY5MjY5
NyAobWlncmF0aW9uL2RpcnR5cmF0ZTogaW1wbGVtZW50IGRpcnR5LXJpbmcgZGlydHlyYXRlIGNh
bGN1bGF0aW9uKQpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojODg6IEZJTEU6IG1pZ3JhdGlv
bi9kaXJ0eXJhdGUuYzo5MzoKKyAkCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwoj
OTQ6IEZJTEU6IG1pZ3JhdGlvbi9kaXJ0eXJhdGUuYzo5OToKKyAgICAgICAgICAgIC8qIHNldCBz
YW1wbGVfcGFnZXMgd2l0aCAwIHRvIGluZGljYXRlIHBhZ2Ugc2FtcGxpbmcgaXNuJ3QgZW5hYmxl
ZCAqLwoKRVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzEwNjogRklMRTogbWlncmF0aW9uL2Rp
cnR5cmF0ZS5jOjExMToKKyAgICQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMzMjU6IEZJ
TEU6IG1pZ3JhdGlvbi9kaXJ0eXJhdGUuYzo2NTg6CisgICAgcWFwaV9mcmVlX0RpcnR5UmF0ZVZj
cHVMaXN0KGluZm8tPnZjcHVfZGlydHlfcmF0ZSk7ICQKCnRvdGFsOiAzIGVycm9ycywgMSB3YXJu
aW5ncywgMzUwIGxpbmVzIGNoZWNrZWQKClBhdGNoIDYvNiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBs
ZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMg
cmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlO
RVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
Y292ZXIuMTYyMzkzNDE4Mi5naXQuaHVhbmd5ODFAY2hpbmF0ZWxlY29tLmNuL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

