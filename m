Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7DA10A0F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 17:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLrBc-0007MA-6b
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 11:30:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLrAI-0006k4-6M
	for qemu-devel@nongnu.org; Wed, 01 May 2019 11:29:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLrAF-00034U-5R
	for qemu-devel@nongnu.org; Wed, 01 May 2019 11:28:58 -0400
Resent-Date: Wed, 01 May 2019 11:28:58 -0400
Resent-Message-Id: <E1hLrAF-00034U-5R@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21567)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLrAE-00033l-RH
	for qemu-devel@nongnu.org; Wed, 01 May 2019 11:28:55 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556724503; cv=none; d=zoho.com; s=zohoarc; 
	b=N7YRC5sejBW2Rty48nrzIbEraeMpV+klr4S667vLjeMC/cDfjxxpSDGxpgHmEx5WUWZiyZWBDNVrixM8v0lZk3DphodjhWweWTr/uVQ8mtvgvkqHnMc34hf/oiabSHvR5PBSL5DHZWDaNKrSM8TI5YH/Y7jfO3og7buDgWZAkE4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556724503;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=fzsowCH0NtC5M2YsUNfMRTLecn0LrqW8XZlP8cgKc+s=; 
	b=NOgKM9Uqlt+ojHJgloAMZZZNlzrAn+Gh/1rxLyXDp7tW7JM2LIs1jNSDwSJKszaygGCmr+ujUBTffCfsAOaa/v0mwnzuQBeSG8yh2iwqgMZ73WlaTwqL12g60P4AATEhNbS35Vau5VqOkXcMhEyCRA3JqtITuWoom9E99WvxMs8=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556724500137111.31230978191024;
	Wed, 1 May 2019 08:28:20 -0700 (PDT)
In-Reply-To: <20190501144646.4851-1-berrange@redhat.com>
Message-ID: <155672449895.10667.13588345622933880325@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: berrange@redhat.com
Date: Wed, 1 May 2019 08:28:20 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-devel] [PATCH v2] linux-user: avoid string truncation
 warnings in uname field copying
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
Cc: fam@euphon.net, riku.voipio@iki.fi, qemu-devel@nongnu.org,
	laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDUwMTE0NDY0Ni40ODUx
LTEtYmVycmFuZ2VAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMTkwNTAxMTQ0NjQ2LjQ4NTEt
MS1iZXJyYW5nZUByZWRoYXQuY29tClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjJdIGxp
bnV4LXVzZXI6IGF2b2lkIHN0cmluZyB0cnVuY2F0aW9uIHdhcm5pbmdzIGluIHVuYW1lIGZpZWxk
IGNvcHlpbmcKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1w
YXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAz
YzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRo
dWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAgIHBh
dGNoZXcvMjAxOTA1MDExNDQ2NDYuNDg1MS0xLWJlcnJhbmdlQHJlZGhhdC5jb20gLT4gcGF0Y2hl
dy8yMDE5MDUwMTE0NDY0Ni40ODUxLTEtYmVycmFuZ2VAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBh
IG5ldyBicmFuY2ggJ3Rlc3QnCmI5N2ZhN2JlMzQgbGludXgtdXNlcjogYXZvaWQgc3RyaW5nIHRy
dW5jYXRpb24gd2FybmluZ3MgaW4gdW5hbWUgZmllbGQgY29weWluZwoKPT09IE9VVFBVVCBCRUdJ
TiA9PT0KRVJST1I6IHN1c3BlY3QgY29kZSBpbmRlbnQgZm9yIGNvbmRpdGlvbmFsIHN0YXRlbWVu
dHMgKDIsIDYpCiMzMTogRklMRTogbGludXgtdXNlci91bmFtZS5jOjc0OgogICBkbyB7IFwKKyAg
ICAgIG1lbWNweSgoZGVzdCksIChzcmMpLCBNSU4oc2l6ZW9mKHNyYyksIHNpemVvZihkZXN0KSkp
OyBcCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDExIGxpbmVzIGNoZWNrZWQKCkNvbW1p
dCBiOTdmYTdiZTM0NGUgKGxpbnV4LXVzZXI6IGF2b2lkIHN0cmluZyB0cnVuY2F0aW9uIHdhcm5p
bmdzIGluIHVuYW1lIGZpZWxkIGNvcHlpbmcpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwNTAx
MTQ0NjQ2LjQ4NTEtMS1iZXJyYW5nZUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==


