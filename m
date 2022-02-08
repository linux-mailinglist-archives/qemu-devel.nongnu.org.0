Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9A4ADE7C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:42:36 +0100 (CET)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTZb-0004jA-Dn
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:42:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLo-0001Ok-Tn
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:18 -0500
Received: from [2607:f8b0:4864:20::42d] (port=41790
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLl-0000Pn-2J
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:16 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i30so19411573pfk.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IgBOe+/71p8VD2+WTRmPCpmKMyS03V8Or4ygo2HC2EI=;
 b=obHpR8LqRzZbVD+YooiS08VG7tOYCQeAfRETfL5csJzEezA3BztRv5fiIHCaBOfSvj
 phneYEVNsvBxbLgKNim+oo1HRW8xWaqdGrAAuHuJcbb/uRS6KJrf/UvgnYFt7rj2y8T4
 RDvMjSAtz29w9TMJrQxgxsX9SzCB9y/dWT3x6R9k+JH6mIQ0mjSeaj7nTHfHDC/ZV7Aj
 j/wrXV+NDWWmDSeYf4LZunigoWv07Iu/esJVacvSW9vqYXrxB0+3rwb5ockDXYRm2B81
 iUVeZ+EmvrXCPxXDId2c/gv4YRjU5nBq0lixOFf6JzXcpgy8I4ytynP6+reAFfdJH5rQ
 gzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IgBOe+/71p8VD2+WTRmPCpmKMyS03V8Or4ygo2HC2EI=;
 b=Mb/m1Aeqa9W/xl4VTiqWwOyTH4d8feZraYdVHhh+E95buvFse0pr4teNX1RpeZQyLE
 O0IoNGjTB7bhVXhRG0kH+yLMYKFo3YRzd+aeu2Dn0mhBpJDBRD+KwDrqEU6QI01ml60P
 nnIgX+yni9AZP8pXXbJgD0jEiEE4vP8zUh1ZAbOBXy6zUmSyFtXuIvMMosDHkpzfYrl4
 fMnPUnZzr7DSGZkpd8SdxyZ2x+RGh6c/9Y22C64TTZm6K6cIDxRMJf762B8BfsYjnV7w
 XPr8hQEulgiTrXoPCdwVY4YcfOVUKYVHJwToXJJfaMuz4PzOPTYyNHrOzOblm2HHqkpr
 iCTQ==
X-Gm-Message-State: AOAM531TfOgAbwcvyFz6D1z/zUmX4m+4Xff7eXYBfLaOuktDmCMw6Dna
 TY9FfwwmfaN36CpvGOE2mYGW/y+iAFA=
X-Google-Smtp-Source: ABdhPJxidsA0G/U2vOMpjV2OEKr23PsQkcRSUxWzW4PnxRx9EKqbYXo1SDrc07xN1Ph/FW14ijZ7ng==
X-Received: by 2002:a63:6d0:: with SMTP id 199mr3903969pgg.78.1644333849333;
 Tue, 08 Feb 2022 07:24:09 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g8sm16394545pfc.193.2022.02.08.07.24.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:24:09 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 10/13] target: Use CPUArchState as interface to
 target-specific CPU state
Date: Tue,  8 Feb 2022 16:22:40 +0100
Message-Id: <20220208152243.16452-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

While CPUState is our interface with generic code, CPUArchState is
our interface with target-specific code. Use CPUArchState as an
abstract type, defined by each target.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/poison.h   | 2 --
 include/hw/core/cpu.h   | 2 +-
 include/qemu/typedefs.h | 1 +
 target/alpha/cpu.h      | 6 ++----
 target/arm/cpu.h        | 2 +-
 target/avr/cpu.h        | 6 ++----
 target/cris/cpu.h       | 2 +-
 target/hexagon/cpu.h    | 5 ++---
 target/hppa/cpu.h       | 6 ++----
 target/i386/cpu.h       | 2 +-
 target/m68k/cpu.h       | 2 +-
 target/microblaze/cpu.h | 4 ++--
 target/mips/cpu.h       | 5 ++---
 target/nios2/cpu.h      | 4 ++--
 target/openrisc/cpu.h   | 2 +-
 target/ppc/cpu-qom.h    | 2 +-
 target/ppc/cpu.h        | 3 +--
 target/riscv/cpu.h      | 4 ++--
 target/rx/cpu-qom.h     | 2 --
 target/rx/cpu.h         | 2 +-
 target/s390x/cpu-qom.h  | 2 +-
 target/s390x/cpu.h      | 2 +-
 target/sh4/cpu.h        | 2 +-
 target/sparc/cpu.h      | 4 ++--
 target/tricore/cpu.h    | 5 ++---
 target/xtensa/cpu.h     | 6 +++---
 26 files changed, 36 insertions(+), 49 deletions(-)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 7ad4ad18e8..7c5c02f03f 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -51,8 +51,6 @@
 #pragma GCC poison TARGET_PAGE_BITS
 #pragma GCC poison TARGET_PAGE_ALIGN
 
