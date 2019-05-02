Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F3110C8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 02:51:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLzwC-0003dl-HQ
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 20:51:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLzv2-0003AR-VD
	for qemu-devel@nongnu.org; Wed, 01 May 2019 20:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLzuz-0007BR-HF
	for qemu-devel@nongnu.org; Wed, 01 May 2019 20:49:47 -0400
Resent-Date: Wed, 01 May 2019 20:49:46 -0400
Resent-Message-Id: <E1hLzuz-0007BR-HF@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLzuu-000760-K2
	for qemu-devel@nongnu.org; Wed, 01 May 2019 20:49:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556758158; cv=none; d=zoho.com; s=zohoarc; 
	b=ZM8YiftnfuuyoaXwOSjqy8Ba06XWTOIy0IRQQDHmm8OZiC9AwCAOB8EJ6cLdxuCskj7lUYWP2QBLoc8c9UE5V4nPneGWG7mT4rfIZY1SxfBm6atpPbZbvKoaxzUW/3ERpsv2SDswbNnWwPpZ9kzMkL9t/99F5t/0+j1yYxXe1W4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556758158;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=EN2tPKsGKX9l8IPUAH4U+/K5pbL+a9QhCupVg60dJWk=; 
	b=TpbyqCf9X7q7a0G0XPTZm6m8k1pmeNs1sY/0oBmykqRQga8nGPH/sRacGsg9519QFJTZpUkGJmKYwzs99snzHXJgrDTU1xeDA+50ewlCx/FWhC+aHpxLNmbOY3VS3DerBaryc637XTnkHEfX4E/7HBnZ1ne0KE7WbEJ+osqKoqM=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556758157429681.5558773835613;
	Wed, 1 May 2019 17:49:17 -0700 (PDT)
In-Reply-To: <1556605301-44112-1-git-send-email-longpeng2@huawei.com>
Message-ID: <155675815611.10667.2665700417180707656@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: longpeng2@huawei.com
Date: Wed, 1 May 2019 17:49:17 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [PATCH v2] usb/xchi: avoid trigger assertion if
 guest write wrong epid
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
Cc: fam@euphon.net, longpeng2@huawei.com, arei.gonglei@huawei.com,
	kraxel@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTU2NjA1MzAxLTQ0MTEyLTEt
Z2l0LXNlbmQtZW1haWwtbG9uZ3BlbmcyQGh1YXdlaS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMg
ZmFpbGVkIHRoZSBkb2NrZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRo
ZSB0ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERv
Y2tlciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9
PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCnRpbWUgbWFrZSBkb2NrZXItdGVz
dC1taW5nd0BmZWRvcmEgU0hPV19FTlY9MSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5v
cmcvbG9ncy8xNTU2NjA1MzAxLTQ0MTEyLTEtZ2l0LXNlbmQtZW1haWwtbG9uZ3BlbmcyQGh1YXdl
aS5jb20vdGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFp
bCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


