Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569D3372308
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:36:14 +0200 (CEST)
Received: from localhost ([::1]:40472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhAj-0000Az-A2
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqI-0005ms-TG
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:07 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqG-0000ID-Io
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080104; x=1651616104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+NPft2RyN4RxgurmCoyTVD5EaivC4NQIQYrLmDjJmk=;
 b=LOdWZaOVGV8pNmELCju0JCm0OSsU3F6cFFzvdfSQcUifvXzjDMsJA7kT
 pSz14q8MzI3aU0jXw1pW3YjjxNCbDZlOkew+Oycz8GxYzHMmeBognWQ6w
 6pU2QlbsWOz698yAosZ21f0KZtWDpbZqbwtDcsV4ouLBMZIMs4jyIg4/4
 sCzXHEYwLfd38B/AxU25TxVduYrbceZ03fuYvbs3zNk8RgnZxYBQGvBk4
 CK6PNcmtXx5ULix024EjaClE4X+7wagABPPIL3/FWdFGDeSi5pUjZwDiN
 WXjR2nwkfEp7N/8AalfSogxsS/U2Qw/A3AzJwmOtcwdfbmEgklLv6KbDf Q==;
IronPort-SDR: M1vo6uFfzFUZqHwB2FZLDPaLsPbleiWAEh+fc4UiJ8hxJY5z186UFY1FcwW4GQYx0iycHOxvW5
 IggRXCEo5tPZnb+fhjTxpgO89oVHs3y7+jwivwgoM5g4chZL1L4OsCyTyRdGEfRtx3Xgu+JKJJ
 T/yq+rsKAOsRcAS+Q5z50nIt9PG13QBoWpiBaaK4j7r4pelDXuZWiYRb8QQVdACZerK9o1DAm6
 K+XzB+5pvJEMHTdOCfepOVK1CKEYMme4neK0ZeP4Mtjnq9KKrI4k3qkD7hjS02Ev9PuA3UQoY4
 WYM=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114665"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:45 +0800
IronPort-SDR: 83fW4R19PSdr9UP0xrnPej74VmeiFRMykG/Zgz6WJ0bLwdNWFc1wLjvJtz0tfu7/sFCKWz6GeK
 3zys/H/47mA4qLX78Md7aW9xqyisBxPA4zzkJn7cJm3Ls4dq4w/t2bq3zHQWJ8Y/cczMPzo/4T
 TNeR6TqRrIsDaYIuX6KkPYlAc70x0aAwi+RHJQKuihBMfk9/w7KvrZTj8mnt2wQjUxH0UjQ15W
 PK/qj0b/pvNzALKEYQDtNTJaxFuzMzFMMUDeEuP+QhHM3hb1IYRUo1UaJeNhceNkkJbBmQDl1j
 MYuAcxqzSNhQcvWsRbY2ANgd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:56 -0700
IronPort-SDR: isNXFv2o64U0vZySkXDmMqhWk9I5xRVu7myIBC9zUe3g+q5GCNoAFPwzK41DwEB2zSeLGuCffW
 MgG7+oy+GfVhs8R97xrlQmGH8eeQMHwOKSK66+BFx6LDbEpQg0JfgLHfYwlWA21nN3uEbCkrFE
 vCPFIfm8TZEpIKvotjm+NLxGnS9FcXSdvKzeKeqShqCL+wkm0RN52eXdb2hdEmxjTC3orj0dT/
 H80HeOTQaYPWaBQFv1BQtCdgq45DofDENjT/mPO2mOHgw+Y/Jr++9XuGwlgDvcFwvhNNmWgwop
 i4Y=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 20/42] target/riscv: Fix the PMP is locked check when using TOR
Date: Tue,  4 May 2021 08:13:05 +1000
Message-Id: <20210503221327.3068768-21-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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


