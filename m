Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D417F36CE8C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 00:20:32 +0200 (CEST)
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbW4F-00077g-TG
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 18:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbW2x-0006di-N6; Tue, 27 Apr 2021 18:19:11 -0400
Resent-Date: Tue, 27 Apr 2021 18:19:11 -0400
Resent-Message-Id: <E1lbW2x-0006di-N6@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbW2t-0001Dn-3j; Tue, 27 Apr 2021 18:19:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619561931; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gdvsSOhKptWzaWiJqW1LscT4gHOPJAjiqnvRXxKccL8QYgnlTK+6jgm+tUXfCQcO7b29NJWSWn9MrTbCJszQ226ejVXgYTRP4BWAvx28IOMEumsklcqZzeS/8yDrSVahqODMxyIuZnRMP+CiowTJ+pLF5eiLtA+KlY2s/Z1pQZA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619561931;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=v6RkTrXAdIvJaH+M3BUs5lFn4aMHSv9fze6SBqmAl9g=; 
 b=K2qs+thRc116kkL4wZNmwmHy2doki94YsjmFix2bVIxXkDiUvsT8SUqoNO/IRaJLPP0jM8pYEsZ3rYEPrF241tMCvxR6f0Vc7ogwjH+QEPhK19OwMUUU+E0USs7qfmarjFBCD1922QlvZgf7abgrclVektA+ipdCaAMSfelisQo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619561930050124.44847682593752;
 Tue, 27 Apr 2021 15:18:50 -0700 (PDT)
In-Reply-To: <20210427220615.12763-1-space.monkey.delivers@gmail.com>
Subject: Re: [PATCH v8 0/6] RISC-V Pointer Masking implementation
Message-ID: <161956192844.28712.8301554068785204832@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: baturo.alexey@gmail.com
Date: Tue, 27 Apr 2021 15:18:50 -0700 (PDT)
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, space.monkey.delivers@gmail.com,
 Alistair.Francis@wdc.com, kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQyNzIyMDYxNS4xMjc2
