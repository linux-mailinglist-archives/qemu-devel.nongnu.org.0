Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC9E321499
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:59:39 +0100 (CET)
Received: from localhost ([::1]:53734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8wE-0005fF-6w
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lE8uz-0004UC-4K
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:58:21 -0500
Resent-Date: Mon, 22 Feb 2021 05:58:21 -0500
Resent-Message-Id: <E1lE8uz-0004UC-4K@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lE8uw-0007tu-M9
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:58:20 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613991468; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bWE6JzblTWWXh3m7AfDutk/Auuh6/a/iQFA2U3T2LQ40AFDK6dpN+cM6oAQzNFgE3vOVqP1Go1Siv5QKrUA3bNfRuKO5LPp334o5lFlQyBIPVTpiWwUop+eInKedwEoJYODO3a7obHQDVH4/2R2VDy4W/Irbt+yjCx20gfuA4Ao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613991468;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=VaPk+6I2M/M4r3QG28C8888Gb2/iUakInaRxUwXAr7g=; 
 b=O4SV8z7LR3p48hpSyRSq2Q1CMMjKEMoig/w7xl7diOH2ewgjqJRQFCSRkWabbC8M2FmXqxtjqp9NXxlJt/sbCJOAv1GLNZC1X7ta91e/mLNLCR3cXSNLpZI6RTDh7glmba3a0HiRh8Cm+yVi6gtbqjwTgcOhmVtdknMGDDo3cXg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613991465294857.229039639904;
 Mon, 22 Feb 2021 02:57:45 -0800 (PST)
In-Reply-To: <20210222105004.1642234-1-laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
Message-ID: <161399146394.21706.5667576356611037897@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: laurent@vivier.eu
Date: Mon, 22 Feb 2021 02:57:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: deller@gmx.de, glaubitz@physik.fu-berlin.de, mjt@tls.msk.ru,
 qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIyMjEwNTAwNC4xNjQy
MjM0LTEtbGF1cmVudEB2aXZpZXIuZXUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIyMjEwNTAwNC4xNjQy
MjM0LTEtbGF1cmVudEB2aXZpZXIuZXUKU3ViamVjdDogW1BBVENIXSBsaW51eC11c2VyOiBtYW5h
Z2UgYmluZm10LW1pc2MgcHJlc2VydmUtYXJnWzBdIGZsYWcKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAt
IFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAyMTkxODQ1NTYuMTU0OTcyLTEtYmVycmFu
Z2VAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMjE5MTg0NTU2LjE1NDk3Mi0xLWJlcnJhbmdl
QHJlZGhhdC5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDIyMjEwNTAwNC4x
NjQyMjM0LTEtbGF1cmVudEB2aXZpZXIuZXUgLT4gcGF0Y2hldy8yMDIxMDIyMjEwNTAwNC4xNjQy
MjM0LTEtbGF1cmVudEB2aXZpZXIuZXUKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwph
MTAzNWMxIGxpbnV4LXVzZXI6IG1hbmFnZSBiaW5mbXQtbWlzYyBwcmVzZXJ2ZS1hcmdbMF0gZmxh
ZwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiMx
OTU6IEZJTEU6IHNjcmlwdHMvcWVtdS1iaW5mbXQtY29uZi5zaDozNDE6CitvcHRpb25zPSQoZ2V0
b3B0IC1vIGRzOlE6UzplOmhjOnA6ZzogLWwgZGViaWFuLHN5c3RlbWQ6LHFlbXUtcGF0aDoscWVt
dS1zdWZmaXg6LGV4cG9ydGRpcjosaGVscCxjcmVkZW50aWFsOixwZXJzaXN0ZW50OixwcmVzZXJ2
ZS1hcmd2MDogLS0gIiRAIikKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTI3IGxpbmVz
IGNoZWNrZWQKCkNvbW1pdCBhMTAzNWMxMzk4MzggKGxpbnV4LXVzZXI6IG1hbmFnZSBiaW5mbXQt
bWlzYyBwcmVzZXJ2ZS1hcmdbMF0gZmxhZykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2
aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0
aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBm
dWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAyMjIx
MDUwMDQuMTY0MjIzNC0xLWxhdXJlbnRAdml2aWVyLmV1L3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==

