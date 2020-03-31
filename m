Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C0199555
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 13:27:19 +0200 (CEST)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJF38-0002DX-Gu
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 07:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jJF2N-0001nK-7g
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jJF2M-0006nb-5P
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:26:31 -0400
Resent-Date: Tue, 31 Mar 2020 07:26:31 -0400
Resent-Message-Id: <E1jJF2M-0006nb-5P@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21127)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jJF2L-0006m1-U0
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:26:30 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1585653973; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cfFR0fzZc7rwoCPUEF2VcjhxNhQgL4I8Axi/BboeJl7fRc3v1pReVLe2+Gid/P64QCyMUZ+aQLCaUpssqrKE9Rd1DcJ1ysl+qbIYAnG46MNnQtjeU1SK1K1pVf5SXdPYfm0xoRiAwRHQ6iiTQ8zNbkT8+yW3tPHAXxGoimkDtTU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1585653973;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=E19w/Xo2NzADkFaGqmRlLD/AEKOQjScwJwX9zhAnHpo=; 
 b=lGMiL2cRSZzKRS2aDZuUaFXqRgDzCxV1ctVNsAJHuqypsmXnQ7RENG7nwWeLzgDX0wJPHfmTTBxhphtztnrcfB3ZWoHDdSP95P45bPq2sy6rtDSjq4/LTkFlF2QCN0bTVz8NfpH3SaK6CKgpG6PAthHyzc/oMD7bzWCHaaVmT+0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1585653971270130.91295420721258;
 Tue, 31 Mar 2020 04:26:11 -0700 (PDT)
In-Reply-To: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
Subject: Re: [PATCH v2 0/3] Improved reporting for migrate parameters
Message-ID: <158565397003.16271.18366238629798998968@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: maozhongyi@cmss.chinamobile.com
Date: Tue, 31 Mar 2020 04:26:11 -0700 (PDT)
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
aWxlZCBidWlsZCB0ZXN0IG9uIEZyZWVCU0QgaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMg
YmVsb3cuCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCiMgVGVzdGluZyBz
Y3JpcHQgd2lsbCBiZSBpbnZva2VkIHVuZGVyIHRoZSBnaXQgY2hlY2tvdXQgd2l0aAojIEhFQUQg
cG9pbnRpbmcgdG8gYSBjb21taXQgdGhhdCBoYXMgdGhlIHBhdGNoZXMgYXBwbGllZCBvbiB0b3Ag
b2YgImJhc2UiCiMgYnJhbmNoCmlmIHFlbXUtc3lzdGVtLXg4Nl82NCAtLWhlbHAgPi9kZXYvbnVs
bCAyPiYxOyB0aGVuCiAgUUVNVT1xZW11LXN5c3RlbS14ODZfNjQKZWxpZiAvdXNyL2xpYmV4ZWMv
cWVtdS1rdm0gLS1oZWxwID4vZGV2L251bGwgMj4mMTsgdGhlbgogIFFFTVU9L3Vzci9saWJleGVj
L3FlbXUta3ZtCmVsc2UKICBleGl0IDEKZmkKbWFrZSB2bS1idWlsZC1mcmVlYnNkIEo9MjEgUUVN
VT0kUUVNVQpleGl0IDAKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxvZyBp
cyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvY292ZXIuMTU4NTY0MTA4My5n
aXQubWFvemhvbmd5aUBjbXNzLmNoaW5hbW9iaWxlLmNvbS90ZXN0aW5nLkZyZWVCU0QvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=

