Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AB1E6F1B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 00:33:37 +0200 (CEST)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeR5k-0000HT-5e
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 18:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4104b2603=alistair.francis@wdc.com>)
 id 1jeQxP-0005QI-BJ; Thu, 28 May 2020 18:24:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4104b2603=alistair.francis@wdc.com>)
 id 1jeQxM-0008Aq-DA; Thu, 28 May 2020 18:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1590704696; x=1622240696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7XsObUTOmANBGkm0Z0f9CxYlI3PAM1BkJFcltW/HVKU=;
 b=h8ZGZaQbG1hq95dFYL6wO142/TlWkR3b4lZ+8uLybPwsyc2WpifMSJ0i
 m8H2jy9xGfKGRXmBddn5B+zNQIsn1NRr5OaqJe05DLI1oOFAIqvrnKT2K
 WCQhoMYLiLTUgy4b24tBTKaH62G/uRCDuhKi/zz2s40qkQKwEK1dMzu8H
 E6YbmohcS+ycHbJM2MIlDwXb1U1TEeEYu/VB4xTRkk+GtJ9UI7JV81nfl
 3+CH6UqQDTD8Z5NWI6jKjMlCPta647I+gDKfeLHopnA2qeda0QMFf6dNM
 k/BjiZ3XTzlKccfpkexJs4OT3i3M4ntm9m//NTuAh2TvUcQ92MTfN6UMg w==;
IronPort-SDR: VG64szpQys+IRZoNo7phwW3CDkC32jHlUH5ehdWh8qaZaK65l1rhb4VQA9TC+2cGh3Wd5b1t+8
 iCopQirqall+bD5TrMM/6tch17wvmB4sORwvXWZXbm6wJa+Aidnz9QJHKOfoLhApUxIMiDGsoB
 brJ8H9N5I6t/2SWyJ5SDfiesHyDWDvB7H8thfzCpWUElFnLwPbt65noVDgWMIZgedU3U6CLdFO
 gQBRV2/TjaDVXzgyf8Q1KgIx6+P7teQOrplz5tbBjBXCnMYFANfz+E46xENjin683EMRz2wEZ1
 hEA=
X-IronPort-AV: E=Sophos;i="5.73,446,1583164800"; d="scan'208";a="247810986"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2020 06:24:49 +0800
IronPort-SDR: BbYK8ZfACSiddrOoT4XGGtVHJPP5+mTRJbvhk3O7bEIVz1XEt1bVRj/yjcCImIPhx5wqppHC1Z
 k3jX8C7eWyC54vPv1i0EQn8fMihGLFrK4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 15:14:05 -0700
IronPort-SDR: GYT4v7u7Y8438J8lipwB8JwK7F1pZR/smHqswBc+ilG236B0GNPYhShtUZIjVmnJQpCW48yV7x
 aKdJnuLHf0zw==
WDCIronportException: Internal
Received: from 6xf7cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.123])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 May 2020 15:24:49 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 3/4] target/riscv: Drop support for ISA spec version 1.09.1
Date: Thu, 28 May 2020 15:16:13 -0700
Message-Id: <8f4f5104c0687f6c11d41f8b72f6b57cc1e9f4a5.1590704110.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590704110.git.alistair.francis@wdc.com>
References: <cover.1590704110.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=4104b2603=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 18:24:44
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RISC-V ISA spec version 1.09.1 has been deprecated in QEMU since
4.1. It's not commonly used so let's remove support for it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/deprecated.rst                    |  20 +--
 target/riscv/cpu.h                            |   1 -
 target/riscv/cpu.c                            |   2 -
 target/riscv/cpu_helper.c                     |  82 ++++-------
 target/riscv/csr.c                            | 138 ++++--------------
 .../riscv/insn_trans/trans_privileged.inc.c   |  18 +--
 target/riscv/monitor.c                        |   5 -
 target/riscv/op_helper.c                      |  17 +--
 8 files changed, 73 insertions(+), 210 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index a6664bfca9..38865daafc 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -301,16 +301,6 @@ The ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, and
 ``acl_remove`` commands are deprecated with no replacement. Authorization
 for VNC should be performed using the pluggable QAuthZ objects.
 
