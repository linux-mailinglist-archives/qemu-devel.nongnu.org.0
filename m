Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5247B3ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 18:24:51 +0200 (CEST)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9to2-0008Fy-D1
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 12:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1i9t16-0007qb-HI
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:34:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1i9t15-0003ng-99
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:34:16 -0400
Resent-Date: Mon, 16 Sep 2019 11:34:16 -0400
Resent-Message-Id: <E1i9t15-0003ng-99@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21491)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1i9t12-0003iP-9E; Mon, 16 Sep 2019 11:34:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568648042; cv=none; d=zoho.com; s=zohoarc; 
 b=N8c/d9HQW6ZYoBNnH4q2X7auXKYh2yMf2dVPTdiJZFXwBm3OIcCZBHh/TWEeCL2VxpfYsLaNRwsCAexNArMz4za33Ly0JOp6W9XLwXakKV2xzYMDdS8V785jNq1pZOVAH87oexoXo+4f5wbkw4umOJa4BUnD70EuIPDzHvzWYJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1568648042;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=BoXRS5mvK0vgEIFzWwp70lhHFp0V0FLVodK+q4wyR/Q=; 
 b=VJB076ld1GMO3Qk21T8++cO2MfwsMbwhg6ZuPJwdfSjKBKPqijhhknvCR/8F1jfLBnZm1gmWMN9gCqDnSgvqV89DtisgAOOH2PbbHHx+4jRhMBe3W9KOCF4BuxFFL6J1FEzi0dUJvJyCGuapTANZEa9aGO6TBv0YUsYhyM864qU=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1568648042535346.87298520339834;
 Mon, 16 Sep 2019 08:34:02 -0700 (PDT)
In-Reply-To: <20190916142246.31474-1-mreitz@redhat.com>
Message-ID: <156864804136.12144.17991842384335047087@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mreitz@redhat.com
Date: Mon, 16 Sep 2019 08:34:02 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.54
Subject: Re: [Qemu-devel] [PULL 00/16] Block patches
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkxNjE0MjI0Ni4zMTQ3
NC0xLW1yZWl0ekByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA5MTYxNDIyNDYuMzE0NzQt
MS1tcmVpdHpAcmVkaGF0LmNvbS90ZXN0aW5nLmRvY2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1l
c3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRw
czovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1k
ZXZlbEByZWRoYXQuY29t


