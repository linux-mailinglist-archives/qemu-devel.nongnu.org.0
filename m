Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C1B37A494
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:27:41 +0200 (CEST)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPc4-0004b8-2E
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPUu-0008Jp-LR
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:21 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPUn-0006V6-8z
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728407; x=1652264407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BdYYVeUYgq1mi3A8UHIIcrCtropB7TiiKZWRQSAagxg=;
 b=KmfMBAq/+/gYJvq9BKqOUL4ycGEtqwEZY2rQ3TZ496fz3mjw1ICPU7l9
 SLis5aWnNUwQEG99RjFBz41Rd4aU61BlnxctpGs1BJKYaapTnY8LQc0tJ
 9yDX9Hje6wgm5TZeUN9ubnoLzELZR7eN3BdcPtNgjX3sa0yGM6XA3pJfB
 Ho9KMG6v/zAkPcGhOxmhP+MuzO7s9bB7m/8HMc+hNXQza6beEDNhcW48Z
 nFe+kLGzWFKbVHDnfQPPMpw0XLnk4UJmHz4aUxpQ4aXU7Rjc8hubB8f+j
 bG8/U8n1mnt30k5DOco4C2oLKC/U0IaWtf3tWXnyTG0HWp/KmnWx2iERE w==;
IronPort-SDR: DRurbCGvTwk5yELL0a8Jg2aqfCWdSgKRgVJl8MlPEV3P7eFdAmKAl1FBUfSgS7o4G9YXxE2kKm
 LPZLrJnDdSSYKfasGcS2U9pWrEYDFWXiUVjAZfzqOakHM9+PPggvJvAO9kbwccLjbeyvRNaOOT
 xAXG4ceBw0u3s9FC+dBPm+386PCc/u9l3cQrcl41/AOIsQJNM7QQbM82OoKr/3B3AMm77oGIbb
 +tPoGjCLx6QIr0pA4z9OGbhZ+7ldN+4Qff8QUohsP09+4XCsGPgX6a8B1D55XF/4wLFap7osIW
 GcM=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735325"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:05 +0800
IronPort-SDR: f14K/L3Qh8hlUHQL0rf9qTZM0jP8Fz+g4vAzcStNy8ifCYSkvKCwsafmZalmHwP242uKSInPvG
 /yvrqPF/ZTZl55URwFS3Bct9LmR6QNpGodfwhj/JZXKZUpAhooGS2y+dYc+vJiyJgoNlqU0oyx
 8eonMrGCsHxHo8NgNFJ2Tp3BiPSq3XiBNybuSf25bX1IMFtcqU/VD4HMTFpdztfFT8oeRQS1SY
 pDovQiCnVGGMhLaJ0b6GjCinrEwCNttxZVQXCmebMdqknwcS1QYOAXM1980dFtECHwLzHmnqtV
 +bXLUpAV4Yp/t44YB1r5rHo9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:04 -0700
IronPort-SDR: vTjTenOGJk2HKyjCn5yko6iy+rqdjCmUXV4TlsKSyLtDHnoqPP84yOfj416t5RtpE7O3fvwgQ9
 3amaSOvbR6qpEvJrdhOkrwJDHy4hWA7xar2XxRCOPrvQ6RKlGpykeR5gQo6lLYKJP7z1LdZTRK
 rnUgp8478TeOwrUIW6CsFPGrV2W0TJb2MLXpjOnf+5m6+H0JCU5r5ekknr9/SjhZvxheqCYhwZ
 QSoU65pjUotUhJk1BIoqVc+GKRIswoWEUZu0EYqvh+b3i2zXi6pTn3k5GEe9lJVJiWYdwjryB7
 9rU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 01/42] target/riscv: Remove privilege v1.9 specific CSR
 related code
Date: Tue, 11 May 2021 20:19:10 +1000
Message-Id: <20210511101951.165287-2-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Atish Patra <atish.patra@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

