Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9266A1E4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 07:40:30 +0200 (CEST)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnGCT-00035g-BE
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 01:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hnGCC-0002T2-8E
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 01:40:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hnGC9-0008OF-TD
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 01:40:12 -0400
Resent-Date: Tue, 16 Jul 2019 01:40:11 -0400
Resent-Message-Id: <E1hnGC9-0008OF-TD@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21930)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hnGC7-0008MA-U8; Tue, 16 Jul 2019 01:40:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563255587; cv=none; d=zoho.com; s=zohoarc; 
 b=a4fHR4Sof+7f2isQwv1jbuHxrhwpYzELaz8ypA/4JfOb0NyYQaK0+b3CuRrWSjuvLeLMS8U8HSLodS85UCCgTpHvV0n/dfj39Cfr/wKSouRkBDSsav79NAfhDp+zUUahAZWtlY1koWUz6WNnrCMMO/+mfGgmJfJHezjDFA6XXuk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1563255587;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=RYzP2EYeDsr+A6et0/vMWIfaiMr1VkKLWdUOqyimhAs=; 
 b=HnVJHNd5ZdeKcVfKzAV1lS/CgQfQRP/4Bj5DG1N1RyU2OUmTriA/45VhM8+p7MwbtmWcpN451LnUxBQmMS+ACLO+6z4q5j5omHqDTvgXPiCkObbEjDzjkR3/h5hQ1uHvmDF5klc8gcgia1RBP+1nzPEqC8NWiTE6qtSNKKBTP6I=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1563255586925874.1086116503285;
 Mon, 15 Jul 2019 22:39:46 -0700 (PDT)
Message-ID: <156325558583.3080.11223516627356136517@c4a48874b076>
In-Reply-To: <20190716053522.78813-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: aik@ozlabs.ru
Date: Mon, 15 Jul 2019 22:39:46 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [RFC PATCH qemu] spapr: Stop providing RTAS blob
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcxNjA1MzUyMi43ODgx
My0xLWFpa0BvemxhYnMucnUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIGJ1aWxkIHRlc3Qg
b24gRnJlZUJTRCBob3N0LiBQbGVhc2UgZmluZCB0aGUgZGV0YWlscyBiZWxvdy4KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKIyBUZXN0aW5nIHNjcmlwdCB3aWxsIGJlIGlu
dm9rZWQgdW5kZXIgdGhlIGdpdCBjaGVja291dCB3aXRoCiMgSEVBRCBwb2ludGluZyB0byBhIGNv
bW1pdCB0aGF0IGhhcyB0aGUgcGF0Y2hlcyBhcHBsaWVkIG9uIHRvcCBvZiAiYmFzZSIKIyBicmFu
Y2gKaWYgcWVtdS1zeXN0ZW0teDg2XzY0IC0taGVscCA+L2Rldi9udWxsIDI+JjE7IHRoZW4KICBR
RU1VPXFlbXUtc3lzdGVtLXg4Nl82NAplbGlmIC91c3IvbGliZXhlYy9xZW11LWt2bSAtLWhlbHAg
Pi9kZXYvbnVsbCAyPiYxOyB0aGVuCiAgUUVNVT0vdXNyL2xpYmV4ZWMvcWVtdS1rdm0KZWxzZQog
IGV4aXQgMQpmaQptYWtlIHZtLWJ1aWxkLWZyZWVic2QgSj0yMSBRRU1VPSRRRU1VCmV4aXQgMAo9
PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDcxNjA1MzUyMi43ODgxMy0xLWFpa0BvemxhYnMu
cnUvdGVzdGluZy5GcmVlQlNELz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


