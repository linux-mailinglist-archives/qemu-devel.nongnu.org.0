Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F6203487
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 12:09:06 +0200 (CEST)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnJNx-0007A4-N7
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 06:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jnJMz-0006eR-8a; Mon, 22 Jun 2020 06:08:05 -0400
Resent-Date: Mon, 22 Jun 2020 06:08:05 -0400
Resent-Message-Id: <E1jnJMz-0006eR-8a@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jnJMw-00087Q-5e; Mon, 22 Jun 2020 06:08:05 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1592820463; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MaU9ilwCXN6Zot7vgsFX5d/ldVUzKqa2//HmDo7YHmp9qBFE1KxAYy2WmTTSaBA2CjvusBOkf1EsjTD+/a7z2ZoJ4tcqrmQgo5V1rGQYDFV8T8ADdkCuxPtHa6CptNXCH7Rns6eHcd3U0v4fc27gUzzn4eNDhjtOKX8YyMFnRsE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1592820463;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ckSkDl82RIG/nEfmO1G1NDCoB2UavNsKqSGbD3VcQL8=; 
 b=YEv+tOdwbMU/2hQhHJ6bmh/tpolYSuYuKA09jSKe/foth9E6GvnDJUCBbPZMALhYCEHRYYNoLloiElKj98wjgn4cWVS/QgzUlxaqRql0H7KfhIkLvdd09vjd7td1VPwIXvtPPJq9u+e1M+DstYZYDOv6S7SGPnQqJ1IK5PmJJmc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1592820460140147.3537947176353;
 Mon, 22 Jun 2020 03:07:40 -0700 (PDT)
