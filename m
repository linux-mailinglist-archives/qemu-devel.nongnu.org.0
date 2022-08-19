Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDC59A2DB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:23:10 +0200 (CEST)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5i9-00068Y-Bp
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hm-0007vH-R3; Fri, 19 Aug 2022 12:55:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hl-0000yw-1b; Fri, 19 Aug 2022 12:55:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 93BC5747F1E;
 Fri, 19 Aug 2022 18:55:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 71B1E747F1C; Fri, 19 Aug 2022 18:55:51 +0200 (CEST)
Message-Id: <e6d3affa5b0c014acf68fabea0ab40aa4ec38f48.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 12/20] ppc440_sdram: Rename local variable for readibility
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:51 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename local sdram variable in ppc440_sdram_init to s for readibility.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440_uc.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index bd3d60f278..72eb75d3d2 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -729,40 +729,40 @@ static void sdram_reset(void *opaque)
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                        Ppc4xxSdramBank ram_banks[])
 {
-    ppc440_sdram_t *sdram;
+    ppc440_sdram_t *s;
     int i;
 
-    sdram = g_malloc0(sizeof(*sdram));
-    sdram->nbanks = nbanks;
+    s = g_malloc0(sizeof(*s));
+    s->nbanks = nbanks;
     for (i = 0; i < nbanks; i++) {
-        sdram->bank[i].ram = ram_banks[i].ram;
-        sdram->bank[i].base = ram_banks[i].base;
-        sdram->bank[i].size = ram_banks[i].size;
+        s->bank[i].ram = ram_banks[i].ram;
+        s->bank[i].base = ram_banks[i].base;
+        s->bank[i].size = ram_banks[i].size;
     }
-    qemu_register_reset(&sdram_reset, sdram);
+    qemu_register_reset(&sdram_reset, s);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
 
     ppc_dcr_register(env, SDRAM_R0BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_R1BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_R2BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_R3BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_CONF1HB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_PLBADDULL,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_CONF1LL,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_CONFPATHB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_PLBADDUHB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
 }
 
 /*****************************************************************************/
-- 
2.30.4


