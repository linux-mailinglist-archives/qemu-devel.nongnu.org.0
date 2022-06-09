Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B066054475C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:26:13 +0200 (CEST)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEQe-0004rC-O1
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6v-0001P1-WB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:50 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6s-0005w5-7u
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n185so12105923wmn.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a3NPxQEfQiPYIU+CS5LV4PTQGOjBrNVkuFvlYXBD2EU=;
 b=oPESQEkJiXqw96JYsCxfSoPpocP0aqx+3VH1r+Ynns3kKgdLEX9GLzSRWlk8RKWGbL
 vNveqnGaCaAP7wNrJe0wzSTUPukJS5cs8PFLjcMledJuL85BAYx++nkATSz5cDecWber
 G/ENPwecldYz7lw5V7rIN6Hcc9a9FmVfJ9ZOA23YPPc05CdHTka8hvLfpQUd2716FYFQ
 XdkJJHVuAdJpnudQ/F+aOhjEgrQXIl/Fmv74plC4hd0sLLM8R23Y/elqJQ8BqGZCngHI
 7dskp9ME51CtUwGrH7Va6x/fBnBDkA+x2PPCxG4Cp/+xGiecbZ2e681QZSa2oCyR9JEG
 ad9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a3NPxQEfQiPYIU+CS5LV4PTQGOjBrNVkuFvlYXBD2EU=;
 b=WxTiHT3z4oVUswb7vXNB/87oiXauzFCBMhwkPQoJBZe11yjMYBzmR7zavQf/WH+FfL
 PbAb8E/P8pFVnly38cjA4d/dXXm9XShvK53Q42TfIV+1vuraBwlNsBIIBTSuqvkziin2
 7Gj9Z4+NscQO+EjNSXPWCGWN0CpB0Ub+3vhVXWWwkO5pQDVLkJt6s5QTTbJgplz4GQsb
 t1tLmUDEh5vZvTYOQ95I3aKR3E7f5MVAqRqGgFygTGUK68ooUZAGiRwge4u2LrvUBj8w
 bJbY8xqaz7MQBkSDcBtmk5VrA6DaSeJwU0kYBF8nOi1CFYbLaLMRnqHc2vQMRe3F41vK
 gkSg==
X-Gm-Message-State: AOAM5325Ow43y5OLThXK8bIAF2/9RF+xQ6zjRRXQd3yWx7U44P8BeR30
 USGO2XdH+NwJrSTQzLRJaeMdR5AyJV0gxw==
X-Google-Smtp-Source: ABdhPJxnIAtll6SHbB3h3KI78Nbcu76oy62/LLR8rtnDrEicdQLQYA8FaODv7Ze3x+sQRwG0d9QDNw==
X-Received: by 2002:a1c:4682:0:b0:39c:4459:6a84 with SMTP id
 t124-20020a1c4682000000b0039c44596a84mr2209884wma.167.1654765543794; 
 Thu, 09 Jun 2022 02:05:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/55] Fix 'writeable' typos
Date: Thu,  9 Jun 2022 10:04:45 +0100
Message-Id: <20220609090537.1971756-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We have about 30 instances of the typo/variant spelling 'writeable',
and over 500 of the more common 'writable'.  Standardize on the
latter.

Change produced with:

  sed -i -e 's/\([Ww][Rr][Ii][Tt]\)[Ee]\([Aa][Bb][Ll][Ee]\)/\1\2/g' $(git grep -il writeable)

and then hand-undoing the instance in linux-headers/linux/kvm.h.

Most of these changes are in comments or documentation; the
exceptions are:
 * a local variable in accel/hvf/hvf-accel-ops.c
 * a local variable in accel/kvm/kvm-all.c
 * the PMCR_WRITABLE_MASK macro in target/arm/internals.h
 * the EPT_VIOLATION_GPA_WRITABLE macro in target/i386/hvf/vmcs.h
   (which is never used anywhere)
 * the AR_TYPE_WRITABLE_MASK macro in target/i386/hvf/vmx.h
   (which is never used anywhere)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-id: 20220505095015.2714666-1-peter.maydell@linaro.org
