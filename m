Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88314073
	for <lists+qemu-devel@lfdr.de>; Sun,  5 May 2019 17:05:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNIhW-0008BS-K1
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 11:05:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hNIfX-0007R9-Qp
	for qemu-devel@nongnu.org; Sun, 05 May 2019 11:03:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hNIfW-0000bB-Ls
	for qemu-devel@nongnu.org; Sun, 05 May 2019 11:03:11 -0400
Resent-Date: Sun, 05 May 2019 11:03:11 -0400
Resent-Message-Id: <E1hNIfW-0000bB-Ls@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21949)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hNIfW-0000Xr-EP
	for qemu-devel@nongnu.org; Sun, 05 May 2019 11:03:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556795585; cv=none; d=zoho.com; s=zohoarc; 
	b=eXEkUvWFVVvkRhOXfoHM4VATTAPX1yb/TCGkeJeJz0Z6QKqEN2bq1KedPOg04JqWAxoKJedcQ/pXMvSZGUmYho96rVIcpjXF3Ko5cThvZLw3X4bQ2mQEkqT3YyvvSav5lsRhBDTvADv8LA3ysZfIRBCJVdgitu9R+0ePKOsuNFA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556795585;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=1mBTG/IMUoFPK1MJ0sfNXBdUP4WGtOMVbznWp9b9hH0=; 
	b=ABAOyNIv79b4q0aPnSQh4WLRjSPA1ujY+QMzi4vojnMW5ayB1ZLMb/Q7ur8+XWASyoY7EH8H48rAbOSm3RCAIcW/yewr5GfTfxBeJUsFrBvir7MdTQ00NwyuLTTYLxH7wefRCkGkr7W2bF7tG5bkn5LV1Ma3ahkRcIVAUzvceOU=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556795583720867.2223188344036;
	Thu, 2 May 2019 04:13:03 -0700 (PDT)
In-Reply-To: <20190430100802.15368-1-berto@igalia.com>
Message-ID: <155679558195.10667.5588564760744650669@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: berto@igalia.com
Date: Thu, 2 May 2019 04:13:03 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [PATCH] qcow2: Fix error handling in the
 compression code
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
	berto@igalia.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
	mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDQzMDEwMDgwMi4xNTM2
OC0xLWJlcnRvQGlnYWxpYS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5nd0BmZWRvcmEg
U0hPV19FTlY9MSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhl
IGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDQz
MDEwMDgwMi4xNTM2OC0xLWJlcnRvQGlnYWxpYS5jb20vdGVzdGluZy5kb2NrZXItbWluZ3dAZmVk
b3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQ
YXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sg
dG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


