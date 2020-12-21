Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5832DF766
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 02:09:10 +0100 (CET)
Received: from localhost ([::1]:43316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr9hF-0000RG-Ux
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 20:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kr9gJ-0008HZ-86; Sun, 20 Dec 2020 20:08:11 -0500
Resent-Date: Sun, 20 Dec 2020 20:08:11 -0500
Resent-Message-Id: <E1kr9gJ-0008HZ-86@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kr9gG-0001rU-KX; Sun, 20 Dec 2020 20:08:10 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1608512810; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Bzt7U2FrMLf4tJAsYbgVCgCE/CWkhRXl1v6Rj8VfXVV0YFI5FxoQ0dxAXg2KKaLQYlcN25Bc9lGHMHdf1+bcU5tv5hNQDagwoTyxu3YPvEn1Vv4QMP8kic2eDtrtCMFTfmln0yYQ2ksiTTMcOgKu/PicvoMtNtqQeoCntQyRkn0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1608512810;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=xReZONDBf5BtZhWqmLZ11SYiyUn/9i5TlxMjjJ4rZ4Q=; 
 b=KeS1lmdPlI4qgVkih7cymb3D0sPXXQmXe2kXVKqSbSwrKmnqPcmGgc8NZfQZHgn8wayFtZWmxWNDiXa4iRaaOGxobi0f8nC2mvmi8/GQp+7q5OymL2vBoqsfXrsKBP92VxKigG5jezRDkKjuklXXecxDZeBGyLGZc83nRqo727g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1608512807934794.4072788246411;
 Sun, 20 Dec 2020 17:06:47 -0800 (PST)
In-Reply-To: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 0/9] Alpine Linux build fix and CI pipeline
Message-ID: <160851280526.21294.6201442635975331015@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jiaxun.yang@flygoat.com
Date: Sun, 20 Dec 2020 17:06:47 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, thuth@redhat.com,
 viktor.prutyanov@phystech.edu, kvm@vger.kernel.org, qemu-block@nongnu.org,
 lvivier@redhat.com, alex.bennee@linaro.org, alistair@alistair23.me,
 qemu-devel@nongnu.org, wainersm@redhat.com, groug@kaod.org,
 qemu-ppc@nongnu.org, pbonzini@redhat.com, mreitz@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIyMTAwNTMxOC4xMTg2
