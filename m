Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD3A3713BB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:43:50 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldW3J-0002iJ-Qt
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ldW2Y-0002JE-En
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:43:02 -0400
Resent-Date: Mon, 03 May 2021 06:43:02 -0400
Resent-Message-Id: <E1ldW2Y-0002JE-En@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ldW2V-0001sk-Mp
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:43:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620038570; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PxjdWKu4DHwP5FDKWItaMlrtLaynr4AyGzzir0lCcmOJPvajgZXZMgHUmLOaIBCeSMz9Hd8KuZB3wzgKMfPHFW7wcXF/1Z6y1UrOrS0JSfcSoVnG8p0/iH9pDDHDzIObmYMTNAtQlHurlcGj+UZiouJAsFtahLFrL3RMPc/tvgg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620038570;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=w6aF8wMjIXvTtispmBHyPrbFLJOUOKZ8p1YhyixoOyI=; 
 b=Exm9DQXRxMCoEHiGJTeCQQfPWQXEeA1M1GSo9Z5yF9SLJCfg7njRzUSweX3CzjgEfdLt0uMLAsrEbgY+SxYw9zlQCPUj1eOX/Mk2Bp09ErJ+2PqYddTgznNbKri1qa+GgrSKYESYm2JYEKKq5m24r6dkcszhuUsOXD90aAIRhOk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1620038567784607.575968050757;
 Mon, 3 May 2021 03:42:47 -0700 (PDT)
In-Reply-To: <20210503084034.3804963-1-armbru@redhat.com>
Subject: Re: [PATCH 0/2] Drop deprecated lm32 and unicore32
Message-ID: <162003856651.17935.9040893944776850381@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: armbru@redhat.com
Date: Mon, 3 May 2021 03:42:47 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUwMzA4NDAzNC4zODA0
OTYzLTEtYXJtYnJ1QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDUwMzA4NDAzNC4zODA0
OTYzLTEtYXJtYnJ1QHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIDAvMl0gRHJvcCBkZXByZWNh
dGVkIGxtMzIgYW5kIHVuaWNvcmUzMgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4v
YmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1l
cyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3Jp
cHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9
PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJv
bSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVd
ICAgICAgcGF0Y2hldy8yMDIxMDUwMjE3NDgzNi44Mzg4MTYtMS10aHV0aEByZWRoYXQuY29tIC0+
IHBhdGNoZXcvMjAyMTA1MDIxNzQ4MzYuODM4ODE2LTEtdGh1dGhAcmVkaGF0LmNvbQogKiBbbmV3
IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNTAzMDg0MDM0LjM4MDQ5NjMtMS1hcm1icnVAcmVk
aGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNTAzMDg0MDM0LjM4MDQ5NjMtMS1hcm1icnVAcmVkaGF0
LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmM3MDc3NGEgRHJvcCB0aGUgZGVw
cmVjYXRlZCB1bmljb3JlMzIgdGFyZ2V0CjMyOTllZmUgRHJvcCB0aGUgZGVwcmVjYXRlZCBsbTMy
IHRhcmdldAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8yIENoZWNraW5nIGNvbW1pdCAzMjk5ZWZl
YWVjYTkgKERyb3AgdGhlIGRlcHJlY2F0ZWQgbG0zMiB0YXJnZXQpCkVSUk9SOiBsaW5lIG92ZXIg
OTAgY2hhcmFjdGVycwojOTk2OTogRklMRTogdGVzdHMvdGNnL2NvbmZpZ3VyZS5zaDo5OToKKyAg
ICBhbHBoYXxjcmlzfGhleGFnb258aHBwYXxpMzg2fG1pY3JvYmxhemV8bWljcm9ibGF6ZWVsfG02
OGt8b3BlbnJpc2N8cmlzY3Y2NHxzMzkweHxzaDR8c3BhcmM2NCkKCnRvdGFsOiAxIGVycm9ycywg
MCB3YXJuaW5ncywgNDk0IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMiBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgoKMi8yIENoZWNraW5nIGNvbW1pdCBjNzA3NzRhNTJhMjQgKERyb3AgdGhlIGRl
cHJlY2F0ZWQgdW5pY29yZTMyIHRhcmdldCkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1h
bmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA1MDMwODQwMzQuMzgwNDk2My0xLWFybWJydUByZWRo
YXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVh
c2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

