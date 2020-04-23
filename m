Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E542E1B609E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 18:20:53 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jReaq-0001cv-T9
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 12:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bobby.prani@gmail.com>) id 1jReZJ-0000ea-RD
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bobby.prani@gmail.com>) id 1jReZI-0004zb-CL
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:19:17 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:45687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bobby.prani@gmail.com>)
 id 1jReZH-0004zF-Tn
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:19:16 -0400
Received: by mail-ot1-x32d.google.com with SMTP id e20so7000026otk.12
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 09:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=gMak5iHsDaGFieChHeIpN7gKh3u5HnVL5dSpOzwm6Yw=;
 b=oFn2tC02/dHUo7eJfqyXUHNGA2kB6jezzrxItYKyIZtgU7BexKeDhTOPjFIspFVNXJ
 IwWyOyUP3VY40GATHQYnluPAn8pDkUvpWUiYx2fEBR8nT0Ne38wn88xBnkTfBxuX36Wr
 cBZP0LTJu7vdCKs/G5KZ4eWV9xGoFbgGJHrsRhUKek/29fYAF6no3nExM7fs4X2SOWb5
 Oedf4J15ksYchZQ13YAf8d+AwJ+7sdrxQIE98wz6T2x/u2H8xpgWSy2YYjMfqFemOe/K
 bJ8YjYu9FCskkVgSFiOgiWWYpG1AFBAOH8Q6y2n6eldV6GPpFKEudiESUVJBkMrIiWVK
 Ypog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=gMak5iHsDaGFieChHeIpN7gKh3u5HnVL5dSpOzwm6Yw=;
 b=AhaP8u5ntp8+Jyfcw1kiEEAWeCOxcOd9O2fd0gC9uJCJ3MengLMJTacEDFZvcmGjzt
 TfJOQ90mpg9OSCQsHxmN03oCDoOG69DAVjr3qqwTu/VDEv0IIeqnxj/c6gqNk2HBSkb1
 LiXnDOBRvrhvUlYAYXCIbpDPGF2XhUthyB/RctjvByotzPjPM7sATupUgKy+dBDQbzCX
 0m5X+dTRy663e1PAvMHt0HK2CE4yICDE1fqEaL/lXhUYUiiElaIHB5PtK6Z0d48EoRyu
 vg4lvq+AyZTaNGV2S7sl3KELxaZ22mN/g/fCPeYSTav095FfSqzmwPtw5tkwEfdBTU2L
 YN2w==
X-Gm-Message-State: AGi0PuaNniiwdxneeGu5EyRDhdfFuBsp0RMBxzqNyWxsAJi1vJxgzyA4
 Oa80+Fpdu8QgM1Dh4AB3+Rh7GgC0zO6ZZQA+rfM=
X-Google-Smtp-Source: APiQypJ3ib5N71cFSpf2XykVQ7iAHZ++aZ5TtO266jIbBQulVx47M8db2vw/HcLlBoSwoipgksvZYyRqW6JT6crgV/g=
X-Received: by 2002:aca:c751:: with SMTP id x78mr3647964oif.163.1587658753795; 
 Thu, 23 Apr 2020 09:19:13 -0700 (PDT)
MIME-Version: 1.0
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Thu, 23 Apr 2020 09:18:47 -0700
Message-ID: <CAJhHMCAcA2CMEbV+DcOjM_LhJ4KSob=F2=hrDT0zwrMZ7Wj=oA@mail.gmail.com>
Subject: Warnings with GCC 9.3
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000b6c4b05a3f79cef"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=bobby.prani@gmail.com; helo=mail-ot1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::32d
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b6c4b05a3f79cef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I keep seeing these warnings on the latest master with GCC 9.3:

/home/pranith/qemu/hw/block/pflash_cfi01.c: In function
=E2=80=98pflash_mem_read_with_attrs=E2=80=99:

/home/pranith/qemu/hw/block/pflash_cfi01.c:667:20: note: parameter passing
for argument of type =E2=80=98MemTxAttrs=E2=80=99 {aka =E2=80=98struct MemT=
xAttrs=E2=80=99} changed in GCC
9.1
  667 | static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr
addr, uint64_t *value,

      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


Are there any patches in queue to fix this before the release?

Thanks,
--=20
Pranith

--0000000000000b6c4b05a3f79cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZWxsbyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkkga2Vl
cCBzZWVpbmcgdGhlc2Ugd2FybmluZ3Mgb24gdGhlIGxhdGVzdCBtYXN0ZXIgd2l0aCBHQ0MgOS4z
OjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9z
cGFjZSI+L2hvbWUvcHJhbml0aC9xZW11L2h3L2Jsb2NrL3BmbGFzaF9jZmkwMS5jOiBJbiBmdW5j
dGlvbiDigJhwZmxhc2hfbWVtX3JlYWRfd2l0aF9hdHRyc+KAmTogwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPi9ob21lL3ByYW5pdGgvcWVtdS9ody9ibG9jay9w
Zmxhc2hfY2ZpMDEuYzo2Njc6MjA6IG5vdGU6IHBhcmFtZXRlciBwYXNzaW5nIGZvciBhcmd1bWVu
dCBvZiB0eXBlIOKAmE1lbVR4QXR0cnPigJkge2FrYSDigJhzdHJ1Y3QgTWVtVHhBdHRyc+KAmX0g
Y2hhbmdlZCBpbiBHQ0MgOS4xIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIDxicj7CoCA2NjcgfCBzdGF0aWMgTWVtVHhSZXN1bHQgcGZsYXNoX21l
bV9yZWFkX3dpdGhfYXR0cnModm9pZCAqb3BhcXVlLCBod2FkZHIgYWRkciwgdWludDY0X3QgKnZh
bHVlLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgPC9zcGFuPjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PkFyZSB0aGVyZSBhbnkgcGF0Y2hlcyBpbiBxdWV1ZSB0byBmaXggdGhpcyBiZWZvcmUgdGhl
IHJlbGVhc2U/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPGJyPjwvZGl2PjxkaXY+
LS0gPGJyPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21hcnRt
YWlsPSJnbWFpbF9zaWduYXR1cmUiPlByYW5pdGg8L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--0000000000000b6c4b05a3f79cef--