Qemu doesn't support RISC-V privilege specification v1.9. Remove the
remaining v1.9 specific references from the implementation.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210319194534.2082397-2-atish.patra@wdc.com>
[Changes by AF:
 - Rebase on latest patches
 - Bump the vmstate_riscv_cpu version_id and minimum_version_id
 ]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  4 +---
 target/riscv/cpu_bits.h   | 23 ---------------------
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_helper.c | 12 +++++------
 target/riscv/csr.c        | 42 ++++++++++-----------------------------
 target/riscv/machine.c    |  8 +++-----
 target/riscv/translate.c  |  4 ++--
 7 files changed, 23 insertions(+), 72 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..311b1db875 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -163,10 +163,8 @@ struct CPURISCVState {
     target_ulong mie;
     target_ulong mideleg;
 
-    target_ulong sptbr;  /* until: priv-1.9.1 */
     target_ulong satp;   /* since: priv-1.10.0 */
-    target_ulong sbadaddr;
-    target_ulong mbadaddr;
+    target_ulong stval;
     target_ulong medeleg;
 
     target_ulong stvec;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..b42dd4f8d8 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -153,12 +153,6 @@
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
-/* Legacy Counter Setup (priv v1.9.1) */
-/* Update to #define CSR_MCOUNTINHIBIT 0x320 for 1.11.0 */
-#define CSR_MUCOUNTEREN     0x320
-#define CSR_MSCOUNTEREN     0x321
-#define CSR_MHCOUNTEREN     0x322
-
 /* Machine Trap Handling */
 #define CSR_MSCRATCH        0x340
 #define CSR_MEPC            0x341
@@ -166,9 +160,6 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
-/* Legacy Machine Trap Handling (priv v1.9.1) */
-#define CSR_MBADADDR        0x343
-
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
 #define CSR_SEDELEG         0x102
@@ -184,9 +175,6 @@
 #define CSR_STVAL           0x143
 #define CSR_SIP             0x144
 
-/* Legacy Supervisor Trap Handling (priv v1.9.1) */
-#define CSR_SBADADDR        0x143
-
 /* Supervisor Protection and Translation */
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
@@ -354,14 +342,6 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
-/* Legacy Machine Protection and Translation (priv v1.9.1) */
-#define CSR_MBASE           0x380
-#define CSR_MBOUND          0x381
-#define CSR_MIBASE          0x382
-#define CSR_MIBOUND         0x383
-#define CSR_MDBASE          0x384
-#define CSR_MDBOUND         0x385
-
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -375,10 +355,8 @@
 #define MSTATUS_FS          0x00006000
 #define MSTATUS_XS          0x00018000
 #define MSTATUS_MPRV        0x00020000
-#define MSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
 #define MSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define MSTATUS_MXR         0x00080000
-#define MSTATUS_VM          0x1F000000 /* until: priv-1.9.1 */
 #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
 #define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
 #define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
@@ -416,7 +394,6 @@
 #define SSTATUS_SPP         0x00000100
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
-#define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define SSTATUS_MXR         0x00080000
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..86e7dbeb20 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -282,7 +282,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
     }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->sbadaddr);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->stval);
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..503c2559f8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -136,8 +136,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
         env->vscause = env->scause;
         env->scause = env->scause_hs;
 
-        env->vstval = env->sbadaddr;
-        env->sbadaddr = env->stval_hs;
+        env->vstval = env->stval;
+        env->stval = env->stval_hs;
 
         env->vsatp = env->satp;
         env->satp = env->satp_hs;
@@ -159,8 +159,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
         env->scause_hs = env->scause;
         env->scause = env->vscause;
 
-        env->stval_hs = env->sbadaddr;
-        env->sbadaddr = env->vstval;
+        env->stval_hs = env->stval;
+        env->stval = env->vstval;
 
         env->satp_hs = env->satp;
         env->satp = env->vsatp;
@@ -1023,7 +1023,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mstatus = s;
         env->scause = cause | ((target_ulong)async << (TARGET_LONG_BITS - 1));
         env->sepc = env->pc;
-        env->sbadaddr = tval;
+        env->stval = tval;
         env->htval = htval;
         env->pc = (env->stvec >> 2 << 2) +
             ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
