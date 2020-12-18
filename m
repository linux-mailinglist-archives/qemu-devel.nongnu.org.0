Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF72DDE84
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:17:55 +0100 (CET)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq95O-0003rJ-7O
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qT-0006HU-CN
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:29 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qQ-0002GA-Mf
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271687; x=1639807687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQDp+Z5DgJDqq4g4UN948IKVTTZPhvjb+OtqhS8pZr0=;
 b=PL3IIiFcYwiNIU54Gdu5lR5IA4HV1sZMfouyw3REP3asgVGwdu0BRDws
 TTM8X0Ipg/udUt43+kWe/5qYV3lWh9VfQZoRU63Bg4nUYRTQV2kDeZovN
 E2+SDJP62Mo3fS8m0EK+DctP12zv3Gq0zsCo2nZPIBxZG7xZbxeepqDyl
 aMzDPil+vgD7iqD+A1Xa09t736j3C2zOY/NjvxavBDiZ4VBTRojoOQwml
 m6vg2lM6Nh3viPwb15qy8yH3QHdg8ALM4nIswOOvtrs1aZJty/4+eq0oV
 O8iIIN9O/ulXfFDfVUraUki+qVNqGk38hxTN1lWIiW4YJXR9n3JlNGClh g==;
IronPort-SDR: ex3ebJ41oLDkqF+0usy74jE3Pi6CLMLuUqi+rs5NtpqldLfYniriaLArAn4LE9mukDm43hTrzm
 eCDVEF+ml8nxjWzUuX5onGpXhaUYYQBazzf8guCHqKKCy/IvD661z0IMpjsiHQ+YBWSiQdj1CO
 0AORKOaku9hw8+byQbgbJhf6bA5/uRqatPXJf4SagPVU79KeI6mwRKZStsWsMbpu4Chti7kIhO
 rf6PH3hKDuJ5BwWHqZ06cyj/RaI1BOx+/uQSHSULCxaYXqxMmtqefwblqBRIakN+faJU2iTuVH
 RRg=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237070"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:34 +0800
IronPort-SDR: XNBvO1eHukuzHfM40W6JlzDPNd6LTMvocY514NJnFXYASSKUx1lxdkwDJyZ5ecmg8AOErMVoDl
 Yve9c3UxEDw3ZmsjG6Fys1S+PPLM6DOkxqPSIAcjB1e1ZaoYTrIlHfyK+EgrdoSMRzgc0DKsP9
 F2qGhksZk0DowEQFDsCFxlpJRPBeMfrQrMDQjXCNeRyJbAXjSlcavxOxD+IFLASUr8NNaobea/
 JKOQNUz56Ym0ejShKS2xZ12TM3mFAEX9Klfq6Gw5/rZSk3zn2z5m9+p/waC8ZHKUMGPt0P3oTU
 Dxwo5f77H6mihJYhNig2RlZW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:41 -0800
IronPort-SDR: iPk5J7SX/KxY+5sBg+BTUdQIbZ2psF6+wI7hC2YBcXPHkW9VIaWkM31XNsN/RZJXT/IApJqa7V
 xLio14vwPQc87o1bn43Cz8CI3z5320CTVayiHufzDsWVa+d7jnaguv+0uu60Nt3k69QI9ELy6i
 cZhm3uOKCdZ/j/vICn5WoeGX7fIvmydoph9gaXfAX8exIRu8yvqNFZoBO73d5TsJ1l+da+Rudz
 rls1mXxdLKlnaTEi2mX2fRa5T7rwkKNOAmXa2Wp0XehiOWA9nfh5r1H960mHANj/YCC4XppeDk
 idU=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:25 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 20/23] target/riscv: csr: Remove compile time XLEN checks
Date: Thu, 17 Dec 2020 22:01:11 -0800
Message-Id: <20201218060114.3591217-21-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Message-id: 7371180970b7db310d3a1da21d03d33499c2beb0.1608142916.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h |   4 +-
 target/riscv/csr.c      | 176 +++++++++++++++++++++-------------------
 2 files changed, 92 insertions(+), 88 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 92147332c6..b41e8836c3 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -437,9 +437,7 @@
 #define HSTATUS_VGEIN        0x0003F000
 #define HSTATUS_VTVM         0x00100000
 #define HSTATUS_VTSR         0x00400000
