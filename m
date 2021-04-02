Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E480352DC1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:32:08 +0200 (CEST)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMiN-0003Qd-My
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lSMeN-0000eH-Eu; Fri, 02 Apr 2021 12:27:59 -0400
Resent-Date: Fri, 02 Apr 2021 12:27:59 -0400
Resent-Message-Id: <E1lSMeN-0000eH-Eu@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lSMeK-0000Qt-4g; Fri, 02 Apr 2021 12:27:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617380870; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=c4mDHDVP0S+r4ntd+UW2qTX99ICnK6im48nQWWQTa7krp7JJafo0f77meHmNIhbTTD7qB9jEeqP0ek9RjJb44wpbfGDzHmRDi1D9giKo+fFaMfpgPKGWtrGwu1ovXFPo3x8Mo/RMvO3mMz8kSbKxJKTDM8p/O2s/E7lAVNUji9E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617380870;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lbRsuDDeOjx7iNGBwO+zphIvh/DcamTAjhJvvAtCQq8=; 
 b=kGHs7iz1UFk14viHfluFUjDNbeeKh3kXMD2d4lYWLbGA33WtoI4stOd1Pu+H1KyLNb7WAVtkPzkUFALSD4adhOuNshtt6oAIiuxwkTUR9StNmlaJoujNSofqspMSRPD4tNCBNrNcNI2GcMbV9GXh3Tq+hUfzdJFnRLxwilhCbro=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 161738086633011.775781403611973;
 Fri, 2 Apr 2021 09:27:46 -0700 (PDT)
