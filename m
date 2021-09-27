Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF9418E7D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:52:49 +0200 (CEST)
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUidE-00030u-1i
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYt-0000Ci-Sv; Mon, 27 Sep 2021 00:48:19 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:57643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYp-000091-Uh; Mon, 27 Sep 2021 00:48:19 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqrq1D36z4xbb; Mon, 27 Sep 2021 14:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632718091;
 bh=jvg8nv15r+kVra5KkyZumu1DWPLJix8o4+ImJHUIHD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QfnrxPHbi7fWsZzyyEgDZFPHNRrayIqYLwOVAFAfWpdsm8Mj2D8i8UDS/gmWgc1cT
 M7CYpJIS91EyPZLABI09orG3el85N15PHu8ixQ7EXKDYl6XWti2o+MCGijn4MzfWvB
 0NVxK3M9MThYdlWfpROTTDeckJucGxThmDOL0Ax0=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 3/7] MAINTAINERS: Remove David & Greg as reviewers for a
 number of boards
Date: Mon, 27 Sep 2021 14:48:04 +1000
Message-Id: <20210927044808.73391-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927044808.73391-1-david@gibson.dropbear.id.au>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
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

Greg and I are moving towards other areas and no longer have capacity to
act as regular reviewers for several of the secondary ppc machine types.
So, remove ourselves as reviewers for Macintosh, PReP, sam460ex and
pegasos2 in MAINTAINERS.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e51bab91bd..f2060b46f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1274,8 +1274,6 @@ F: tests/acceptance/ppc_mpc8544ds.py
 
 New World (mac99)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-R: David Gibson <david@gibson.dropbear.id.au>
-R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mac_newworld.c
@@ -1294,8 +1292,6 @@ F: pc-bios/qemu_vga.ndrv
 
 Old World (g3beige)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-R: David Gibson <david@gibson.dropbear.id.au>
-R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mac_oldworld.c
@@ -1309,8 +1305,6 @@ F: pc-bios/qemu_vga.ndrv
 
 PReP
 M: Hervé Poussineau <hpoussin@reactos.org>
-R: David Gibson <david@gibson.dropbear.id.au>
-R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/prep.c
@@ -1367,8 +1361,6 @@ F: tests/acceptance/ppc_virtex_ml507.py
 
 sam460ex
 M: BALATON Zoltan <balaton@eik.bme.hu>
-R: David Gibson <david@gibson.dropbear.id.au>
-R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/sam460ex.c
@@ -1382,7 +1374,6 @@ F: roms/u-boot-sam460ex
 
 pegasos2
 M: BALATON Zoltan <balaton@eik.bme.hu>
-R: David Gibson <david@gibson.dropbear.id.au>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/pegasos2.c
-- 
2.31.1


