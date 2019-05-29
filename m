Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C14E2DC3C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 13:54:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVxA1-0001Xd-NQ
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 07:54:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hVx8K-0000sk-Ex
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hVx8J-0003KP-Dv
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:52:40 -0400
Resent-Date: Wed, 29 May 2019 07:52:40 -0400
Resent-Message-Id: <E1hVx8J-0003KP-Dv@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hVx8J-000381-75
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:52:39 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1559130693; cv=none; d=zoho.com; s=zohoarc; 
	b=L8jAAqKJ8sfxpACLwxLCU7PI+vHVBsjW6/gYimnrtswMRUNbFbBEHRavI0UDEu+rva7HDgOT2dkqq68pgio1ikhOP5vbnc9ybQWKUIGkOV+M+fQC4Ny1+NyYH43J9gz31Zy52epg+NgHWoYe3cQBwkj1Ta6lW1UYXKQ/547SAYI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1559130693;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=ykE6n/0iynkevXV7q2xtgFj3wc3Oifd/yn5vEh/7CVU=; 
	b=XRUKS0TIYupIRk21Mw+DVjiCAAbxbr8Z8ZV5lyrJaS89i4Je7w/DGWAGapm880w0LmRWRLGNbbzvQmvHgmcO8Wp6FXbvPJDyUO7cynaM0VJOwuFNYvrQkbbOgA8Eixm8T9tEF/glfbGSjB7knCpi+ICc9y+Bb5stxgTpSqIYJT0=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 155913068979487.70905596810871;
	Wed, 29 May 2019 04:51:29 -0700 (PDT)
In-Reply-To: <20190529114624.23107-1-dplotnikov@virtuozzo.com>
Message-ID: <155913068852.9187.17807984451087577082@ce79690b2cb9>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: dplotnikov@virtuozzo.com
Date: Wed, 29 May 2019 04:51:29 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [PATCH v2] qemu-io: add pattern file for write
 command
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
Cc: kwolf@redhat.com, den@virtuozzo.com, qemu-block@nongnu.org,
	qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDUyOTExNDYyNC4yMzEw
Ny0xLWRwbG90bmlrb3ZAdmlydHVvenpvLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQQVRDSCB2Ml0gcWVtdS1p
bzogYWRkIHBhdHRlcm4gZmlsZSBmb3Igd3JpdGUgY29tbWFuZApUeXBlOiBzZXJpZXMKTWVzc2Fn
ZS1pZDogMjAxOTA1MjkxMTQ2MjQuMjMxMDctMS1kcGxvdG5pa292QHZpcnR1b3p6by5jb20KCj09
PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4g
L2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJh
Y2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpGcm9tIGh0dHBzOi8vZ2l0aHViLmNv
bS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3
LzIwMTkwNTI5MTE0NjI0LjIzMTA3LTEtZHBsb3RuaWtvdkB2aXJ0dW96em8uY29tIC0+IHBhdGNo
ZXcvMjAxOTA1MjkxMTQ2MjQuMjMxMDctMS1kcGxvdG5pa292QHZpcnR1b3p6by5jb20KU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwozYjdmNzcyNmQ3IHFlbXUtaW86IGFkZCBwYXR0ZXJu
IGZpbGUgZm9yIHdyaXRlIGNvbW1hbmQKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBNaXNz
aW5nIFNpZ25lZC1vZmYtYnk6IGxpbmUocykKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywg
MTA3IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCAzYjdmNzcyNmQ3ZDQgKHFlbXUtaW86IGFkZCBwYXR0
ZXJuIGZpbGUgZm9yIHdyaXRlIGNvbW1hbmQpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwNTI5
MTE0NjI0LjIzMTA3LTEtZHBsb3RuaWtvdkB2aXJ0dW96em8uY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


