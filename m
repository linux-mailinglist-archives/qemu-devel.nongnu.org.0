Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B8D18898A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:55:52 +0100 (CET)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEEZL-0003hu-Hh
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jEEI1-0008IP-3F
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:37:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jEEHy-0003iy-Nj
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:37:56 -0400
Resent-Date: Tue, 17 Mar 2020 11:37:56 -0400
Resent-Message-Id: <E1jEEHy-0003iy-Nj@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jEEHy-0003XG-DQ
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:37:54 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1584459463; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H8pvayZtcNXHYib+FOP/efLy19Tn7pzYrBcFKeFTC/zxRI1hmpkzzI25yoxZkfPEGG68Eetj8B3L+ogGWVNwraNX4QaTQfWCKoyxFWrQy7Mc6PlsKlMtSlcwf6wzT+5VJwjyGPbQH0+mmNEN1rixds07NVxS3SeSQftl4c7zT+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1584459463;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=RM/Jku03U9xlfFrW+LwnSKWJkvAU/zukYxKapQTk/cE=; 
 b=ElutwA1EbrBPfauJhkZuf6HMDhccB+3zUaeAGqG7HnWN/SOe5VB1+O6FaZ1136uyqcdiK2rx/am65AQOr3JUWZV3NAcx3qaIvVEG/66lFGcUYEF++G7vl1mGM8AuBum0iYM/eVrgue1idsxQdAHl+lBZNIcquaF163je8WF0uDw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 158445946088653.02815593272385;
 Tue, 17 Mar 2020 08:37:40 -0700 (PDT)
In-Reply-To: <20200317135803.2682384-1-marcandre.lureau@redhat.com>
Subject: Re: [PATCH] slirp: update submodule to v4.2.0
Message-ID: <158445945964.25100.11060721921655386960@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Tue, 17 Mar 2020 08:37:40 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 samuel.thibault@ens-lyon.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMxNzEzNTgwMy4yNjgy
Mzg0LTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZh
aWxlZCB0aGUgZG9ja2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUg
dGVzdGluZyBjb21tYW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2Nr
ZXIgaW5zdGFsbGVkLCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojISAvYmluL2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1h
a2UgZG9ja2VyLWltYWdlLWZlZG9yYSBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVz
dC1taW5nd0BmZWRvcmEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAg
R0VOICAgICBody9pMzg2L3hlbi90cmFjZS5oCiAgQ0MgICAgICAvdG1wL3FlbXUtdGVzdC9idWls
ZC9zbGlycC9zcmMvdXRpbC5vCi90bXAvcWVtdS10ZXN0L3NyYy9zbGlycC9zcmMvc29ja2V0LmM6
IEluIGZ1bmN0aW9uICdzb3RyYW5zbGF0ZV9vdXQ2JzoKL3RtcC9xZW11LXRlc3Qvc3JjL3NsaXJw
L3NyYy9zb2NrZXQuYzo4NDM6NDc6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDIgb2YgJ2dldF9k
bnM2X2FkZHInIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJvcj1pbmNvbXBh
dGlibGUtcG9pbnRlci10eXBlc10KICAgICAgICAgcmV0dXJuIGdldF9kbnM2X2FkZHIoJnNpbi0+
c2luNl9hZGRyLCAmc2luLT5zaW42X3Njb3BlX2lkKSA+PSAwOwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC90bXAvcWVtdS10ZXN0L3NyYy9zbGlycC9zcmMvc29ja2V0LmM6NjoKLS0t
CiBpbnQgZ2V0X2RuczZfYWRkcihzdHJ1Y3QgaW42X2FkZHIgKnBkbnM2X2FkZHIsIHVpbnQzMl90
ICpzY29wZV9pZCk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIH5+fn5+fn5+fn5efn5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFz
IGVycm9ycwptYWtlWzFdOiAqKiogW01ha2VmaWxlOjQ0OiAvdG1wL3FlbXUtdGVzdC9idWlsZC9z
bGlycC9zcmMvc29ja2V0Lm9dIEVycm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4KICBHRU4gICAgIGh3L2lkZS90cmFjZS5oCiAgR0VOICAgICBody9pbnB1
dC90cmFjZS5oCi0tLQogICAgICAgICBERVAgZHRjLWxleGVyLmxleC5jCiAgICAgICAgQ0hLIHZl
cnNpb25fZ2VuLmgKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy90bXAvcWVtdS10ZXN0L3Ny
Yy9zbGlycCcKbWFrZTogKioqIFtNYWtlZmlsZTo1NTg6IHNsaXJwL2FsbF0gRXJyb3IgMgptYWtl
OiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgogICAgICAgIFVQRCB2ZXJzaW9u
X2dlbi5oCiAgICAgICAgIERFUCAvdG1wL3FlbXUtdGVzdC9zcmMvZHRjL3V0aWwuYwotLS0KICAg
IHJhaXNlIENhbGxlZFByb2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQpCnN1YnByb2Nlc3MuQ2FsbGVk
UHJvY2Vzc0Vycm9yOiBDb21tYW5kICdbJ3N1ZG8nLCAnLW4nLCAnZG9ja2VyJywgJ3J1bicsICct
LWxhYmVsJywgJ2NvbS5xZW11Lmluc3RhbmNlLnV1aWQ9ZjIwYWFiODVhZGFmNDE2NTg1MGY4Njhi
Mjc5NWRiZWYnLCAnLXUnLCAnMTAwMScsICctLXNlY3VyaXR5LW9wdCcsICdzZWNjb21wPXVuY29u
ZmluZWQnLCAnLS1ybScsICctZScsICdUQVJHRVRfTElTVD0nLCAnLWUnLCAnRVhUUkFfQ09ORklH
VVJFX09QVFM9JywgJy1lJywgJ1Y9JywgJy1lJywgJ0o9MTQnLCAnLWUnLCAnREVCVUc9JywgJy1l
JywgJ1NIT1dfRU5WPScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2NjYWNoZScsICctdics
ICcvaG9tZS9wYXRjaGV3Ly5jYWNoZS9xZW11LWRvY2tlci1jY2FjaGU6L3Zhci90bXAvY2NhY2hl
OnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWRnZzlpamlzL3NyYy9kb2Nr
ZXItc3JjLjIwMjAtMDMtMTctMTEuMzYuMTIuMjI1MzQ6L3Zhci90bXAvcWVtdTp6LHJvJywgJ3Fl
bXU6ZmVkb3JhJywgJy92YXIvdG1wL3FlbXUvcnVuJywgJ3Rlc3QtbWluZ3cnXScgcmV0dXJuZWQg
bm9uLXplcm8gZXhpdCBzdGF0dXMgMi4KZmlsdGVyPS0tZmlsdGVyPWxhYmVsPWNvbS5xZW11Lmlu
c3RhbmNlLnV1aWQ9ZjIwYWFiODVhZGFmNDE2NTg1MGY4NjhiMjc5NWRiZWYKbWFrZVsxXTogKioq
IFtkb2NrZXItcnVuXSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvdmFyL3Rt
cC9wYXRjaGV3LXRlc3Rlci10bXAtZGdnOWlqaXMvc3JjJwptYWtlOiAqKiogW2RvY2tlci1ydW4t
dGVzdC1taW5nd0BmZWRvcmFdIEVycm9yIDIKCnJlYWwgICAgMW0yNy44MTFzCnVzZXIgICAgMG04
LjA2OHMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzIwMjAwMzE3MTM1ODAzLjI2ODIzODQtMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20v
dGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5l
cmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