-#if defined(TARGET_RISCV64)
-#define HSTATUS_VSXL        0x300000000
-#endif
+#define HSTATUS_VSXL         0x300000000
 
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 93263f8e06..10ab82ed1f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -102,44 +102,65 @@ static int ctr(CPURISCVState *env, int csrno)
                 return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
-#if defined(TARGET_RISCV32)
-        case CSR_CYCLEH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
-                get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_TIMEH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
-                get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_INSTRETH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
-                get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        if (riscv_cpu_is_32bit(env)) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
+                    get_field(env->mcounteren, HCOUNTEREN_CY)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
+                    get_field(env->mcounteren, HCOUNTEREN_TM)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
+                    get_field(env->mcounteren, HCOUNTEREN_IR)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
+                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
             }
-            break;
-#endif
         }
     }
 #endif
     return 0;
 }
 
+static int ctr32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return ctr(env, csrno);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 static int any(CPURISCVState *env, int csrno)
 {
     return 0;
 }
 
+static int any32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+
+}
+
 static int smode(CPURISCVState *env, int csrno)
 {
     return -!riscv_has_ext(env, RVS);
@@ -161,6 +182,16 @@ static int hmode(CPURISCVState *env, int csrno)
     return -RISCV_EXCP_ILLEGAL_INST;
 }
 
+static int hmode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return 0;
+    }
+
+    return hmode(env, csrno);
+
+}
+
 static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
@@ -310,7 +341,6 @@ static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -324,7 +354,6 @@ static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     return 0;
 }
-#endif /* TARGET_RISCV32 */
 
 #if defined(CONFIG_USER_ONLY)
 static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
@@ -333,13 +362,11 @@ static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = cpu_get_host_ticks() >> 32;
     return 0;
 }
-#endif
 
 #else /* CONFIG_USER_ONLY */
 
@@ -355,7 +382,6 @@ static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 {
     uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
@@ -367,7 +393,6 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
     *val = (env->rdtime_fn(env->rdtime_fn_arg) + delta) >> 32;
     return 0;
 }
-#endif
 
 /* Machine constants */
 
@@ -406,19 +431,17 @@ static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
-#if defined(TARGET_RISCV32)
-static const char valid_vm_1_10[16] = {
+static const char valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV32] = 1
 };
-#elif defined(TARGET_RISCV64)
-static const char valid_vm_1_10[16] = {
+
+static const char valid_vm_1_10_64[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV39] = 1,
     [VM_1_10_SV48] = 1,
     [VM_1_10_SV57] = 1
 };
-#endif /* CONFIG_USER_ONLY */
 
 /* Machine Information Registers */
 static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
@@ -441,7 +464,11 @@ static int read_mstatus(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    return valid_vm_1_10[vm & 0xf];
+    if (riscv_cpu_is_32bit(env)) {
+        return valid_vm_1_10_32[vm & 0xf];
+    } else {
+        return valid_vm_1_10_64[vm & 0xf];
+    }
 }
 
 static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
@@ -459,13 +486,14 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW;
-#if defined(TARGET_RISCV64)
-    /*
-     * RV32: MPV and GVA are not in mstatus. The current plan is to
-     * add them to mstatush. For now, we just don't support it.
-     */
-    mask |= MSTATUS_MPV | MSTATUS_GVA;
-#endif
+
+    if (!riscv_cpu_is_32bit(env)) {
+        /*
+         * RV32: MPV and GVA are not in mstatus. The current plan is to
+         * add them to mstatush. For now, we just don't support it.
+         */
+        mask |= MSTATUS_MPV | MSTATUS_GVA;
+    }
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
@@ -477,7 +505,6 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-#ifdef TARGET_RISCV32
 static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->mstatus >> 32;
@@ -497,7 +524,6 @@ static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
 
     return 0;
 }
-#endif
 
 static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -895,10 +921,10 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
 static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->hstatus;
-#ifdef TARGET_RISCV64
-    /* We only support 64-bit VSXL */
-    *val = set_field(*val, HSTATUS_VSXL, 2);
-#endif
+    if (!riscv_cpu_is_32bit(env)) {
+        /* We only support 64-bit VSXL */
+        *val = set_field(*val, HSTATUS_VSXL, 2);
+    }
     /* We only support little endian */
     *val = set_field(*val, HSTATUS_VSBE, 0);
     return 0;
