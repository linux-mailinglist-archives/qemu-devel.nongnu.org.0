Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB3D1904D8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 06:20:57 +0100 (CET)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGbzk-0002tr-PN
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 01:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jGbu8-0004aA-64
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 01:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jGbu7-0001eG-57
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 01:15:08 -0400
Received: from ozlabs.org ([203.11.71.1]:52325)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jGbu6-0001c5-Q2; Tue, 24 Mar 2020 01:15:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48mfZX09jrz9sSR; Tue, 24 Mar 2020 16:14:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1585026900;
 bh=jbBX3JoVk1S0mEuBSwAHT1Fs43s6s7XMQFv5jI4uPK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hgNzn9UI6WKYuGFiGO/lzXf8rEBBYLkT8hUtrmmTBGNYy8K2FkXyRIq/9MjNuH9JP
 QavlbW+V6DDNcXYdUAWglOlLBtTY7ZGWbE8xQe1oeNY3BqFcEuXAvJd8V4fgdvQeFM
 ZQ4qCeoEN3XE5z1pXUzNDgFPPu/jSyK/GeO45QKM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 7/7] ppc/ppc405_boards: Remove unnecessary NULL check
Date: Tue, 24 Mar 2020 16:14:56 +1100
Message-Id: <20200324051456.256116-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324051456.256116-1-david@gibson.dropbear.id.au>
References: <20200324051456.256116-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: aik@ozlabs.ru, Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

This code is inside the "if (dinfo)" condition, so testing
again here whether it is NULL is unnecessary.

Fixes: dd59bcae7 (Don't size flash memory to match backing image)
Reported-by: Coverity (CID 1421917)
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200320155740.5342-1-philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc405_boards.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index e6bffb9e1a..6198ec1035 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -191,7 +191,7 @@ static void ref405ep_init(MachineState *machine)
         bios_size =3D 8 * MiB;
         pflash_cfi02_register((uint32_t)(-bios_size),
                               "ef405ep.bios", bios_size,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               2, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, =
0x2AA,
                               1);
@@ -459,7 +459,7 @@ static void taihu_405ep_init(MachineState *machine)
         bios_size =3D 2 * MiB;
         pflash_cfi02_register(0xFFE00000,
                               "taihu_405ep.bios", bios_size,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, =
0x2AA,
                               1);
@@ -494,7 +494,7 @@ static void taihu_405ep_init(MachineState *machine)
     if (dinfo) {
         bios_size =3D 32 * MiB;
         pflash_cfi02_register(0xfc000000, "taihu_405ep.flash", bios_size=
,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, =
0x2AA,
                               1);
--=20
2.25.1


