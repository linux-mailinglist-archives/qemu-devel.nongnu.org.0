Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF98362804
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:48:12 +0200 (CEST)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTVj-0008EO-3U
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lXTTg-0007Lj-C0; Fri, 16 Apr 2021 14:46:04 -0400
Resent-Date: Fri, 16 Apr 2021 14:46:04 -0400
Resent-Message-Id: <E1lXTTg-0007Lj-C0@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lXTTZ-0004DR-RR; Fri, 16 Apr 2021 14:46:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618598751; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KOJ11l6hnx9x2LwoFPDAjelQXk5sdHyfWVnV6ntOGt1oIBM5y5ZZ30V3m7j3tcUTfwG9hkaHE3FPXDoGTaHRYO70SZS6N3JhI/OaLMfk/hBgZ3kQyLFW1TE19xX2RXXmZ+5lsOqYzpjZGF7sobwNK1hAn3XufWdeKNkI3h3eL6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618598751;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=LXQxHJo/9wZ+JgtBrU+BxFHEDyB5HhN5QTy51zioyk8=; 
 b=gtM1q+0KiuvZSaUUAbnETFJ1cLpiBiIIZi1JlMDAHZqb4cpoq838WFC1yP3o8jkHO5xfMdtFAR6A2puUm4k+rAXd5OfQM8+PXaNh9MMo5uIBI4Z3HoJuOs/dmylbVRzQU1+t7u7IvapXnAUjWd0apxG+e/KAZqnf0gs/2OGyz54=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618598749516328.04631760582436;
 Fri, 16 Apr 2021 11:45:49 -0700 (PDT)
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
Subject: Re: [PATCH v5 for-6.1 0/9] target/arm mte fixes
Message-ID: <161859874844.2382.1031653393101241510@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Fri, 16 Apr 2021 11:45:49 -0700 (PDT)
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxNjE4MzEwNi4xNTE2
NTYzLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNDE2
MTgzMTA2LjE1MTY1NjMtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN1YmplY3Q6IFtQ
QVRDSCB2NSBmb3ItNi4xIDAvOV0gdGFyZ2V0L2FybSBtdGUgZml4ZXMKCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8
IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0
aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09
PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVm
N2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9x
ZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMTYxODUzODkwNC05MzQzMy0xLWdpdC1z
ZW5kLWVtYWlsLXJvYmVydC5odUBsaW51eC5pbnRlbC5jb20gLT4gcGF0Y2hldy8xNjE4NTM4OTA0
LTkzNDMzLTEtZ2l0LXNlbmQtZW1haWwtcm9iZXJ0Lmh1QGxpbnV4LmludGVsLmNvbQogLSBbdGFn
IHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNDE1MTYzMzA0LjQxMjAwNTItMS1waGlsbWRAcmVk
aGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNDE1MTYzMzA0LjQxMjAwNTItMS1waGlsbWRAcmVkaGF0
LmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNDE1MjE1MTQxLjE4NjU0Njct
MS1jcm9zYUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTA0MTUyMTUxNDEuMTg2NTQ2Ny0xLWNy
b3NhQHJlZGhhdC5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDQxNjEzNTU0
My4yMDM4Mi0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwNDE2MTM1
NTQzLjIwMzgyLTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnCiAqIFtuZXcgdGFnXSAgICAgICAg
IHBhdGNoZXcvMjAyMTA0MTYxODMxMDYuMTUxNjU2My0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFy
by5vcmcgLT4gcGF0Y2hldy8yMDIxMDQxNjE4MzEwNi4xNTE2NTYzLTEtcmljaGFyZC5oZW5kZXJz
b25AbGluYXJvLm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmQ2OWUxZjYgdGFy
Z2V0L2FybTogUmVtb3ZlIGxvZzJfZXNpemUgcGFyYW1ldGVyIHRvIGdlbl9tdGVfY2hlY2tOCjgx
NDMwNzYgdGFyZ2V0L2FybTogU2ltcGxpZnkgc3ZlIG10ZSBjaGVja2luZwo1YmIxMmE4IHRhcmdl
dC9hcm06IFJlbmFtZSBtdGVfcHJvYmUxIHRvIG10ZV9wcm9iZQowOTRjYTgwIHRhcmdldC9hcm06
IE1lcmdlIG10ZV9jaGVjazEsIG10ZV9jaGVja04KMmNkZGQ3YiB0YXJnZXQvYXJtOiBSZXBsYWNl
IE1URURFU0MgRVNJWkUrVFNJWkUgd2l0aCBTSVpFTTEKZGNiOTNjMCB0ZXN0L3RjZy9hYXJjaDY0
OiBBZGQgbXRlLTUKY2M2Nzc1ZCB0YXJnZXQvYXJtOiBGaXggdW5hbGlnbmVkIGNoZWNrcyBmb3Ig
bXRlX2NoZWNrMSwgbXRlX3Byb2JlMQpmZmU2ODE3IHRhcmdldC9hcm06IFNwbGl0IG91dCBtdGVf
cHJvYmVfaW50Cjk4MjY4ZTMgdGFyZ2V0L2FybTogRml4IG10ZV9jaGVja04KCj09PSBPVVRQVVQg
QkVHSU4gPT09CjEvOSBDaGVja2luZyBjb21taXQgOTgyNjhlM2E3MjU4ICh0YXJnZXQvYXJtOiBG
aXggbXRlX2NoZWNrTikKMi85IENoZWNraW5nIGNvbW1pdCBmZmU2ODE3MDU2ZjkgKHRhcmdldC9h
cm06IFNwbGl0IG91dCBtdGVfcHJvYmVfaW50KQozLzkgQ2hlY2tpbmcgY29tbWl0IGNjNjc3NWRi
ODcyMyAodGFyZ2V0L2FybTogRml4IHVuYWxpZ25lZCBjaGVja3MgZm9yIG10ZV9jaGVjazEsIG10
ZV9wcm9iZTEpCjQvOSBDaGVja2luZyBjb21taXQgZGNiOTNjMGI5MWFhICh0ZXN0L3RjZy9hYXJj
aDY0OiBBZGQgbXRlLTUpClVzZSBvZiB1bmluaXRpYWxpemVkIHZhbHVlICRhY3BpX3Rlc3RleHBl
Y3RlZCBpbiBzdHJpbmcgZXEgYXQgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgbGluZSAxNTI5LgpX
QVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJT
IG5lZWQgdXBkYXRpbmc/CiMzMDogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBlcnJv
cnMsIDEgd2FybmluZ3MsIDUyIGxpbmVzIGNoZWNrZWQKClBhdGNoIDQvOSBoYXMgc3R5bGUgcHJv
YmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBw
b3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGlu
IE1BSU5UQUlORVJTLgo1LzkgQ2hlY2tpbmcgY29tbWl0IDJjZGRkN2I4NWI1YiAodGFyZ2V0L2Fy
bTogUmVwbGFjZSBNVEVERVNDIEVTSVpFK1RTSVpFIHdpdGggU0laRU0xKQo2LzkgQ2hlY2tpbmcg
Y29tbWl0IDA5NGNhODA5NmZjNCAodGFyZ2V0L2FybTogTWVyZ2UgbXRlX2NoZWNrMSwgbXRlX2No
ZWNrTikKNy85IENoZWNraW5nIGNvbW1pdCA1YmIxMmE4MWEyMzUgKHRhcmdldC9hcm06IFJlbmFt
ZSBtdGVfcHJvYmUxIHRvIG10ZV9wcm9iZSkKOC85IENoZWNraW5nIGNvbW1pdCA4MTQzMDc2MjZl
Y2EgKHRhcmdldC9hcm06IFNpbXBsaWZ5IHN2ZSBtdGUgY2hlY2tpbmcpCkVSUk9SOiBzcGFjZXMg
cmVxdWlyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6V3hWKQojOTY6IEZJTEU6IHRhcmdldC9hcm0v
c3ZlX2hlbHBlci5jOjQ0Mzg6CisgICAgICAgICAgICAgICBzdmVfbGRzdDFfdGxiX2ZuICp0bGJf
Zm4pCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCkVSUk9SOiBzcGFjZXMgcmVx
dWlyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6V3hWKQojMTkwOiBGSUxFOiB0YXJnZXQvYXJtL3N2
ZV9oZWxwZXIuYzo1MDYzOgorICAgICAgICAgICAgICAgc3ZlX2xkc3QxX3RsYl9mbiAqdGxiX2Zu
KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgp0b3RhbDogMiBlcnJvcnMsIDAg
d2FybmluZ3MsIDIwMiBsaW5lcyBjaGVja2VkCgpQYXRjaCA4LzkgaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRp
dmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlO
VEFJTkVSUy4KCjkvOSBDaGVja2luZyBjb21taXQgZDY5ZTFmNjg1ZWRiICh0YXJnZXQvYXJtOiBS
ZW1vdmUgbG9nMl9lc2l6ZSBwYXJhbWV0ZXIgdG8gZ2VuX210ZV9jaGVja04pCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNDE2MTgzMTA2LjE1
MTY1NjMtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/
dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

