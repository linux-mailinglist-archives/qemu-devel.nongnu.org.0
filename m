Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BAE2D207E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 03:11:28 +0100 (CET)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmSTQ-0001hH-18
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 21:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kmSRu-0001A9-Mp
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 21:09:54 -0500
Resent-Date: Mon, 07 Dec 2020 21:09:54 -0500
Resent-Message-Id: <E1kmSRu-0001A9-Mp@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kmSRs-0005oV-3k
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 21:09:54 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607393385; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Kx1vh5LXVDWUKgZEdw8JXl/8wARqqUGKwItup0xG3UkQxIEVhGkX87BWNzJJD3T8yBuP5VHflVGrsLpJSoy2SsouiSsKJ0kh1kzeaLJZiaZmTQ66R5p2J21qRALK71dtO6abqnI9ZYBcYkI2zYmST12JLwKu8Pv8pye7PdxV0+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607393385;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=9hWQSne/MGCA40Ok0lFGq787vqZWzL0h2CW2hUIc+vc=; 
 b=Cp1SvkbSp5ITWHwwEChEon49orgOFJllX2BK+jkI3M1nWZhowIh90lYV37rtHFNyaOilyFl1PR9O8Aw+2mfWoIBz8IeaMJSnN76/lTTW35cBQUfCVBUnvKaVKODN8pg8NT1CtxqIPX4rnbocxqLpFPR5QP7tBxFl7QhOU0TLikM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607393384055839.0719824191199;
 Mon, 7 Dec 2020 18:09:44 -0800 (PST)
In-Reply-To: <20201208001727.17433-1-mcroce@linux.microsoft.com>
Subject: Re: [PATCH] linux-user: add option to chroot before emulation
Message-ID: <160739338277.32706.6809716255190298497@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mcroce@linux.microsoft.com
Date: Mon, 7 Dec 2020 18:09:44 -0800 (PST)
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIwODAwMTcyNy4xNzQz
My0xLW1jcm9jZUBsaW51eC5taWNyb3NvZnQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDEyMDgwMDE3
MjcuMTc0MzMtMS1tY3JvY2VAbGludXgubWljcm9zb2Z0LmNvbQpTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LXVzZXI6IGFkZCBvcHRpb24gdG8gY2hyb290IGJlZm9yZSBlbXVsYXRpb24KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9u
dWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5h
bGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFz
ZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2
NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJv
amVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDEyMDgwMDE3MjcuMTc0
MzMtMS1tY3JvY2VAbGludXgubWljcm9zb2Z0LmNvbSAtPiBwYXRjaGV3LzIwMjAxMjA4MDAxNzI3
LjE3NDMzLTEtbWNyb2NlQGxpbnV4Lm1pY3Jvc29mdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0Jwo5MzliMDFkIGxpbnV4LXVzZXI6IGFkZCBvcHRpb24gdG8gY2hyb290IGJlZm9y
ZSBlbXVsYXRpb24KCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBkbyBub3QgdXNlIGFzc2ln
bm1lbnQgaW4gaWYgY29uZGl0aW9uCiM2MjogRklMRTogbGludXgtdXNlci9tYWluLmM6NzA3Ogor
ICAgICAgICBpZiAoKGZwID0gZm9wZW4oIi9wcm9jL3N5cy92bS9tbWFwX21pbl9hZGRyIiwgInIi
KSkgIT0gTlVMTCkgewoKRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBu
YW1lIGFuZCBvcGVuIHBhcmVudGhlc2lzICcoJwojODg6IEZJTEU6IGxpbnV4LXVzZXIvbWFpbi5j
OjczMzoKKyAgICB0YXJnZXRfYXJndiA9IGNhbGxvYyh0YXJnZXRfYXJnYyArIDEsIHNpemVvZiAo
Y2hhciAqKSk7Cgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDE1OCBsaW5lcyBjaGVja2Vk
CgpDb21taXQgOTM5YjAxZDE2MzMwIChsaW51eC11c2VyOiBhZGQgb3B0aW9uIHRvIGNocm9vdCBi
ZWZvcmUgZW11bGF0aW9uKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBh
bnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhl
IG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVO
RCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlz
IGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMTIwODAwMTcyNy4xNzQz
My0xLW1jcm9jZUBsaW51eC5taWNyb3NvZnQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1t
ZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQ==