In-Reply-To: <20210402161835.286665-1-richard.henderson@linaro.org>
Subject: Re: [PATCH v2 0/3] target/arm mte fixes
Message-ID: <161738086524.1406.14391226727515130206@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Fri, 2 Apr 2021 09:27:46 -0700 (PDT)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQwMjE2MTgzNS4yODY2
NjUtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MDIx
NjE4MzUuMjg2NjY1LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTdWJqZWN0OiBbUEFU
Q0ggdjIgMC8zXSB0YXJnZXQvYXJtIG10ZSBmaXhlcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09
PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dy
YW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NS
SVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3
MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3Rh
ZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDQwMTE4MTQ1Ny43MzAzOS0xLXZpamFpQGJlaGlu
ZGJ5dGVzLmNvbSAtPiBwYXRjaGV3LzIwMjEwNDAxMTgxNDU3LjczMDM5LTEtdmlqYWlAYmVoaW5k
Ynl0ZXMuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MDIxMDIxMjguMjEz
OTQzLTEtdmFpYmhhdkBsaW51eC5pYm0uY29tIC0+IHBhdGNoZXcvMjAyMTA0MDIxMDIxMjguMjEz
OTQzLTEtdmFpYmhhdkBsaW51eC5pYm0uY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcv
MjAyMTA0MDIxNjE4MzUuMjg2NjY1LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBw
YXRjaGV3LzIwMjEwNDAyMTYxODM1LjI4NjY2NS0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5v
cmcKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDQwMjE2MjA1Mi4yNjQ5NTItMS1h
bHhuZHJAYnUuZWR1IC0+IHBhdGNoZXcvMjAyMTA0MDIxNjIwNTIuMjY0OTUyLTEtYWx4bmRyQGJ1
LmVkdQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmUyMTZjOGEgYWNjZWwvdGNnOiBQ
cmVzZXJ2ZSBQQUdFX0FOT04gd2hlbiBjaGFuZ2luZyBwYWdlIHBlcm1pc3Npb25zCjY3NzNiMTYg
dGFyZ2V0L2FybTogRml4IHVuYWxpZ25lZCBtdGUgY2hlY2tzCjQzMWMxOWQgdGFyZ2V0L2FybTog
Q2hlY2sgUEFHRV9XUklURV9PUkcgZm9yIE1URSB3cml0ZWFiaWxpdHkKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvMyBDaGVja2luZyBjb21taXQgNDMxYzE5ZDVmMTM3ICh0YXJnZXQvYXJtOiBDaGVj
ayBQQUdFX1dSSVRFX09SRyBmb3IgTVRFIHdyaXRlYWJpbGl0eSkKV0FSTklORzogbGluZSBvdmVy
IDgwIGNoYXJhY3RlcnMKIzI4OiBGSUxFOiB0YXJnZXQvYXJtL210ZV9oZWxwZXIuYzo4NjoKKyAg
ICBpZiAoIShmbGFncyAmIChwdHJfYWNjZXNzID09IE1NVV9EQVRBX1NUT1JFID8gUEFHRV9XUklU
RV9PUkcgOiBQQUdFX1JFQUQpKSkgewoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCA4IGxp
bmVzIGNoZWNrZWQKClBhdGNoIDEvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoyLzMgQ2hl
Y2tpbmcgY29tbWl0IDY3NzNiMTYzNDQ0ZCAodGFyZ2V0L2FybTogRml4IHVuYWxpZ25lZCBtdGUg
Y2hlY2tzKQpVc2Ugb2YgdW5pbml0aWFsaXplZCB2YWx1ZSAkYWNwaV90ZXN0ZXhwZWN0ZWQgaW4g
c3RyaW5nIGVxIGF0IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIGxpbmUgMTUyOS4KRVJST1I6IHNw
YWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpXeFYpCiM0MDc6IEZJTEU6IHRhcmdl
dC9hcm0vc3ZlX2hlbHBlci5jOjQ0Mzg6CisgICAgICAgICAgICAgICBzdmVfbGRzdDFfdGxiX2Zu
ICp0bGJfZm4pCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCkVSUk9SOiBzcGFj
ZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6V3hWKQojNTE3OiBGSUxFOiB0YXJnZXQv
YXJtL3N2ZV9oZWxwZXIuYzo1MDYzOgorICAgICAgICAgICAgICAgc3ZlX2xkc3QxX3RsYl9mbiAq
dGxiX2ZuKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpXQVJOSU5HOiBhZGRl
ZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRp
bmc/CiM3Nzc6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKdG90YWw6IDIgZXJyb3JzLCAxIHdhcm5p
bmdzLCA3MDggbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi8zIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCgozLzMgQ2hlY2tpbmcgY29tbWl0IGUyMTZjOGE2NDUxNyAoYWNjZWwvdGNnOiBQcmVzZXJ2
ZSBQQUdFX0FOT04gd2hlbiBjaGFuZ2luZyBwYWdlIHBlcm1pc3Npb25zKQpVc2Ugb2YgdW5pbml0
aWFsaXplZCB2YWx1ZSAkYWNwaV90ZXN0ZXhwZWN0ZWQgaW4gc3RyaW5nIGVxIGF0IC4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIGxpbmUgMTUyOS4KV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0
ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojNjY6IApuZXcgZmls
ZSBtb2RlIDEwMDY0NAoKRVJST1I6ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiMx
MjM6IEZJTEU6IHRlc3RzL3RjZy9hYXJjaDY0L210ZS5oOjUxOgorc3RhdGljIHZvaWQgKiBhbGxv
Y19tdGVfbWVtKHNpemVfdCBzaXplKSBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQpKTsKCkVSUk9SOiAi
Zm9vICogYmFyIiBzaG91bGQgYmUgImZvbyAqYmFyIgojMTI0OiBGSUxFOiB0ZXN0cy90Y2cvYWFy
Y2g2NC9tdGUuaDo1MjoKK3N0YXRpYyB2b2lkICogYWxsb2NfbXRlX21lbShzaXplX3Qgc2l6ZSkK
CnRvdGFsOiAyIGVycm9ycywgMSB3YXJuaW5ncywgODQgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy8z
IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJv
cnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2Vl
CkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDQwMjE2MTgzNS4yODY2NjUtMS1yaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0K
RW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3
Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0
LmNvbQ==

