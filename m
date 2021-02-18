Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113A31EADC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:23:08 +0100 (CET)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkCx-0002PA-JA
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCk9N-0007v2-It
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:19:25 -0500
Resent-Date: Thu, 18 Feb 2021 09:19:25 -0500
Resent-Message-Id: <E1lCk9N-0007v2-It@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCk9G-0000hz-CO
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:19:25 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613657927; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H+a9pIX9N3ugOELpNKDKV4E3HteDk0MFCEWTjEsDnelw3NSDwODjqtasNvjFf5Fuw30yAZk5hRvWnHJ86n1KBQ3/GO9ZEO989wJuZR23yUtizb8yHe01FuBQencsL5vBKwgCn5KYWw4YtCyOsKQMtI/C5terSZLvy+z/BmanPwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613657927;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=40JHU4sz6ZzKEGefEXDM4uji56tRwhpsHSK11Kl9UEw=; 
 b=JALNv87EN8tnKERTHoQOq/E+uuou0OwkZP929BbcPvQ9VrCbZLJ8GfuvVH9YJe6tU8Xx5w1pir1lJDQqz6/SCtY/IBGmgdh98Bi1CMEQHSYFu1Nl4SP+g9vhyW+eo6c4oaxhCnbZ0xo6yZxQ4EO7unXI1H60MZidLXHs7bgedrw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613657925051998.7930904847981;
 Thu, 18 Feb 2021 06:18:45 -0800 (PST)
In-Reply-To: <20210218140629.373646-1-ppandit@redhat.com>
Subject: Re: [PATCH] net: eepro100: validate various address values
Message-ID: <161365792335.24024.13908309385345308385@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ppandit@redhat.com
Date: Thu, 18 Feb 2021 06:18:45 -0800 (PST)
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
Cc: sw@weilnetz.de, jasowang@redhat.com, bugs-syssec@rub.de,
 qemu-devel@nongnu.org, pjp@fedoraproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxODE0MDYyOS4zNzM2
NDYtMS1wcGFuZGl0QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIxODE0MDYyOS4zNzM2
NDYtMS1wcGFuZGl0QHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIXSBuZXQ6IGVlcHJvMTAwOiB2
YWxpZGF0ZSB2YXJpb3VzIGFkZHJlc3MgdmFsdWVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3
IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMjE4MTQwNjI5LjM3MzY0Ni0xLXBwYW5kaXRAcmVk
aGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMjE4MTQwNjI5LjM3MzY0Ni0xLXBwYW5kaXRAcmVkaGF0
LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjFjY2NjMmQgbmV0OiBlZXBybzEw
MDogdmFsaWRhdGUgdmFyaW91cyBhZGRyZXNzIHZhbHVlcwoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
RVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBvcGVuIHBh
cmVudGhlc2lzICcoJwojMzA6IEZJTEU6IGh3L25ldC9lZXBybzEwMC5jOjg0NzoKKyAgICAgICAg
YXNzZXJ0IChzLT5jYl9hZGRyZXNzID49IHMtPmN1X2Jhc2UpOwoKdG90YWw6IDEgZXJyb3JzLCAw
IHdhcm5pbmdzLCAzNiBsaW5lcyBjaGVja2VkCgpDb21taXQgMWNjY2MyZDdjN2RhIChuZXQ6IGVl
cHJvMTAwOiB2YWxpZGF0ZSB2YXJpb3VzIGFkZHJlc3MgdmFsdWVzKSBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBj
b2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcv
bG9ncy8yMDIxMDIxODE0MDYyOS4zNzM2NDYtMS1wcGFuZGl0QHJlZGhhdC5jb20vdGVzdGluZy5j
aGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVl
ZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

