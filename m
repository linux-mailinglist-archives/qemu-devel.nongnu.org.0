Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD30109AC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 16:55:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLqdy-0000WS-MS
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 10:55:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLqax-0007X0-SV
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:52:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLqau-00054L-Q6
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:52:27 -0400
Resent-Date: Wed, 01 May 2019 10:52:27 -0400
Resent-Message-Id: <E1hLqau-00054L-Q6@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLqau-000541-IO
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:52:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556722317; cv=none; d=zoho.com; s=zohoarc; 
	b=SRbJy8hu6vxAv+nRvK1TFbp4l8d2W1dFK2eDMyU+X5ziSQYe4gQbR2tKP0OIa/1PBbBGw4QZN+J2QbTgCEbu0XwD/7EwrqnAQH+L9x/ShsEDMj8FXUXXMZSHHrz693j9KrxCA9VqSLFx0jBvC6Nejn79W26Yd1BtsMqsYKj9Ovs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556722317;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=lSj9XTGcfI8MgpAYwrQ2tLku3IsaAuJTyZz8Mq5uni4=; 
	b=G0O3RNLvAlx7COKwzH1Y/PjdPzEcjJTn2Si0EWin/PLQIrtPtjqynvLGYaRC7SAkyrs4J7ylbpyNpgSHK2gItEIV5n+mByGUmbRegxG/o5/HJTQDrgaAAggV36vseTXxJGtQndI9ruql5kJGGcKlE5R4bfibJRcMyPARdxZqms8=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556722315451938.9508098438077;
	Wed, 1 May 2019 07:51:55 -0700 (PDT)
In-Reply-To: <20190501144646.4851-1-berrange@redhat.com>
Message-ID: <155672231431.10667.14581824699579804342@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: berrange@redhat.com
Date: Wed, 1 May 2019 07:51:55 -0700 (PDT)
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
dWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgICAgICAgIHBh
dGNoZXcvMjAxOTA1MDExNDQ2NDYuNDg1MS0xLWJlcnJhbmdlQHJlZGhhdC5jb20gLT4gcGF0Y2hl
dy8yMDE5MDUwMTE0NDY0Ni40ODUxLTEtYmVycmFuZ2VAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBh
IG5ldyBicmFuY2ggJ3Rlc3QnCmMwOGI1ZWQzMDYgbGludXgtdXNlcjogYXZvaWQgc3RyaW5nIHRy
dW5jYXRpb24gd2FybmluZ3MgaW4gdW5hbWUgZmllbGQgY29weWluZwoKPT09IE9VVFBVVCBCRUdJ
TiA9PT0KRVJST1I6IHN1c3BlY3QgY29kZSBpbmRlbnQgZm9yIGNvbmRpdGlvbmFsIHN0YXRlbWVu
dHMgKDIsIDYpCiMzMDogRklMRTogbGludXgtdXNlci91bmFtZS5jOjc0OgogICBkbyB7IFwKKyAg
ICAgIG1lbWNweSgoZGVzdCksIChzcmMpLCBNSU4oc2l6ZW9mKHNyYyksIHNpemVvZihkZXN0KSkp
OyBcCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDExIGxpbmVzIGNoZWNrZWQKCkNvbW1p
dCBjMDhiNWVkMzA2NzQgKGxpbnV4LXVzZXI6IGF2b2lkIHN0cmluZyB0cnVuY2F0aW9uIHdhcm5p
bmdzIGluIHVuYW1lIGZpZWxkIGNvcHlpbmcpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwNTAx
MTQ0NjQ2LjQ4NTEtMS1iZXJyYW5nZUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==


