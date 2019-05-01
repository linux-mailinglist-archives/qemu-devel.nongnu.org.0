Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA7110CEE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 20:58:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLuR4-0003ee-6j
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 14:58:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLuQ4-0003MQ-LG
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:57:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hLuQ3-0001Sv-K9
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:57:28 -0400
Resent-Date: Wed, 01 May 2019 14:57:28 -0400
Resent-Message-Id: <E1hLuQ3-0001Sv-K9@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hLuQ3-0001Oe-Bs
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:57:27 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1556737027; cv=none; d=zoho.com; s=zohoarc; 
	b=Z7ROgZEeg9/UFpDMCZj+/dfklQYzZW51cnh82uWe7c1XJmYnqDdOBBwWi/8Nnce859JUAO1NnlXiKM5JJ8a/L0J6h1i8Br7P5SoKx9pWfsyZjD7Nq6ioCjttPnYdwhd27X46zAHmD/HDtQ37KHDvg/mEiPnC6ZdFkU4DSDU4oWk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1556737027;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=6wjhjCnVGGHEI3Zks8ecsWDTa90FcTsaEOYLC4ETXi4=; 
	b=jRTZ6oSsxjo+uR/gMGG0k/9o0O+xvPFbm9lbBKZzM3/WEbF1tHQWNTRx0NjS3oI/8zlAwngsxugoDSMiCdXv3a0Nshr+/gBFXgL0GpTNwAEISLOXUOTQmu6yv2cqe4gx8Xw/GUhhxWn5tVRHYVGr/5qJKYwWYkXfLxgGCSMcmVE=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1556737025876148.23528321244294;
	Wed, 1 May 2019 11:57:05 -0700 (PDT)
In-Reply-To: <20190430031238.40499-1-yangchuanlong@huawei.com>
Message-ID: <155673702480.10667.18159119295853264553@c2072b67cc0c>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: yangchuanlong@huawei.com
Date: Wed, 1 May 2019 11:57:05 -0700 (PDT)
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
dGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3Rp
bmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGlu
c3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1pbmd3
QGZlZG9yYSBTSE9XX0VOVj0xIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgoKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dz
LzIwMTkwNDMwMDMxMjM4LjQwNDk5LTEteWFuZ2NodWFubG9uZ0BodWF3ZWkuY29tL3Rlc3Rpbmcu
ZG9ja2VyLW1pbmd3QGZlZG9yYS8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1
dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2Vu
ZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