---
 docs/interop/vhost-user.rst    | 2 +-
 docs/specs/vmgenid.txt         | 4 ++--
 hw/scsi/mfi.h                  | 2 +-
 target/arm/internals.h         | 4 ++--
 target/i386/hvf/vmcs.h         | 2 +-
 target/i386/hvf/vmx.h          | 2 +-
 accel/hvf/hvf-accel-ops.c      | 4 ++--
 accel/kvm/kvm-all.c            | 4 ++--
 accel/tcg/user-exec.c          | 6 +++---
 hw/acpi/ghes.c                 | 2 +-
 hw/intc/arm_gicv3_cpuif.c      | 2 +-
 hw/intc/arm_gicv3_dist.c       | 2 +-
 hw/intc/arm_gicv3_redist.c     | 4 ++--
 hw/intc/riscv_aclint.c         | 2 +-
 hw/intc/riscv_aplic.c          | 2 +-
 hw/pci/shpc.c                  | 2 +-
 hw/sparc64/sun4u_iommu.c       | 2 +-
 hw/timer/sse-timer.c           | 2 +-
 target/arm/gdbstub.c           | 2 +-
 target/arm/helper.c            | 4 ++--
 target/arm/hvf/hvf.c           | 4 ++--
 target/i386/cpu-sysemu.c       | 2 +-
 target/s390x/ioinst.c          | 2 +-
 python/qemu/machine/machine.py | 2 +-
 tests/tcg/x86_64/system/boot.S | 2 +-
 25 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index a99ba4433ce..d7cf904f7fe 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -222,7 +222,7 @@ Virtio device config space
 :size: a 32-bit configuration space access size in bytes
 
 :flags: a 32-bit value:
-  - 0: Vhost front-end messages used for writeable fields
+  - 0: Vhost front-end messages used for writable fields
   - 1: Vhost front-end messages used for live migration
 
 :payload: Size bytes array holding the contents of the virtio
diff --git a/docs/specs/vmgenid.txt b/docs/specs/vmgenid.txt
index aa9f5186767..80ff69f31cc 100644
--- a/docs/specs/vmgenid.txt
+++ b/docs/specs/vmgenid.txt
@@ -153,7 +153,7 @@ change the contents of the memory at runtime, specifically when starting a
 backed-up or snapshotted image.  In order to do this, QEMU must know the
 address that has been allocated.
 
-The mechanism chosen for this memory sharing is writeable fw_cfg blobs.
+The mechanism chosen for this memory sharing is writable fw_cfg blobs.
 These are data object that are visible to both QEMU and guests, and are
 addressable as sequential files.
 
@@ -164,7 +164,7 @@ Two fw_cfg blobs are used in this case:
 /etc/vmgenid_guid - contains the actual VM Generation ID GUID
                   - read-only to the guest
 /etc/vmgenid_addr - contains the address of the downloaded vmgenid blob
-                  - writeable by the guest
+                  - writable by the guest
 
 
 QEMU sends the following commands to the guest at startup:
