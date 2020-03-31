Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D278C199548
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 13:23:30 +0200 (CEST)
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJEzR-0007zf-Uu
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 07:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jJEyj-0007ae-60
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jJEyh-0004CR-JN
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:22:44 -0400
Resent-Date: Tue, 31 Mar 2020 07:22:44 -0400
Resent-Message-Id: <E1jJEyh-0004CR-JN@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21105)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jJEyh-0004BZ-Bi
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:22:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1585653748; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=X64Nwy48d0fY3VO8mF6nluyFD783m0UdLoWY0JW2GizFRUadux93xyjkX6a/kLka+dmtmXFx9LZo7vwhjnXnnyO3shBV0B16c9KrcFqrfojvCXtybf69epgxaMXP4zXEbdRJ7XrIRkOhBb6WDXRNOY+jzGQ0z9khRIYKbyEbfoc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1585653748;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=xZpbnTnwYVjG18EQRiC9N8I7idU6E6uBqlXiq1q13OE=; 
 b=E9Bu0xtls9Vg50PTTM/tyM/+HfsLQllw8CEQz92bT0JZoeJRWE8OGOghGwxE6G9KE+berrAtVml8Yf6ft1K2jz/Ts0eiMN2hCiPyAovzcEmQdcJSXmod13Vo8VMllWkGCpeU9r8Wwjf+9763oOMiBrgXsO85XPifX73GF+X4wS4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1585653746905288.07983564319363;
 Tue, 31 Mar 2020 04:22:26 -0700 (PDT)
In-Reply-To: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
Subject: Re: [PATCH v2 0/3] Improved reporting for migrate parameters
Message-ID: <158565374556.16271.8088136402741585223@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: maozhongyi@cmss.chinamobile.com
Date: Tue, 31 Mar 2020 04:22:26 -0700 (PDT)
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, maozhongyi@cmss.chinamobile.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNTg1NjQxMDgzLmdp
dC5tYW96aG9uZ3lpQGNtc3MuY2hpbmFtb2JpbGUuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZh
aWxlZCB0aGUgYXNhbiBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5k
cyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5
b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXItaW1hZ2Ut
ZmVkb3JhIFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBU
QVJHRVRfTElTVD14ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5v
cmcvbG9ncy9jb3Zlci4xNTg1NjQxMDgzLmdpdC5tYW96aG9uZ3lpQGNtc3MuY2hpbmFtb2JpbGUu
Y29tL3Rlc3RpbmcuYXNhbi8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9t
YXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5
b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