@@ -1054,7 +1054,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mstatus = s;
         env->mcause = cause | ~(((target_ulong)-1) >> async);
         env->mepc = env->pc;
-        env->mbadaddr = tval;
+        env->mtval = tval;
         env->mtval2 = mtval2;
         env->pc = (env->mtvec >> 2 << 2) +
             ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..de7427d8f8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -644,26 +644,6 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
-static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
-    *val = env->mcounteren;
-    return 0;
-}
-
-/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
-static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
-{
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
-    env->mcounteren = val;
-    return 0;
-}
-
 /* Machine Trap Handling */
 static int read_mscratch(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -701,15 +681,15 @@ static int write_mcause(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-static int read_mbadaddr(CPURISCVState *env, int csrno, target_ulong *val)
+static int read_mtval(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = env->mbadaddr;
+    *val = env->mtval;
     return 0;
 }
 
-static int write_mbadaddr(CPURISCVState *env, int csrno, target_ulong val)
+static int write_mtval(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->mbadaddr = val;
+    env->mtval = val;
     return 0;
 }
 
@@ -853,15 +833,15 @@ static int write_scause(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-static int read_sbadaddr(CPURISCVState *env, int csrno, target_ulong *val)
+static int read_stval(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = env->sbadaddr;
+    *val = env->stval;
     return 0;
 }
 
-static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
+static int write_stval(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->sbadaddr = val;
+    env->stval = val;
     return 0;
 }
 
@@ -1419,13 +1399,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-    [CSR_MSCOUNTEREN] = { "msounteren", any,   read_mscounteren, write_mscounteren },
-
     /* Machine Trap Handling */
     [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch },
     [CSR_MEPC]     = { "mepc",     any,  read_mepc,     write_mepc     },
     [CSR_MCAUSE]   = { "mcause",   any,  read_mcause,   write_mcause   },
-    [CSR_MBADADDR] = { "mbadaddr", any,  read_mbadaddr, write_mbadaddr },
+    [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
     /* Supervisor Trap Setup */
@@ -1438,7 +1416,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch },
     [CSR_SEPC]     = { "sepc",     smode, read_sepc,     write_sepc     },
     [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
-    [CSR_SBADADDR] = { "sbadaddr", smode, read_sbadaddr, write_sbadaddr },
+    [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
     [CSR_SIP]      = { "sip",      smode, NULL,    NULL, rmw_sip        },
 
     /* Supervisor Protection and Translation */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 44d4015bd6..16a08302da 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -140,8 +140,8 @@ static const VMStateDescription vmstate_hyper = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
@@ -165,10 +165,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.miclaim, RISCVCPU),
         VMSTATE_UINTTL(env.mie, RISCVCPU),
         VMSTATE_UINTTL(env.mideleg, RISCVCPU),
-        VMSTATE_UINTTL(env.sptbr, RISCVCPU),
         VMSTATE_UINTTL(env.satp, RISCVCPU),
-        VMSTATE_UINTTL(env.sbadaddr, RISCVCPU),
-        VMSTATE_UINTTL(env.mbadaddr, RISCVCPU),
+        VMSTATE_UINTTL(env.stval, RISCVCPU),
         VMSTATE_UINTTL(env.medeleg, RISCVCPU),
         VMSTATE_UINTTL(env.stvec, RISCVCPU),
         VMSTATE_UINTTL(env.sepc, RISCVCPU),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2f9f5ccc62..26eccc5eb1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -116,7 +116,7 @@ static void generate_exception(DisasContext *ctx, int excp)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void generate_exception_mbadaddr(DisasContext *ctx, int excp)
+static void generate_exception_mtval(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
@@ -160,7 +160,7 @@ static void gen_exception_illegal(DisasContext *ctx)
 
 static void gen_exception_inst_addr_mis(DisasContext *ctx)
 {
-    generate_exception_mbadaddr(ctx, RISCV_EXCP_INST_ADDR_MIS);
+    generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
 
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-- 
2.31.1


