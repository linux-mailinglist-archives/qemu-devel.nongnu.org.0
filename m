Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A91A1C4B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 09:08:36 +0200 (CEST)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jM4p9-0008SK-VP
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 03:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jM4oK-0007r7-6n
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 03:07:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jM4oI-0004uE-RW
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 03:07:44 -0400
Resent-Date: Wed, 08 Apr 2020 03:07:44 -0400
Resent-Message-Id: <E1jM4oI-0004uE-RW@eggs.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jM4oI-0004sI-Jo
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 03:07:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586329651; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YonYiJRh0ZAj8V0JQ4+Uu0eT9frB7lzPktWYasywW/rU9DIFU/kABJXRXYRls5VcbhSrOrqzUZ6kqoyGGuO1/fCUUpUNM4dH+4ZdS51hnqoUkzr4LOfFtxHHSxKGgNvEG8QMmPxLnj4YhS/cAf6+BmANwDaJFaMWJs3jJNLNaBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1586329651;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5s4JYVYKu8WZD40bMKml9gBRidEyCpxe0vd6hd0yiIQ=; 
 b=EhRk2sxPwFaZic3oO9fOCrzOmJWrXWIW/Rq0IYkQGR2g2+ijX2W7gQjrLLpNHjX2TS5Px9E//feW5w/qcwmq4KHtTyRMGxzTEo8xfbV5GWuRfN/ispJ8ysWEe3IRvnBgo0kqTt9i1Q+g8lYxKZ1lXQ9EwVmpVlXGDqnQjEN6mKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1586329648921464.68936813270307;
 Wed, 8 Apr 2020 00:07:28 -0700 (PDT)
In-Reply-To: <20200408070231.20265-1-cfontana@suse.de>
Subject: Re: [PATCH] Makefile: libfdt: build only the strict necessary
Message-ID: <158632964759.16886.4297640536520342286@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: cfontana@suse.de
Date: Wed, 8 Apr 2020 00:07:28 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.57
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, laurent@vivier.eu,
 cfontana@suse.de, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQwODA3MDIzMS4yMDI2
NS0xLWNmb250YW5hQHN1c2UuZGUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItcXVpY2tAY2VudG9zNyBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1jZW50b3M3IFY9MSBORVRX
T1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LXF1aWNrQGNlbnRvczcgU0hPV19FTlY9MSBKPTE0
IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
TWFrZWZpbGU6NTMyOiBkdGMvbGliZmR0L01ha2VmaWxlLmxpYmZkdDogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQpjYyAtbm9zdGRsaWIgIC1vIGR0Yy9saWJmZHQvTWFrZWZpbGUubGliZmR0Lm1v
IApjYzogZmF0YWwgZXJyb3I6IG5vIGlucHV0IGZpbGVzCmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQu
Cm1ha2U6ICoqKiBbZHRjL2xpYmZkdC9NYWtlZmlsZS5saWJmZHQubW9dIEVycm9yIDQKTWFrZWZp
bGU6NTMyOiBkdGMvbGliZmR0L01ha2VmaWxlLmxpYmZkdDogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeQogIExEICAgICAgZHRjL2xpYmZkdC9NYWtlZmlsZS5saWJmZHQubW8KY2M6IGZhdGFsIGVy
cm9yOiBubyBpbnB1dCBmaWxlcwpjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgptYWtlOiAqKiogW2R0
Yy9saWJmZHQvTWFrZWZpbGUubGliZmR0Lm1vXSBFcnJvciA0CgpyZWFsICAgIDBtMC40MTBzCnVz
ZXIgICAgMG0wLjIxNnMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRj
aGV3Lm9yZy9sb2dzLzIwMjAwNDA4MDcwMjMxLjIwMjY1LTEtY2ZvbnRhbmFAc3VzZS5kZS90ZXN0
aW5nLmRvY2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0
ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

