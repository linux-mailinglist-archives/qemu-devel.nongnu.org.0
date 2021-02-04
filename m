Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0D30F5FF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:19:21 +0100 (CET)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gPg-0002EL-14
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7gJX-0006od-EN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:12:59 -0500
Resent-Date: Thu, 04 Feb 2021 10:12:59 -0500
Resent-Message-Id: <E1l7gJX-0006od-EN@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7gJU-0006iE-4c
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:12:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612451568; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Sp2Tuwta1Y7oafCH7xflfiNuWthHx3mLK4FrxOSSFO8vDf0y2Pbob8ortlRld6Fwsj0SGAPFWuMUxYvHFAFiQ7I4QZCkvDM+inyoN7MUmTX8sRqysy638nNisAw3pxXss8QA+K4e4sLSni5Gjth5g9Be5Z2Httb9C3GH1oDWb8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612451568;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=wQvrTGEsVPzBHvujL/DMtwzrIUkAYn+jYjjRrnZUd/8=; 
 b=P2jofnI+dZECiO40oeVNIomt/6lonMupLoX+vUvfzTM5yfsjCwV3TwUzFHTHaf6lM5XX0IsGB1AB9nFIdif5h/URMslJruZsszMnphMdcFoqi7dlxBmELbugoRktXVIFa7QKlvlHMIfUS9yX/hJogbCsopGV/Xhq+gzMM3KnEh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612451566478217.3230000249015;
 Thu, 4 Feb 2021 07:12:46 -0800 (PST)
In-Reply-To: <20210204140136.2769065-1-armbru@redhat.com>
Subject: Re: [PULL 0/9] QMP patches patches for 2021-02-04
Message-ID: <161245156523.30579.4225184533740834913@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: armbru@redhat.com
Date: Thu, 4 Feb 2021 07:12:46 -0800 (PST)
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwNDE0MDEzNi4yNzY5
MDY1LTEtYXJtYnJ1QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIwNDE0MDEzNi4yNzY5
MDY1LTEtYXJtYnJ1QHJlZGhhdC5jb20KU3ViamVjdDogW1BVTEwgMC85XSBRTVAgcGF0Y2hlcyBw
YXRjaGVzIGZvciAyMDIxLTAyLTA0Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0g
ICAgICBwYXRjaGV3LzIwMjEwMTI4MDAzMjIzLjM1NjExMDgtMS1mNGJ1Z0BhbXNhdC5vcmcgLT4g
cGF0Y2hldy8yMDIxMDEyODAwMzIyMy4zNTYxMTA4LTEtZjRidWdAYW1zYXQub3JnCiAqIFtuZXcg
dGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAyMDQxNDAxMzYuMjc2OTA2NS0xLWFybWJydUByZWRo
YXQuY29tIC0+IHBhdGNoZXcvMjAyMTAyMDQxNDAxMzYuMjc2OTA2NS0xLWFybWJydUByZWRoYXQu
Y29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNmRiNWU0ZSBxbXA6IFJlc3VtZSBP
T0ItZW5hYmxlZCBtb25pdG9yIGJlZm9yZSBwcm9jZXNzaW5nIHRoZSByZXF1ZXN0CjZhNjdjNWZi
IHFtcDogQWRkIG1vcmUgdHJhY2Vwb2ludHMKNDY2MWU2NyBxbXA6IEZpeCB1cCBjb21tZW50cyBh
ZnRlciBjb21taXQgOWNlNDRlMmNlMgo3NjRiMTkyIGRvY3MvaW50ZXJvcC9xbXAtc3BlYzogRG9j
dW1lbnQgdGhlIHJlcXVlc3QgcXVldWUgbGltaXQKNTdmY2FmMCBxb2JqZWN0OiBicmFjZXMge30g
YXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKZThhZDZjMCBxb2Jq
ZWN0OiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgb3BlcmF0b3JzCmQwODNjODQgcW9iamVj
dDogY29kZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCjJkN2RjNDUgcW9iamVjdDogb3Bl
biBicmFjZSAneycgZm9sbG93aW5nIHN0cnVjdCBnbyBvbiB0aGUgc2FtZSBsaW5lCmIxMDcwNTEg
bW9uaXRvci9xbXAtY21kcy5jOiBEb24ndCBpbmNsdWRlIHVpL3ZuYy5oCgo9PT0gT1VUUFVUIEJF
R0lOID09PQoxLzkgQ2hlY2tpbmcgY29tbWl0IGIxMDcwNTFjZmZiNCAobW9uaXRvci9xbXAtY21k
cy5jOiBEb24ndCBpbmNsdWRlIHVpL3ZuYy5oKQoyLzkgQ2hlY2tpbmcgY29tbWl0IDJkN2RjNDU0
ODIxYiAocW9iamVjdDogb3BlbiBicmFjZSAneycgZm9sbG93aW5nIHN0cnVjdCBnbyBvbiB0aGUg
c2FtZSBsaW5lKQozLzkgQ2hlY2tpbmcgY29tbWl0IGQwODNjODQxM2Q5NSAocW9iamVjdDogY29k
ZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzKQo0LzkgQ2hlY2tpbmcgY29tbWl0IGU4YWQ2
YzBmYjJiNyAocW9iamVjdDogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0IG9wZXJhdG9ycykK
RVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRl
bWVudAojMjg6IEZJTEU6IHFvYmplY3QvcWRpY3QuYzo0NjoKKyAgICBmb3IgKHZhbHVlID0gMHgy
MzhGMTNBRiAqIHN0cmxlbihuYW1lKSwgaSA9IDA7IG5hbWVbaV07IGkrKykKWy4uLl0KCnRvdGFs
OiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTAgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNC85IGhhcyBz
dHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJl
IGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNL
UEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo1LzkgQ2hlY2tpbmcgY29tbWl0IDU3ZmNhZjAzNTY4ZiAo
cW9iamVjdDogYnJhY2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3Rh
dGVtZW50KQo2LzkgQ2hlY2tpbmcgY29tbWl0IDc2NGIxOTI0ZDViNCAoZG9jcy9pbnRlcm9wL3Ft
cC1zcGVjOiBEb2N1bWVudCB0aGUgcmVxdWVzdCBxdWV1ZSBsaW1pdCkKNy85IENoZWNraW5nIGNv
bW1pdCA0NjYxZTY3YzU5MmYgKHFtcDogRml4IHVwIGNvbW1lbnRzIGFmdGVyIGNvbW1pdCA5Y2U0
NGUyY2UyKQo4LzkgQ2hlY2tpbmcgY29tbWl0IDZhNjdjNWZiOGMxYSAocW1wOiBBZGQgbW9yZSB0
cmFjZXBvaW50cykKOS85IENoZWNraW5nIGNvbW1pdCA2ZGI1ZTRlZjljM2QgKHFtcDogUmVzdW1l
IE9PQi1lbmFibGVkIG1vbml0b3IgYmVmb3JlIHByb2Nlc3NpbmcgdGhlIHJlcXVlc3QpCj09PSBP
VVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVs
bCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMjA0MTQw
MTM2LjI3NjkwNjUtMS1hcm1icnVAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=