-Guest Emulator ISAs
--------------------
-
-RISC-V ISA privledge specification version 1.09.1 (since 4.1)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The RISC-V ISA privledge specification version 1.09.1 has been deprecated.
-QEMU supports both the newer version 1.10.0 and the ratified version 1.11.0, these
-should be used instead of the 1.09.1 version.
-
 System emulator CPUS
 --------------------
 
@@ -471,6 +461,16 @@ The ``hub_id`` parameter of ``hostfwd_add`` / ``hostfwd_remove`` (removed in 5.0
 The ``[hub_id name]`` parameter tuple of the 'hostfwd_add' and
 'hostfwd_remove' HMP commands has been replaced by ``netdev_id``.
 
+Guest Emulator ISAs
+-------------------
+
+RISC-V ISA privledge specification version 1.09.1 (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The RISC-V ISA privledge specification version 1.09.1 has been removed.
+QEMU supports both the newer version 1.10.0 and the ratified version 1.11.0, these
+should be used instead of the 1.09.1 version.
+
 System emulator CPUS
 --------------------
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 76b98d7a33..c022539012 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -73,7 +73,6 @@ enum {
     RISCV_FEATURE_MISA
 };
 
-#define PRIV_VERSION_1_09_1 0x00010901
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 112f2e3a2f..eeb91f8513 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -368,8 +368,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             priv_version = PRIV_VERSION_1_11_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version = PRIV_VERSION_1_10_0;
-        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.9.1")) {
-            priv_version = PRIV_VERSION_1_09_1;
         } else {
             error_setg(errp,
                        "Unsupported privilege spec version '%s'",
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index bc80aa87cf..62fe1ecc8f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -364,57 +364,36 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         mxr = get_field(env->vsstatus, MSTATUS_MXR);
     }
 
-    if (env->priv_ver >= PRIV_VERSION_1_10_0) {
-        if (first_stage == true) {
-            if (use_background) {
-                base = (hwaddr)get_field(env->vsatp, SATP_PPN) << PGSHIFT;
-                vm = get_field(env->vsatp, SATP_MODE);
-            } else {
-                base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
-                vm = get_field(env->satp, SATP_MODE);
-            }
-            widened = 0;
+    if (first_stage == true) {
+        if (use_background) {
+            base = (hwaddr)get_field(env->vsatp, SATP_PPN) << PGSHIFT;
+            vm = get_field(env->vsatp, SATP_MODE);
         } else {
-            base = (hwaddr)get_field(env->hgatp, HGATP_PPN) << PGSHIFT;
-            vm = get_field(env->hgatp, HGATP_MODE);
-            widened = 2;
-        }
-        sum = get_field(env->mstatus, MSTATUS_SUM);
-        switch (vm) {
-        case VM_1_10_SV32:
-          levels = 2; ptidxbits = 10; ptesize = 4; break;
-        case VM_1_10_SV39:
-          levels = 3; ptidxbits = 9; ptesize = 8; break;
-        case VM_1_10_SV48:
-          levels = 4; ptidxbits = 9; ptesize = 8; break;
-        case VM_1_10_SV57:
-          levels = 5; ptidxbits = 9; ptesize = 8; break;
-        case VM_1_10_MBARE:
-            *physical = addr;
-            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-            return TRANSLATE_SUCCESS;
-        default:
-          g_assert_not_reached();
+            base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
+            vm = get_field(env->satp, SATP_MODE);
         }
-    } else {
         widened = 0;
-        base = (hwaddr)(env->sptbr) << PGSHIFT;
-        sum = !get_field(env->mstatus, MSTATUS_PUM);
-        vm = get_field(env->mstatus, MSTATUS_VM);
-        switch (vm) {
-        case VM_1_09_SV32:
-          levels = 2; ptidxbits = 10; ptesize = 4; break;
-        case VM_1_09_SV39:
-          levels = 3; ptidxbits = 9; ptesize = 8; break;
-        case VM_1_09_SV48:
-          levels = 4; ptidxbits = 9; ptesize = 8; break;
-        case VM_1_09_MBARE:
-            *physical = addr;
-            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-            return TRANSLATE_SUCCESS;
-        default:
-          g_assert_not_reached();
-        }
+    } else {
+        base = (hwaddr)get_field(env->hgatp, HGATP_PPN) << PGSHIFT;
+        vm = get_field(env->hgatp, HGATP_MODE);
+        widened = 2;
+    }
+    sum = get_field(env->mstatus, MSTATUS_SUM);
+    switch (vm) {
+    case VM_1_10_SV32:
+      levels = 2; ptidxbits = 10; ptesize = 4; break;
+    case VM_1_10_SV39:
+      levels = 3; ptidxbits = 9; ptesize = 8; break;
+    case VM_1_10_SV48:
+      levels = 4; ptidxbits = 9; ptesize = 8; break;
+    case VM_1_10_SV57:
+      levels = 5; ptidxbits = 9; ptesize = 8; break;
+    case VM_1_10_MBARE:
+        *physical = addr;
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return TRANSLATE_SUCCESS;
+    default:
+      g_assert_not_reached();
     }
 
     CPUState *cs = env_cpu(env);
@@ -588,7 +567,6 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     int page_fault_exceptions;
     if (first_stage) {
         page_fault_exceptions =
-            (env->priv_ver >= PRIV_VERSION_1_10_0) &&
             get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
             !pmp_violation;
     } else {
@@ -941,8 +919,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
 
         s = env->mstatus;
-        s = set_field(s, MSTATUS_SPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
-            get_field(s, MSTATUS_SIE) : get_field(s, MSTATUS_UIE << env->priv));
+        s = set_field(s, MSTATUS_SPIE, get_field(s, MSTATUS_SIE));
         s = set_field(s, MSTATUS_SPP, env->priv);
         s = set_field(s, MSTATUS_SIE, 0);
         env->mstatus = s;
@@ -979,8 +956,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
 
         s = env->mstatus;
-        s = set_field(s, MSTATUS_MPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
-            get_field(s, MSTATUS_MIE) : get_field(s, MSTATUS_UIE << env->priv));
+        s = set_field(s, MSTATUS_MPIE, get_field(s, MSTATUS_MIE));
         s = set_field(s, MSTATUS_MPP, env->priv);
         s = set_field(s, MSTATUS_MIE, 0);
         env->mstatus = s;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 11d184cd16..383be0a955 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -58,31 +58,11 @@ static int ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
-    uint32_t ctr_en = ~0u;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
         return -1;
     }
-
-    /*
-     * The counters are always enabled at run time on newer priv specs, as the
-     * CSR has changed from controlling that the counters can be read to
-     * controlling that the counters increment.
-     */
-    if (env->priv_ver > PRIV_VERSION_1_09_1) {
-        return 0;
-    }
-
-    if (env->priv < PRV_M) {
-        ctr_en &= env->mcounteren;
-    }
-    if (env->priv < PRV_S) {
-        ctr_en &= env->scounteren;
-    }
-    if (!(ctr_en & (1u << (csrno & 31)))) {
-        return -1;
-    }
 #endif
     return 0;
 }
@@ -293,9 +273,6 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
     (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
-static const target_ulong sstatus_v1_9_mask = SSTATUS_SIE | SSTATUS_SPIE |
-    SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_SD;
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
@@ -304,20 +281,11 @@ static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
 #if defined(TARGET_RISCV32)
-static const char valid_vm_1_09[16] = {
-    [VM_1_09_MBARE] = 1,
-    [VM_1_09_SV32] = 1,
-};
 static const char valid_vm_1_10[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV32] = 1
 };
 #elif defined(TARGET_RISCV64)
-static const char valid_vm_1_09[16] = {
-    [VM_1_09_MBARE] = 1,
-    [VM_1_09_SV39] = 1,
-    [VM_1_09_SV48] = 1,
-};
 static const char valid_vm_1_10[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV39] = 1,
@@ -347,8 +315,7 @@ static int read_mstatus(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    return (env->priv_ver >= PRIV_VERSION_1_10_0) ?
-        valid_vm_1_10[vm & 0xf] : valid_vm_1_09[vm & 0xf];
+    return valid_vm_1_10[vm & 0xf];
 }
 
 static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
@@ -358,34 +325,21 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     int dirty;
 
     /* flush tlb on mstatus fields that affect VM */
-    if (env->priv_ver <= PRIV_VERSION_1_09_1) {
-        if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP |
-                MSTATUS_MPRV | MSTATUS_SUM | MSTATUS_VM)) {
-            tlb_flush(env_cpu(env));
-        }
-        mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
-            MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
-            MSTATUS_MPP | MSTATUS_MXR |
-            (validate_vm(env, get_field(val, MSTATUS_VM)) ?
-                MSTATUS_VM : 0);
+    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
+            MSTATUS_MPRV | MSTATUS_SUM)) {
+        tlb_flush(env_cpu(env));
     }
