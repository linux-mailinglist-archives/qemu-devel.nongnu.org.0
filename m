Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E35AF42F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 04:16:18 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7sB7-0003Ay-9H
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 22:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1i7s9o-0002Xh-D8
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 22:14:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1i7s9m-0004PE-MT
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 22:14:55 -0400
Resent-Date: Tue, 10 Sep 2019 22:14:55 -0400
Resent-Message-Id: <E1i7s9m-0004PE-MT@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1i7s9m-0004Mq-FA
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 22:14:54 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568168051; cv=none; d=zoho.com; s=zohoarc; 
 b=fHOnz7cuHHhlKrroXI6/iRsOrpjHMtL0cJcAYeE+NRPVPgKHstvEJzUBw54BdYXjUadVar3ViRC14ubMm34DIVXSTJxWYCB74OVcSK94WbNyXFsOMIrtgGGD6rgSWXyP4gDkCa58uDZsJGGuyHg/22YT1mLNP5p9sCk8BdCjLzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1568168051;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=LKZ5E61NqnvO2sDXazGqJqm57Hcci4BsOgtC+nECWOQ=; 
 b=km3yGJkBinfKJsBNmx3cHRZy9ccEXFudZ8ZcgH01EO3Jlq1hqlu0avqTC/J/OOcin0WtySZOcc9PTlUrDb/8E45hu+vpfFWQQz2SssCNApgX6Kvzty1TDJ+fY+dolpV4Qd9AZOVdm5ySvlS+pcjF/PxVWJPfKtGRDRpmanKDjjI=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1568168050456261.1518125603784;
 Tue, 10 Sep 2019 19:14:10 -0700 (PDT)
In-Reply-To: <20190910193347.16000-1-laurent@vivier.eu>
Message-ID: <156816804837.15929.13324903728599030505@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: laurent@vivier.eu
Date: Tue, 10 Sep 2019 19:14:10 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.54
Subject: Re: [Qemu-devel] [PATCH v11 0/9] hw/m68k: add Apple Machintosh
 Quadra 800 machine
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org, huth@tuxfamily.org,
 jasowang@redhat.com, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 dgilbert@redhat.com, hpoussin@reactos.org, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, mreitz@redhat.com,
 aurelien@aurel32.net, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkxMDE5MzM0Ny4xNjAw
