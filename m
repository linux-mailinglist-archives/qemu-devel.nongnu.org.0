Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17694318962
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:29:37 +0100 (CET)
Received: from localhost ([::1]:51290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAAC-0000M9-4q
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAA7q-0007rb-26; Thu, 11 Feb 2021 06:27:13 -0500
Resent-Date: Thu, 11 Feb 2021 06:27:10 -0500
Resent-Message-Id: <E1lAA7q-0007rb-26@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAA7n-0003Xd-LS; Thu, 11 Feb 2021 06:27:09 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613042807; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XiYPeHE4Q0FVldnixS5XXL+wF3W3aNkHBePhbIYLu8I2SuNJlpw10tSfqhOfnv5Ge9LJB4bMwO1YR3EyfWzeHG+gk6Dn60ajjk0ziP3jDH2yFArmGL7gU+EvjhzRT5GEWymPMae9JlMc11iWJPHNC9zGlvomygjtGUkIkpTrzRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613042807;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=HZsTvwMjWlMrnaHVxCoVw+OfnG9Z1YDRxareNnJnQ88=; 
 b=JaOzMY3zhkH/ALFcaLU0YH0sQ1+lLuUZ1Hdw9U7zgA3dDb6QCMMy2givD2fdh7HQ8wGkY/18iWnlGd5XPfmE065mSrIqQqEMe3lm612OBfebr3XA5D8swatmMznkOY6TUppbUDmI/Ebrxvbu6y9VoN9LgNzSvPdaFZbZOzDKARg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613042804674308.67111518446495;
 Thu, 11 Feb 2021 03:26:44 -0800 (PST)
In-Reply-To: <1612925152-20913-1-git-send-email-bmeng.cn@gmail.com>
Subject: Re: [PATCH v2] target/ppc: Add E500 L2CSR0 write helper
Message-ID: <161304280319.26113.534065437169980356@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: bmeng.cn@gmail.com
Date: Thu, 11 Feb 2021 03:26:44 -0800 (PST)
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
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjEyOTI1MTUyLTIwOTEzLTEt
Z2l0LXNlbmQtZW1haWwtYm1lbmcuY25AZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMTYxMjkyNTE1
Mi0yMDkxMy0xLWdpdC1zZW5kLWVtYWlsLWJtZW5nLmNuQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFU
Q0ggdjJdIHRhcmdldC9wcGM6IEFkZCBFNTAwIEwyQ1NSMCB3cml0ZSBoZWxwZXIKCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9u
dWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5h
bGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFz
ZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2
NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJv
amVjdC9xZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAyMTEwODUzMTguMjUw
Ny0xLWx1Y0BsbWljaGVsLmZyIC0+IHBhdGNoZXcvMjAyMTAyMTEwODUzMTguMjUwNy0xLWx1Y0Bs
bWljaGVsLmZyClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKCj09PSBPVVRQVVQgQkVH
SU4gPT09CmNoZWNrcGF0Y2gucGw6IG5vIHJldmlzaW9ucyByZXR1cm5lZCBmb3IgcmV2bGlzdCAn
YmFzZS4uJwo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2Rl
OiAyNTUKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzE2MTI5MjUxNTItMjA5MTMtMS1naXQtc2VuZC1lbWFpbC1ibWVuZy5jbkBnbWFpbC5jb20v
dGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

