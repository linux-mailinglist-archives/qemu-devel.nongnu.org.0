Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB5443F7D7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:26:54 +0200 (CEST)
Received: from localhost ([::1]:51588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMHt-0002ea-6Z
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7Y-00072i-HB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:16:14 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7T-0002XB-6z
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491767; x=1667027767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uT0cvGbgwLHa6h/L8pMyTB93NNsouaRxSleBwq0/OVI=;
 b=qppW5eiFQB8ACEEf/EHRolPRj0nj6gddXagCkBn1ma6IoknsHidFFyIn
 5ykSc5UyyPUHLGE033GKJO7JLTdQ5P3g43oy4RmrNn1Q0LTb/Dlmi38Gu
 XBxmOBJ7UtimRFzxupzltNMFTN5PdtRvp2zkfBn19tawYf9A4u5GxNG/s
 b3yKfxILcuWU3n/BYDPbMqwoKVZVQVJ8MrZyVMfP6SMtzD8IuLK7wnvSl
 Jo5ZjxtdzPrHvHMrXFCPZZ+S+1Eam7NL/6NxVigcuq4q036Tyvm7Ab+Ce
 aDxtDZTf5jsIEn9YX9ruRUBFJvU3+F/M2xaA9PRaQltXsGcfi730oKJrl A==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="183153989"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:16:05 +0800
IronPort-SDR: aksCe09qMJsX936GMbPorSEVaG68Z0ahCfxN6HLIe4qd/Dh5XpzRwvQc53QNl5wzkPEW+eYZWX
 KqrVP+kUiENnvOI1UB7r3KOPFTD02vpJA+M4n48sOk/CSgpSYxTmWpGvWrnUzY+8lsS0XJWh2j
 a8YjJ4NylcZLaL0ODNnBnpgfxBCFMf9D4lndgjDaWnR3CfEMy8KRDVHmJvlGz0E3QJ1l9QNvO3
 dDNnlNGT56uhTuzeOARm8DpWaatJovDXLy9Qh/MCe1yNA2pNF4CbW7Ib50Ou4Ji83+C2VPiPyB
 L0oce4XFG52yVSvTK/4vAeMV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:49:59 -0700
IronPort-SDR: zUmW+PDTvU9oAh1AlmjH/ry9NjyVLJsIkFgb0WljtIsoNeFd6fYq9pVqEmdjGv6h22EbHVdy13
 qfNp3HxpsMZfvq72IA08Ed1aLTN5A+zm+aHcTbCTx1NPJJPVY2GuWJnVjZS4/+SMxq+fP0vRx2
 DwCHBoeGc7Data0d1nEnvs1O0vED989uzV9JjQ586+zUOSYD/QSkFfyD8OENPgDRj/z2SAwbOK
 kiAaTongCPC3p3/RngPrK1oVYfVszw+f0yWRSiyUMPisiby0B2+tnep4Q6PnVyLkEqyJojoQMI
 6ls=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:16:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYcj51PMz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:16:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491765; x=1638083766; bh=uT0cvGbgwLHa6h/L8p
 MyTB93NNsouaRxSleBwq0/OVI=; b=qNArP2N/FkzPh/xBMxKc7OWnKJr+Olo2Oy
 W0bkHqBSduq3jbER2zoQl5gYbEwJCNlLNNfN7e6ipBtj2WF3iP/pQd5wPSWFBtiA
 Lqk+CSK9ZI6PGgmTiPe6YZnFN4VudPwPPMzfpSGf+6CiTNBZh9dD/bNtldWaF/Tz
 DzKksKFBZGts5xH26aGptk5Z1A8BoEfKTU7vwekhgUg3IxtqaKanhlGy4sbrfFXk
 hMpRjBiQB+YIKGJWyZep/rxMDUF3wm8MHxkGz0bHOO11BBzzCk0tWZbqgGnkIZ7e
 5GYZJuVRnQC1alTXkYiGlp6vKrWKNfhwln4wR+SCOqdiUjxjhqOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4M_8Vzt51edn for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:16:05 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYcd01z2z1RtVl;
 Fri, 29 Oct 2021 00:16:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jose Martins <josemartins90@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 16/18] target/riscv: remove force HS exception
Date: Fri, 29 Oct 2021 17:08:15 +1000
Message-Id: <20211029070817.100529-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jose Martins <josemartins90@gmail.com>

There is no need to "force an hs exception" as the current privilege
level, the state of the global ie and of the delegation registers should
be enough to route the interrupt to the appropriate privilege level in
riscv_cpu_do_interrupt. The is true for both asynchronous and
synchronous exceptions, specifically, guest page faults which must be
hardwired to zero hedeleg. As such the hs_force_except mechanism can be
removed.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211026145126.11025-3-josemartins90@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 --
 target/riscv/cpu_bits.h   |  6 ------
 target/riscv/cpu_helper.c | 26 +-------------------------
 3 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 325908287d..0760c0af93 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -352,8 +352,6 @@ int riscv_cpu_gdb_write_register(CPUState *cpu, uint8=
_t *buf, int reg);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
-bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
-void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index aa0bce4e06..9913fa9f77 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -444,12 +444,6 @@ typedef enum {
=20
 /* Virtulisation Register Fields */
 #define VIRT_ONOFF          1
-/* This is used to save state for when we take an exception. If this is =
set
- * that means that we want to force a HS level exception (no matter what=
 the
- * delegation is set to). This will occur for things such as a second le=
vel
- * page table fault.
- */
-#define FORCE_HS_EXCEP      2
=20
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5076580374..f30ff672f8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -270,24 +270,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, =
bool enable)
     env->virt =3D set_field(env->virt, VIRT_ONOFF, enable);
 }
=20
-bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return false;
-    }
-
-    return get_field(env->virt, FORCE_HS_EXCEP);
-}
-
-void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return;
-    }
-
-    env->virt =3D set_field(env->virt, FORCE_HS_EXCEP, enable);
-}
-
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
     return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
@@ -1004,7 +986,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
=20
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
-    bool force_hs_execp =3D riscv_cpu_force_hs_excep_enabled(env);
     uint64_t s;
=20
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wi=
de
@@ -1033,8 +1014,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
         case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
-            force_hs_execp =3D true;
-            /* fallthrough */
         case RISCV_EXCP_INST_ADDR_MIS:
         case RISCV_EXCP_INST_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
@@ -1093,8 +1072,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 0)=
;
             }
=20
-            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &=
&
-                !force_hs_execp) {
+            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) =
{
                 /* Trap to VS mode */
                 /*
                  * See if we need to adjust cause. Yes if its VS mode in=
terrupt
@@ -1116,7 +1094,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 htval =3D env->guest_phys_fault_addr;
=20
                 riscv_cpu_set_virt_enabled(env, 0);
-                riscv_cpu_set_force_hs_excep(env, 0);
             } else {
                 /* Trap into HS mode */
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV, fa=
lse);
@@ -1152,7 +1129,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
=20
             /* Trapping to M mode, virt is disabled */
             riscv_cpu_set_virt_enabled(env, 0);
-            riscv_cpu_set_force_hs_excep(env, 0);
         }
=20
         s =3D env->mstatus;
--=20
2.31.1


