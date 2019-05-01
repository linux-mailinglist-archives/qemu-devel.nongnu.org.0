Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B49108C6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 16:06:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLpsp-0005Pr-VI
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 10:06:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLprd-0004fl-4i
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:05:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLprZ-0007lL-UW
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:05:37 -0400
Resent-Date: Wed, 01 May 2019 10:05:36 -0400
Resent-Message-Id: <E1hLprZ-0007lL-UW@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21447)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLprZ-0007kc-Mq
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:05:33 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556719493; cv=none; d=zoho.com; s=zohoarc; 
	b=FAJodsV3e/d2exKZ9vhui8Z0u6aze0khRmyaENC3fpEEBFx5kqDIGj8UzRuQXhcCB/vRyPKdcp0PE2MtwYsFmc+qlPaw6UekWl96uFwTZjcrLGFwU7+oNIc2PgJJg24HmwuBKj0AwXt6yZ5eEKja3h53Om+rj982YUgWtvf4yBA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556719493;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=1sVA1xwUoDM6BZis3ha8dQt06x0ggML6QuMXbf41ENw=; 
	b=KZ9VbpqK6Z6vMz7V44PB8Er5uWA0jQiA7O1qfLq/js/cZ4ryMCKBrJ57o8WuxzM8usfA70eOe7mG4E8Kjkhp4FdChbfvDCmpDsgAY8R8FLOHu8Kq+Q7cd0Jr3AiOx60g0QlEsuO0hk7pc+ncGxGu41SFJ5jBuP0UdqB4aHIX95E=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556719490786423.2821079595826;
	Wed, 1 May 2019 07:04:50 -0700 (PDT)
In-Reply-To: <20190429090250.7648-1-borntraeger@de.ibm.com>
Message-ID: <155671948930.10667.17588937283524246648@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: borntraeger@de.ibm.com
Date: Wed, 1 May 2019 07:04:50 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-devel] [PATCH v3 0/9] s390x: new guest features
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
Cc: fam@euphon.net, jjherne@linux.ibm.com, walling@linux.ibm.com,
	david@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
	pasic@linux.ibm.com, qemu-s390x@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDQyOTA5MDI1MC43NjQ4
LTEtYm9ybnRyYWVnZXJAZGUuaWJtLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhl
IGFzYW4gYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29tbWFuZHMgYW5kCnRo
ZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxlZCwgeW91IGNhbiBw
cm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRfTElT
VD14ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDE5MDQyOTA5MDI1MC43NjQ4LTEtYm9ybnRyYWVnZXJAZGUuaWJtLmNvbS90ZXN0aW5nLmFzYW4v
P3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNo
ZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBw
YXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


