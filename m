Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E49AF59E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 08:12:29 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7vrg-00083d-Et
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 02:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1i7vqb-0007SJ-Rv
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:11:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1i7vqa-00060V-PS
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:11:21 -0400
Resent-Date: Wed, 11 Sep 2019 02:11:21 -0400
Resent-Message-Id: <E1i7vqa-00060V-PS@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21964)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1i7vqa-000606-HT
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:11:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568182248; cv=none; d=zoho.com; s=zohoarc; 
 b=hsWq855nRhjOB29V2ey/E3NvDXG1iRDvOX8BRRwIVUXrvBePbUh1hIOR0spC7Mt6u9HtEu1jP0ArNqZKMLIVxP+wb90wIRZbHoRUSkWzXPjjARh2W8B7ntoT1kPixCmxvGCCk55B5u8dptf3LAR5mpNr14aKrhIto/oJSRHtX8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1568182248;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=iIhb9rISYrnsqU5y0/sRoBWVoal2WQHjNWHiwYFy4Bw=; 
 b=EoVhNBYH+dXO4JE9Co/PH4uZobG17gQzWmNR7Um7B2C7hzhGE0LKisIqJoIuz3OoNEfI7Ee/eepSJOV/BpeYCQ3ruiEafpTmOdksKH4XrNaFTV1sGXPLt5fw+1MMqcMAr1SOtSZB7Xg0D+AZ5WI7ETW21TQlzg0+kEjLukHFyKw=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1568182247359862.0576688127516;
 Tue, 10 Sep 2019 23:10:47 -0700 (PDT)
In-Reply-To: <20190911034302.29108-1-andrew@aj.id.au>
Message-ID: <156818224605.15929.1567552683650395230@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: andrew@aj.id.au
Date: Tue, 10 Sep 2019 23:10:47 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [PATCH v3] target-arm: Make the counter tick
 relative to cntfrq
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkxMTAzNDMwMi4yOTEw
OC0xLWFuZHJld0Bhai5pZC5hdS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhlIGRvY2tl
ci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0xIE5FVFdP
Uks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0xIEo9MTQg
TkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpsaWJ1ZGV2ICAgICAgICAgICBubwpk
ZWZhdWx0IGRldmljZXMgICB5ZXMKCndhcm5pbmc6IFB5dGhvbiAyIHN1cHBvcnQgaXMgZGVwcmVj
YXRlZAp3YXJuaW5nOiBQeXRob24gMyB3aWxsIGJlIHJlcXVpcmVkIGZvciBidWlsZGluZyBmdXR1
cmUgdmVyc2lvbnMgb2YgUUVNVQoKTk9URTogY3Jvc3MtY29tcGlsZXJzIGVuYWJsZWQ6ICAnY2Mn
CiAgR0VOICAgICB4ODZfNjQtc29mdG1tdS9jb25maWctZGV2aWNlcy5tYWsudG1wCi0tLQpxZW11
LXN5c3RlbS1hYXJjaDY0OiBJbnZhbGlkIENOVEZSUTogMEh6CkJyb2tlbiBwaXBlCi90bXAvcWVt
dS10ZXN0L3NyYy90ZXN0cy9saWJxdGVzdC5jOjEzNToga2lsbF9xZW11KCkgdHJpZWQgdG8gdGVy
bWluYXRlIFFFTVUgcHJvY2VzcyBidXQgZW5jb3VudGVyZWQgZXhpdCBzdGF0dXMgMQpFUlJPUiAt
IHRvbyBmZXcgdGVzdHMgcnVuIChleHBlY3RlZCA2MSwgZ290IDApCm1ha2U6ICoqKiBbY2hlY2st
cXRlc3QtYWFyY2g2NF0gRXJyb3IgMQptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBq
b2JzLi4uLgpDb3VsZCBub3QgYWNjZXNzIEtWTSBrZXJuZWwgbW9kdWxlOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDE5MDkxMTAzNDMwMi4yOTEwOC0xLWFuZHJld0Bhai5pZC5hdS90ZXN0aW5n
LmRvY2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQg
YXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