diff --git a/hw/scsi/mfi.h b/hw/scsi/mfi.h
index e67a5c0b477..0b4ee53dfc0 100644
--- a/hw/scsi/mfi.h
+++ b/hw/scsi/mfi.h
@@ -633,7 +633,7 @@ struct mfi_ctrl_props {
                               * metadata and user data
                               * 1=5%, 2=10%, 3=15% and so on
                               */
-    uint8_t viewSpace;       /* snapshot writeable VIEWs
+    uint8_t viewSpace;       /* snapshot writable VIEWs
                               * capacity as a % of source LD
                               * capacity. 0=READ only
                               * 1=5%, 2=10%, 3=15% and so on
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b654bee4682..1e4887b2dd3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1280,10 +1280,10 @@ enum MVEECIState {
 #define PMCRP   0x2
 #define PMCRE   0x1
 /*
- * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
+ * Mask of PMCR bits writable by guest (not including WO bits like C, P,
  * which can be written as 1 to trigger behaviour but which stay RAZ).
  */
-#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
+#define PMCR_WRITABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
 
 #define PMXEVTYPER_P          0x80000000
 #define PMXEVTYPER_U          0x40000000
diff --git a/target/i386/hvf/vmcs.h b/target/i386/hvf/vmcs.h
index 42de7ebc3af..b4692f63f65 100644
--- a/target/i386/hvf/vmcs.h
+++ b/target/i386/hvf/vmcs.h
@@ -330,7 +330,7 @@
 #define EPT_VIOLATION_DATA_WRITE (1UL << 1)
 #define EPT_VIOLATION_INST_FETCH (1UL << 2)
 #define EPT_VIOLATION_GPA_READABLE (1UL << 3)
-#define EPT_VIOLATION_GPA_WRITEABLE (1UL << 4)
+#define EPT_VIOLATION_GPA_WRITABLE (1UL << 4)
 #define EPT_VIOLATION_GPA_EXECUTABLE (1UL << 5)
 #define EPT_VIOLATION_GLA_VALID (1UL << 7)
 #define EPT_VIOLATION_XLAT_VALID (1UL << 8)
diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index 573ddc33c07..fcd9a95e5b5 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -80,7 +80,7 @@ static inline uint64_t cap2ctrl(uint64_t cap, uint64_t ctrl)
 
 #define AR_TYPE_ACCESSES_MASK 1
 #define AR_TYPE_READABLE_MASK (1 << 1)
-#define AR_TYPE_WRITEABLE_MASK (1 << 2)
+#define AR_TYPE_WRITABLE_MASK (1 << 2)
 #define AR_TYPE_CODE_MASK (1 << 3)
 #define AR_TYPE_MASK 0x0f
 #define AR_TYPE_BUSY_64_TSS 11
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index a70e2eb375d..24913ca9c49 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -120,12 +120,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
     hvf_slot *mem;
     MemoryRegion *area = section->mr;
-    bool writeable = !area->readonly && !area->rom_device;
+    bool writable = !area->readonly && !area->rom_device;
     hv_memory_flags_t flags;
     uint64_t page_size = qemu_real_host_page_size();
 
     if (!memory_region_is_ram(area)) {
-        if (writeable) {
+        if (writable) {
             return;
         } else if (!memory_region_is_romd(area)) {
             /*
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 32e177bd26b..a4c4863f532 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1346,13 +1346,13 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     KVMSlot *mem;
     int err;
     MemoryRegion *mr = section->mr;
-    bool writeable = !mr->readonly && !mr->rom_device;
+    bool writable = !mr->readonly && !mr->rom_device;
     hwaddr start_addr, size, slot_size, mr_offset;
     ram_addr_t ram_start_offset;
     void *ram;
 
     if (!memory_region_is_ram(mr)) {
-        if (writeable || !kvm_readonly_mem_allowed) {
+        if (writable || !kvm_readonly_mem_allowed) {
             return;
         } else if (!mr->romd_mode) {
             /* If the memory device is not in romd_mode, then we actually want
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ac57324d4f6..20ada5472b4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -101,10 +101,10 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
  * Return true if the write fault has been handled, and should be re-tried.
  *
  * Note that it is important that we don't call page_unprotect() unless
- * this is really a "write to nonwriteable page" fault, because
+ * this is really a "write to nonwritable page" fault, because
  * page_unprotect() assumes that if it is called for an access to
- * a page that's writeable this means we had two threads racing and
- * another thread got there first and already made the page writeable;
+ * a page that's writable this means we had two threads racing and
+ * another thread got there first and already made the page writable;
  * so we will retry the access. If we were to call page_unprotect()
  * for some other kind of fault that should really be passed to the
  * guest, we'd end up in an infinite loop of retrying the faulting access.
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 45d9a809cc9..e9511d9b8f7 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -249,7 +249,7 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
     for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
         /*
          * Initialize the value of read_ack_register to 1, so GHES can be
-         * writeable after (re)boot.
+         * writable after (re)boot.
          * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
          * (GHESv2 - Type 10)
          */
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 8867e2e496f..8ca630e5ad1 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2047,7 +2047,7 @@ static void icc_ctlr_el3_write(CPUARMState *env, const ARMCPRegInfo *ri,
         cs->icc_ctlr_el1[GICV3_S] |= ICC_CTLR_EL1_CBPR;
     }
 
-    /* The only bit stored in icc_ctlr_el3 which is writeable is EOIMODE_EL3: */
+    /* The only bit stored in icc_ctlr_el3 which is writable is EOIMODE_EL3: */
     mask = ICC_CTLR_EL3_EOIMODE_EL3;
 
     cs->icc_ctlr_el3 &= ~mask;
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b9ed955e36b..eea03681187 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -611,7 +611,7 @@ static bool gicd_writel(GICv3State *s, hwaddr offset,
         if (value & mask & GICD_CTLR_DS) {
             /* We just set DS, so the ARE_NS and EnG1S bits are now RES0.
              * Note that this is a one-way transition because if DS is set
-             * then it's not writeable, so it can only go back to 0 with a
+             * then it's not writable, so it can only go back to 0 with a
              * hardware reset.
              */
             s->gicd_ctlr &= ~(GICD_CTLR_EN_GRP1S | GICD_CTLR_ARE_NS);
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index c3d4cdd66b7..f1ecb2502b1 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -257,7 +257,7 @@ static void gicr_write_vpendbaser(GICv3CPUState *cs, uint64_t newval)
 
     /*
      * The DIRTY bit is read-only and for us is always zero;
-     * other fields are writeable.
+     * other fields are writable.
      */
     newval &= R_GICR_VPENDBASER_INNERCACHE_MASK |
         R_GICR_VPENDBASER_SHAREABILITY_MASK |
@@ -491,7 +491,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         /* RAZ/WI for our implementation */
         return MEMTX_OK;
     case GICR_WAKER:
-        /* Only the ProcessorSleep bit is writeable. When the guest sets
+        /* Only the ProcessorSleep bit is writable. When the guest sets
          * it it requests that we transition the channel between the
          * redistributor and the cpu interface to quiescent, and that
          * we set the ChildrenAsleep bit once the inteface has reached the
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e6bceceefdb..e7942c4e5a3 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -463,7 +463,7 @@ static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
     /* Claim software interrupt bits */
     for (i = 0; i < swi->num_harts; i++) {
         RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(swi->hartid_base + i));
-        /* We don't claim mip.SSIP because it is writeable by software */
+        /* We don't claim mip.SSIP because it is writable by software */
         if (riscv_cpu_claim_interrupts(cpu, swi->sswi ? 0 : MIP_MSIP) < 0) {
             error_report("MSIP already claimed");
             exit(1);
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index e7809fb6b2c..cfd007e629c 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -646,7 +646,7 @@ static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
     }
 
     if (addr == APLIC_DOMAINCFG) {
-        /* Only IE bit writeable at the moment */
+        /* Only IE bit writable at the moment */
         value &= APLIC_DOMAINCFG_IE;
         aplic->domaincfg = value;
     } else if ((APLIC_SOURCECFG_BASE <= addr) &&
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 28e62174c42..f822f18b980 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -456,7 +456,7 @@ static int shpc_cap_add_config(PCIDevice *d, Error **errp)
     pci_set_byte(config + SHPC_CAP_CxP, 0);
     pci_set_long(config + SHPC_CAP_DWORD_DATA, 0);
     d->shpc->cap = config_offset;
-    /* Make dword select and data writeable. */
+    /* Make dword select and data writable. */
     pci_set_byte(d->wmask + config_offset + SHPC_CAP_DWORD_SELECT, 0xff);
     pci_set_long(d->wmask + config_offset + SHPC_CAP_DWORD_DATA, 0xffffffff);
     return 0;
diff --git a/hw/sparc64/sun4u_iommu.c b/hw/sparc64/sun4u_iommu.c
index 9178277f824..1c1dca712e3 100644
--- a/hw/sparc64/sun4u_iommu.c
+++ b/hw/sparc64/sun4u_iommu.c
@@ -165,7 +165,7 @@ static IOMMUTLBEntry sun4u_translate_iommu(IOMMUMemoryRegion *iommu,
     }
 
     if (tte & IOMMU_TTE_DATA_W) {
-        /* Writeable */
+        /* Writable */
         ret.perm = IOMMU_RW;
     } else {
         ret.perm = IOMMU_RO;
diff --git a/hw/timer/sse-timer.c b/hw/timer/sse-timer.c
index f959cb9d603..e92e83747d2 100644
--- a/hw/timer/sse-timer.c
+++ b/hw/timer/sse-timer.c
@@ -324,7 +324,7 @@ static void sse_timer_write(void *opaque, hwaddr offset, uint64_t value,
     {
         uint32_t old_ctl = s->cntp_aival_ctl;
 
-        /* EN bit is writeable; CLR bit is write-0-to-clear, write-1-ignored */
+        /* EN bit is writable; CLR bit is write-0-to-clear, write-1-ignored */
         s->cntp_aival_ctl &= ~R_CNTP_AIVAL_CTL_EN_MASK;
         s->cntp_aival_ctl |= value & R_CNTP_AIVAL_CTL_EN_MASK;
         if (!(value & R_CNTP_AIVAL_CTL_CLR_MASK)) {
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index f5b35cd55f0..2f806512d0a 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -118,7 +118,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             /*
              * Don't allow writing to XPSR.Exception as it can cause
              * a transition into or out of handler mode (it's not
-             * writeable via the MSR insn so this is a reasonable
+             * writable via the MSR insn so this is a reasonable
              * restriction). Other fields are safe to update.
              */
             xpsr_write(env, tmp, ~XPSR_EXCP);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7f2c14bea94..5727ead5e4c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1411,8 +1411,8 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
     }
 
-    env->cp15.c9_pmcr &= ~PMCR_WRITEABLE_MASK;
-    env->cp15.c9_pmcr |= (value & PMCR_WRITEABLE_MASK);
+    env->cp15.c9_pmcr &= ~PMCR_WRITABLE_MASK;
+    env->cp15.c9_pmcr |= (value & PMCR_WRITABLE_MASK);
 
     pmu_op_finish(env);
 }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 1fdc5eef92b..060aa0ccf4b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -978,8 +978,8 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
             }
         }
 
-        env->cp15.c9_pmcr &= ~PMCR_WRITEABLE_MASK;
-        env->cp15.c9_pmcr |= (val & PMCR_WRITEABLE_MASK);
+        env->cp15.c9_pmcr &= ~PMCR_WRITABLE_MASK;
+        env->cp15.c9_pmcr |= (val & PMCR_WRITABLE_MASK);
 
         pmu_op_finish(env);
         break;
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index e254d8ba10f..a6f47b7d114 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -103,7 +103,7 @@ static void x86_cpu_to_dict(X86CPU *cpu, QDict *props)
 
 /* Convert CPU model data from X86CPU object to a property dictionary
  * that can recreate exactly the same CPU model, including every
- * writeable QOM property.
+ * writable QOM property.
  */
 static void x86_cpu_to_dict_full(X86CPU *cpu, QDict *props)
 {
diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index bdae5090bc8..b12f18d346f 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -284,7 +284,7 @@ void ioinst_handle_stsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb,
         g_assert(!s390_is_pv());
         /*
          * As operand exceptions have a lower priority than access exceptions,
-         * we check whether the memory area is writeable (injecting the
+         * we check whether the memory area is writable (injecting the
          * access execption if it is not) first.
          */
         if (!s390_cpu_virt_mem_check_write(cpu, addr, ar, sizeof(schib))) {
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 07ac5a710be..37191f433b2 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -495,7 +495,7 @@ def _early_cleanup(self) -> None:
         """
         # If we keep the console socket open, we may deadlock waiting
         # for QEMU to exit, while QEMU is waiting for the socket to
-        # become writeable.
+        # become writable.
         if self._console_socket is not None:
             self._console_socket.close()
             self._console_socket = None
diff --git a/tests/tcg/x86_64/system/boot.S b/tests/tcg/x86_64/system/boot.S
index f8a2fcc8395..ed0f638406b 100644
--- a/tests/tcg/x86_64/system/boot.S
+++ b/tests/tcg/x86_64/system/boot.S
@@ -56,7 +56,7 @@
 	*
 	* - `ebx`: contains the physical memory address where the loader has placed
 	*          the boot start info structure.
-	* - `cr0`: bit 0 (PE) must be set. All the other writeable bits are cleared.
+	* - `cr0`: bit 0 (PE) must be set. All the other writable bits are cleared.
 	* - `cr4`: all bits are cleared.
 	* - `cs `: must be a 32-bit read/execute code segment with a base of ‘0’
 	*          and a limit of ‘0xFFFFFFFF’. The selector value is unspecified.
-- 
2.25.1


