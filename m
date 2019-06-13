Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F10444A63
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 20:10:07 +0200 (CEST)
Received: from localhost ([::1]:43308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbUAo-00062O-2L
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 14:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hbSeG-0004AJ-KD
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 12:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hbSX2-0004IV-Tp
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 12:24:58 -0400
Resent-Date: Thu, 13 Jun 2019 12:24:58 -0400
Resent-Message-Id: <E1hbSX2-0004IV-Tp@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21856)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hbSX2-000493-KO; Thu, 13 Jun 2019 12:24:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1560443042; cv=none; d=zoho.com; s=zohoarc; 
 b=cXVXPo7KU9MI1BpT53aZh6sQ0htqGaRbD5IBCQQ3QVrkMbksXnZhJdMTrwVg8ewo3dXC8YjgesWf8LCXhdsa3XoTgwSMZE3VqfA10JwpwW8hwmLDuVfoHLHZD0IkZ+EE9UPl6WzHDr2E7a+IaGrbc5DRLFt15x28lsIzxTWb7yE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1560443042;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=SIPSa9w/2D3hPbpt548JCaJV9rtZBueZ38gYb/Dfe9g=; 
 b=HmzUrB0wcLJvbG0spodyGCjBlFE7tGh0U+yk3R9ZfEwj+dQPI85J7/4c0I2Sc0b3aKPyQrCgYVHEAm1JhyV1aDJ+ppuIjOHidGy6E0agiL4nogZZHwIumBpKRUGgZxhfOOYYqAiLbf1JjfBX/vR4ke4vTSgJr00ZUmE4UevVzQs=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1560443040057463.79573770310844;
 Thu, 13 Jun 2019 09:24:00 -0700 (PDT)
In-Reply-To: <20190613132000.2146-1-ptoscano@redhat.com>
Message-ID: <156044303828.5426.699619794825925129@ce79690b2cb9>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ptoscano@redhat.com
Date: Thu, 13 Jun 2019 09:24:00 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-devel] [PATCH v9] ssh: switch from libssh2 to libssh
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org, sw@weilnetz.de,
 qemu-devel@nongnu.org, rjones@redhat.com, alex.bennee@linaro.org,
 mreitz@redhat.com, ptoscano@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDYxMzEzMjAwMC4yMTQ2
LTEtcHRvc2Nhbm9AcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhlIGFz
YW4gYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29tbWFuZHMgYW5kCnRoZWly
IG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxlZCwgeW91IGNhbiBwcm9i
YWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRfTElTVD14
ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5
MDYxMzEzMjAwMC4yMTQ2LTEtcHRvc2Nhbm9AcmVkaGF0LmNvbS90ZXN0aW5nLmFzYW4vP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=


