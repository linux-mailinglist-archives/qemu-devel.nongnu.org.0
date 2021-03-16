Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7EA33E170
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:32:23 +0100 (CET)
Received: from localhost ([::1]:43988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIEe-00065d-KT
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMIDJ-0005GQ-9n
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:30:57 -0400
Resent-Date: Tue, 16 Mar 2021 18:30:57 -0400
Resent-Message-Id: <E1lMIDJ-0005GQ-9n@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMIDG-0005Gf-S8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:30:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615933849; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RGBTdKgUOPeGxkVAcgT2HIl81hYFrz4fe3fVzhFoEabfzKwgxIQZRWoaD/7Zp6hwcl0ker0+NjVB+Q4bQcQv18smuaDva+2AmayKkLECsac8RAb3R39X2+5zfAj3UBTPXStB/QjIsNI8u0CaGytutWSVT9AOuKTVphQPRfwLoJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615933849;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=AX/IM4yGM5B6W6ilqzwlU8BDox95kp0uXOyByzo/ZoE=; 
 b=Zv24EehdxLylE9zF0Lkfs0IN+U6Ef17RUCz+csCL0p25PBmlAFfkfSb/bcMbnYLqrGpf0c+mU4+DbgsYivQHryniC32lVCPoJUfF8oUCXZdz8Zhrpm/XCh9TXsAPeJUvzAQjK/VY8JqbA3vttnwMykjgK8V2H8tb0Pq79yxEYQM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16159338480761018.6771384872415;
 Tue, 16 Mar 2021 15:30:48 -0700 (PDT)
In-Reply-To: <20210316220735.2048137-1-richard.henderson@linaro.org>
Subject: Re: [PATCH 0/5] tcg: Issue memory barriers for guest memory model
Message-ID: <161593384697.18566.1014483421756684030@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Tue, 16 Mar 2021 15:30:48 -0700 (PDT)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNjIyMDczNS4yMDQ4
MTM3LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzE2
MjIwNzM1LjIwNDgxMzctMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN1YmplY3Q6IFtQ
QVRDSCAwLzVdIHRjZzogSXNzdWUgbWVtb3J5IGJhcnJpZXJzIGZvciBndWVzdCBtZW1vcnkgbW9k
ZWwKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBi
YXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVs
aW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0t
bWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVh
OWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29t
L3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAz
MTExNDM5NTguNTYyNjI1LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3
LzIwMjEwMzExMTQzOTU4LjU2MjYyNS0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcKICog
W25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMxNjIyMDczNS4yMDQ4MTM3LTEtcmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwMzE2MjIwNzM1LjIwNDgxMzct
MS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAn
dGVzdCcKMDZjZWI1YSB0Y2c6IEFkZCBob3N0IG1lbW9yeSBiYXJyaWVycyB0byBjcHVfbGRzdC5o
IGludGVyZmFjZXMKYmU0YWRlNSB0Y2c6IENyZWF0ZSB0Y2dfcmVxX21vCjEzMzY3NzggdGNnOiBF
bGlkZSBtZW1vcnkgYmFycmllcnMgaW1wbGllZCBieSB0aGUgaG9zdCBtZW1vcnkgbW9kZWwKZDBm
OTBkNSB0Y2c6IERvIG5vdCBlbGlkZSBtZW1vcnkgYmFycmllcnMgZm9yIENGX1BBUkFMTEVMCmM5
ZjYzNGIgdGNnOiBEZWNvZGUgdGhlIG9wZXJhbmQgdG8gSU5ERVhfb3BfbWIgaW4gZHVtcHMKCj09
PSBPVVRQVVQgQkVHSU4gPT09CjEvNSBDaGVja2luZyBjb21taXQgYzlmNjM0YmRiZTIwICh0Y2c6
IERlY29kZSB0aGUgb3BlcmFuZCB0byBJTkRFWF9vcF9tYiBpbiBkdW1wcykKMi81IENoZWNraW5n
IGNvbW1pdCBkMGY5MGQ1ODRmMTcgKHRjZzogRG8gbm90IGVsaWRlIG1lbW9yeSBiYXJyaWVycyBm
b3IgQ0ZfUEFSQUxMRUwpCjMvNSBDaGVja2luZyBjb21taXQgMTMzNjc3ODM4ZjE0ICh0Y2c6IEVs
aWRlIG1lbW9yeSBiYXJyaWVycyBpbXBsaWVkIGJ5IHRoZSBob3N0IG1lbW9yeSBtb2RlbCkKNC81
IENoZWNraW5nIGNvbW1pdCBiZTRhZGU1MWE0NTcgKHRjZzogQ3JlYXRlIHRjZ19yZXFfbW8pCjUv
NSBDaGVja2luZyBjb21taXQgMDZjZWI1YWQyMTJhICh0Y2c6IEFkZCBob3N0IG1lbW9yeSBiYXJy
aWVycyB0byBjcHVfbGRzdC5oIGludGVyZmFjZXMpCkVSUk9SOiBtZW1vcnkgYmFycmllciB3aXRo
b3V0IGNvbW1lbnQKIzE4OTogRklMRTogaW5jbHVkZS9leGVjL2NwdV9sZHN0Lmg6MTc1OgorICAg
ICAgICAgICAgc21wX21iKCk7ICAgICAgICAgICAgIFwKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJu
aW5ncywgMTQ2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDUvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBs
ZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMg
cmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlO
RVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMTAzMTYyMjA3MzUuMjA0ODEzNy0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvdGVz
dGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

