Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2AD3C9990
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:21:59 +0200 (CEST)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vh0-0006cn-W9
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc4-0005Uf-MA
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:52 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc2-0003VO-L2
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333411; x=1657869411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RoRHBbakSWJHXSQUaN07cP0CANZsUUdsXB3Th0i7Nyw=;
 b=KqrOz4EEwlhDylUHq2Xs4nzrFc4zLGTOgaNI5j20rHU/SkX5yWMGBtM3
 qKYdsLssL/t6ztn2T9xIbJD0Q4Z+iG+ly/FDDyxVutTIQHUtrLFnFqbQa
 WMb7Ldg2A0TJoNpASyb49kEDD+PcDo6c++wF4HupWayMvMnvUSAS+kS4o
 dK+k8g30eqzpZDqjUojMHZCCfWwcA16LRei4AApjrUACqlHJjh2fWm7sC
 2tvdQLcF788sG96PgCH/jaYGyPBip+D2SHmBXw72TQdAF7j/AoVnvrsb+
 XvC4Q/kFHp6VmDjzJDmUtiq1HJ7B3mukAlfkfl4NfKJdfYhTO62tGKJBB Q==;
IronPort-SDR: 8QDWSgN3gFalGxe9lEwSsJnHTtLGHdrJl95zbv+4/GUGCNgNx+1oV2wyG+xy9rH/HSgRdKX/N0
 Oa8nzkRokb8xaxiANluxMR8KrKAL/NTzhbX5M0gXSDsAo7YRjbJiOaSCA8uSAPbkDSiOSeMx/c
 M+QtQRZ42Qymn/0Yrv6AAEniZVpbaZVeCFTWshC5oinFxekouOrJc0TSgl8wEYoxiQT6NkAinL
 0/HtL6EY0gL5okWAm1qld1mJ7biTCQCegQFpKHifuUYB7k2EPGkOisf3SHWZH7WtRvRMipGW5T
 2y0=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212303"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:42 +0800
IronPort-SDR: 2EYAvRdXzQo6PbzU4v9KlWBo6uptyxre6oQBwUCsz9UZtRErXoHwlFUAmfHv2rQ0nCGjQFqfSD
 1r5bN4LV5T6WNmvtbutp6pVhn/VM3HwCNVA/yK0hJuI2txDZy71IN40E6XPkcu2HftpoYusUZS
 XAishXqqCs2M53mwiluU7VqEja6qoOENhAxTAwcdcShlQdp03NAcOjb+rewWZFSELYgEXOctcF
 qWyzw0C18+/SrukXYWIcJBgDQv7XKSlYZ+/5V0BHAlbDqD0IYsTwHMgSatfSNTrvzJY2cd4Z3n
 cGwgbXT5Nqwl3vrj2M+ye+gQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:45 -0700
IronPort-SDR: aXTMk15hPQapxSosGGAqE2f8R8uWtsXy0neFtZuj1cDUSUub936W+2HBexp0riT1nkxReRpmb4
 SdNgFfaYcjEdjgC+Q+VqLpqGyyAMhJzkjYuIxzQXbySBXYGGZU+T4NPjbKSsBsDA3kQk4a6h6t
 Zrf3/LMsLjgXX3kCvR6XXXpcujOgFibmYtbV+vZYsja94ZsE4I7ySdcUft6NGVBYzRfVwAltdT
 WtbzTJDQR7kfujUwwfmThKcp3z5SUuBwB8NROso7oIkz8BlMmEB7JarC9xBPNTz8O46fyPbgcG
 L/g=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 05/12] target/riscv: hardwire bits in hideleg and hedeleg
Date: Thu, 15 Jul 2021 00:16:33 -0700
Message-Id: <20210715071640.232070-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: Jose Martins <josemartins90@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jose Martins <josemartins90@gmail.com>

The specification mandates for certain bits to be hardwired in the
hypervisor delegation registers. This was not being enforced.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210522155902.374439-1-josemartins90@gmail.com
[ Changes by AF:
 - Improve indentation
 - Convert delegable_excps to a #define to avoid failures with GCC 8
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 54 ++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 62b968326c..9a4ed18ac5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -411,28 +411,36 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
+static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
 static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                                      VS_MODE_INTERRUPTS;
-static const target_ulong delegable_excps =
-    (1ULL << (RISCV_EXCP_INST_ADDR_MIS)) |
-    (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) |
-    (1ULL << (RISCV_EXCP_ILLEGAL_INST)) |
-    (1ULL << (RISCV_EXCP_BREAKPOINT)) |
-    (1ULL << (RISCV_EXCP_LOAD_ADDR_MIS)) |
-    (1ULL << (RISCV_EXCP_LOAD_ACCESS_FAULT)) |
-    (1ULL << (RISCV_EXCP_STORE_AMO_ADDR_MIS)) |
-    (1ULL << (RISCV_EXCP_STORE_AMO_ACCESS_FAULT)) |
-    (1ULL << (RISCV_EXCP_U_ECALL)) |
-    (1ULL << (RISCV_EXCP_S_ECALL)) |
-    (1ULL << (RISCV_EXCP_VS_ECALL)) |
-    (1ULL << (RISCV_EXCP_M_ECALL)) |
-    (1ULL << (RISCV_EXCP_INST_PAGE_FAULT)) |
-    (1ULL << (RISCV_EXCP_LOAD_PAGE_FAULT)) |
-    (1ULL << (RISCV_EXCP_STORE_PAGE_FAULT)) |
-    (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
-    (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
-    (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
-    (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
+#define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
+                         (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
+                         (1ULL << (RISCV_EXCP_BREAKPOINT)) | \
+                         (1ULL << (RISCV_EXCP_LOAD_ADDR_MIS)) | \
+                         (1ULL << (RISCV_EXCP_LOAD_ACCESS_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_STORE_AMO_ADDR_MIS)) | \
+                         (1ULL << (RISCV_EXCP_STORE_AMO_ACCESS_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_U_ECALL)) | \
+                         (1ULL << (RISCV_EXCP_S_ECALL)) | \
+                         (1ULL << (RISCV_EXCP_VS_ECALL)) | \
+                         (1ULL << (RISCV_EXCP_M_ECALL)) | \
+                         (1ULL << (RISCV_EXCP_INST_PAGE_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_LOAD_PAGE_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_STORE_PAGE_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)))
+static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
+    ~((1ULL << (RISCV_EXCP_S_ECALL)) |
+      (1ULL << (RISCV_EXCP_VS_ECALL)) |
+      (1ULL << (RISCV_EXCP_M_ECALL)) |
+      (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
+      (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
+      (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
+      (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR;
@@ -620,7 +628,7 @@ static RISCVException read_medeleg(CPURISCVState *env, int csrno,
 static RISCVException write_medeleg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    env->medeleg = (env->medeleg & ~delegable_excps) | (val & delegable_excps);
+    env->medeleg = (env->medeleg & ~DELEGABLE_EXCPS) | (val & DELEGABLE_EXCPS);
     return RISCV_EXCP_NONE;
 }
 
@@ -1039,7 +1047,7 @@ static RISCVException read_hedeleg(CPURISCVState *env, int csrno,
 static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    env->hedeleg = val;
+    env->hedeleg = val & vs_delegable_excps;
     return RISCV_EXCP_NONE;
 }
 
@@ -1053,7 +1061,7 @@ static RISCVException read_hideleg(CPURISCVState *env, int csrno,
 static RISCVException write_hideleg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    env->hideleg = val;
+    env->hideleg = val & vs_delegable_ints;
     return RISCV_EXCP_NONE;
 }
 
-- 
2.31.1


