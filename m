Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE98374BF2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:33:33 +0200 (CEST)
Received: from localhost ([::1]:47208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR1J-00058y-1y
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsU-0008I3-TX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:26 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsT-0000cg-1C
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257065; x=1651793065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+NPft2RyN4RxgurmCoyTVD5EaivC4NQIQYrLmDjJmk=;
 b=WZV7xwkjAFvRNbkomMFzy+AP77cLP4KpNFH+SaH2K++1aw66N2AsVwJV
 5jI+0TwTrjQjV2Fo6ByAKoAZqtZwcYS8XNPh1DU27FilWGJZNW4gKQ3IZ
 xLNjVCnJWekJWBRa8vdd9D+8oucNu7Cq3D8UHcKH+cWcV9dVrryroCiz1
 u4Rwx/94zNj9SPj/FTXGOxHg+YKcdvG7QXYZiG2K29MPAUcghqEXnaZfb
 o9OzsKAnRuMYHfjFa5fOPMnRu92489Lg992SETIs6Zw/7ElA3AWnyreuc
 +UZXE6/qGAKksncjm4a8GEGskpPODG7yvKAPQDP3le6lJlj2OxAmcF4Wn A==;
IronPort-SDR: CpSGE3jjtLAr3csjo61NLb/jHhpvAijWP1xwByFzGaQMC+ueYa1ZKgjF/2F1yFWdQkaf6TGi6u
 I/gevd8zRsbLs8TKHqgbG+sLHcM4dz6L53oUU3HtTM/srARM7GjP7eGjPVk6UBDq9lGiSclX5U
 Fke43t/AqcB0bDFTtIMHmLjWcAlktQgl5Uw6Px999pwYg+IBi+jYwx83kiAK6Gr0qqIb6zmBZC
 D+S5ghxtZnet+5r+pFKtecOY9dnK5zHSyd1B38Z3ntO6Nvvs38lLLlE0HzmVWw+zVbaIoHEILy
 hEI=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585938"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:24 +0800
IronPort-SDR: nsYEg5KDxAE1h4uf0eyuAnKWCQmn5jNOqxWwKK+PmdN0XAU3RWIqipMMGFpFCDeCLEfCLGzMW4
 Cvjt6QHDPN1/S5fO5bhZDZiwwrUt9yMdxh20HJoMifP+DfYm1N5Yt/bvzQQPPLDNlzhjeWSgOU
 JiwZTpiL9cOMhHXt4h0zdbsZJ3yrzlm+J3rfXgHD268haI2mZiYBVzaQHGGH199bDFntyCCLJ2
 dAdSl1sf0yW01vgwXqrwrhgw6KDFtH3PFfaEbP3VK+/zzfXZepa57P6AzMRIvh1e93EtlU0axD
 V4UcrvmMCxJhUeQZb/WN6CbU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:05 -0700
IronPort-SDR: omhSHgXrf9v8XrIEO/Ih1fK8ZXsobGLfOXEu8zz4izSRCAcSFTw1e8MwxsEhgTrmcw6anOxkdG
 mJJ9ROoKonT6wWV94Ma3t+wAIhQpa9VXjbOZc5BX2wGem3aXj/g1id3CQD5MnTeOt9vVmW83+C
 GYzLVCHbkkClgrerx4JRggfLJvtRblYGIcP3fgA6eP0MuwAg0BJRFiMpQVZeQ3CqDTSI0Rl9/t
 aWL1gzrr74gc7EuqZch5fpAzttv5XH5xo0jBJzQBCKMc/rdlrttk4QsSaELeC58S3pUOtbHvvb
 yPI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:22 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 20/42] target/riscv: Fix the PMP is locked check when using
 TOR
Date: Thu,  6 May 2021 09:22:50 +1000
Message-Id: <20210505232312.4175486-21-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RISC-V spec says:
    if PMP entry i is locked and pmpicfg.A is set to TOR, writes to
    pmpaddri-1 are ignored.

The current QEMU code ignores accesses to pmpaddri-1 and pmpcfgi-1 which
is incorrect.

Update the pmp_is_locked() function to not check the supporting fields
and instead enforce the lock functionality in the pmpaddr write operation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 2831241458163f445a89bd59c59990247265b0c6.1618812899.git.alistair.francis@wdc.com
---
 target/riscv/pmp.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index cff020122a..a3b253bb15 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -59,16 +59,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
         return 0;
     }
 
-    /* In TOR mode, need to check the lock bit of the next pmp
-     * (if there is a next)
-     */
-    const uint8_t a_field =
-        pmp_get_a_field(env->pmp_state.pmp[pmp_index + 1].cfg_reg);
-    if ((env->pmp_state.pmp[pmp_index + 1u].cfg_reg & PMP_LOCK) &&
-         (PMP_AMATCH_TOR == a_field)) {
-        return 1;
-    }
-
     return 0;
 }
 
@@ -380,7 +370,23 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val)
 {
     trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
+
     if (addr_index < MAX_RISCV_PMPS) {
+        /*
+         * In TOR mode, need to check the lock bit of the next pmp
+         * (if there is a next).
+         */
+        if (addr_index + 1 < MAX_RISCV_PMPS) {
+            uint8_t pmp_cfg = env->pmp_state.pmp[addr_index + 1].cfg_reg;
+
+            if (pmp_cfg & PMP_LOCK &&
+                PMP_AMATCH_TOR == pmp_get_a_field(pmp_cfg)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "ignoring pmpaddr write - pmpcfg + 1 locked\n");
+                return;
+            }
+        }
+
         if (!pmp_is_locked(env, addr_index)) {
             env->pmp_state.pmp[addr_index].addr_reg = val;
             pmp_update_rule(env, addr_index);
-- 
2.31.1


