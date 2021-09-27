Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C0418E8A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:59:35 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUijm-00041F-8X
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYt-0000Cv-W9; Mon, 27 Sep 2021 00:48:20 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYp-000092-RE; Mon, 27 Sep 2021 00:48:19 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqrq1RqLz4xbc; Mon, 27 Sep 2021 14:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632718091;
 bh=5fiCKt8cStE2h+YirDdl8qbHH/9Dw4yls0eV1dwa0pY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jJRoDA72omQ8sEoILe1M25H2iEk5Xh2TjOBsaYBbhwjgqOB7cHqxs32rRBXDqxVIo
 AnOBxIbidzACJxG0whyP5pFb4Ejryyog18NrzJXatkoIJS3zRqpUnQz3l5sYUjSQW0
 Oa0CH4eYqatNdsZMn8f5OXwi94xPgjTBM93DDofU=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 4/7] MAINTAINERS: Orphan obscure ppc platforms
Date: Mon, 27 Sep 2021 14:48:05 +1000
Message-Id: <20210927044808.73391-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927044808.73391-1-david@gibson.dropbear.id.au>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a nunber of old embedded ppc machine types which have been little
changed and in "Odd Fixes" state for a long time.  With both myself and
Greg Kurz moving toward other areas, we no longer have the capacity to
keep reviewing and maintaining even the rare patches that come in for those
platforms.

Therefore, remove our names as reviewers and mark these platforms as
orphaned.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2060b46f9..1ecb5716c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1236,24 +1236,18 @@ F: hw/openrisc/openrisc_sim.c
 PowerPC Machines
 ----------------
 405
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Odd Fixes
+S: Orphan
 F: hw/ppc/ppc405_boards.c
 
 Bamboo
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Odd Fixes
+S: Orphan
 F: hw/ppc/ppc440_bamboo.c
 
 e500
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Odd Fixes
+S: Orphan
 F: hw/ppc/e500*
 F: hw/gpio/mpc8xxx.c
 F: hw/i2c/mpc_i2c.c
@@ -1264,10 +1258,8 @@ F: include/hw/pci-host/ppce500.h
 F: pc-bios/u-boot.e500
 
 mpc8544ds
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Odd Fixes
+S: Orphan
 F: hw/ppc/mpc8544ds.c
 F: hw/ppc/mpc8544_guts.c
 F: tests/acceptance/ppc_mpc8544ds.py
@@ -1777,9 +1769,8 @@ F: include/hw/acpi/ghes.h
 F: docs/specs/acpi_hest_ghes.rst
 
 ppc4xx
-M: David Gibson <david@gibson.dropbear.id.au>
 L: qemu-ppc@nongnu.org
-S: Odd Fixes
+S: Orphan
 F: hw/ppc/ppc4*.c
 F: hw/i2c/ppc4xx_i2c.c
 F: include/hw/ppc/ppc4xx.h
-- 
2.31.1


