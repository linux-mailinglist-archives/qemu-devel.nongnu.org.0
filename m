Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2461327FC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 14:43:44 +0100 (CET)
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iop93-0005ws-P1
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 08:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54045)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1ionpK-0000O4-Ji
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:19:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1ionpJ-0005Ws-1r
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:19:14 -0500
Resent-Date: Tue, 07 Jan 2020 07:19:14 -0500
Resent-Message-Id: <E1ionpJ-0005Ws-1r@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21128)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1ionpI-0005W9-Ql
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:19:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1578399547; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aZ/6MGbdIjAMvAChHkYTq85qB++Kv/6o0qL+dt/b00K5wDvzeAOiKn8SEocEjLpxNRSJW7jgg8b5H6U6zmvaY0HXuR4tqQ+che+9SMLgGEKa2+PYpLnUrAFl9B/FwUj3pttVACQOGbvSJ2Z0/WJZOgUzdZaE24xxGtMVzp5QEqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1578399547;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=VFeE0qS0V3wIMZpM+vrvgjVEM03WL9U+KD5tBBHa3/U=; 
 b=II11BGsC/O/GWHBc6GgRvF5EpXXdPJ2gzxdQ39VLSJk6DfTJbwD3ZSX6F+ULXJTrPXX9KlsTSU6byOmoTR2E0Jul3F7boQAKdOZZdOLBWEMpY8mA92TaP21qOe4tYhmOAdr6EBpOHw4yYVZwNgTqmQ/gFkvaU105NKankOiJIPc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1578399543691908.881670630922;
 Tue, 7 Jan 2020 04:19:03 -0800 (PST)
In-Reply-To: <20200107112438.383958-1-stefanha@redhat.com>
Subject: Re: [PATCH] trace: update qemu-trace-stap to Python 3
Message-ID: <157839954315.764.8684392701288950117@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: stefanha@redhat.com
Date: Tue, 7 Jan 2020 04:19:03 -0800 (PST)
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDEwNzExMjQzOC4zODM5
NTgtMS1zdGVmYW5oYUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpOL0EuIEludGVybmFsIGVycm9yIHdoaWxlIHJlYWRpbmcgbG9nIGZpbGUK
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDIwMDEwNzExMjQzOC4zODM5NTgtMS1zdGVmYW5oYUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2tw
YXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