-    if (env->priv_ver >= PRIV_VERSION_1_10_0) {
-        if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-                MSTATUS_MPRV | MSTATUS_SUM)) {
-            tlb_flush(env_cpu(env));
-        }
-        mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
-            MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
-            MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-            MSTATUS_TW;
+    mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
+        MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
+        MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
+        MSTATUS_TW;
 #if defined(TARGET_RISCV64)
-            /*
-             * RV32: MPV and MTL are not in mstatus. The current plan is to
-             * add them to mstatush. For now, we just don't support it.
-             */
-            mask |= MSTATUS_MTL | MSTATUS_MPV;
+    /*
+     * RV32: MPV and MTL are not in mstatus. The current plan is to
+     * add them to mstatush. For now, we just don't support it.
+     */
+    mask |= MSTATUS_MTL | MSTATUS_MPV;
 #endif
-    }
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
@@ -534,18 +488,12 @@ static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_mcounteren(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_10_0) {
-        return -1;
-    }
     *val = env->mcounteren;
     return 0;
 }
 
 static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_10_0) {
-        return -1;
-    }
     env->mcounteren = val;
     return 0;
 }
@@ -553,8 +501,7 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
 /* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    if (env->priv_ver > PRIV_VERSION_1_09_1
-        && env->priv_ver < PRIV_VERSION_1_11_0) {
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
         return -1;
     }
     *val = env->mcounteren;
@@ -564,32 +511,13 @@ static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
 /* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
 {
-    if (env->priv_ver > PRIV_VERSION_1_09_1
-        && env->priv_ver < PRIV_VERSION_1_11_0) {
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
         return -1;
     }
     env->mcounteren = val;
     return 0;
 }
 
-static int read_mucounteren(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    if (env->priv_ver > PRIV_VERSION_1_09_1) {
-        return -1;
-    }
-    *val = env->scounteren;
-    return 0;
-}
-
-static int write_mucounteren(CPURISCVState *env, int csrno, target_ulong val)
-{
-    if (env->priv_ver > PRIV_VERSION_1_09_1) {
-        return -1;
-    }
-    env->scounteren = val;
-    return 0;
-}
-
 /* Machine Trap Handling */
 static int read_mscratch(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -663,16 +591,14 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
 /* Supervisor Trap Setup */
 static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    target_ulong mask = ((env->priv_ver >= PRIV_VERSION_1_10_0) ?
-                         sstatus_v1_10_mask : sstatus_v1_9_mask);
+    target_ulong mask = (sstatus_v1_10_mask);
     *val = env->mstatus & mask;
     return 0;
 }
 
 static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
 {
-    target_ulong mask = ((env->priv_ver >= PRIV_VERSION_1_10_0) ?
-                         sstatus_v1_10_mask : sstatus_v1_9_mask);
+    target_ulong mask = (sstatus_v1_10_mask);
     target_ulong newval = (env->mstatus & ~mask) | (val & mask);
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
@@ -722,18 +648,12 @@ static int write_stvec(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_scounteren(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_10_0) {
-        return -1;
-    }
     *val = env->scounteren;
     return 0;
 }
 
 static int write_scounteren(CPURISCVState *env, int csrno, target_ulong val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_10_0) {
-        return -1;
-    }
     env->scounteren = val;
     return 0;
 }
