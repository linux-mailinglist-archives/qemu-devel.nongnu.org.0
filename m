Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9B741D34C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:29:22 +0200 (CEST)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpZC-0004q4-6B
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVotO-0002kB-Hr; Thu, 30 Sep 2021 01:46:03 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:33547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVotM-0004Ji-K1; Thu, 30 Sep 2021 01:46:02 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR4NwWz4xcB; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=2akbGMYQCmIo5ebEHKutJze1cfRN/V09huIwPc9SNwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZT/kMCRRb0AUfkRfxGzs6PNimdB4/HgjsxLrlSSoWcS6Hx+P1c1ckpB9q7If7mp1p
 yxn9APSkXU+533tVd7P3Vu0vYg4wmHBKbebbD5YLZotoDPKtkeMeDQQ/EJnUXb2M88
 V1/kqvhnRH0VYNt0cJKeYqQevNLSDbpIQuIBrDxc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 41/44] MAINTAINERS: Orphan obscure ppc platforms
Date: Thu, 30 Sep 2021 15:44:23 +1000
Message-Id: <20210930054426.357344-42-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
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
index 4d547e5604..a79543a877 100644
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