@@ -907,11 +933,9 @@ static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
 {
     env->hstatus = val;
-#ifdef TARGET_RISCV64
-    if (get_field(val, HSTATUS_VSXL) != 2) {
+    if (!riscv_cpu_is_32bit(env) && get_field(val, HSTATUS_VSXL) != 2) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
     }
-#endif
     if (get_field(val, HSTATUS_VSBE) != 0) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support big endian guests.");
     }
@@ -1053,11 +1077,7 @@ static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
-#if defined(TARGET_RISCV32)
-    *val = env->htimedelta & 0xffffffff;
-#else
     *val = env->htimedelta;
-#endif
     return 0;
 }
 
@@ -1067,15 +1087,14 @@ static int write_htimedelta(CPURISCVState *env, int csrno, target_ulong val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
-#if defined(TARGET_RISCV32)
-    env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
-#else
-    env->htimedelta = val;
-#endif
+    if (riscv_cpu_is_32bit(env)) {
+        env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
+    } else {
+        env->htimedelta = val;
+    }
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_htimedeltah(CPURISCVState *env, int csrno, target_ulong *val)
 {
     if (!env->rdtime_fn) {
@@ -1095,7 +1114,6 @@ static int write_htimedeltah(CPURISCVState *env, int csrno, target_ulong val)
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
     return 0;
 }
-#endif
 
 /* Virtual CSR Registers */
 static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
@@ -1374,26 +1392,20 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-#if defined(TARGET_RISCV32)
-    [CSR_CYCLEH] =              { ctr,  read_instreth                       },
-    [CSR_INSTRETH] =            { ctr,  read_instreth                       },
-#endif
+    [CSR_CYCLEH] =              { ctr32,  read_instreth                     },
+    [CSR_INSTRETH] =            { ctr32,  read_instreth                     },
 
     /* In privileged mode, the monitor will have to emulate TIME CSRs only if
      * rdtime callback is not provided by machine/platform emulation */
     [CSR_TIME] =                { ctr,  read_time                           },
-#if defined(TARGET_RISCV32)
-    [CSR_TIMEH] =               { ctr,  read_timeh                          },
-#endif
+    [CSR_TIMEH] =               { ctr32,  read_timeh                        },
 
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE] =              { any,  read_instret                        },
     [CSR_MINSTRET] =            { any,  read_instret                        },
-#if defined(TARGET_RISCV32)
-    [CSR_MCYCLEH] =             { any,  read_instreth                       },
-    [CSR_MINSTRETH] =           { any,  read_instreth                       },
-#endif
+    [CSR_MCYCLEH] =             { any32,  read_instreth                     },
+    [CSR_MINSTRETH] =           { any32,  read_instreth                     },
 
     /* Machine Information Registers */
     [CSR_MVENDORID] =           { any,  read_zero                           },
@@ -1410,9 +1422,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVEC] =               { any,  read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN] =          { any,  read_mcounteren,  write_mcounteren  },
 
-#if defined(TARGET_RISCV32)
-    [CSR_MSTATUSH] =            { any,  read_mstatush,    write_mstatush    },
-#endif
+    [CSR_MSTATUSH] =            { any32,  read_mstatush,    write_mstatush  },
 
     [CSR_MSCOUNTEREN] =         { any,  read_mscounteren, write_mscounteren },
 
@@ -1452,9 +1462,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HGEIP] =               { hmode,   read_hgeip,       write_hgeip      },
     [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
     [CSR_HTIMEDELTA] =          { hmode,   read_htimedelta,  write_htimedelta },
-#if defined(TARGET_RISCV32)
-    [CSR_HTIMEDELTAH] =         { hmode,   read_htimedeltah, write_htimedeltah},
-#endif
+    [CSR_HTIMEDELTAH] =         { hmode32,   read_htimedeltah, write_htimedeltah},
 
     [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
     [CSR_VSIP] =                { hmode,   NULL,     NULL,     rmw_vsip       },
@@ -1477,9 +1485,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HPMCOUNTER3   ... CSR_HPMCOUNTER31] =    { ctr,  read_zero          },
     [CSR_MHPMCOUNTER3  ... CSR_MHPMCOUNTER31] =   { any,  read_zero          },
     [CSR_MHPMEVENT3    ... CSR_MHPMEVENT31] =     { any,  read_zero          },
-#if defined(TARGET_RISCV32)
-    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr,  read_zero          },
-    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any,  read_zero          },
-#endif
+    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr32,  read_zero        },
+    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any32,  read_zero        },
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.29.2