-#pragma GCC poison CPUArchState
-
 #pragma GCC poison CPU_INTERRUPT_HARD
 #pragma GCC poison CPU_INTERRUPT_EXITTB
 #pragma GCC poison CPU_INTERRUPT_HALT
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3f2b681281..c9d41e4ece 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -340,7 +340,7 @@ struct CPUState {
     AddressSpace *as;
     MemoryRegion *memory;
 
-    void *env_ptr; /* CPUArchState */
+    CPUArchState *env_ptr;
     IcountDecr *icount_decr_ptr;
 
     /* Accessed in parallel; all accesses must be atomic */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index ee60eb3de4..c6f692b0dd 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -39,6 +39,7 @@ typedef struct CompatProperty CompatProperty;
 typedef struct CoMutex CoMutex;
 typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUAddressSpace CPUAddressSpace;
+typedef struct CPUArchState CPUArchState;
 typedef struct CPUState CPUState;
 typedef struct DeviceListener DeviceListener;
 typedef struct DeviceState DeviceState;
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index e819211503..1c12b4394c 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -197,9 +197,7 @@ enum {
 #define MMU_USER_IDX     1
 #define MMU_PHYS_IDX     2
 
-typedef struct CPUAlphaState CPUAlphaState;
-
-struct CPUAlphaState {
+typedef struct CPUArchState {
     uint64_t ir[31];
     float64 fir[31];
     uint64_t pc;
@@ -251,7 +249,7 @@ struct CPUAlphaState {
     uint32_t features;
     uint32_t amask;
     int implver;
-};
+} CPUAlphaState;
 
 /**
  * AlphaCPU:
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6a4d50e82..c3bdf4551e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -232,7 +232,7 @@ typedef struct CPUARMTBFlags {
     target_ulong flags2;
 } CPUARMTBFlags;
 
-typedef struct CPUARMState {
+typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
 
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index dceacf3cd7..c39e435696 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -108,9 +108,7 @@ typedef enum AVRFeature {
     AVR_FEATURE_RAMPZ,
 } AVRFeature;
 
-typedef struct CPUAVRState CPUAVRState;
-
-struct CPUAVRState {
+typedef struct CPUArchState {
     uint32_t pc_w; /* 0x003fffff up to 22 bits */
 
     uint32_t sregC; /* 0x00000001 1 bit */
@@ -137,7 +135,7 @@ struct CPUAVRState {
     bool fullacc; /* CPU/MEM if true MEM only otherwise */
 
     uint64_t features;
-};
+} CPUAVRState;
 
 /**
  *  AVRCPU:
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index b445b194ea..6d5f7b859b 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -105,7 +105,7 @@ typedef struct {
     uint32_t lo;
 } TLBSet;
 
-typedef struct CPUCRISState {
+typedef struct CPUArchState {
 	uint32_t regs[16];
 	/* P0 - P15 are referred to as special registers in the docs.  */
 	uint32_t pregs[16];
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 58a0d3870b..18f963859e 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -75,7 +75,7 @@ typedef struct {
 /* Maximum number of vector temps in a packet */
 #define VECTOR_TEMPS_MAX            4
 
-struct CPUHexagonState {
+typedef struct CPUArchState {
     target_ulong gpr[TOTAL_PER_THREAD_REGS];
     target_ulong pred[NUM_PREGS];
     target_ulong branch_taken;
@@ -129,7 +129,7 @@ struct CPUHexagonState {
     target_ulong vstore_pending[VSTORES_MAX];
     bool vtcm_pending;
     VTCMStoreLog vtcm_log;
-};
+} CPUHexagonState;
 
 #define HEXAGON_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(HexagonCPUClass, (klass), TYPE_HEXAGON_CPU)
@@ -180,7 +180,6 @@ static inline int cpu_mmu_index(CPUHexagonState *env, bool ifetch)
 #endif
 }
 
-typedef struct CPUHexagonState CPUArchState;
 typedef HexagonCPU ArchCPU;
 
 void hexagon_translate_init(void);
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 93c119532a..53e33d01e7 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -138,8 +138,6 @@
 #define CR_IPSW          22
 #define CR_EIRR          23
 
-typedef struct CPUHPPAState CPUHPPAState;
-
 #if TARGET_REGISTER_BITS == 32
 typedef uint32_t target_ureg;
 typedef int32_t  target_sreg;
@@ -168,7 +166,7 @@ typedef struct {
     unsigned access_id : 16;
 } hppa_tlb_entry;
 
-struct CPUHPPAState {
+typedef struct CPUArchState {
     target_ureg gr[32];
     uint64_t fr[32];
     uint64_t sr[8];          /* stored shifted into place for gva */
@@ -207,7 +205,7 @@ struct CPUHPPAState {
     /* ??? We should use a more intelligent data structure.  */
     hppa_tlb_entry tlb[HPPA_TLB_ENTRIES];
     uint32_t tlb_last;
-};
+} CPUHPPAState;
 
 /**
  * HPPACPU:
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9911d7c871..cdafefc2d6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1429,7 +1429,7 @@ typedef struct HVFX86LazyFlags {
     target_ulong auxbits;
 } HVFX86LazyFlags;
 
-typedef struct CPUX86State {
+typedef struct CPUArchState {
     /* standard registers */
     target_ulong regs[CPU_NB_REGS];
     target_ulong eip;
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index a3423729ef..3ed40004bf 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -79,7 +79,7 @@
 
 typedef CPU_LDoubleU FPReg;
 
-typedef struct CPUM68KState {
+typedef struct CPUArchState {
     uint32_t dregs[8];
     uint32_t aregs[8];
     uint32_t pc;
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e9cd0b88de..06cff32e56 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -24,7 +24,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 
-typedef struct CPUMBState CPUMBState;
+typedef struct CPUArchState CPUMBState;
 #if !defined(CONFIG_USER_ONLY)
 #include "mmu.h"
 #endif
@@ -239,7 +239,7 @@ typedef struct CPUMBState CPUMBState;
 #define USE_NON_SECURE_M_AXI_DC_MASK 0x4
 #define USE_NON_SECURE_M_AXI_IC_MASK 0x8
 
-struct CPUMBState {
+struct CPUArchState {
     uint32_t bvalue;   /* TCG temporary, only valid during a TB */
     uint32_t btarget;  /* Full resolved branch destination */
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 56b1cbd091..ec5b588edb 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -524,8 +524,7 @@ struct TCState {
 };
 
 struct MIPSITUState;
-typedef struct CPUMIPSState CPUMIPSState;
-struct CPUMIPSState {
+typedef struct CPUArchState {
     TCState active_tc;
     CPUMIPSFPUContext active_fpu;
 
@@ -1161,7 +1160,7 @@ struct CPUMIPSState {
     QEMUTimer *timer; /* Internal timer */
     target_ulong exception_base; /* ExceptionBase input to the core */
     uint64_t cp0_count_ns; /* CP0_Count clock period (in nanoseconds) */
-};
+} CPUMIPSState;
 
 /**
  * MIPSCPU:
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index d2ba0c5bbd..629b9e2301 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -25,7 +25,7 @@
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
-typedef struct CPUNios2State CPUNios2State;
+typedef struct CPUArchState CPUNios2State;
 #if !defined(CONFIG_USER_ONLY)
 #include "mmu.h"
 #endif
@@ -155,7 +155,7 @@ struct Nios2CPUClass {
 
 #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
 
-struct CPUNios2State {
+struct CPUArchState {
     uint32_t regs[NUM_CORE_REGS];
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index ee069b080c..19c2d9e7be 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -242,7 +242,7 @@ typedef struct CPUOpenRISCTLBContext {
 } CPUOpenRISCTLBContext;
 #endif
 
-typedef struct CPUOpenRISCState {
+typedef struct CPUArchState {
     target_ulong shadow_gpr[16][32]; /* Shadow registers */
 
     target_ulong pc;          /* Program counter */
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 99a6b509af..87ea91ef9c 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -32,7 +32,7 @@
 OBJECT_DECLARE_TYPE(PowerPCCPU, PowerPCCPUClass,
                     POWERPC_CPU)
 
-typedef struct CPUPPCState CPUPPCState;
+typedef struct CPUArchState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
 typedef struct ppc_dcr_t ppc_dcr_t;
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index dcd83b503c..55ae99e1b8 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1080,7 +1080,7 @@ struct ppc_radix_page_info {
 #define PPC_CPU_OPCODES_LEN          0x40
 #define PPC_CPU_INDIRECT_OPCODES_LEN 0x20
 
-struct CPUPPCState {
+struct CPUArchState {
     /* Most commonly used resources during translated code execution first */
     target_ulong gpr[32];  /* general purpose registers */
     target_ulong gprh[32]; /* storage for GPR MSB, used by the SPE extension */
@@ -1476,7 +1476,6 @@ void ppc_compat_add_property(Object *obj, const char *name,
                              uint32_t *compat_pvr, const char *basedesc);
 #endif /* defined(TARGET_PPC64) */
 
-typedef CPUPPCState CPUArchState;
 typedef PowerPCCPU ArchCPU;
 
 #include "exec/cpu-all.h"
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 55635d68d5..6e6475b7a4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -97,7 +97,7 @@ enum {
 
 #define MAX_RISCV_PMPS (16)
 
-typedef struct CPURISCVState CPURISCVState;
+typedef struct CPUArchState CPURISCVState;
 
 #if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
@@ -112,7 +112,7 @@ FIELD(VTYPE, VMA, 7, 1)
 FIELD(VTYPE, VEDIV, 8, 2)
 FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
 
-struct CPURISCVState {
+struct CPUArchState {
     target_ulong gpr[32];
     target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
     uint64_t fpr[32]; /* assume both F and D extensions */
diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
index 7310558e0c..f918c46b00 100644
--- a/target/rx/cpu-qom.h
+++ b/target/rx/cpu-qom.h
@@ -45,6 +45,4 @@ struct RXCPUClass {
     DeviceReset parent_reset;
 };
 
-#define CPUArchState struct CPURXState
-
 #endif
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 58adf9edf6..0f3d9d5bd9 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -65,7 +65,7 @@ enum {
     NUM_REGS = 16,
 };
 
-typedef struct CPURXState {
+typedef struct CPUArchState {
     /* CPU registers */
     uint32_t regs[NUM_REGS];    /* general registers */
     uint32_t psw_o;             /* O bit of status register */
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 9f3a0d86c5..dfb9ce4d88 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -63,6 +63,6 @@ struct S390CPUClass {
     void (*reset)(CPUState *cpu, cpu_reset_type type);
 };
 
-typedef struct CPUS390XState CPUS390XState;
+typedef struct CPUArchState CPUS390XState;
 
 #endif
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index a75e559134..3fe628c911 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -51,7 +51,7 @@ typedef struct PSW {
     uint64_t addr;
 } PSW;
 
-struct CPUS390XState {
+struct CPUArchState {
     uint64_t regs[16];     /* GP registers */
     /*
      * The floating point registers are part of the vector registers.
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index fb9dd9db2f..d023b087b1 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -130,7 +130,7 @@ typedef struct memory_content {
     struct memory_content *next;
 } memory_content;
 
-typedef struct CPUSH4State {
+typedef struct CPUArchState {
     uint32_t flags;		/* general execution flags */
     uint32_t gregs[24];		/* general registers */
     float32 fregs[32];		/* floating point registers */
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5a7f1ed5d6..cfa263a696 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -420,7 +420,7 @@ struct CPUTimer
 
 typedef struct CPUTimer CPUTimer;
 
-typedef struct CPUSPARCState CPUSPARCState;
+typedef struct CPUArchState CPUSPARCState;
 #if defined(TARGET_SPARC64)
 typedef union {
    uint64_t mmuregs[16];
@@ -439,7 +439,7 @@ typedef union {
    };
 } SparcV9MMU;
 #endif
-struct CPUSPARCState {
+struct CPUArchState {
     target_ulong gregs[8]; /* general registers */
     target_ulong *regwptr; /* pointer to current register window */
     target_ulong pc;       /* program counter */
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index c461387e71..50fe16ae9c 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -28,8 +28,7 @@ struct tricore_boot_info;
 
 typedef struct tricore_def_t tricore_def_t;
 
-typedef struct CPUTriCoreState CPUTriCoreState;
-struct CPUTriCoreState {
+typedef struct CPUArchState {
     /* GPR Register */
     uint32_t gpr_a[16];
     uint32_t gpr_d[16];
@@ -189,7 +188,7 @@ struct CPUTriCoreState {
     const tricore_def_t *cpu_model;
     void *irq[8];
     struct QEMUTimer *timer; /* Internal timer */
-};
+} CPUTriCoreState;
 
 /**
  * TriCoreCPU:
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index f2165b17e2..ea0de568af 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -306,7 +306,7 @@ typedef enum {
     INTTYPE_MAX
 } interrupt_type;
 
-struct CPUXtensaState;
+typedef struct CPUArchState CPUXtensaState;
 
 typedef struct xtensa_tlb_entry {
     uint32_t vaddr;
@@ -506,7 +506,7 @@ enum {
 };
 #endif
 
-typedef struct CPUXtensaState {
+struct CPUArchState {
     const XtensaConfig *config;
     uint32_t regs[16];
     uint32_t pc;
@@ -545,7 +545,7 @@ typedef struct CPUXtensaState {
 
     /* Watchpoints for DBREAK registers */
     struct CPUWatchpoint *cpu_watchpoint[MAX_NDBREAK];
-} CPUXtensaState;
+};
 
 /**
  * XtensaCPU:
-- 
2.34.1