@@ -812,15 +732,15 @@ static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
 {
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         *val = 0;
-    } else if (env->priv_ver >= PRIV_VERSION_1_10_0) {
-        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
-            return -1;
-        } else {
-            *val = env->satp;
-        }
+        return 0;
+    }
+
+    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+        return -1;
     } else {
-        *val = env->sptbr;
+        *val = env->satp;
     }
+
     return 0;
 }
 
@@ -829,13 +749,7 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return 0;
     }
-    if (env->priv_ver <= PRIV_VERSION_1_09_1 && (val ^ env->sptbr)) {
-        tlb_flush(env_cpu(env));
-        env->sptbr = val & (((target_ulong)
-            1 << (TARGET_PHYS_ADDR_SPACE_BITS - PGSHIFT)) - 1);
-    }
-    if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        validate_vm(env, get_field(val, SATP_MODE)) &&
+    if (validate_vm(env, get_field(val, SATP_MODE)) &&
         ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
     {
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
@@ -1313,8 +1227,6 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MSTATUSH] =            { any,  read_mstatush,    write_mstatush    },
 #endif
 
-    /* Legacy Counter Setup (priv v1.9.1) */
-    [CSR_MUCOUNTEREN] =         { any,  read_mucounteren, write_mucounteren },
     [CSR_MSCOUNTEREN] =         { any,  read_mscounteren, write_mscounteren },
 
     /* Machine Trap Handling */
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index 76c2fad71c..5f26e0f5ea 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -85,30 +85,21 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
-    if (ctx->priv_ver >= PRIV_VERSION_1_10_0) {
-        gen_helper_tlb_flush(cpu_env);
-        return true;
-    }
+    gen_helper_tlb_flush(cpu_env);
+    return true;
 #endif
     return false;
 }
 
 static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
 {
-#ifndef CONFIG_USER_ONLY
-    if (ctx->priv_ver <= PRIV_VERSION_1_09_1) {
-        gen_helper_tlb_flush(cpu_env);
-        return true;
-    }
-#endif
     return false;
 }
 
 static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
