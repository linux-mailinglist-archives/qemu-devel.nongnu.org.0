Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD0D43DAA6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 07:08:53 +0200 (CEST)
Received: from localhost ([::1]:59580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxem-0002ur-Uv
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 01:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxI9-0001Ll-N9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:29 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:42396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxI3-0005CM-BY
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396322; x=1666932322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uT0cvGbgwLHa6h/L8pMyTB93NNsouaRxSleBwq0/OVI=;
 b=PG9CW7jQzKI3BYKtiOxMLiJYump6LdwNY3CuZEctDNvBHv1Wa65sxuQs
 w5gK5S3qCJMtKcxWImLwI0zwiEA8va6dzZAs6qPZJEMBw/LgbJKRELkAh
 vlnrzfvd+gTMcbqR3cX3R02+daZs/QfB0uu61DMcm4n3JeUZO03Da/h3z
 lICMH2Qu64TPNsKQiOBOiGnq0sMrg+2+fweYtRJXsOBCv0KopJGoMRmDv
 6M0PzUwiZoQsSarbE9DuKSBm396z9wCyy09vFAyq2BKqLepqMLed2QP/f
 HFVyRnru/av4UDjVEcFEJX/oJanTYKqvR7o7NnKKldVaPmIkO3KspcWhT g==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="188815826"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:45:21 +0800
IronPort-SDR: WAmJyoCbpE8qsVtnpc2wrArns8cpzUY6edI9ICQ4CWgfOuibBzFKx/M2lOO8purx3fTqKN/+wc
 L+mb7xmBBMYibjmyyHH5f4EjC+7ZYFhbVlrAtMse3AgO3BL39Hdb2R9O3qqgztbADsBEMFGV6H
 fvxzPkQy1nKN2vDFSml+h7TMSJAFp0ZCIKLBEuSlFgYworMP751IqoM0Vey1ZoqYPN6eRGOXiw
 uswvWGPMrAaoD0HNyzlzkmw88LSZh0UIheW9Za3P+hF64WT0Wj5iclcCy9qHvJZ4UE/ZXT9mMP
 HFGUYHd2ShHoFp9e9k3yaFfA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:19:17 -0700
IronPort-SDR: 8uiuwIQzzZOVUa6i7SL/LzZGouTYov1w/gcsNd+H8lCc7WHP6gaegrpWaFelSN135u6/+acf2A
 7ep/hbmQt6zh67En9GwW+kyaKdGaf2s5kpFU2Sl8qCuANq6mPB1rg4qyCbTzLantXO9krPAV9X
 WMlRv5Lt1YXfpjP/0SiTOaXuEDBhr+WxrlA+vll2n0yC8N5um2x0QiX06d7BJ8aMInqXmg6PN1
 LW0C/PlSRR2+fz3ngL74M5fblWoQyqk6PaqvxkPDD+2YDSywmUnPNvS8RVqG4BZtdwRf4v9/N6
 tJc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:45:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftKG2BTVz1RtVp
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:45:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396321; x=1637988322; bh=uT0cvGbgwLHa6h/L8p
 MyTB93NNsouaRxSleBwq0/OVI=; b=RVVkJqHwn/oiAuCdXXwKSJSJOpU8eFiX54
 bU5+dpiS9vqWQtiIUl0ibdlmcvrDN22tzhIg8Wj/ZaGTj8ze0zXg9rrN6YotYKuP
 GLuX4GbY61NtBPFOoD6p9ZugKdPaHaR427BrgswFMwbvCw2GNsEUa7eGtT0NCkYi
 /h4Jjv4O0At86X6cFCr15D3+YaO00gFtopTVIhtmu+Qw0bRoY5uBFj3LNjKX+0ig
 URD8KBFlLH8sNMo90+ckiHJS4maOtG0nul6QmVBXxjPUSN0o6cNJw+FjeVABUbjR
 tEsnQxCGJDDlJXAt4sinFTIbsZfvPddv+zO9qnz4YRHdvAeZiItg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GFAKtZR3xEoa for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:45:21 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftKB5mL7z1RtVl;
 Wed, 27 Oct 2021 21:45:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jose Martins <josemartins90@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/18] target/riscv: remove force HS exception
Date: Thu, 28 Oct 2021 14:43:42 +1000
Message-Id: <20211028044342.3070385-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


