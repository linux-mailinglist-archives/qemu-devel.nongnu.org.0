Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3EFB6170
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 12:29:01 +0200 (CEST)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAXCm-0005bi-Qz
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 06:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iAXAu-0004Ul-9E
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 06:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iAXAs-0004AM-KH
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 06:27:03 -0400
Resent-Date: Wed, 18 Sep 2019 06:27:03 -0400
Resent-Message-Id: <E1iAXAs-0004AM-KH@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21570)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iAXAs-00049U-BP
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 06:27:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568802402; cv=none; d=zoho.com; s=zohoarc; 
 b=aqksvawF8hbC+2YUFxjhguMDwEBWyxNwiz8tWIZP2+ZZ/+ExAUCnZrq1CvGhP4cYz2lnNHrf/1iOanPvemKZxRwJ9sncIwP37Ft2Q4zUfvyq/LYD5bxURzOaPAQ5CJBwybJFTqdklbYcfPtobfcP3NpAeS5y4wGGr3BYNZVokpA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1568802402;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=cEj7/5JPcJP27wtdxJni5CLvnpONZQSmD41nyX6ZX44=; 
 b=hNf/RcOQytpCoUYfgocIXBCISecJRWRNtqmRyPk70c3YIu7DYHVpLpWerdeHeK7q8nonUFzivA4T2iE/WmgqDXO/9CCdWPMm6BrdtO9vAi4gcUHcQpdXCQ+Cp7/N8xr3aPn1I+VO6uiZiNIZVVPpn6/ftACDhK0oKO72xxZMW9g=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1568802400598137.86275822804225;
 Wed, 18 Sep 2019 03:26:40 -0700 (PDT)
In-Reply-To: <1615bbe5-3033-3b76-5cfb-52e343dc4d67@freepascal.org>
Message-ID: <156880239966.17151.3547561892455591337@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pierre@freepascal.org
Date: Wed, 18 Sep 2019 03:26:40 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-devel] [PATCH] * include/fpu/softfloat.h
 (floatx80_invalid_encoding): Handle m68k specific infinity pattern.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE1YmJlNS0zMDMzLTNiNzYt
NWNmYi01MmUzNDNkYzRkNjdAZnJlZXBhc2NhbC5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hdICogaW5j
bHVkZS9mcHUvc29mdGZsb2F0LmggKGZsb2F0eDgwX2ludmFsaWRfZW5jb2RpbmcpOiBIYW5kbGUg
bTY4ayBzcGVjaWZpYyBpbmZpbml0eSBwYXR0ZXJuLgpNZXNzYWdlLWlkOiAxNjE1YmJlNS0zMDMz
LTNiNzYtNWNmYi01MmUzNDNkYzRkNjdAZnJlZXBhc2NhbC5vcmcKVHlwZTogc2VyaWVzCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9k
ZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNr
IGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3
LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMTkwOTE4MDk1MzM1
Ljc2NDYtMS1zdGVmYW5oYUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAxOTA5MTgwOTUzMzUuNzY0
Ni0xLXN0ZWZhbmhhQHJlZGhhdC5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDE5
MDkxODEwMDcwNi4xOTc1My0xLXBvbGV0YWV2QGlzcHJhcy5ydSAtPiBwYXRjaGV3LzIwMTkwOTE4
MTAwNzA2LjE5NzUzLTEtcG9sZXRhZXZAaXNwcmFzLnJ1ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5j
aCAndGVzdCcKMGUwZDM1MiAqIGluY2x1ZGUvZnB1L3NvZnRmbG9hdC5oIChmbG9hdHg4MF9pbnZh
bGlkX2VuY29kaW5nKTogSGFuZGxlIG02OGsgc3BlY2lmaWMgaW5maW5pdHkgcGF0dGVybi4KCj09
PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJldHdlZW4gZnVuY3Rp
b24gbmFtZSBhbmQgb3BlbiBwYXJlbnRoZXNpcyAnKCcKIzQ4OiBGSUxFOiBpbmNsdWRlL2ZwdS9z
b2Z0ZmxvYXQuaDo2OTM6CisjaWYgZGVmaW5lZCAoVEFSR0VUX002OEspCgpFUlJPUjogc3BhY2Ug
cHJvaGliaXRlZCBhZnRlciB0aGF0ICchJyAoY3R4OkJ4VykKIzUwOiBGSUxFOiBpbmNsdWRlL2Zw
dS9zb2Z0ZmxvYXQuaDo2OTU6CisgICAgICAgICAgICYmICghIGZsb2F0eDgwX2lzX2luZmluaXR5
KGEpKTsKICAgICAgICAgICAgICAgIF4KCkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6IGxp
bmUocykKCnRvdGFsOiAzIGVycm9ycywgMCB3YXJuaW5ncywgMTcgbGluZXMgY2hlY2tlZAoKQ29t
bWl0IDBlMGQzNTJkOTNkMiAoKiBpbmNsdWRlL2ZwdS9zb2Z0ZmxvYXQuaCAoZmxvYXR4ODBfaW52
YWxpZF9lbmNvZGluZyk6IEhhbmRsZSBtNjhrIHNwZWNpZmljIGluZmluaXR5IHBhdHRlcm4uKSBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFu
ZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRw
Oi8vcGF0Y2hldy5vcmcvbG9ncy8xNjE1YmJlNS0zMDMzLTNiNzYtNWNmYi01MmUzNDNkYzRkNjdA
ZnJlZXBhc2NhbC5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFp
bCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


