Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D2A7C58
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 09:11:33 +0200 (CEST)
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5PRz-0006qD-Uy
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 03:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5PMQ-0001S8-1f
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5PMO-0006J5-Tj
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:05:45 -0400
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:43239)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5PMO-0006I3-Nj
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:05:44 -0400
Received: from player690.ha.ovh.net (unknown [10.109.159.90])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id D6CC913FEC5
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 09:05:42 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 3FFCA94DC7FB;
 Wed,  4 Sep 2019 07:05:36 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 09:04:59 +0200
Message-Id: <20190904070506.1052-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904070506.1052-1-clg@kaod.org>
References: <20190904070506.1052-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7081347465658206993
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.79.46
Subject: [Qemu-devel] [PATCH 03/10] aspeed: Remove unused SoC definitions
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are no QEMU Aspeed machines using the SoCs "ast2400-a0" or
"ast2400".

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 04480875d0d8..3aa73d2438ef 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -118,19 +118,6 @@ static const char *aspeed_soc_ast2500_typenames[] =3D=
 {
=20
 static const AspeedSoCInfo aspeed_socs[] =3D {
     {
-        .name         =3D "ast2400-a0",
-        .cpu_type     =3D ARM_CPU_TYPE_NAME("arm926"),
-        .silicon_rev  =3D AST2400_A0_SILICON_REV,
-        .sram_size    =3D 0x8000,
-        .spis_num     =3D 1,
-        .fmc_typename =3D "aspeed.smc.fmc",
-        .spi_typename =3D aspeed_soc_ast2400_typenames,
-        .gpio_typename =3D "aspeed.gpio-ast2400",
-        .wdts_num     =3D 2,
-        .irqmap       =3D aspeed_soc_ast2400_irqmap,
-        .memmap       =3D aspeed_soc_ast2400_memmap,
-        .num_cpus     =3D 1,
-    }, {
         .name         =3D "ast2400-a1",
         .cpu_type     =3D ARM_CPU_TYPE_NAME("arm926"),
         .silicon_rev  =3D AST2400_A1_SILICON_REV,
@@ -143,19 +130,6 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .irqmap       =3D aspeed_soc_ast2400_irqmap,
         .memmap       =3D aspeed_soc_ast2400_memmap,
         .num_cpus     =3D 1,
-    }, {
-        .name         =3D "ast2400",
-        .cpu_type     =3D ARM_CPU_TYPE_NAME("arm926"),
-        .silicon_rev  =3D AST2400_A0_SILICON_REV,
-        .sram_size    =3D 0x8000,
-        .spis_num     =3D 1,
-        .fmc_typename =3D "aspeed.smc.fmc",
-        .spi_typename =3D aspeed_soc_ast2400_typenames,
-        .gpio_typename =3D "aspeed.gpio-ast2400",
-        .wdts_num     =3D 2,
-        .irqmap       =3D aspeed_soc_ast2400_irqmap,
-        .memmap       =3D aspeed_soc_ast2400_memmap,
-        .num_cpus     =3D 1,
     }, {
         .name         =3D "ast2500-a1",
         .cpu_type     =3D ARM_CPU_TYPE_NAME("arm1176"),
--=20
2.21.0


