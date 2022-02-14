Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033A74B5A46
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:57:37 +0100 (CET)
Received: from localhost ([::1]:45184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgXX-00007P-SY
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:57:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgAr-0000jJ-4H
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:34:09 -0500
Received: from [2607:f8b0:4864:20::1036] (port=39435
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgAj-0002hV-UF
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:34:08 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso19677231pjt.4
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NWB4//dxBY+Ll8+QrnZ0CwtnQW94DDn04zgPvteE1Yk=;
 b=d5DsOJwtm0t7fprNdAp5s+/f9aWY5yU6YwIytIVOYnQ659EPODfpCjQ8mWZtheY8jo
 t9rBIGA5rdjQ+GhK8alcPFDWbz0tBYgYbKmKjTXkq9oVk6QpO4pjdB5So/pJhteP+Tij
 SoMrpqjIlolfQKDFGtV4R5ke7QnZpLUyv1eBm07010GeNl29PUAP2+O1tTqvcmC4XJZb
 /UG79aBhciI8CjvGwmIVKhr94N9tckkfGaOWBEFptGDw0TXnLtBImeVm2upOmfdbALmO
 OCK2ZOW3NOEcU0ycp8l8ENSwsllbfmfpX5KTor2c5nxL1F/Od3arxvyxJNCzLHu+A2PG
 TORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NWB4//dxBY+Ll8+QrnZ0CwtnQW94DDn04zgPvteE1Yk=;
 b=lmI4r9Jhbz+w3dltpoWM06kkQXTPYL4QGPV5XEn8e8bmR/t9/R7Pg0P5RiECau8GGW
 8Jg6hOyN+hg0Xu4xFmDmv8WpXtQh41yQ8tpxPT9NOxIaWHLndd4IKjTGR79rRx597q6V
 4wlmBHdat9Lo8rNruqRSZrtQMM1shpXNMgEClEBpAzjk93WVWxxrNKUcaayG2FeycZPw
 Y3xByxrRIAVRPHdNkvtZugmQJIS2JHff9iYneTbeebDUUTWRRKoAMIrfIvff0v7W2pb5
 n+HaY5NUbMVO2uTczesk8Dnj/aQkSPUF52U5mXcU7neM3W4diYZBTwFcLPhE8fBkw5Ig
 Yo4g==
X-Gm-Message-State: AOAM531TshgynRP9c1PHMOcsA9A3gzHJLooHTNH0AbCktS3HgJdulZAB
 WXdWXPG8DBKzG451iyWbpC7AYsLpIJQ=
X-Google-Smtp-Source: ABdhPJyRI2Kjkysx01P4st0Mhu2/kLS93KmPIvRTMn6bcxtQ9mZEsZyXdBeC4YV2xzqq8X4I3iCo6g==
X-Received: by 2002:a17:902:c14a:: with SMTP id 10mr72960plj.159.1644863632802; 
 Mon, 14 Feb 2022 10:33:52 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id b21sm15721579pji.22.2022.02.14.10.33.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:33:52 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 14/14] target: Use ArchCPU as interface to target CPU
Date: Mon, 14 Feb 2022 19:31:44 +0100
Message-Id: <20220214183144.27402-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

ArchCPU is our interface with target-specific code. Use it as
a forward-declared opaque pointer (abstract type), having its
structure defined by each target.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 2a0893b1dc..0efc6153ed 100644
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
index c6f692b0dd..c564f54c11 100644
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
index 84430aff42..58f00b7814 100644
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
index a137c564c4..a4bbca1812 100644
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
index a833799fc1..55497f851d 100644
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
index af7121bba0..e6776f25b1 100644
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
index 8db0aa542d..2a65a57bab 100644
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
index 73a3f32389..4cc936b6bf 100644
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
index f3b951df0d..b5d1ff5956 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1705,7 +1705,7 @@ struct kvm_msrs;
  *
  * An x86 CPU.
  */
-struct X86CPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 76a7cc70b4..872e8ce637 100644
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
index 6e4e90a41e..0a0ce71b6a 100644
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
index c361408cc8..09e98f64de 100644
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
index 94c581a98f..eedcf3c27d 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -170,7 +170,7 @@ struct CPUArchState {
  *
  * A Nios2 CPU.
  */
-struct Nios2CPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index bcd28802e4..bdf29d2dc4 100644
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
index 8a879f0e5e..04c9c6113b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1273,7 +1273,7 @@ typedef struct PPCVirtualHypervisorClass PPCVirtualHypervisorClass;
  *
  * A PowerPC CPU.
  */
-struct PowerPCCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 421d18ad0b..dffc01ee6d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -308,7 +308,7 @@ struct RISCVCPUClass {
  *
  * A RISCV CPU.
  */
-struct RISCVCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index f81bf5b592..b4abd90ccd 100644
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
index bdf3f7d4fe..c49c8466e7 100644
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
index dd477ba577..c72a30edfd 100644
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
index 2a7fd47da3..abb38db674 100644
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
index cd1954aa9e..108d6b8288 100644
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
index a361ab8785..4515f682aa 100644
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
2.34.1


