Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6678BE19AE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 14:13:05 +0200 (CEST)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNFVg-0000i7-6a
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 08:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iNFFF-0002ad-2A
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 07:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iNFFD-0003PQ-E3
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 07:56:04 -0400
Resent-Date: Wed, 23 Oct 2019 07:56:04 -0400
Resent-Message-Id: <E1iNFFD-0003PQ-E3@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21461)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iNFFD-0003Oo-67
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 07:56:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571831756; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AzrILPvmy4W0/w3qwt+sO7Y98SwNN87WPjqf3I7jfZGxizgLVqOL2OqgfJZI5gVMsAeF+SdfO0Kt4LOo7bG4J6b2Pw/k1SM5+eQm30TRx/n6SNcP663mi3qi3nMq8G927G4rPpQPOfZhF9EVuDWA0zGiUx0PcWJuHrYzYEAGwCA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1571831756;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Z3SfVHTgtq9ly36pAflEFZh6clTEQJW+oyejjnkco5Q=; 
 b=BEO6wradEmlPL54RDHH+ngQ6EkHfWKYPrq5DBYmxtAD+kbWU0zkbdoPIlhhRPVCUNhHvWctLTp8cxFDl4OyjCHJOMGaOoNwWjqXtl7TWQmRQqdYKboWgPLKePjvYbCZGjJ14HiwlpsxUjqJMfsAziKTAmVTRGIiDIQg+RS1l/7E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1571831754627957.9802485720151;
 Wed, 23 Oct 2019 04:55:54 -0700 (PDT)
In-Reply-To: <20191023020126.24991-1-eblake@redhat.com>
Subject: Re: [PULL 0/3] NBD patches for 2019-10-22
Message-ID: <157183175375.17590.12883932088108636951@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eblake@redhat.com
Date: Wed, 23 Oct 2019 04:55:54 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.54
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAyMzAyMDEyNi4yNDk5
MS0xLWVibGFrZUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgVEVTVCAgICBjaGVjay11bml0
OiB0ZXN0cy90ZXN0LXFodC1wYXIKICBURVNUICAgIGNoZWNrLXF0ZXN0LXg4Nl82NDogdGVzdHMv
aGQtZ2VvLXRlc3QKKioKRVJST1I6L3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzL21pZ3JhdGlvbi10
ZXN0LmM6MTMxNjp0ZXN0X21pZ3JhdGVfYXV0b19jb252ZXJnZTogYXNzZXJ0aW9uIGZhaWxlZCAo
cmVtYWluaW5nIDwgZXhwZWN0ZWRfdGhyZXNob2xkKTogKDEwMDAwMzg0MCA8IDEwMDAwMDAwMCkK
RVJST1IgLSBCYWlsIG91dCEgRVJST1I6L3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzL21pZ3JhdGlv
bi10ZXN0LmM6MTMxNjp0ZXN0X21pZ3JhdGVfYXV0b19jb252ZXJnZTogYXNzZXJ0aW9uIGZhaWxl
ZCAocmVtYWluaW5nIDwgZXhwZWN0ZWRfdGhyZXNob2xkKTogKDEwMDAwMzg0MCA8IDEwMDAwMDAw
MCkKbWFrZTogKioqIFtjaGVjay1xdGVzdC1hYXJjaDY0XSBFcnJvciAxCm1ha2U6ICoqKiBXYWl0
aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCiAgVEVTVCAgICBjaGVjay1xdGVzdC14ODZfNjQ6
IHRlc3RzL2Jvb3Qtb3JkZXItdGVzdAogIFRFU1QgICAgY2hlY2stdW5pdDogdGVzdHMvdGVzdC1i
aXRvcHMKLS0tCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwgY21kKQpzdWJw
cm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywgJy1uJywgJ2RvY2tl
cicsICdydW4nLCAnLS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlkPTg2MjUzZGQ5OGRi
MTQyODFiNGVjYzdkMGVlMDJmZDE4JywgJy11JywgJzEwMDMnLCAnLS1zZWN1cml0eS1vcHQnLCAn
c2VjY29tcD11bmNvbmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJU1Q9JywgJy1lJywg
J0VYVFJBX0NPTkZJR1VSRV9PUFRTPScsICctZScsICdWPScsICctZScsICdKPTE0JywgJy1lJywg
J0RFQlVHPScsICctZScsICdTSE9XX0VOVj0xJywgJy1lJywgJ0NDQUNIRV9ESVI9L3Zhci90bXAv
Y2NhY2hlJywgJy12JywgJy9ob21lL3BhdGNoZXcyLy5jYWNoZS9xZW11LWRvY2tlci1jY2FjaGU6
L3Zhci90bXAvY2NhY2hlOnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWtp
dWlvcmFlL3NyYy9kb2NrZXItc3JjLjIwMTktMTAtMjMtMDcuNDQuMTAuMjM5MDg6L3Zhci90bXAv
cWVtdTp6LHJvJywgJ3FlbXU6Y2VudG9zNycsICcvdmFyL3RtcC9xZW11L3J1bicsICd0ZXN0LXF1
aWNrJ10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1s
YWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPTg2MjUzZGQ5OGRiMTQyODFiNGVjYzdkMGVlMDJm
ZDE4Cm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRp
cmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWtpdWlvcmFlL3NyYycKbWFrZTog
KioqIFtkb2NrZXItcnVuLXRlc3QtcXVpY2tAY2VudG9zN10gRXJyb3IgMgoKcmVhbCAgICAxMW00
My43NTZzCnVzZXIgICAgMG04LjE4M3MKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkxMDIzMDIwMTI2LjI0OTkxLTEtZWJsYWtlQHJlZGhh
dC5jb20vdGVzdGluZy5kb2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNv
bQ==


