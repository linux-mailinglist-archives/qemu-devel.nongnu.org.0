Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13194B55F2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 21:08:06 +0200 (CEST)
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAIpZ-0008Aw-1V
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 15:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iAIkS-0004JW-VC
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:02:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iAIkR-0002nj-UD
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:02:48 -0400
Resent-Date: Tue, 17 Sep 2019 15:02:48 -0400
Resent-Message-Id: <E1iAIkR-0002nj-UD@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21594)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iAIkR-0002nE-Lf
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 15:02:47 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568746964; cv=none; d=zoho.com; s=zohoarc; 
 b=KITR9iJbJIp3eF3l5BNiVmtmxp4vOpD2D1Dz3tY8eLdRPTS6p6C172z6+wVvBilhrPORewkGzJ3G1qD2G1aKxQ6Z7MpXz1U9JC2OnSNZpF2iAdVtH7SzUShJguu1BQ97HN/uaBG6eumuIoikkUSO+4GKw4a0cI3haWJpBjqRHVQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1568746964;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=bN8PgvfsuiR1e40M4mSGeFPYh58LraXUTJpD2ofe+r4=; 
 b=ZuDeOb2w7FuTgrRsDG75qcZl2Jd7z3pFKhxyJekxdL0c7z6ckR/Y2s+r4i68HWQu3yiD3Zwtm69K4YCy5V1rXFiXvWIdj+o+sUA7dUAailzfbxe2tsbcFzzL9AyMg8vsa6GoZ53zAEb1ob28tRJRRy/UgrvevkZbKIfo99ZuBco=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1568746962935868.7914142891917;
 Tue, 17 Sep 2019 12:02:42 -0700 (PDT)
In-Reply-To: <20190917122644.15736-1-johannes@sipsolutions.net>
Message-ID: <156874696202.17151.3951456968699460317@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: johannes@sipsolutions.net
Date: Tue, 17 Sep 2019 12:02:42 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-devel] [RFC] contrib: add vhost-user-sim
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
Cc: qemu-devel@nongnu.org, johannes.berg@intel.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkxNzEyMjY0NC4xNTcz
Ni0xLWpvaGFubmVzQHNpcHNvbHV0aW9ucy5uZXQvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVk
IHRoZSBkb2NrZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0
aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBp
bnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVT
VCBTQ1JJUFQgQkVHSU4gPT09CiMhIC9iaW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1mZWRvcmEg
Vj0xIE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtbWluZ3dAZmVkb3JhIEo9MTQgTkVU
V09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgouL3Rlc3RzL2RvY2tlci9kb2NrZXIucHkg
LS1lbmdpbmUgYXV0byBidWlsZCBxZW11OmZlZG9yYSB0ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMv
ZmVkb3JhLmRvY2tlciAgIC0tYWRkLWN1cnJlbnQtdXNlciAgCkltYWdlIGlzIHVwIHRvIGRhdGUu
CiAgTEQgICAgICBkb2NrZXItdGVzdC1taW5nd0BmZWRvcmEubW8KY2M6IGZhdGFsIGVycm9yOiBu
byBpbnB1dCBmaWxlcwpjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgptYWtlOiAqKiogW2RvY2tlci10
ZXN0LW1pbmd3QGZlZG9yYS5tb10gRXJyb3IgNAoKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxl
IGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwOTE3MTIyNjQ0LjE1NzM2LTEtam9oYW5u
ZXNAc2lwc29sdXRpb25zLm5ldC90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=


