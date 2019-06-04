Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F733D56
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 04:56:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXzcV-00007F-Ja
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 22:56:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hXzbS-0008BK-QD
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 22:55:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hXzbM-0003GF-2P
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 22:55:07 -0400
Resent-Date: Mon, 03 Jun 2019 22:55:05 -0400
Resent-Message-Id: <E1hXzbM-0003GF-2P@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hXzbJ-00034G-8o
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 22:55:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1559616864; cv=none; d=zoho.com; s=zohoarc; 
	b=ROB+l3YZ1/x1wtReoTh9pXgGNlGOdrldAhkmCC9P4uZn/jt946twy6bhtJEDVpE2Awjb6VCas7hoZ57pvizGgjQNipqbukgjyJvMdxPBRlAqgB46xxTKc7T7feVeFg964lA54or1YrlDEOHJeVNBn901bfLERUIJa2n/H7mUq1M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1559616864;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=cioNYSmRxsED7bMmbsy79bSqu+Nqf2V/aacyZO4bZ2o=; 
	b=nsvLzMuPH4cCIh95eBh4ZSNvKcKtZ2L9iVwXtNtFWCX3IVxdZtltUwNfp2a4INtK3kwpxr4yN0UmewR8jOCHvpZSvXrgga5ywERdDIaWv8VwGoPMKa9lONdH6Eet4AW7JSNbZEzfNqqBeX5Lx1O/PZw2ldU+rxcfeVfljYVR9go=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 155961686359079.60412347120541;
	Mon, 3 Jun 2019 19:54:23 -0700 (PDT)
In-Reply-To: <20190603232209.20704-1-richard.henderson@linaro.org>
Message-ID: <155961686273.32260.12082608759231945921@ce79690b2cb9>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Mon, 3 Jun 2019 19:54:23 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
	That's all we know.
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-devel] [PATCH v2] target/arm: Vectorize USHL and SSHL
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDYwMzIzMjIwOS4yMDcw
NC0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjJdIHRh
cmdldC9hcm06IFZlY3Rvcml6ZSBVU0hMIGFuZCBTU0hMClR5cGU6IHNlcmllcwpNZXNzYWdlLWlk
OiAyMDE5MDYwMzIzMjIwOS4yMDcwNC0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcKCj09
PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4g
L2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJh
Y2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpGcm9tIGh0dHBzOi8vZ2l0aHViLmNv
bS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3
LzIwMTkwNjAzMjMyMjA5LjIwNzA0LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBw
YXRjaGV3LzIwMTkwNjAzMjMyMjA5LjIwNzA0LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
ZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjRlODFkZGY4MzAgdGFyZ2V0L2FybTog
VmVjdG9yaXplIFVTSEwgYW5kIFNTSEwKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiB0cmFp
bGluZyBzdGF0ZW1lbnRzIHNob3VsZCBiZSBvbiBuZXh0IGxpbmUKIzE2MDogRklMRTogdGFyZ2V0
L2FybS90cmFuc2xhdGUuYzo1Mzc3OgorICAgICAgICAgICAgY2FzZSAyOiBnZW5fdXNobF9pMzIo
dmFyLCB2YXIsIHNoaWZ0KTsgYnJlYWs7CgpFUlJPUjogdHJhaWxpbmcgc3RhdGVtZW50cyBzaG91
bGQgYmUgb24gbmV4dCBsaW5lCiMxNjc6IEZJTEU6IHRhcmdldC9hcm0vdHJhbnNsYXRlLmM6NTM4
MzoKKyAgICAgICAgICAgIGNhc2UgMjogZ2VuX3NzaGxfaTMyKHZhciwgdmFyLCBzaGlmdCk7IGJy
ZWFrOwoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCA1NzAgbGluZXMgY2hlY2tlZAoKQ29t
bWl0IDRlODFkZGY4MzA0YSAodGFyZ2V0L2FybTogVmVjdG9yaXplIFVTSEwgYW5kIFNTSEwpIGhh
cyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMK
YXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNI
RUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5k
IGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6
Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwNjAzMjMyMjA5LjIwNzA0LTEtcmljaGFyZC5oZW5kZXJz
b25AbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


