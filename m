Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A8D6B7E1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 10:09:21 +0200 (CEST)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnf04-0002gh-MS
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 04:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39393)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hnezq-0002DT-NR
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 04:09:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hnezp-00037B-GM
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 04:09:06 -0400
Resent-Date: Wed, 17 Jul 2019 04:09:06 -0400
Resent-Message-Id: <E1hnezp-00037B-GM@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hnezp-00034u-8Y; Wed, 17 Jul 2019 04:09:05 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563350937; cv=none; d=zoho.com; s=zohoarc; 
 b=QDrxC0JWAZEI4t3f6VQNtz13K5KH4ybmjaF1kLZUg0ZAD6q1/WbtO+fnii68nPWq7pu7pwv8BW8ijgZ05/iOHVFXWoXcYA2XwzKx3c4AjHSGrv3Qr5xxhzp5AiXRW3hDVuU84aFKGp/KlN90z9A7lu+0e48/m5KdvLklnIMNeDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1563350937;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=nlbJJRCp6OV+BjOdkmUhN775Vs1Io6E3qmUlJJfJJwA=; 
 b=Rn7yNNliK4/2vIyFwkY+7rIMLCHO2nhXmFazyn5DyV6bfkOGw0uQb3hTFoF9ETTqgG5e2ryR9gumWZkR3Rml7A9HD8WDPYP4UaCXN8+MObpRRKoAwOk664ATmX3U8rNvBlnJeMWyZCjvhKD6+O89B9GHc7rwHS7Lbki5jMVUtJ8=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1563350936599542.9323617370496;
 Wed, 17 Jul 2019 01:08:56 -0700 (PDT)
Message-ID: <156335093528.10055.12894271416870560792@c4a48874b076>
In-Reply-To: <20190716084240.17594-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Wed, 17 Jul 2019 01:08:56 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-devel] [PATCH] nbd: fix uninitialized variable warning
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
Cc: kwolf@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcxNjA4NDI0MC4xNzU5
NC0xLW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGFzYW4gYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29tbWFuZHMg
YW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxlZCwgeW91
IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtZmVkb3JhIFY9MSBORVRXT1JLPTEK
dGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRfTElTVD14ODZfNjQtc29m
dG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKICBDQyAgICAgIGF1
ZGlvL25vYXVkaW8ubwogIENDICAgICAgYXVkaW8vd2F2YXVkaW8ubwogIENDICAgICAgYXVkaW8v
bWl4ZW5nLm8KL3RtcC9xZW11LXRlc3Qvc3JjL2Jsb2NrL25iZC5jOjcxMDozMDogZXJyb3I6IHN1
Z2dlc3QgYnJhY2VzIGFyb3VuZCBpbml0aWFsaXphdGlvbiBvZiBzdWJvYmplY3QgWy1XZXJyb3Is
LVdtaXNzaW5nLWJyYWNlc10KICAgIE5CRFJlcGx5IGxvY2FsX3JlcGx5ID0geyAwLCB9OwogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7
fQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAxOTA3MTYwODQyNDAuMTc1OTQtMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20vdGVzdGlu
Zy5hc2FuLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBi
eSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJh
Y2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


