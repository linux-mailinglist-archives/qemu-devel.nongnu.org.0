Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744E34CE8C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:14:07 +0200 (CEST)
Received: from localhost ([::1]:40212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpqQ-0007wY-3U
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQppK-0007Vp-PY
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:12:58 -0400
Resent-Date: Mon, 29 Mar 2021 07:12:58 -0400
Resent-Message-Id: <E1lQppK-0007Vp-PY@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQppI-000294-2A
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:12:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617016370; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SSEi2r+2fdjwqD2mRyedY9v9JbjcD8HK82b0QYTtr55ZAPJCu6M4eRu01utR86hHS9fWidIFmKBjD1maXXbLK5nSgtZrB7QfOY662zAcEY3EcQoWDBZakbRBpMnsW8jhLXMzAVMRj82K9Bm0zwR8NnGwhV7P3P1LPvlY7CqqS7I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617016370;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=A1MXkcB37OhtcVegkgfdfZog7ECLT8iXNKLw7jwSons=; 
 b=hTdj9mXJ7OuuTtNyQCVHfk1DTcw9Pmtt1+OdCimUDIfBJ9PoWnz1FaBuBRWoItcInIXSN03tTOnPutYPI2XhcacKXF/PtNfD2dQx6NW88Rmo8IERmjVhhgdrpm4DjLItFrJCuaXkJDqnhI9I3rmxB6eZdmA2lPbudNvyWM6OBe8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1617016367536275.48126236983865;
 Mon, 29 Mar 2021 04:12:47 -0700 (PDT)
In-Reply-To: <20210329110303.15235-1-alex.bennee@linaro.org>
Subject: Re: [PATCH for 6.0-rc2? v1 0/6] check-tcg for non-x86 hosts
Message-ID: <161701636648.27779.3280759116914805392@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Mon, 29 Mar 2021 04:12:47 -0700 (PDT)
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMyOTExMDMwMy4xNTIz
NS0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMyOTExMDMwMy4x
NTIzNS0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3ViamVjdDogW1BBVENIIGZvciA2LjAtcmMy
PyB2MSAwLzZdIGNoZWNrLXRjZyBmb3Igbm9uLXg4NiBob3N0cwoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhp
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
ICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMyOTExMDMwMy4xNTIzNS0xLWFsZXgu
YmVubmVlQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDMyOTExMDMwMy4xNTIzNS0xLWFsZXgu
YmVubmVlQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo4MGM4ODQ4
IHRlc3RzL2kzODYvdGVzdC1pMzg2OiB0cnkgYW5kIGNvcnJlY3QgY29uc3RyYWluIDE2IGJpdCBj
YWxsIChXSVApCjQyODhkMzEgdGVzdHMvdGNnL2kzODY6IGV4cGFuZCAuZGF0YSBzZWN0aW9ucyBm
b3Igc3lzdGVtIHRlc3RzCjBmNzk3ZjAgdGVzdHMvdGNnL2NvbmZpZ3VyZS5zaDogbWFrZSBzdXJl
IHdlIHBpY2sgdXAgeDg2XzY0IGNyb3NzIGNvbXBpbGVycwoyMDQ5Mzg3IHRlc3RzL3RjZzogYWRk
IGNvbmNlcHQgb2YgY29udGFpbmVyX2hvc3RzCjI0Y2Y2OTAgdGVzdHMvZG9ja2VyOiBkb24ndCBz
ZXQgRE9DS0VSX1JFR0lTVFJZIG9uIG5vbi14ODZfNjQKMzk5YTYyYiB0ZXN0cy90Y2c6IHVwZGF0
ZSB0aGUgZGVmYXVsdHMgZm9yIHg4NiBjb21waWxlcnMKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEv
NiBDaGVja2luZyBjb21taXQgMzk5YTYyYmRhZWRlICh0ZXN0cy90Y2c6IHVwZGF0ZSB0aGUgZGVm
YXVsdHMgZm9yIHg4NiBjb21waWxlcnMpCjIvNiBDaGVja2luZyBjb21taXQgMjRjZjY5MGUzYjA2
ICh0ZXN0cy9kb2NrZXI6IGRvbid0IHNldCBET0NLRVJfUkVHSVNUUlkgb24gbm9uLXg4Nl82NCkK
My82IENoZWNraW5nIGNvbW1pdCAyMDQ5Mzg3OTI2NzAgKHRlc3RzL3RjZzogYWRkIGNvbmNlcHQg
b2YgY29udGFpbmVyX2hvc3RzKQpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMTQ1
OiBGSUxFOiB0ZXN0cy90Y2cvY29uZmlndXJlLnNoOjI5MDoKKyAgICAgICAgICAgICAgZWNobyAi
RE9DS0VSX0NST1NTX0NDX0dVRVNUPSRjb250YWluZXJfY3Jvc3NfY2MiID4+ICRjb25maWdfdGFy
Z2V0X21hawoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxMTkgbGluZXMgY2hlY2tlZAoK
UGF0Y2ggMy82IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0
aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRh
aW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCjQvNiBDaGVja2luZyBjb21taXQg
MGY3OTdmMDFjNzYyICh0ZXN0cy90Y2cvY29uZmlndXJlLnNoOiBtYWtlIHN1cmUgd2UgcGljayB1
cCB4ODZfNjQgY3Jvc3MgY29tcGlsZXJzKQo1LzYgQ2hlY2tpbmcgY29tbWl0IDQyODhkMzE4NThm
ZCAodGVzdHMvdGNnL2kzODY6IGV4cGFuZCAuZGF0YSBzZWN0aW9ucyBmb3Igc3lzdGVtIHRlc3Rz
KQo2LzYgQ2hlY2tpbmcgY29tbWl0IDgwYzg4NDgwNGU0YSAodGVzdHMvaTM4Ni90ZXN0LWkzODY6
IHRyeSBhbmQgY29ycmVjdCBjb25zdHJhaW4gMTYgYml0IGNhbGwgKFdJUCkpCkVSUk9SOiBzcGFj
ZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJzonIChjdHg6VnhXKQojMzk6IEZJTEU6IHRlc3RzL3Rj
Zy9pMzg2L3Rlc3QtaTM4Ni5jOjEzOTU6CisgICAgICAgICAgICAgICAgICA6ICJpIiAoTUtfU0VM
KDEpKSwgIlRzIiAoJmNvZGUxNl9mdW5jMSk6ICJtZW1vcnkiLCAiY2MiKTsKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCkVSUk9SOiBz
cGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJzonIChjdHg6VnhXKQojNDQ6IEZJTEU6IHRlc3Rz
L3RjZy9pMzg2L3Rlc3QtaTM4Ni5jOjEzOTk6CisgICAgICAgICAgICAgICAgICA6ICJpIiAoTUtf
U0VMKDEpKSwgIlRzIiAoJmNvZGUxNl9mdW5jMik6ICJtZW1vcnkiLCAiY2MiKTsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCkVSUk9S
OiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJzonIChjdHg6VnhXKQojNDk6IEZJTEU6IHRl
c3RzL3RjZy9pMzg2L3Rlc3QtaTM4Ni5jOjE0MDM6CisgICAgICAgICAgICAgICAgICA6ICJpIiAo
TUtfU0VMKDEpKSwgIlRzIiAoJmNvZGUxNl9mdW5jMyk6ICJtZW1vcnkiLCAiY2MiKTsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRv
dGFsOiAzIGVycm9ycywgMCB3YXJuaW5ncywgMTggbGluZXMgY2hlY2tlZAoKUGF0Y2ggNi82IGhh
cyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMK
YXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNI
RUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFu
ZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRw
Oi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMyOTExMDMwMy4xNTIzNS0xLWFsZXguYmVubmVlQGxp
bmFyby5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5l
cmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

