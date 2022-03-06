Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E24CEBAE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:18:58 +0100 (CET)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqmn-0001oH-Jm
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqXB-0003Lk-3t
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:49 -0500
Received: from [2a00:1450:4864:20::435] (port=42793
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqX9-0004JE-3W
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:48 -0500
Received: by mail-wr1-x435.google.com with SMTP id u10so17698654wra.9
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ob/qUj0cCUThBinSOv0KTN3FxSfVR3ugqTAqwuuw7EE=;
 b=frj1jgSe7xOMcQmHr1Qb13Yy0rb4vDcYS4MiGiQpNk+XEW0ErE2vurrW9SjOhlItNp
 XQN8oVdR57cUgiITvmDdLPxmyxh9J5Y6CXlyIC33Y/o5Bz7JUhPmE+P4wvJruDb0RM6v
 OTrHm3MF8+5LxONF4rINkaK3/Gv6wgqKKCA6do3steFVe9/2UZjXgMIplpTn7g+IXdnq
 a22QGYV6xikC7LX6sa8hpvyLsuAo+zGuWShf+tGKciU5sRvg6Lj0o29m1bUXenOw6fEW
 kfFGfAXYzr27BEWl4Idrd7n0mW1hmoOZ8vC7RJ5KKPm3hR4E+A8v6cshtSHG1ODDULfU
 oTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ob/qUj0cCUThBinSOv0KTN3FxSfVR3ugqTAqwuuw7EE=;
 b=yhpGKvj2WmaR3P3SKiUe8mTwaCzJ1pOiDPNfztIbET51NlRwdPqxATnsAnk9IQV0pr
 zsZHeNPhO0XAEhO/Bo8bjdUs7dJpL7qLBZOgABR+r7uDvkMCPzMKrdDYn1d36Rp4fmJ0
 hu06tRvWtBhBuf23ul+LalH74b3UMu7031lO3OCrgHefAK58JcWyWsqQNG9U6v8Fs3Kh
 Afl29f0rvE3jm+/v5fby5OkyhCyMtEOimR9CdF9JSvaEFoOgeZM+bs9FwtplgNk7e0xu
 hbAZCqTiFnWWpkfy9M861w8zPoz0ppB8ZqM5UKNn/xBLVrJXtq3/jtdNedmXfbU3u7cu
 Ss2Q==
X-Gm-Message-State: AOAM5320X+cml846x76J1Kw87FuykJIeaxkzNuAbOL95Y/sZt+WyNJke
 ZXRcGdmE7xS3tQZY3iDFH3ZCg288FiA=
X-Google-Smtp-Source: ABdhPJwUt6EIaibH8ROSMZAPKovcReAmlyGacRBWMURHw1sqAbmPaOp8WScJLAWyL2f/oKb9IRaehQ==
X-Received: by 2002:a05:6000:50f:b0:1ed:e1d5:4cf6 with SMTP id
 a15-20020a056000050f00b001ede1d54cf6mr5135114wrf.594.1646571765361; 
 Sun, 06 Mar 2022 05:02:45 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 e20-20020adfa454000000b001f01a14dce8sm8782413wra.97.2022.03.06.05.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/33] target: Use ArchCPU as interface to target CPU
Date: Sun,  6 Mar 2022 13:59:58 +0100
Message-Id: <20220306130000.8104-32-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

