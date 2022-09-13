Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A746F5B7BF9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 22:05:49 +0200 (CEST)
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYCAG-0004GV-Rt
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 16:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYBxa-0001g6-ML; Tue, 13 Sep 2022 15:52:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYBxY-00053M-Nu; Tue, 13 Sep 2022 15:52:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3389774633F;
 Tue, 13 Sep 2022 21:52:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1475C74632B; Tue, 13 Sep 2022 21:52:39 +0200 (CEST)
Message-Id: <4d0b81884e09ca412d3cc4de285ce2ba1c327856.1663097286.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663097286.git.balaton@eik.bme.hu>
References: <cover.1663097286.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 12/20] ppc440_sdram: Rename local variable for readibility
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2022 21:52:39 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index b3f56c49b5..d8a7947196 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -729,40 +729,40 @@ static void sdram_reset(void *opaque)
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                        Ppc4xxSdramBank *ram_banks)
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


