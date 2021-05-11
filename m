Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872237A4E7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:46:27 +0200 (CEST)
Received: from localhost ([::1]:42064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPuE-0004zD-Ac
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWL-00016m-E5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:45 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWG-0006X1-Gp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728499; x=1652264499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+NPft2RyN4RxgurmCoyTVD5EaivC4NQIQYrLmDjJmk=;
 b=WaDEUtaHz0aAVnar1UCGGnUZD663mELnukEcozW52KJXvZHqbzZYVnRe
 MQ6Xc//3G7K9lrERqJ/vQNK11439rmCCepQHm6yEHSJagc9Q4ypEQ10ru
 KGZJY1FWxqtK0L9Z2AbftnQnSlk7hNQe9O6uh9UWCCBIegctxr185IWM8
 co4vRk7fOhEfhC6ZElF10WOCEt4RZ4DyF7OoGBzpFKMVXvcjS35fmY+yv
 J5b79XpTD+Ind44nfpf5j4XMV+t7F/Q6JMLhW2p15D019XLkerdJr1z7E
 rATFHoovqkSxEsnOnloKK6vM33opPYuFPuFYx1xGhc/rlR9OkXULC//Fj w==;
IronPort-SDR: AZxSc/UWlG6E9NatSM+0xMkQ/QtkMt4ssgGjjybjmy0gtg1DDkXETZcTaTYW7pyubIsxKf+cI3
 sCy6YeHeMPGiXZg3srAABALKhbGbPVKpQsutpZz69FIYQpX0dZsE7yRUa3EeAMdCwzWAzTutt8
 xuEFG+3TMOKZ48H4kmUC1HFtfWhB8CuhWymWQK4hbr8XcqmdBqM/nLMQCLW4JGAtrKeGx9lXhw
 9RMjAFNRB+GKEZEI0K4puWXDpdl0if/Qw3kAZkjgFKld+9MWGV9VQTd/1swyREL2ixf6lDGUkB
 tuM=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735413"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:05 +0800
IronPort-SDR: 4xYaoSmSvCM5kwU59IAh2kMWKDj/Hat6EWSOdYtx11jGVVuHwNZvNt5p7AqljDXupP856UAkhP
 A1Is9OkQJpYAqVU58vlSRRx2STQIL8hVRMFuw9o9S8E4Y4KnuW2EYqyMHOkRh0gCOxas+n509A
 9HD3g64S9in66QpKEzpu3a9nLF3cnBfE7/qfz+RK0eZ2bHSUEZkS6oMuSJoaf3rHGp1RvMreEg
 rJq4L0CJi5Ylj56kWJHXLDsQVR78aVnFr5sMcmJzUFGLowt0WW+rZXadzeYygwLMZ4ZvBei4+V
 kJ5fIlyJmqBaV3h7LWGTmyUW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:05 -0700
IronPort-SDR: 9V6CReCCR+GUdSTBCl5zTBnj+Jw2AZJkZiNx6OL1SHTxqnJSw2KMIFFsDWBvq0xj7DpDaz2K+w
 kMzQ2AbwbDs9QNQ0Qmmxu8m6N263tujOiGU9ucIi3jqHLHzR5lDXsqJ7gtt8zB4wrx4SpRHSD0
 VWLHl1c+bnOqKFNmKq8JMTrTNI1K/AFmO4LkLv7AGQc+rl4i0P1Se4uC4756YVi2K+h96IsxZx
 E2mK2Hh1IUsZAwuvwANFM7rVwRSUL6sSUgpeA/uAovWdAiOwp4Fr0yDX24m/Y9dadSokXzXIY4
 q/w=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 20/42] target/riscv: Fix the PMP is locked check when using
 TOR
Date: Tue, 11 May 2021 20:19:29 +1000
Message-Id: <20210511101951.165287-21-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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


