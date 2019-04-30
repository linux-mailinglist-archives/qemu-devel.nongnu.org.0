Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E8FB23
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 16:11:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLTTT-0007uq-4X
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 10:11:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLTRW-0006kL-1u
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 10:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLTDs-0002wp-13
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:55:05 -0400
Resent-Date: Tue, 30 Apr 2019 09:55:05 -0400
Resent-Message-Id: <E1hLTDs-0002wp-13@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLTDp-0002ur-Vt; Tue, 30 Apr 2019 09:55:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556632485; cv=none; d=zoho.com; s=zohoarc; 
	b=cEhBEX5xwIi+yuphGGMbwsfpLJvwj8UqfsXJGp1EoLbMpSarEdttKYLb6RzTpOwy/So/P8Ig1SLMsKi2QHwZQU/gUfVbzL2AJ0thRExhcln4tikTtYxfzD2HMRRfdDNSx/EWejW6Zgaf8Rcf6pcNeHUqsMRhIWRQtMAKUtVC+Q8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556632485;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=akPmttkrhpCMDKMOJ6Jr+4nJtjfzBJP2nH7jkJFtT7k=; 
	b=Q7HQmm4s5NSb2ZHEsDpIJWHPUoCwAi4niaoxQ4usEOoiIaxKVB/7farrz1DgA7DQ1Y5abGgXn2qAUYGZHbnh6/oPg7nm27zUt+xYGKGJ6k7bIgAnpM/jcY22tRklS8ES0kSEMBlgvj5/ALxpAEFfb9Z0We+SuFGeFKulbi5xyKk=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556632483944211.20248062194958;
	Tue, 30 Apr 2019 06:54:43 -0700 (PDT)
In-Reply-To: <20190429105741.31033-1-kwolf@redhat.com>
Message-ID: <155663248155.10667.17447181616173672748@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kwolf@redhat.com
Date: Tue, 30 Apr 2019 06:54:43 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-devel] [PATCH] qcow2: Fix qcow2_make_empty() with
 external data file
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
	qemu-stable@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDQyOTEwNTc0MS4zMTAz
My0xLWt3b2xmQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5nd0BmZWRvcmEg
U0hPV19FTlY9MSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhl
IGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDQy
OTEwNTc0MS4zMTAzMy0xLWt3b2xmQHJlZGhhdC5jb20vdGVzdGluZy5kb2NrZXItbWluZ3dAZmVk
b3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQ
YXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sg
dG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