ArchCPU is our interface with target-specific code. Use it as
a forward-declared opaque pointer (abstract type), having its
structure defined by each target.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-15-f4bug@amsat.org>
---
 include/hw/core/cpu.h   | 4 ++--
 include/qemu/typedefs.h | 1 +
 target/alpha/cpu.h      | 2 +-
 target/arm/cpu.h        | 2 +-
 target/avr/cpu.h        | 2 +-
 target/cris/cpu.h       | 2 +-
 target/hexagon/cpu.h    | 2 +-
 target/hppa/cpu.h       | 2 +-
 target/i386/cpu.h       | 2 +-
 target/m68k/cpu.h       | 2 +-
 target/microblaze/cpu.h | 2 +-
 target/mips/cpu.h       | 2 +-
 target/nios2/cpu.h      | 2 +-
 target/openrisc/cpu.h   | 2 +-
 target/ppc/cpu.h        | 2 +-
 target/riscv/cpu.h      | 2 +-
 target/rx/cpu.h         | 2 +-
 target/s390x/cpu.h      | 2 +-
 target/sh4/cpu.h        | 2 +-
 target/sparc/cpu.h      | 2 +-
 target/tricore/cpu.h    | 2 +-
 target/xtensa/cpu.h     | 2 +-
 22 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2a0893b1dc7..0efc6153ed0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -70,8 +70,8 @@ DECLARE_CLASS_CHECKERS(CPUClass, CPU,
  * The object struct and class struct need to be declared manually.
  */
 #define OBJECT_DECLARE_CPU_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME) \
-    OBJECT_DECLARE_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME); \
-    typedef CpuInstanceType ArchCPU;
+    typedef struct ArchCPU CpuInstanceType; \
+    OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
 
 typedef enum MMUAccessType {
     MMU_DATA_LOAD  = 0,
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index c6f692b0dd5..c564f54c112 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -26,6 +26,7 @@ typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
 typedef struct Aml Aml;
 typedef struct AnnounceTimer AnnounceTimer;
+typedef struct ArchCPU ArchCPU;
 typedef struct BdrvDirtyBitmap BdrvDirtyBitmap;
 typedef struct BdrvDirtyBitmapIter BdrvDirtyBitmapIter;
 typedef struct BlockBackend BlockBackend;
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 84430aff421..58f00b7814f 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -257,7 +257,7 @@ typedef struct CPUArchState {
  *
  * An Alpha CPU.
  */
-struct AlphaCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index af89509f5a9..0b4b5bbf54c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -774,7 +774,7 @@ typedef struct ARMISARegisters ARMISARegisters;
  *
  * An ARM CPU core.
  */
-struct ARMCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index a833799fc14..55497f851dc 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -143,7 +143,7 @@ typedef struct CPUArchState {
  *
  *  A AVR CPU.
  */
-struct AVRCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index af7121bba06..e6776f25b17 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -173,7 +173,7 @@ typedef struct CPUArchState {
  *
  * A CRIS CPU.
  */
-struct CRISCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 8db0aa542d6..2a65a57bab3 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -140,7 +140,7 @@ typedef struct HexagonCPUClass {
     DeviceReset parent_reset;
 } HexagonCPUClass;
 
-struct HexagonCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 73a3f323895..4cc936b6bfd 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -213,7 +213,7 @@ typedef struct CPUArchState {
  *
  * An HPPA CPU.
  */
-struct HPPACPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d99e175e17c..e11734ba866 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1707,7 +1707,7 @@ struct kvm_msrs;
  *
  * An x86 CPU.
  */
-struct X86CPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 76a7cc70b4f..872e8ce6375 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -156,7 +156,7 @@ typedef struct CPUArchState {
  *
  * A Motorola 68k CPU.
  */
-struct M68kCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 6e4e90a41ed..0a0ce71b6a5 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -339,7 +339,7 @@ typedef struct {
  *
  * A MicroBlaze CPU.
  */
-struct MicroBlazeCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index c361408cc81..09e98f64de5 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1171,7 +1171,7 @@ typedef struct CPUArchState {
  *
  * A MIPS CPU.
  */
-struct MIPSCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index e07da73df0d..ca0f3420cd1 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -169,7 +169,7 @@ struct CPUArchState {
  *
  * A Nios2 CPU.
  */
-struct Nios2CPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index bcd28802e49..bdf29d2dc4c 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -297,7 +297,7 @@ typedef struct CPUArchState {
  *
  * A OpenRISC CPU.
  */
-struct OpenRISCCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 03bba61c8b4..047b24ba50e 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1275,7 +1275,7 @@ typedef struct PPCVirtualHypervisorClass PPCVirtualHypervisorClass;
  *
  * A PowerPC CPU.
  */
-struct PowerPCCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2810389fddb..c069fe85fa1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -394,7 +394,7 @@ typedef struct RISCVCPUConfig RISCVCPUConfig;
  *
  * A RISCV CPU.
  */
-struct RISCVCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index f81bf5b592a..b4abd90ccd1 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -105,7 +105,7 @@ typedef struct CPUArchState {
  *
  * A RX CPU
  */
-struct RXCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index bdf3f7d4feb..c49c8466e74 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -163,7 +163,7 @@ static inline uint64_t *get_freg(CPUS390XState *cs, int nr)
  *
  * An S/390 CPU.
  */
-struct S390CPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index dd477ba5771..c72a30edfd4 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -195,7 +195,7 @@ typedef struct CPUArchState {
  *
  * A SuperH CPU.
  */
-struct SuperHCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 2a7fd47da3e..abb38db6749 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -556,7 +556,7 @@ struct CPUArchState {
  *
  * A SPARC CPU.
  */
-struct SPARCCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index cd1954aa9ed..108d6b8288f 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -196,7 +196,7 @@ typedef struct CPUArchState {
  *
  * A TriCore CPU.
  */
-struct TriCoreCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index a361ab87859..4515f682aa2 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -553,7 +553,7 @@ struct CPUArchState {
  *
  * An Xtensa CPU.
  */
-struct XtensaCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
-- 
2.35.1


