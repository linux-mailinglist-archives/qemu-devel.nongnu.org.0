Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4CA33A498
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 12:53:52 +0100 (CET)
Received: from localhost ([::1]:52342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLPJf-000129-Pe
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 07:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLPHo-0000Ti-UM
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 07:51:57 -0400
Resent-Date: Sun, 14 Mar 2021 07:51:56 -0400
Resent-Message-Id: <E1lLPHo-0000Ti-UM@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLPHl-0003oE-HM
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 07:51:55 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615722708; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dFBC82WmfbGN5Wqtb2cR7/lqFHGj7L6E4nI+vBtFgEc8yJc9qcRKLYNkC/ijIDqEvsI+shW9d/dHiOcPL2tjbIDUCXn5bbPBA+y/bIM4XSbiRZMT+iINfBas1z93LFhulGkpejXZIMRJrDozg9dI+vZj87nlcna4DKh+Wf4lzn8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615722708;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=nYgXAo1fUVIpc4DtrnrZICQ7lVu20GuqQI3MUUyV9kk=; 
 b=W1XHaXPSrZzprx9HlHPq2nBjTX3CpyhtUrtNHB3tsbCbjMrhf/iOUoYKT4Zm0Q1uT3vpz8Z09aYUDG4S7FCPW61fcVfzSyj4v/UB3cI1+6/LSpDbkYbkP5XyYu7b4Oj95YVkrxHwoITL1m0x3h1F4IDvMAI0g1CJx5ph/oJ27QA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 161572270545830.754674557270164;
 Sun, 14 Mar 2021 04:51:45 -0700 (PDT)
In-Reply-To: <161572198360.18482.17163668289458544283.malone@soybean.canonical.com>
Subject: Re: [Bug 1919036] Re: Assertion failure in fifo8_push_all() through
 am53c974
Message-ID: <161572270432.5470.11336318518807394046@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1919036@bugs.launchpad.net
Date: Sun, 14 Mar 2021 04:51:45 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE1NzIxOTgzNjAuMTg0ODIu
MTcxNjM2NjgyODk0NTg1NDQyODMubWFsb25lQHNveWJlYW4uY2Fub25pY2FsLmNvbS8KCgoKSGks
CgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBT
ZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3Nh
Z2UtaWQ6IDE2MTU3MjE5ODM2MC4xODQ4Mi4xNzE2MzY2ODI4OTQ1ODU0NDI4My5tYWxvbmVAc295
YmVhbi5jYW5vbmljYWwuY29tClN1YmplY3Q6IFtCdWcgMTkxOTAzNl0gUmU6IEFzc2VydGlvbiBm
YWlsdXJlIGluIGZpZm84X3B1c2hfYWxsKCkgdGhyb3VnaCBhbTUzYzk3NAoKPT09IFRFU1QgU0NS
SVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwg
fHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29y
aXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4K
PT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFk
ZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0
L3FlbXUKICAgM2Y4ZDE4OC4uOGU2YmM2YyAgbWFzdGVyICAgICAtPiBtYXN0ZXIKICogW25ldyB0
YWddICAgICAgICAgcGF0Y2hldy8xNjE1NzIxOTgzNjAuMTg0ODIuMTcxNjM2NjgyODk0NTg1NDQy
ODMubWFsb25lQHNveWJlYW4uY2Fub25pY2FsLmNvbSAtPiBwYXRjaGV3LzE2MTU3MjE5ODM2MC4x
ODQ4Mi4xNzE2MzY2ODI4OTQ1ODU0NDI4My5tYWxvbmVAc295YmVhbi5jYW5vbmljYWwuY29tClN3
aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYWRiZjM3MyBBc3NlcnRpb24gZmFpbHVyZSBp
biBmaWZvOF9wdXNoX2FsbCgpIHRocm91Z2ggYW01M2M5NzQKCj09PSBPVVRQVVQgQkVHSU4gPT09
CkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6IGxpbmUocykKCnRvdGFsOiAxIGVycm9ycywg
MCB3YXJuaW5ncywgNyBsaW5lcyBjaGVja2VkCgpDb21taXQgYWRiZjM3M2E5OTI4IChBc3NlcnRp
b24gZmFpbHVyZSBpbiBmaWZvOF9wdXNoX2FsbCgpIHRocm91Z2ggYW01M2M5NzQpIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRl
ZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRj
aGV3Lm9yZy9sb2dzLzE2MTU3MjE5ODM2MC4xODQ4Mi4xNzE2MzY2ODI4OTQ1ODU0NDI4My5tYWxv
bmVAc295YmVhbi5jYW5vbmljYWwuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdl
LgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9w
YXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxA
cmVkaGF0LmNvbQ==

