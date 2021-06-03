Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F882399C9E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:32:55 +0200 (CEST)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loimc-0004jd-4m
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid4-0006Xv-Uh; Thu, 03 Jun 2021 04:23:02 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51083 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid2-00006c-NS; Thu, 03 Jun 2021 04:23:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5m2zqJz9srX; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708556;
 bh=gmvEzfEJLJG9fd+QDD+EwrSDGGewIy13/ewbJWE2MdY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kTvXVkc3nEkDs6b9tBtPePL+sXF8A8nH/8wPfdLUr4epqXtAnQTFxi1S+7CYZnE9x
 ERc98wcsjSqsAgf9q8GaRNuYD3WSWP6wfAOPFEJnOB/8iFIMrjMtXF8gWPDQjaaWDX
 m29b7hxYBnBGM1tRADEWi+rkx7r0dsTlv7MoxMT8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/42] target/ppc: removed mentions to DO_PPC_STATISTICS
Date: Thu,  3 Jun 2021 18:22:06 +1000
Message-Id: <20210603082231.601214-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Removed the commented out definition and all ifdefs relating to
PPC_DUMP_STATISTICS, as it's hardly ever used.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210526202104.127910-4-bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b494bd8b9c..5c56e33c3c 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -47,7 +47,6 @@
 
 /* Include definitions for instructions classes and implementations flags */
 /* #define PPC_DEBUG_DISAS */
-/* #define DO_PPC_STATISTICS */
 
 #ifdef PPC_DEBUG_DISAS
 #  define LOG_DISAS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
@@ -217,12 +216,9 @@ struct opc_handler_t {
     uint64_t type2;
     /* handler */
     void (*handler)(DisasContext *ctx);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+#if defined(PPC_DUMP_CPU)
     const char *oname;
 #endif
-#if defined(DO_PPC_STATISTICS)
-    uint64_t count;
-#endif
 };
 
 /* SPR load/store helpers */
@@ -8546,7 +8542,7 @@ static int register_direct_insn(opc_handler_t **ppc_opcodes,
     if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
         printf("*** ERROR: opcode %02x already assigned in main "
                "opcode table\n", idx);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+#if defined(PPC_DUMP_CPU)
         printf("           Registered handler '%s' - new handler '%s'\n",
                ppc_opcodes[idx]->oname, handler->oname);
 #endif
@@ -8570,7 +8566,7 @@ static int register_ind_in_table(opc_handler_t **table,
         if (!is_indirect_opcode(table[idx1])) {
             printf("*** ERROR: idx %02x already assigned to a direct "
                    "opcode\n", idx1);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+#if defined(PPC_DUMP_CPU)
             printf("           Registered handler '%s' - new handler '%s'\n",
                    ind_table(table[idx1])[idx2]->oname, handler->oname);
 #endif
@@ -8581,7 +8577,7 @@ static int register_ind_in_table(opc_handler_t **table,
         insert_in_table(ind_table(table[idx1]), idx2, handler) < 0) {
         printf("*** ERROR: opcode %02x already assigned in "
                "opcode table %02x\n", idx2, idx1);
-#if defined(DO_PPC_STATISTICS) || defined(PPC_DUMP_CPU)
+#if defined(PPC_DUMP_CPU)
         printf("           Registered handler '%s' - new handler '%s'\n",
                ind_table(table[idx1])[idx2]->oname, handler->oname);
 #endif
@@ -9036,10 +9032,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         gen_invalid(ctx);
     }
 
-#if defined(DO_PPC_STATISTICS)
-    handler->count++;
-#endif
-
     translator_loop_temp_check(&ctx->base);
 }
 
-- 
2.31.1


