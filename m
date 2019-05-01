Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C910CC6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 20:39:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLu8E-0003oN-4G
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 14:39:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLu7C-0003RI-5o
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:37:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLu7A-0002jG-Tk
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:37:58 -0400
Resent-Date: Wed, 01 May 2019 14:37:58 -0400
Resent-Message-Id: <E1hLu7A-0002jG-Tk@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLu7A-0002i6-M3
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:37:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556735862; cv=none; d=zoho.com; s=zohoarc; 
	b=ZibURtDmkK1Eq8+IBafD3c8+HOMiV7KgQ8g1OrvSNpDaiKgXe8ZIHQLLdxUh9o0WpCMZBJKBlhUjdgLzzUwJDB6+tZN8fSVtlYKQ5Rwt1FQhGcpOvjzCHs9VJ326mRSVJH/Rc1EHyAlYZhUNl8h9d9oRvMv849nlEJ7l3d+yDqA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556735862;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=JfkBfRT91L2YjOZeH2TKn11HR5L+5nCW9ohB95NNCLY=; 
	b=cLigysWXb3xNt8UJ/Qu5Qbr/HdUyftTTuhrwV67QtK/Au5RYs0PfrS7mtSbcznPMnfRx5Ox1s4RhiYyr+ujkwL9afIrMA+qUBr7Ep5jigZ2qIj1f8ri1aFfBZZNr5GFYIs6urzL3NRGC57yv1atKWRrxqrXtOWrB9glDI98cUK0=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556735861226477.83141453521523;
	Wed, 1 May 2019 11:37:41 -0700 (PDT)
In-Reply-To: <20190430031238.40499-1-yangchuanlong@huawei.com>
Message-ID: <155673586019.10667.9130032716299474327@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: yangchuanlong@huawei.com
Date: Wed, 1 May 2019 11:37:41 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [PATCH v1] target/arm/arm-powerctl: mask the cpuid
 with affinity bits when get cpu
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
Cc: fam@euphon.net, qemu-devel@nongnu.org, gengdongjiu@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDQzMDAzMTIzOC40MDQ5
OS0xLXlhbmdjaHVhbmxvbmdAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQg
dGhlIGFzYW4gYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29tbWFuZHMgYW5k
CnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxlZCwgeW91IGNh
biBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9
PT0KIyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRf
TElTVD14ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9n
cy8yMDE5MDQzMDAzMTIzOC40MDQ5OS0xLXlhbmdjaHVhbmxvbmdAaHVhd2VpLmNvbS90ZXN0aW5n
LmFzYW4vP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5
IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFj
ayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


