Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5663703C0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:53:18 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcc0b-0005OB-R5
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lcbzM-0004yR-VR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:52:02 -0400
Resent-Date: Fri, 30 Apr 2021 18:52:00 -0400
Resent-Message-Id: <E1lcbzM-0004yR-VR@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lcbzI-0004nH-Lx
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:52:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619823107; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DOahIcszI1/mFyW5Oz8gya5OEhbMG+1Cd0hzcQhXYgC+l2QHLZQh+0YetxYEjnQ0y5MiFYqSKqbL8Vq81s3deOy74FH2wa0sYwLCz1pgjfWc2ty7juBlmSNceev/thyy/AA2hF22uZqCvPRnDQuz6js3ilfTl0JP6yU39H44DZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619823107;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=bhqgSOq35HrtO4zHdY9xiT5/8RIyCszLmvrcf9tVQoo=; 
 b=m4ljh/W4SUR2A+vjIIRA3dBv2kScD1lhS5MjwU0n++wODEGu/b4C63HIxOWKse8JZD9OBOBChA+ToA9sJ0qj+Q40nq7B9CbYbW9lEOFhzn4HZwfvDYiefK6r3I7PyS1cVmEf9oAG9mDcsEI4W3D3rLWb3hoWRH/+Xqd+cSnj53k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619823105830665.4184527608462;
 Fri, 30 Apr 2021 15:51:45 -0700 (PDT)
In-Reply-To: <20210430223701.176696-1-ziqiaokong@gmail.com>
Subject: Re: [PATCH v3] Set the correct env->fpip for x86 float instructions
Message-ID: <161982310453.14179.11842301629878729440@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ziqiaokong@gmail.com
Date: Fri, 30 Apr 2021 15:51:45 -0700 (PDT)
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
Cc: pbonzini@redhat.com, ziqiaokong@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQzMDIyMzcwMS4xNzY2
OTYtMS16aXFpYW9rb25nQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNDMwMjIzNzAxLjE3
NjY5Ni0xLXppcWlhb2tvbmdAZ21haWwuY29tClN1YmplY3Q6IFtQQVRDSCB2M10gU2V0IHRoZSBj
b3JyZWN0IGVudi0+ZnBpcCBmb3IgeDg2IGZsb2F0IGluc3RydWN0aW9ucwoKPT09IFRFU1QgU0NS
SVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwg
fHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29y
aXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4K
PT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFk
ZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0
L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDQzMDIyMzcwMS4xNzY2OTYt
MS16aXFpYW9rb25nQGdtYWlsLmNvbSAtPiBwYXRjaGV3LzIwMjEwNDMwMjIzNzAxLjE3NjY5Ni0x
LXppcWlhb2tvbmdAZ21haWwuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNDky
OTUyOSBTZXQgdGhlIGNvcnJlY3QgZW52LT5mcGlwIGZvciB4ODYgZmxvYXQgaW5zdHJ1Y3Rpb25z
Cgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogc3BhY2UgcmVxdWlyZWQgYmVmb3JlIHRoZSBv
cGVuIHBhcmVudGhlc2lzICcoJwojOTUwOiBGSUxFOiB0YXJnZXQvaTM4Ni90Y2cvdHJhbnNsYXRl
LmM6NjIyNDoKKyAgICAgICAgICAgICAgICAgICAgc3dpdGNoKHJtKSB7CgpFUlJPUjogdHJhaWxp
bmcgd2hpdGVzcGFjZQojMTE0NTogRklMRTogdGFyZ2V0L2kzODYvdGNnL3RyYW5zbGF0ZS5jOjYz
NzU6CisgICAgICAgICAgICAgICAgdGNnX2dlbl9zdF90bChzLT5UMCwgY3B1X2Vudiwgb2Zmc2V0
b2YoQ1BVWDg2U3RhdGUsIGZwaXApKTsgICAgICAgICAgICAgICAgJAoKRVJST1I6IGxpbmUgb3Zl
ciA5MCBjaGFyYWN0ZXJzCiMxMTQ1OiBGSUxFOiB0YXJnZXQvaTM4Ni90Y2cvdHJhbnNsYXRlLmM6
NjM3NToKKyAgICAgICAgICAgICAgICB0Y2dfZ2VuX3N0X3RsKHMtPlQwLCBjcHVfZW52LCBvZmZz
ZXRvZihDUFVYODZTdGF0ZSwgZnBpcCkpOyAgICAgICAgICAgICAgICAKCldBUk5JTkc6IGxpbmUg
b3ZlciA4MCBjaGFyYWN0ZXJzCiMxMTUzOiBGSUxFOiB0YXJnZXQvaTM4Ni90Y2cvdHJhbnNsYXRl
LmM6NjM4MzoKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldG9mKENQVVg4
NlN0YXRlLCBzZWdzW2xhc3Rfc2VnXS5zZWxlY3RvcikpOwoKdG90YWw6IDMgZXJyb3JzLCAxIHdh
cm5pbmdzLCAxMTEyIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA0OTI5NTI5NWJlYjcgKFNldCB0aGUg
Y29ycmVjdCBlbnYtPmZwaXAgZm9yIHg4NiBmbG9hdCBpbnN0cnVjdGlvbnMpIGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNl
IHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0gg
aW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3
aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3
Lm9yZy9sb2dzLzIwMjEwNDMwMjIzNzAxLjE3NjY5Ni0xLXppcWlhb2tvbmdAZ21haWwuY29tL3Rl
c3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9t
YXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5
b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