Ni0xLWppYXh1bi55YW5nQGZseWdvYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDEyMjEwMDUzMTgu
MTE4NjYtMS1qaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC85XSBBbHBp
bmUgTGludXggYnVpbGQgZml4IGFuZCBDSSBwaXBlbGluZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICog
W25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTIyMTAwNTMxOC4xMTg2Ni0xLWppYXh1bi55
YW5nQGZseWdvYXQuY29tIC0+IHBhdGNoZXcvMjAyMDEyMjEwMDUzMTguMTE4NjYtMS1qaWF4dW4u
eWFuZ0BmbHlnb2F0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjEwMDk1YTkg
Z2l0bGFiLWNpOiBBZGQgYWxwaW5lIHRvIHBpcGVsaW5lCmExNzdhZjMgdGVzdHM6IFJlbmFtZSBQ
QUdFX1NJWkUgZGVmaW5pdGlvbnMKNWZjYjBlZCBhY2NlbC9rdm06IGF2b2lkIHVzaW5nIHByZWRl
ZmluZWQgUEFHRV9TSVpFCmU3ZmViZGYgaHcvYmxvY2svbmFuZDogUmVuYW1lIFBBR0VfU0laRSB0
byBOQU5EX1BBR0VfU0laRQpiYTMwN2Q1IGVsZjJkbXA6IFJlbmFtZSBQQUdFX1NJWkUgdG8gRUxG
MkRNUF9QQUdFX1NJWkUKMGNjZjkyYiBsaWJ2aG9zdC11c2VyOiBJbmNsdWRlIHBvbGwuaCBpbnN0
ZWFkIG9mIHN5cy9wb2xsLmgKNDFhMTBkYiBjb25maWd1cmUvbWVzb246IE9ubHkgY2hlY2sgc3lz
L3NpZ25hbC5oIG9uIG5vbi1MaW51eAowYmNkMmYyIGNvbmZpZ3VyZTogQWRkIHN5cy90aW1leC5o
IHRvIHByb2JlIGNsa19hZGp0aW1lCmExNmM3ZmYgdGVzdHMvZG9ja2VyOiBBZGQgZG9ja2VyZmls
ZSBmb3IgQWxwaW5lIExpbnV4Cgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzkgQ2hlY2tpbmcgY29t
bWl0IGExNmM3ZmY3ZDg1OSAodGVzdHMvZG9ja2VyOiBBZGQgZG9ja2VyZmlsZSBmb3IgQWxwaW5l
IExpbnV4KQpXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1B
SU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiMyMDogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3Rh
bDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDU2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvOSBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgoyLzkgQ2hlY2tpbmcgY29tbWl0IDBiY2QyZjJlYWU4NCAo
Y29uZmlndXJlOiBBZGQgc3lzL3RpbWV4LmggdG8gcHJvYmUgY2xrX2FkanRpbWUpCjMvOSBDaGVj
a2luZyBjb21taXQgNDFhMTBkYmRjOGRhIChjb25maWd1cmUvbWVzb246IE9ubHkgY2hlY2sgc3lz
L3NpZ25hbC5oIG9uIG5vbi1MaW51eCkKNC85IENoZWNraW5nIGNvbW1pdCAwY2NmOTJiOGVjMzcg
KGxpYnZob3N0LXVzZXI6IEluY2x1ZGUgcG9sbC5oIGluc3RlYWQgb2Ygc3lzL3BvbGwuaCkKNS85
IENoZWNraW5nIGNvbW1pdCBiYTMwN2Q1YTUxYWEgKGVsZjJkbXA6IFJlbmFtZSBQQUdFX1NJWkUg
dG8gRUxGMkRNUF9QQUdFX1NJWkUpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM2
OTogRklMRTogY29udHJpYi9lbGYyZG1wL21haW4uYzoyODQ6CisgICAgICAgIGguUGh5c2ljYWxN
ZW1vcnlCbG9jay5OdW1iZXJPZlBhZ2VzICs9IHBzLT5ibG9ja1tpXS5zaXplIC8gRUxGMkRNUF9Q
QUdFX1NJWkU7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNzk6IEZJTEU6IGNv
bnRyaWIvZWxmMmRtcC9tYWluLmM6MjkxOgorICAgIGguUmVxdWlyZWREdW1wU3BhY2UgKz0gaC5Q
aHlzaWNhbE1lbW9yeUJsb2NrLk51bWJlck9mUGFnZXMgPDwgRUxGMkRNUF9QQUdFX0JJVFM7Cgp0
b3RhbDogMCBlcnJvcnMsIDIgd2FybmluZ3MsIDcwIGxpbmVzIGNoZWNrZWQKClBhdGNoIDUvOSBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo2LzkgQ2hlY2tpbmcgY29tbWl0IGU3ZmViZGYwYjA1
NiAoaHcvYmxvY2svbmFuZDogUmVuYW1lIFBBR0VfU0laRSB0byBOQU5EX1BBR0VfU0laRSkKRVJS
T1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMjY6IEZJTEU6IGh3L2Jsb2Nr
L25hbmQuYzoxMTc6CisjIGRlZmluZSBQQUdFX1NUQVJUKHBhZ2UpXkkoUEFHRShwYWdlKSAqIChO
QU5EX1BBR0VfU0laRSArIE9PQl9TSVpFKSkkCgpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5l
dmVyIHVzZSB0YWJzCiM0NjogRklMRTogaHcvYmxvY2svbmFuZC5jOjEzNDoKKyMgZGVmaW5lIE5B
TkRfUEFHRV9TSVpFXkleSTIwNDgkCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwoj
NjU6IEZJTEU6IGh3L2Jsb2NrL25hbmQuYzo2ODQ6CisgICAgICAgIG1lbV9hbmQoaW9idWYgKyAo
c29mZiB8IG9mZiksIHMtPmlvLCBNSU4ocy0+aW9sZW4sIE5BTkRfUEFHRV9TSVpFIC0gb2ZmKSk7
CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNzA6IEZJTEU6IGh3L2Jsb2NrL25h
bmQuYzo2ODc6CisgICAgICAgICAgICBtZW1fYW5kKHMtPnN0b3JhZ2UgKyAocGFnZSA8PCBPT0Jf
U0hJRlQpLCBzLT5pbyArIE5BTkRfUEFHRV9TSVpFIC0gb2ZmLAoKdG90YWw6IDIgZXJyb3JzLCAy
IHdhcm5pbmdzLCAxMjAgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNi85IGhhcyBzdHlsZSBwcm9ibGVt
cywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0
aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJ
TlRBSU5FUlMuCgo3LzkgQ2hlY2tpbmcgY29tbWl0IDVmY2IwZWQxMzMxYSAoYWNjZWwva3ZtOiBh
dm9pZCB1c2luZyBwcmVkZWZpbmVkIFBBR0VfU0laRSkKOC85IENoZWNraW5nIGNvbW1pdCBhMTc3
YWYzMzkzOGQgKHRlc3RzOiBSZW5hbWUgUEFHRV9TSVpFIGRlZmluaXRpb25zKQo5LzkgQ2hlY2tp
bmcgY29tbWl0IDEwMDk1YTkyNjQzZCAoZ2l0bGFiLWNpOiBBZGQgYWxwaW5lIHRvIHBpcGVsaW5l
KQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIw
MTIyMTAwNTMxOC4xMTg2Ni0xLWppYXh1bi55YW5nQGZseWdvYXQuY29tL3Rlc3RpbmcuY2hlY2tw
YXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

