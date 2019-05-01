Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E22A10673
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 11:42:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLllH-0005R3-E2
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 05:42:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLlj5-0004Py-Ur
	for qemu-devel@nongnu.org; Wed, 01 May 2019 05:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLlj2-0005cH-Lx
	for qemu-devel@nongnu.org; Wed, 01 May 2019 05:40:31 -0400
Resent-Date: Wed, 01 May 2019 05:40:31 -0400
Resent-Message-Id: <E1hLlj2-0005cH-Lx@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21441)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLlj2-0005bZ-EP
	for qemu-devel@nongnu.org; Wed, 01 May 2019 05:40:28 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556700868; cv=none; d=zoho.com; s=zohoarc; 
	b=WasBPMd5R9qwAfnMLH4tgi3CcllJ7TTVUfBzS7y7MB4L6+rjakcnOJ7y5WKGfUhG/IZhSvCUqzPbEzopxFm2H27qfEXdLOPwaOightu/9dnU4ESUb7+FOs8+OyPmpJ0BscdG9dC7RHRMsad1sspBYx6gqxizEzao/xBbDZNd4Lw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556700868;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=XmFRfuaU7g5kD3b1A0bWgwUNCEHjkUn84c2g/mXy/bU=; 
	b=PoTqO2SL4j2mKyS37iMAB6VDowmuYMIdKpJYFZUroKijrrONmsSpnk2EjwsZyUhkGk8mm9VchjrIqiHKq7FKwj+1ZjPchiXNjK5UHxozhbrdveGm//R4EOKOj3o2TE84HATkgSQvYH4Ez4rbvAX6+nLW29qXHRB18FUHuEqHrps=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556700866655324.57951822907944;
	Wed, 1 May 2019 01:54:26 -0700 (PDT)
In-Reply-To: <cover.1556562150.git.berto@igalia.com>
Message-ID: <155670086531.10667.18189622875201687295@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: berto@igalia.com
Date: Wed, 1 May 2019 01:54:26 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-devel] [PATCH 0/5] Remove bdrv_read() and bdrv_write()
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-block@nongnu.org,
	qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNTU2NTYyMTUwLmdp
dC5iZXJ0b0BpZ2FsaWEuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgYXNhbiBi
dWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBhbmQKdGhlaXIgb3V0
cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3UgY2FuIHByb2JhYmx5
IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4v
YmFzaAp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtZGVidWdAZmVkb3JhIFRBUkdFVF9MSVNUPXg4Nl82
NC1zb2Z0bW11IEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgoKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzL2NvdmVyLjE1
NTY1NjIxNTAuZ2l0LmJlcnRvQGlnYWxpYS5jb20vdGVzdGluZy5hc2FuLz90eXBlPW1lc3NhZ2Uu
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3Bh
dGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBy
ZWRoYXQuY29t