-    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
-        has_ext(ctx, RVH)) {
+    if (has_ext(ctx, RVH)) {
         /* Hpervisor extensions exist */
         /*
          * if (env->priv == PRV_M ||
@@ -127,8 +118,7 @@ static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
 static bool trans_hfence_bvma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
-    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
-        has_ext(ctx, RVH)) {
+    if (has_ext(ctx, RVH)) {
         /* Hpervisor extensions exist */
         /*
          * if (env->priv == PRV_M ||
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index d725a7a36e..b569f08387 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -215,11 +215,6 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    if (env->priv_ver < PRIV_VERSION_1_10_0) {
-        monitor_printf(mon, "Privileged mode < 1.10 unsupported\n");
-        return;
-    }
-
     if (!(env->satp & SATP_MODE)) {
         monitor_printf(mon, "No translation or protection\n");
         return;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index c6412f680c..b0c49efc4a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -84,8 +84,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
         riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
     }
 
-    if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(env->mstatus, MSTATUS_TSR) && !(env->priv >= PRV_M)) {
+    if (get_field(env->mstatus, MSTATUS_TSR) && !(env->priv >= PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
 
@@ -119,10 +118,8 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
     } else {
         prev_priv = get_field(mstatus, MSTATUS_SPP);
 
-        mstatus = set_field(mstatus,
-            env->priv_ver >= PRIV_VERSION_1_10_0 ?
-            MSTATUS_SIE : MSTATUS_UIE << prev_priv,
-            get_field(mstatus, MSTATUS_SPIE));
+        mstatus = set_field(mstatus, MSTATUS_SIE,
+                            get_field(mstatus, MSTATUS_SPIE));
         mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
         mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
         env->mstatus = mstatus;
@@ -147,10 +144,8 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
     target_ulong mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
     target_ulong prev_virt = MSTATUS_MPV_ISSET(env);
-    mstatus = set_field(mstatus,
-        env->priv_ver >= PRIV_VERSION_1_10_0 ?
-        MSTATUS_MIE : MSTATUS_UIE << prev_priv,
-        get_field(mstatus, MSTATUS_MPIE));
+    mstatus = set_field(mstatus, MSTATUS_MIE,
+                        get_field(mstatus, MSTATUS_MPIE));
     mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
 #ifdef TARGET_RISCV32
@@ -177,7 +172,6 @@ void helper_wfi(CPURISCVState *env)
     CPUState *cs = env_cpu(env);
 
     if ((env->priv == PRV_S &&
-        env->priv_ver >= PRIV_VERSION_1_10_0 &&
         get_field(env->mstatus, MSTATUS_TW)) ||
         riscv_cpu_virt_enabled(env)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
@@ -193,7 +187,6 @@ void helper_tlb_flush(CPURISCVState *env)
     CPUState *cs = env_cpu(env);
     if (!(env->priv >= PRV_S) ||
         (env->priv == PRV_S &&
-         env->priv_ver >= PRIV_VERSION_1_10_0 &&
          get_field(env->mstatus, MSTATUS_TVM))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
-- 
2.26.2