Message-ID: <159282045857.26976.16461708676100945910@d1fd068a5071>
Subject: Re: [PATCH v2 00/16] Crazy shit around -global (pardon my french)
In-Reply-To: <20200622094227.1271650-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: armbru@redhat.com
Date: Mon, 22 Jun 2020 03:07:40 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 06:07:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDYyMjA5NDIyNy4xMjcx
NjUwLTEtYXJtYnJ1QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClN1YmplY3Q6IFtQQVRDSCB2MiAwMC8xNl0gQ3Jhenkgc2hpdCBhcm91bmQg
LWdsb2JhbCAocGFyZG9uIG15IGZyZW5jaCkKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAw
NjIyMDk0MjI3LjEyNzE2NTAtMS1hcm1icnVAcmVkaGF0LmNvbQoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhp
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KCkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVj
dC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDA2MjIwOTQyMjcuMTI3MTY1
MC0xLWFybWJydUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMDA2MjIwOTQyMjcuMTI3MTY1MC0x
LWFybWJydUByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZjAxMTZl
ZSBzZC9taWxreW1pc3QtbWVtY2FyZDogRml4IGVycm9yIEFQSSB2aW9sYXRpb24KM2NlMDViNCBz
ZC9weGEyeHhfbW1jaTogRG9uJ3QgY3Jhc2ggb24gcHhhMnh4X21tY2lfaW5pdCgpIGVycm9yCjdi
YjM4MmUgYXJtL2FzcGVlZDogRHJvcCBhc3BlZWRfYm9hcmRfaW5pdF9mbGFzaGVzKCkgcGFyYW1l
dGVyIEBlcnJwCjdmYzM5ZjggcWRldjogTWFrZSBxZGV2X3Byb3Bfc2V0X2RyaXZlKCkgbWF0Y2gg
dGhlIG90aGVyIGhlbHBlcnMKYTFiYWQ5MCBxZGV2OiBSZWplY3QgY2hhcmRldiBwcm9wZXJ0eSBv
dmVycmlkZQpiNzM3NjVlIHFkZXY6IFJlamVjdCBkcml2ZSBwcm9wZXJ0eSBvdmVycmlkZQozNDA3
MmFlIHFkZXY6IEltcHJvdmUgbmV0ZGV2IHByb3BlcnR5IG92ZXJyaWRlIGVycm9yIGEgYml0CmZh
NmJjM2UgcWRldjogRWxpbWluYXRlIGdldF9wb2ludGVyKCksIHNldF9wb2ludGVyKCkKMmUyMmFk
MiBibG9ja2RldjogRGVwcmVjYXRlIC1kcml2ZSB3aXRoIGJvZ3VzIGludGVyZmFjZSB0eXBlCjJm
ZGQ0ZjQgZG9jcy9xZGV2LWRldmljZS11c2UudHh0OiBVcGRhdGUgc2VjdGlvbiAiRGVmYXVsdCBE
ZXZpY2VzIgozYmI2MTMxIGZkYzogRGVwcmVjYXRlIGNvbmZpZ3VyaW5nIGZsb3BwaWVzIHdpdGgg
LWdsb2JhbCBpc2EtZmRjCjE0NDJlZjUgZmRjOiBPcGVuLWNvZGUgZmRjdHJsX2luaXRfaXNhKCkK
NmFiOWRjMiBmZGM6IFJlamVjdCBjbGFzaCBiZXR3ZWVuIC1kcml2ZSBpZj1mbG9wcHkgYW5kIC1n
bG9iYWwgaXNhLWZkYwowMGU2NGEyIGlvdGVzdHMvMTcyOiBDb3ZlciAtZ2xvYmFsIGZsb3BweS5k
cml2ZT0uLi4KNDBjMjg0NCBpb3Rlc3RzLzE3MjogQ292ZXIgZW1wdHkgZmlsZW5hbWUgYW5kIG11
bHRpcGxlIHVzZSBvZiBkcml2ZXMKYmE4NjhiYSBpb3Rlc3RzLzE3MjogSW5jbHVkZSAiaW5mbyBi
bG9jayIgaW4gdGVzdCBvdXRwdXQKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMTYgQ2hlY2tpbmcg
Y29tbWl0IGJhODY4YmFmNDRmNyAoaW90ZXN0cy8xNzI6IEluY2x1ZGUgImluZm8gYmxvY2siIGlu
IHRlc3Qgb3V0cHV0KQoyLzE2IENoZWNraW5nIGNvbW1pdCA0MGMyODQ0MmY1NDYgKGlvdGVzdHMv
MTcyOiBDb3ZlciBlbXB0eSBmaWxlbmFtZSBhbmQgbXVsdGlwbGUgdXNlIG9mIGRyaXZlcykKRVJS
T1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzQ4OiBGSUxFOiB0ZXN0cy9xZW11LWlvdGVzdHMvMTcy
Lm91dDoxOTA6CitUZXN0aW5nOiAtZmRiICQKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywg
ODYgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi8xNiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoK
My8xNiBDaGVja2luZyBjb21taXQgMDBlNjRhMmIxYTk5IChpb3Rlc3RzLzE3MjogQ292ZXIgLWds
b2JhbCBmbG9wcHkuZHJpdmU9Li4uKQo0LzE2IENoZWNraW5nIGNvbW1pdCA2YWI5ZGMyOTZkMDgg
KGZkYzogUmVqZWN0IGNsYXNoIGJldHdlZW4gLWRyaXZlIGlmPWZsb3BweSBhbmQgLWdsb2JhbCBp
c2EtZmRjKQo1LzE2IENoZWNraW5nIGNvbW1pdCAxNDQyZWY1YzFkYWQgKGZkYzogT3Blbi1jb2Rl
IGZkY3RybF9pbml0X2lzYSgpKQo2LzE2IENoZWNraW5nIGNvbW1pdCAzYmI2MTMxOGQ2MDcgKGZk
YzogRGVwcmVjYXRlIGNvbmZpZ3VyaW5nIGZsb3BwaWVzIHdpdGggLWdsb2JhbCBpc2EtZmRjKQo3
LzE2IENoZWNraW5nIGNvbW1pdCAyZmRkNGY0NWIzNTUgKGRvY3MvcWRldi1kZXZpY2UtdXNlLnR4
dDogVXBkYXRlIHNlY3Rpb24gIkRlZmF1bHQgRGV2aWNlcyIpCjgvMTYgQ2hlY2tpbmcgY29tbWl0
IDJlMjJhZDJjZjQwZCAoYmxvY2tkZXY6IERlcHJlY2F0ZSAtZHJpdmUgd2l0aCBib2d1cyBpbnRl
cmZhY2UgdHlwZSkKOS8xNiBDaGVja2luZyBjb21taXQgZmE2YmMzZWEwNDFmIChxZGV2OiBFbGlt
aW5hdGUgZ2V0X3BvaW50ZXIoKSwgc2V0X3BvaW50ZXIoKSkKMTAvMTYgQ2hlY2tpbmcgY29tbWl0
IDM0MDcyYWU4MjhjYSAocWRldjogSW1wcm92ZSBuZXRkZXYgcHJvcGVydHkgb3ZlcnJpZGUgZXJy
b3IgYSBiaXQpCjExLzE2IENoZWNraW5nIGNvbW1pdCBiNzM3NjVlMmQ4NmMgKHFkZXY6IFJlamVj
dCBkcml2ZSBwcm9wZXJ0eSBvdmVycmlkZSkKMTIvMTYgQ2hlY2tpbmcgY29tbWl0IGExYmFkOTBm
ZmZlYiAocWRldjogUmVqZWN0IGNoYXJkZXYgcHJvcGVydHkgb3ZlcnJpZGUpCjEzLzE2IENoZWNr
aW5nIGNvbW1pdCA3ZmMzOWY4NTU1YjEgKHFkZXY6IE1ha2UgcWRldl9wcm9wX3NldF9kcml2ZSgp
IG1hdGNoIHRoZSBvdGhlciBoZWxwZXJzKQoxNC8xNiBDaGVja2luZyBjb21taXQgN2JiMzgyZTMx
YmY0IChhcm0vYXNwZWVkOiBEcm9wIGFzcGVlZF9ib2FyZF9pbml0X2ZsYXNoZXMoKSBwYXJhbWV0
ZXIgQGVycnApCjE1LzE2IENoZWNraW5nIGNvbW1pdCAzY2UwNWI0ZTEwOGUgKHNkL3B4YTJ4eF9t
bWNpOiBEb24ndCBjcmFzaCBvbiBweGEyeHhfbW1jaV9pbml0KCkgZXJyb3IpCjE2LzE2IENoZWNr
aW5nIGNvbW1pdCBmMDExNmVlMTQxZWUgKHNkL21pbGt5bWlzdC1tZW1jYXJkOiBGaXggZXJyb3Ig
QVBJIHZpb2xhdGlvbikKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdp
dGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvMjAyMDA2MjIwOTQyMjcuMTI3MTY1MC0xLWFybWJydUByZWRoYXQuY29tL3Rlc3Rp
bmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRp
Y2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3Vy
IGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

