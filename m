Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4765919CAEB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 22:18:40 +0200 (CEST)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK6IR-0000f3-9b
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 16:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jK6GT-0006TA-P9
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 16:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jK6GS-0002pS-I3
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 16:16:37 -0400
Resent-Date: Thu, 02 Apr 2020 16:16:37 -0400
Resent-Message-Id: <E1jK6GS-0002pS-I3@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jK6GS-0002on-A7
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 16:16:36 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1585858584; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XxQ359Cr+i+o3b2PRpioTajBZp8x6jq7ooRfMdx58PDa5NRTq57P6JHm4No+4r8d8guMs/JPAd6K2dLLGVO08hcCbNS+0fTxwcKZCjqZNrERPJA27HXawmdAWpoxMGzFaD6WeP1EkDOk/wIE93F3yYn+m3xeHmhnuCb3UqNnRvM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1585858584;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=mXiNMTfooofH0sgs+zJXVzHor5vOjClr059qNRh2tmc=; 
 b=T8NWknSP7HhsVtMzbMzWqohgS6q/IgpjqsZIBnoUnuSrD4rxIQP0uIQG28gSKWvd3KdqzNTNhszaFpyZWQwvXPsMPI30cLHQebRabQXiCn8SY0eh3YUBNquRNLoIYd/40XNrgFcKphCdAY/2dFQB2LfdIeYqrvMUPRf6AYA8oww=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1585858581889278.2772090645607;
 Thu, 2 Apr 2020 13:16:21 -0700 (PDT)
In-Reply-To: <20200402182848.GA3023@simran-Inspiron-5558>
Subject: Re: [PATCH v3] qobject: json-streamer: Change bracket_count to
 brace_count
Message-ID: <158585858131.23425.765643023734333118@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: singhalsimran0@gmail.com
Date: Thu, 2 Apr 2020 13:16:21 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: stefanha@gmail.com, jusual@mail.ru, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQwMjE4Mjg0OC5HQTMw
MjNAc2ltcmFuLUluc3Bpcm9uLTU1NTgvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBk
b2NrZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNv
bW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxs
ZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhIC9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXIt
aW1hZ2UtZmVkb3JhIFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1pbmd3QGZl
ZG9yYSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDQwMjE4Mjg0
OC5HQTMwMjNAc2ltcmFuLUluc3Bpcm9uLTU1NTgvdGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3Jh
Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRj
aGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