My0xLXNwYWNlLm1vbmtleS5kZWxpdmVyc0BnbWFpbC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMg
c2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxv
dyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDQy
NzIyMDYxNS4xMjc2My0xLXNwYWNlLm1vbmtleS5kZWxpdmVyc0BnbWFpbC5jb20KU3ViamVjdDog
W1BBVENIIHY4IDAvNl0gUklTQy1WIFBvaW50ZXIgTWFza2luZyBpbXBsZW1lbnRhdGlvbgoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAv
ZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFj
ayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4
NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hl
dy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDQyNzIyMDYx
NS4xMjc2My0xLXNwYWNlLm1vbmtleS5kZWxpdmVyc0BnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDIx
MDQyNzIyMDYxNS4xMjc2My0xLXNwYWNlLm1vbmtleS5kZWxpdmVyc0BnbWFpbC5jb20KU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwowZDNjMDM4IEFsbG93IGV4cGVyaW1lbnRhbCBKLWV4
dCB0byBiZSB0dXJuZWQgb24KMmU4YjAyMyBJbXBsZW1lbnQgYWRkcmVzcyBtYXNraW5nIGZ1bmN0
aW9ucyByZXF1aXJlZCBmb3IgUklTQy1WIFBvaW50ZXIgTWFza2luZyBleHRlbnNpb24KOWNmNmNm
MCBTdXBwb3J0IHBvaW50ZXIgbWFza2luZyBmb3IgUklTQy1WIGZvciBpL2MvZi9kL2EgdHlwZXMg
b2YgaW5zdHJ1Y3Rpb25zCjU4M2VhOGEgUHJpbnQgbmV3IFBNIENTUnMgaW4gUUVNVSBsb2dzCmQ2
NzRhNmQgU3VwcG9ydCBDU1JzIHJlcXVpcmVkIGZvciBSSVNDLVYgUE0gZXh0ZW5zaW9uIGV4Y2Vw
dCBmb3IgdGhlIGgtbW9kZQo4Zjc3N2I0IEFkZCBKLWV4dGVuc2lvbiBpbnRvIFJJU0MtVgoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KMS82IENoZWNraW5nIGNvbW1pdCA4Zjc3N2I0MjU3NDkgKEFkZCBK
LWV4dGVuc2lvbiBpbnRvIFJJU0MtVikKMi82IENoZWNraW5nIGNvbW1pdCBkNjc0YTZkYzgzODgg
KFN1cHBvcnQgQ1NScyByZXF1aXJlZCBmb3IgUklTQy1WIFBNIGV4dGVuc2lvbiBleGNlcHQgZm9y
IHRoZSBoLW1vZGUpCkVSUk9SOiBvcGVuIGJyYWNlICd7JyBmb2xsb3dpbmcgZnVuY3Rpb24gZGVj
bGFyYXRpb25zIGdvIG9uIHRoZSBuZXh0IGxpbmUKIzE1MTogRklMRTogdGFyZ2V0L3Jpc2N2L2Nz
ci5jOjE5MzoKK3N0YXRpYyBpbnQgcG9pbnRlcl9tYXNraW5nKENQVVJJU0NWU3RhdGUgKmVudiwg
aW50IGNzcm5vKSB7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMzg2OiBGSUxF
OiB0YXJnZXQvcmlzY3YvY3NyLmM6MTcyNDoKKyAgICBbQ1NSX1VNVEVdICAgID0gICAgeyAidW10
ZSIsICAgIHBvaW50ZXJfbWFza2luZywgcmVhZF91bXRlLCAgICB3cml0ZV91bXRlICAgIH0sCgpX
QVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMzg3OiBGSUxFOiB0YXJnZXQvcmlzY3Yv
Y3NyLmM6MTcyNToKKyAgICBbQ1NSX1VQTU1BU0tdID0gICAgeyAidXBtbWFzayIsIHBvaW50ZXJf
bWFza2luZywgcmVhZF91cG1tYXNrLCB3cml0ZV91cG1tYXNrIH0sCgpXQVJOSU5HOiBsaW5lIG92
ZXIgODAgY2hhcmFjdGVycwojMzg4OiBGSUxFOiB0YXJnZXQvcmlzY3YvY3NyLmM6MTcyNjoKKyAg
ICBbQ1NSX1VQTUJBU0VdID0gICAgeyAidXBtYmFzZSIsIHBvaW50ZXJfbWFza2luZywgcmVhZF91
cG1iYXNlLCB3cml0ZV91cG1iYXNlIH0sCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVy
cwojMzkwOiBGSUxFOiB0YXJnZXQvcmlzY3YvY3NyLmM6MTcyODoKKyAgICBbQ1NSX01NVEVdICAg
ID0gICAgeyAibW10ZSIsICAgIHBvaW50ZXJfbWFza2luZywgcmVhZF9tbXRlLCAgICB3cml0ZV9t
bXRlICAgIH0sCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMzkxOiBGSUxFOiB0
YXJnZXQvcmlzY3YvY3NyLmM6MTcyOToKKyAgICBbQ1NSX01QTU1BU0tdID0gICAgeyAibXBtbWFz
ayIsIHBvaW50ZXJfbWFza2luZywgcmVhZF9tcG1tYXNrLCB3cml0ZV9tcG1tYXNrIH0sCgpXQVJO
SU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMzkyOiBGSUxFOiB0YXJnZXQvcmlzY3YvY3Ny
LmM6MTczMDoKKyAgICBbQ1NSX01QTUJBU0VdID0gICAgeyAibXBtYmFzZSIsIHBvaW50ZXJfbWFz
a2luZywgcmVhZF9tcG1iYXNlLCB3cml0ZV9tcG1iYXNlIH0sCgpXQVJOSU5HOiBsaW5lIG92ZXIg
ODAgY2hhcmFjdGVycwojMzk0OiBGSUxFOiB0YXJnZXQvcmlzY3YvY3NyLmM6MTczMjoKKyAgICBb
Q1NSX1NNVEVdICAgID0gICAgeyAic210ZSIsICAgIHBvaW50ZXJfbWFza2luZywgcmVhZF9zbXRl
LCAgICB3cml0ZV9zbXRlICAgIH0sCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwoj
Mzk1OiBGSUxFOiB0YXJnZXQvcmlzY3YvY3NyLmM6MTczMzoKKyAgICBbQ1NSX1NQTU1BU0tdID0g
ICAgeyAic3BtbWFzayIsIHBvaW50ZXJfbWFza2luZywgcmVhZF9zcG1tYXNrLCB3cml0ZV9zcG1t
YXNrIH0sCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMzk2OiBGSUxFOiB0YXJn
ZXQvcmlzY3YvY3NyLmM6MTczNDoKKyAgICBbQ1NSX1NQTUJBU0VdID0gICAgeyAic3BtYmFzZSIs
IHBvaW50ZXJfbWFza2luZywgcmVhZF9zcG1iYXNlLCB3cml0ZV9zcG1iYXNlIH0sCgp0b3RhbDog
MSBlcnJvcnMsIDkgd2FybmluZ3MsIDM2MiBsaW5lcyBjaGVja2VkCgpQYXRjaCAyLzYgaGFzIHN0
eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUg
ZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQ
QVRDSCBpbiBNQUlOVEFJTkVSUy4KCjMvNiBDaGVja2luZyBjb21taXQgNTgzZWE4YTAyNmE2IChQ
cmludCBuZXcgUE0gQ1NScyBpbiBRRU1VIGxvZ3MpCjQvNiBDaGVja2luZyBjb21taXQgOWNmNmNm
MGE2N2Y5IChTdXBwb3J0IHBvaW50ZXIgbWFza2luZyBmb3IgUklTQy1WIGZvciBpL2MvZi9kL2Eg
dHlwZXMgb2YgaW5zdHJ1Y3Rpb25zKQo1LzYgQ2hlY2tpbmcgY29tbWl0IDJlOGIwMjM3NzI0OSAo
SW1wbGVtZW50IGFkZHJlc3MgbWFza2luZyBmdW5jdGlvbnMgcmVxdWlyZWQgZm9yIFJJU0MtViBQ
b2ludGVyIE1hc2tpbmcgZXh0ZW5zaW9uKQo2LzYgQ2hlY2tpbmcgY29tbWl0IDBkM2MwMzg3YjFi
YiAoQWxsb3cgZXhwZXJpbWVudGFsIEotZXh0IHRvIGJlIHR1cm5lZCBvbikKPT09IE9VVFBVVCBF
TkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBp
cyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA0MjcyMjA2MTUuMTI3
NjMtMS1zcGFjZS5tb25rZXkuZGVsaXZlcnNAZ21haWwuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/
dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

