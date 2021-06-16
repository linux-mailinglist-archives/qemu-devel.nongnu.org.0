Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53FC3A9F28
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:34:05 +0200 (CEST)
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXYK-0006jG-Nh
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltXVX-0000Xp-HP
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:31:13 -0400
Resent-Date: Wed, 16 Jun 2021 11:31:11 -0400
Resent-Message-Id: <E1ltXVX-0000Xp-HP@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltXVP-00032N-Sm
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:31:09 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623857451; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hNcl9eyCNLCZG4/1PCor9ApwIUFe+p1VqOhwoJMDK6GjyBAoWPp8hoMwcUKrw2ikNPUBS/BDsBEkdQTliInlpT+DYAuRmd5uzFA/B8BC7yLoBHjdCt8uSuKTOFThaepdliwkLrivCMuLVz4q9o9a/Ip2t07/2iQ1qSfVdRYKibU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623857451;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=U8ql0W1KwkLPzVOqaUWNRA0xkYwXfsbpr7kKegGASoQ=; 
 b=XPc6W4cav7K/VhD57hK4MbVilujZNhLVYihu2/Ni+jbc0ev1q9gJQZ59anlM6O9+DKFou8Ys1z2g6sHwOumE7XwkWAoM1aX3GjRGCPALqdABELXjPdS3zqk2WLZ0foG9a8wfr/R6R67FkdVAY5JZ9SzulDQvdE2cMF3jlEFMu/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623857449892670.2357330635022;
 Wed, 16 Jun 2021 08:30:49 -0700 (PDT)
In-Reply-To: <20210616152455.1270264-1-imammedo@redhat.com>
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
Message-ID: <162385744868.32204.5844305171880767120@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: imammedo@redhat.com
Date: Wed, 16 Jun 2021 08:30:49 -0700 (PDT)
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
Cc: lvivier@redhat.com, thuth@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxNjE1MjQ1NS4xMjcw
MjY0LTEtaW1hbW1lZG9AcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNjE2MTUyNDU1LjEy
NzAyNjQtMS1pbWFtbWVkb0ByZWRoYXQuY29tClN1YmplY3Q6IFtSRkMgMC8zXSBxdGVzdDogcGlj
ayB0ZXN0cyB0aGF0IHJlcXVpcmUgS1ZNIGF0IHJ1bnRpbWUKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAt
IFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA2MTYwMTEyMDkuMTQ0NjA0NS0xLXJpY2hh
cmQuaGVuZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDYxNjAxMTIwOS4xNDQ2MDQ1
LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAgICBwYXRj
aGV3LzIwMjEwNjE2MTUyNDU1LjEyNzAyNjQtMS1pbWFtbWVkb0ByZWRoYXQuY29tIC0+IHBhdGNo
ZXcvMjAyMTA2MTYxNTI0NTUuMTI3MDI2NC0xLWltYW1tZWRvQHJlZGhhdC5jb20KU3dpdGNoZWQg
dG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo5OWI2MjJmIHRlc3RzOiBhY3BpOiB1cGRhdGUgZXhwZWN0
ZWQgdGFibGVzIGJsb2JzCjhhYWQxMWQgdGVzdHM6IGFjcGk6IHEzNTogdGVzdCBmb3IgeDJBUElD
IGVudHJpZXMgaW4gU1JBVAo1YmFiNDVlIHRlc3RzOiBxdGVzdDogYWRkIHF0ZXN0X2hhc19rdm0o
KSB0byBjaGVjayBpZiB0ZXN0ZWQgYmluYXJ5IHN1cHBvcnRzIEtWTQoKPT09IE9VVFBVVCBCRUdJ
TiA9PT0KMS8zIENoZWNraW5nIGNvbW1pdCA1YmFiNDVlZWIyMGEgKHRlc3RzOiBxdGVzdDogYWRk
IHF0ZXN0X2hhc19rdm0oKSB0byBjaGVjayBpZiB0ZXN0ZWQgYmluYXJ5IHN1cHBvcnRzIEtWTSkK
Mi8zIENoZWNraW5nIGNvbW1pdCA4YWFkMTFkNzYzNGQgKHRlc3RzOiBhY3BpOiBxMzU6IHRlc3Qg
Zm9yIHgyQVBJQyBlbnRyaWVzIGluIFNSQVQpCkVSUk9SOiBEbyBub3QgYWRkIGV4cGVjdGVkIGZp
bGVzIHRvZ2V0aGVyIHdpdGggdGVzdHMsIGZvbGxvdyBpbnN0cnVjdGlvbnMgaW4gdGVzdHMvcXRl
c3QvYmlvcy10YWJsZXMtdGVzdC5jOiBib3RoIHRlc3RzL2RhdGEvYWNwaS9xMzUvRkFDUC5udW1h
bWVtIGFuZCB0ZXN0cy9xdGVzdC9iaW9zLXRhYmxlcy10ZXN0LmMgZm91bmQKCkVSUk9SOiBEbyBu
b3QgYWRkIGV4cGVjdGVkIGZpbGVzIHRvZ2V0aGVyIHdpdGggdGVzdHMsIGZvbGxvdyBpbnN0cnVj
dGlvbnMgaW4gdGVzdHMvcXRlc3QvYmlvcy10YWJsZXMtdGVzdC5jOiBib3RoIHRlc3RzL2RhdGEv
YWNwaS9xMzUvRkFDUC5udW1hbWVtIGFuZCB0ZXN0cy9xdGVzdC9iaW9zLXRhYmxlcy10ZXN0LmMg
Zm91bmQKCnRvdGFsOiAyIGVycm9ycywgMCB3YXJuaW5ncywgMzkgbGluZXMgY2hlY2tlZAoKUGF0
Y2ggMi8zIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVz
ZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgozLzMgQ2hlY2tpbmcgY29tbWl0IDk5
YjYyMmZhMTEwZiAodGVzdHM6IGFjcGk6IHVwZGF0ZSBleHBlY3RlZCB0YWJsZXMgYmxvYnMpCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNjE2
MTUyNDU1LjEyNzAyNjQtMS1pbWFtbWVkb0ByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/
dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