MC0xLWxhdXJlbnRAdml2aWVyLmV1LwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIIHYxMSAwLzldIGh3L202OGs6
IGFkZCBBcHBsZSBNYWNoaW50b3NoIFF1YWRyYSA4MDAgbWFjaGluZQpNZXNzYWdlLWlkOiAyMDE5
MDkxMDE5MzM0Ny4xNjAwMC0xLWxhdXJlbnRAdml2aWVyLmV1ClR5cGU6IHNlcmllcwoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2
L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwox
NjFlODRkIGh3L202OGs6IGRlZmluZSBNYWNpbnRvc2ggUXVhZHJhIDgwMAo4ZTAxNGFlIGh3L202
OGs6IGFkZCBhIGR1bW15IFNXSU0gZmxvcHB5IGNvbnRyb2xsZXIKNDhiNDEzZiBody9tNjhrOiBh
ZGQgTnVidXMgc3VwcG9ydCBmb3IgbWFjZmIgdmlkZW8gY2FyZApjODVhOWQwIGh3L202OGs6IGFk
ZCBOdWJ1cyBzdXBwb3J0CjJhOWM4MTEgaHcvbTY4azogYWRkIG1hY2ZiIHZpZGVvIGNhcmQKZGQ2
ZjQ4NSBody9tNjhrOiBpbXBsZW1lbnQgQURCIGJ1cyBzdXBwb3J0IGZvciB2aWEKOTYyZmIxOSBo
dy9tNjhrOiBhZGQgdmlhIHN1cHBvcnQKYmYyYjVjZCBkcDgzOTN4OiBtYW5hZ2UgYmlnIGVuZGlh
biBidXMKYjlmMGIzNCBlc3A6IGFkZCBwc2V1ZG8tRE1BIGFzIHVzZWQgYnkgTWFjaW50b3NoCgo9
PT0gT1VUUFVUIEJFR0lOID09PQoxLzkgQ2hlY2tpbmcgY29tbWl0IGI5ZjBiMzQ1MzZhNiAoZXNw
OiBhZGQgcHNldWRvLURNQSBhcyB1c2VkIGJ5IE1hY2ludG9zaCkKMi85IENoZWNraW5nIGNvbW1p
dCBiZjJiNWNkYzBlZGQgKGRwODM5M3g6IG1hbmFnZSBiaWcgZW5kaWFuIGJ1cykKMy85IENoZWNr
aW5nIGNvbW1pdCA5NjJmYjE5NmI1MjEgKGh3L202OGs6IGFkZCB2aWEgc3VwcG9ydCkKV0FSTklO
RzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVk
IHVwZGF0aW5nPwojNzc6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKRVJST1I6IHNwYWNlIHByb2hp
Yml0ZWQgYWZ0ZXIgdGhhdCAnJiYnIChjdHg6V3hXKQojNDI2OiBGSUxFOiBody9taXNjL21hY192
aWEuYzozNDU6CisgICAgICAgIGlmICghKHYxcy0+bGFzdF9iICYgVklBMUJfdlJUQ0NsaykgJiYg
KHMtPmIgJiBWSUExQl92UlRDQ2xrKSkgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4KCnRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgODY3IGxpbmVzIGNo
ZWNrZWQKClBhdGNoIDMvOSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBh
bnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhl
IG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKNC85IENoZWNraW5n
IGNvbW1pdCBkZDZmNDg1OGZhN2IgKGh3L202OGs6IGltcGxlbWVudCBBREIgYnVzIHN1cHBvcnQg
Zm9yIHZpYSkKNS85IENoZWNraW5nIGNvbW1pdCAyYTljODExNjMyZWEgKGh3L202OGs6IGFkZCBt
YWNmYiB2aWRlbyBjYXJkKQpXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMp
LCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiM2ODogCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDUxOCBsaW5lcyBjaGVja2VkCgpQYXRj
aCA1LzkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KNi85IENoZWNraW5nIGNvbW1pdCBjODVh
OWQwZDkwYTAgKGh3L202OGs6IGFkZCBOdWJ1cyBzdXBwb3J0KQpXQVJOSU5HOiBhZGRlZCwgbW92
ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiM2
MjogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDUz
MiBsaW5lcyBjaGVja2VkCgpQYXRjaCA2LzkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2
aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0
aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KNy85
IENoZWNraW5nIGNvbW1pdCA0OGI0MTNmYjAxY2MgKGh3L202OGs6IGFkZCBOdWJ1cyBzdXBwb3J0
IGZvciBtYWNmYiB2aWRlbyBjYXJkKQo4LzkgQ2hlY2tpbmcgY29tbWl0IDhlMDE0YWVhMzkzNyAo
aHcvbTY4azogYWRkIGEgZHVtbXkgU1dJTSBmbG9wcHkgY29udHJvbGxlcikKV0FSTklORzogYWRk
ZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0
aW5nPwojNTM6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5p
bmdzLCA1OTEgbGluZXMgY2hlY2tlZAoKUGF0Y2ggOC85IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCjkvOSBDaGVja2luZyBjb21taXQgMTYxZTg0ZDMyOGJjIChody9tNjhrOiBkZWZpbmUgTWFj
aW50b3NoIFF1YWRyYSA4MDApCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUo
cyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzcwOiAKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgNTE4IGxpbmVzIGNoZWNrZWQKClBh
dGNoIDkvOSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDkxMDE5MzM0Ny4xNjAwMC0xLWxhdXJl
bnRAdml2aWVyLmV1L3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9d
LgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


