Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F76143860C
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 02:48:52 +0200 (CEST)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meRgx-0000WZ-KB
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 20:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meRdo-0006FP-V2
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 20:45:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meRdj-0004CV-Lr
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 20:45:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DED6D756197;
 Sun, 24 Oct 2021 02:45:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AB0DA756194; Sun, 24 Oct 2021 02:45:26 +0200 (CEST)
Message-Id: <06c4f8c6c0f254b99c0fcb07e19e1cc260bb19fd.1635036053.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635036053.git.balaton@eik.bme.hu>
References: <cover.1635036053.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/5] hw/sh4: Coding style: Fix multi-line comments
Date: Sun, 24 Oct 2021 02:40:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/char/sh_serial.c  |   6 +-
 hw/intc/sh_intc.c    |   9 +-
 hw/sh4/r2d.c         |   6 +-
 hw/sh4/sh7750.c      |  22 +-
 hw/sh4/sh7750_regs.h | 504 +++++++++++++++++++++----------------------
 hw/sh4/shix.c        |  10 +-
 hw/timer/sh_timer.c  |   7 +-
 7 files changed, 286 insertions(+), 278 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 167f4d8cb9..05ae8e84ce 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -115,8 +115,10 @@ static void sh_serial_write(void *opaque, hwaddr offs,
     case 0x0c: /* FTDR / TDR */
         if (qemu_chr_fe_backend_connected(&s->chr)) {
             ch = val;
-            /* XXX this blocks entire thread. Rewrite to use
-             * qemu_chr_fe_write and background I/O callbacks */
+            /*
+             * XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks
+             */
             qemu_chr_fe_write_all(&s->chr, &ch, 1);
         }
         s->dr = val;
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index a269b8fbd4..84eec7d4ba 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -450,8 +450,7 @@ int sh_intc_init(MemoryRegion *sysmem,
     desc->nr_mask_regs = nr_mask_regs;
     desc->prio_regs = prio_regs;
     desc->nr_prio_regs = nr_prio_regs;
-    /* Allocate 4 MemoryRegions per register (2 actions * 2 aliases).
-     **/
+    /* Allocate 4 MemoryRegions per register (2 actions * 2 aliases) */
     desc->iomem_aliases = g_new0(MemoryRegion,
                                  (nr_mask_regs + nr_prio_regs) * 4);
 
@@ -498,8 +497,10 @@ int sh_intc_init(MemoryRegion *sysmem,
     return 0;
 }
 
-/* Assert level <n> IRL interrupt. 
-   0:deassert. 1:lowest priority,... 15:highest priority. */
+/*
+ * Assert level <n> IRL interrupt.
+ * 0:deassert. 1:lowest priority,... 15:highest priority
+ */
 void sh_intc_set_irl(void *opaque, int n, int level)
 {
     struct intc_source *s = opaque;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 8f0d373b09..46f1fae48c 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -352,8 +352,10 @@ static void r2d_init(MachineState *machine)
     }
 
     if (kernel_cmdline) {
-        /* I see no evidence that this .kernel_cmdline buffer requires
-           NUL-termination, so using strncpy should be ok. */
+        /*
+         * I see no evidence that this .kernel_cmdline buffer requires
+         * NUL-termination, so using strncpy should be ok.
+         */
         strncpy(boot_params.kernel_cmdline, kernel_cmdline,
                 sizeof(boot_params.kernel_cmdline));
     }
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 2a175bfa74..2539924b00 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -82,9 +82,10 @@ static inline int has_bcr3_and_bcr4(SH7750State * s)
 {
     return s->cpu->env.features & SH_FEATURE_BCR3_AND_BCR4;
 }
-/**********************************************************************
- I/O ports
-**********************************************************************/
+
+/*
+ * I/O ports
+ */
 
 int sh7750_register_io_device(SH7750State * s, sh7750_io_device * device)
 {
@@ -194,9 +195,9 @@ static void portb_changed(SH7750State * s, uint16_t prev)
         gen_port_interrupts(s);
 }
 
-/**********************************************************************
- Memory
-**********************************************************************/
+/*
+ * Memory
+ */
 
 static void error_access(const char *kind, hwaddr addr)
 {
@@ -491,7 +492,8 @@ static const MemoryRegionOps sh7750_mem_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-/* sh775x interrupt controller tables for sh_intc.c
+/*
+ * sh775x interrupt controller tables for sh_intc.c
  * stolen from linux/arch/sh/kernel/cpu/sh4/setup-sh7750.c
  */
 
@@ -642,9 +644,9 @@ static struct intc_group groups_irl[] = {
         IRL_7, IRL_8, IRL_9, IRL_A, IRL_B, IRL_C, IRL_D, IRL_E),
 };
 
-/**********************************************************************
- Memory mapped cache and TLB
-**********************************************************************/
+/*
+ * Memory mapped cache and TLB
+ */
 
 #define MM_REGION_MASK   0x07000000
 #define MM_ICACHE_ADDR   (0)
diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
index fd1050646f..bd12b0532d 100644
--- a/hw/sh4/sh7750_regs.h
+++ b/hw/sh4/sh7750_regs.h
@@ -43,8 +43,7 @@
  * All register has 2 addresses: in 0xff000000 - 0xffffffff (P4 address)  and
  * in 0x1f000000 - 0x1fffffff (area 7 address)
  */
-#define SH7750_P4_BASE       0xff000000 /* Accessible only in
-                                           privileged mode */
+#define SH7750_P4_BASE       0xff000000 /* Accessible only in privileged mode */
 #define SH7750_A7_BASE       0x1f000000 /* Accessible only using TLB */
 
 #define SH7750_P4_REG32(ofs) (SH7750_P4_BASE + (ofs))
@@ -81,24 +80,24 @@
 #define SH7750_PTEL_PR_RWPO   0x00000020 /*   read-write in priv mode */
 #define SH7750_PTEL_PR_ROPU   0x00000040 /*   read-only in priv or user mode */
 #define SH7750_PTEL_PR_RWPU   0x00000060 /*   read-write in priv or user mode */
-#define SH7750_PTEL_C         0x00000008 /* Cacheability
-                                              (0 - page not cacheable) */
-#define SH7750_PTEL_D         0x00000004 /* Dirty bit (1 - write has been
-                                              performed to a page) */
-#define SH7750_PTEL_SH        0x00000002 /* Share Status bit (1 - page are
-                                              shared by processes) */
-#define SH7750_PTEL_WT        0x00000001 /* Write-through bit, specifies the
-                                              cache write mode:
-                                              0 - Copy-back mode
-                                              1 - Write-through mode */
+#define SH7750_PTEL_C         0x00000008 /* Cacheability */
+                                         /*   (0 - page not cacheable) */
+#define SH7750_PTEL_D         0x00000004 /* Dirty bit (1 - write has been */
+                                         /*   performed to a page) */
+#define SH7750_PTEL_SH        0x00000002 /* Share Status bit (1 - page are */
+                                         /*   shared by processes) */
+#define SH7750_PTEL_WT        0x00000001 /* Write-through bit, specifies the */
+                                         /*   cache write mode: */
+                                         /*     0 - Copy-back mode */
+                                         /*     1 - Write-through mode */
 
 /* Page Table Entry Assistance register - PTEA */
 #define SH7750_PTEA_REGOFS    0x000034 /* offset */
 #define SH7750_PTEA           SH7750_P4_REG32(SH7750_PTEA_REGOFS)
 #define SH7750_PTEA_A7        SH7750_A7_REG32(SH7750_PTEA_REGOFS)
-#define SH7750_PTEA_TC        0x00000008 /* Timing Control bit
-                                              0 - use area 5 wait states
-                                              1 - use area 6 wait states */
+#define SH7750_PTEA_TC        0x00000008 /* Timing Control bit */
+                                         /*   0 - use area 5 wait states */
+                                         /*   1 - use area 6 wait states */
 #define SH7750_PTEA_SA        0x00000007 /* Space Attribute bits: */
 #define SH7750_PTEA_SA_UNDEF  0x00000000 /*   0 - undefined */
 #define SH7750_PTEA_SA_IOVAR  0x00000001 /*   1 - variable-size I/O space */
@@ -150,13 +149,13 @@
 #define SH7750_CCR_A7         SH7750_A7_REG32(SH7750_CCR_REGOFS)
 
 #define SH7750_CCR_IIX      0x00008000 /* IC index enable bit */
-#define SH7750_CCR_ICI      0x00000800 /* IC invalidation bit:
-                                           set it to clear IC */
+#define SH7750_CCR_ICI      0x00000800 /* IC invalidation bit: */
+                                       /*  set it to clear IC */
 #define SH7750_CCR_ICE      0x00000100 /* IC enable bit */
 #define SH7750_CCR_OIX      0x00000080 /* OC index enable bit */
-#define SH7750_CCR_ORA      0x00000020 /* OC RAM enable bit
-                                           if you set OCE = 0,
-                                           you should set ORA = 0 */
+#define SH7750_CCR_ORA      0x00000020 /* OC RAM enable bit */
+                                       /*  if you set OCE = 0, */
+                                       /*  you should set ORA = 0 */
 #define SH7750_CCR_OCI      0x00000008 /* OC invalidation bit */
 #define SH7750_CCR_CB       0x00000004 /* Copy-back bit for P1 area */
 #define SH7750_CCR_WT       0x00000002 /* Write-through bit for P0,U0,P3 area */
@@ -213,21 +212,22 @@
 /* General exception category */
 #define SH7750_EVT_USER_BREAK          0x1E0 /* User break */
 #define SH7750_EVT_IADDR_ERR           0x0E0 /* Instruction address error */
-#define SH7750_EVT_TLB_READ_MISS       0x040 /* ITLB miss exception /
-                                                   DTLB miss exception (read) */
-#define SH7750_EVT_TLB_READ_PROTV      0x0A0 /* ITLB protection violation /
-                                                   DTLB protection violation (read) */
-#define SH7750_EVT_ILLEGAL_INSTR       0x180 /* General Illegal Instruction
-                                                   exception */
-#define SH7750_EVT_SLOT_ILLEGAL_INSTR  0x1A0 /* Slot Illegal Instruction
-                                                   exception */
+#define SH7750_EVT_TLB_READ_MISS       0x040 /* ITLB miss exception / */
+                                             /*    DTLB miss exception (read) */
+#define SH7750_EVT_TLB_READ_PROTV      0x0A0 /* ITLB protection violation, */
+                                             /* DTLB protection violation */
+                                             /*    (read) */
+#define SH7750_EVT_ILLEGAL_INSTR       0x180 /* General Illegal Instruction */
+                                             /*    exception */
+#define SH7750_EVT_SLOT_ILLEGAL_INSTR  0x1A0 /* Slot Illegal Instruction */
+                                             /*    exception */
 #define SH7750_EVT_FPU_DISABLE         0x800 /* General FPU disable exception */
 #define SH7750_EVT_SLOT_FPU_DISABLE    0x820 /* Slot FPU disable exception */
 #define SH7750_EVT_DATA_READ_ERR       0x0E0 /* Data address error (read) */
 #define SH7750_EVT_DATA_WRITE_ERR      0x100 /* Data address error (write) */
 #define SH7750_EVT_DTLB_WRITE_MISS     0x060 /* DTLB miss exception (write) */
-#define SH7750_EVT_DTLB_WRITE_PROTV    0x0C0 /* DTLB protection violation
-                                                   exception (write) */
+#define SH7750_EVT_DTLB_WRITE_PROTV    0x0C0 /* DTLB protection violation */
+                                             /*    exception (write) */
 #define SH7750_EVT_FPU_EXCEPTION       0x120 /* FPU exception */
 #define SH7750_EVT_INITIAL_PGWRITE     0x080 /* Initial Page Write exception */
 #define SH7750_EVT_TRAPA               0x160 /* Unconditional trap (TRAPA) */
@@ -268,14 +268,14 @@
 #define SH7750_EVT_SCI_TEI             0x540 /* Transmit End */
 
 /* Peripheral Module Interrupts - Watchdog Timer (WDT) */
-#define SH7750_EVT_WDT_ITI             0x560 /* Interval Timer Interrupt
-                                                   (used when WDT operates in
-                                                   interval timer mode) */
+#define SH7750_EVT_WDT_ITI             0x560 /* Interval Timer Interrupt */
+                                             /*    (used when WDT operates in */
+                                             /*    interval timer mode) */
 
 /* Peripheral Module Interrupts - Memory Refresh Unit (REF) */
 #define SH7750_EVT_REF_RCMI            0x580 /* Compare-match Interrupt */
-#define SH7750_EVT_REF_ROVI            0x5A0 /* Refresh Counter Overflow
-                                                   interrupt */
+#define SH7750_EVT_REF_ROVI            0x5A0 /* Refresh Counter Overflow */
+                                             /*    interrupt */
 
 /* Peripheral Module Interrupts - Hitachi User Debug Interface (H-UDI) */
 #define SH7750_EVT_HUDI                0x600 /* UDI interrupt */
@@ -290,11 +290,10 @@
 #define SH7750_EVT_DMAC_DMTE3          0x6A0 /* DMAC 3 Transfer End Interrupt */
 #define SH7750_EVT_DMAC_DMAE           0x6C0 /* DMAC Address Error Interrupt */
 
-/* Peripheral Module Interrupts - Serial Communication Interface with FIFO */
-/*                                                                  (SCIF) */
+/* Peripheral Module Interrupts Serial Communication Interface w/ FIFO (SCIF) */
 #define SH7750_EVT_SCIF_ERI            0x700 /* Receive Error */
-#define SH7750_EVT_SCIF_RXI            0x720 /* Receive FIFO Data Full or
-                                                   Receive Data ready interrupt */
+#define SH7750_EVT_SCIF_RXI            0x720 /* Receive FIFO Data Full or */
+                                             /* Receive Data ready interrupt */
 #define SH7750_EVT_SCIF_BRI            0x740 /* Break or overrun error */
 #define SH7750_EVT_SCIF_TXI            0x760 /* Transmit FIFO Data Empty */
 
@@ -305,13 +304,13 @@
 #define SH7750_STBCR          SH7750_P4_REG32(SH7750_STBCR_REGOFS)
 #define SH7750_STBCR_A7       SH7750_A7_REG32(SH7750_STBCR_REGOFS)
 
-#define SH7750_STBCR_STBY     0x80 /* Specifies a transition to standby mode:
-                                        0 - Transition to SLEEP mode on SLEEP
-                                        1 - Transition to STANDBY mode on SLEEP */
-#define SH7750_STBCR_PHZ      0x40 /* State of peripheral module pins in
-                                        standby mode:
-                                        0 - normal state
-                                        1 - high-impendance state */
+#define SH7750_STBCR_STBY     0x80 /* Specifies a transition to standby mode: */
+                                   /*   0 Transition to SLEEP mode on SLEEP */
+                                   /*   1 Transition to STANDBY mode on SLEEP */
+#define SH7750_STBCR_PHZ      0x40 /* State of peripheral module pins in */
+                                   /* standby mode: */
+                                   /*   0 normal state */
+                                   /*   1 high-impendance state */
 
 #define SH7750_STBCR_PPU      0x20 /* Peripheral module pins pull-up controls */
 #define SH7750_STBCR_MSTP4    0x10 /* Stopping the clock supply to DMAC */
@@ -332,16 +331,16 @@
 #define SH7750_STBCR2         SH7750_P4_REG32(SH7750_STBCR2_REGOFS)
 #define SH7750_STBCR2_A7      SH7750_A7_REG32(SH7750_STBCR2_REGOFS)
 
-#define SH7750_STBCR2_DSLP    0x80 /* Specifies transition to deep sleep mode:
-                                        0 - transition to sleep or standby mode
-                                        as it is specified in STBY bit
-                                        1 - transition to deep sleep mode on
-                                        execution of SLEEP instruction */
-#define SH7750_STBCR2_MSTP6   0x02 /* Stopping the clock supply to Store Queue
-                                        in the cache controller */
+#define SH7750_STBCR2_DSLP    0x80 /* Specifies transition to deep sleep mode */
+                                   /*   0 transition to sleep or standby mode */
+                                   /*     as it is specified in STBY bit */
+                                   /*   1 transition to deep sleep mode on */
+                                   /*     execution of SLEEP instruction */
+#define SH7750_STBCR2_MSTP6   0x02 /* Stopping the clock supply to the */
+                                   /*   Store Queue in the cache controller */
 #define SH7750_STBCR2_SQ_STP  SH7750_STBCR2_MSTP6
-#define SH7750_STBCR2_MSTP5   0x01 /* Stopping the clock supply to the User
-                                        Break Controller (UBC) */
+#define SH7750_STBCR2_MSTP5   0x01 /* Stopping the clock supply to the  */
+                                   /*   User Break Controller (UBC) */
 #define SH7750_STBCR2_UBC_STP SH7750_STBCR2_MSTP5
 
 /*
@@ -351,9 +350,9 @@
 #define SH7750_FRQCR          SH7750_P4_REG32(SH7750_FRQCR_REGOFS)
 #define SH7750_FRQCR_A7       SH7750_A7_REG32(SH7750_FRQCR_REGOFS)
 
-#define SH7750_FRQCR_CKOEN    0x0800 /* Clock Output Enable
-                                           0 - CKIO pin goes to HiZ/pullup
-                                           1 - Clock is output from CKIO */
+#define SH7750_FRQCR_CKOEN    0x0800 /* Clock Output Enable */
+                                     /*    0 - CKIO pin goes to HiZ/pullup */
+                                     /*    1 - Clock is output from CKIO */
 #define SH7750_FRQCR_PLL1EN   0x0400 /* PLL circuit 1 enable */
 #define SH7750_FRQCR_PLL2EN   0x0200 /* PLL circuit 2 enable */
 
@@ -373,8 +372,8 @@
 #define SH7750_FRQCR_BFCDIV6  0x0020 /*    4 - * 1/6 */
 #define SH7750_FRQCR_BFCDIV8  0x0028 /*    5 - * 1/8 */
 
-#define SH7750_FRQCR_PFC      0x0007 /* Peripheral module clock frequency
-                                           division ratio: */
+#define SH7750_FRQCR_PFC      0x0007 /* Peripheral module clock frequency */
+                                     /*    division ratio: */
 #define SH7750_FRQCR_PFCDIV2  0x0000 /*    0 - * 1/2 */
 #define SH7750_FRQCR_PFCDIV3  0x0001 /*    1 - * 1/3 */
 #define SH7750_FRQCR_PFCDIV4  0x0002 /*    2 - * 1/4 */
@@ -389,17 +388,15 @@
 #define SH7750_WTCNT_REGOFS   0xC00008 /* offset */
 #define SH7750_WTCNT          SH7750_P4_REG32(SH7750_WTCNT_REGOFS)
 #define SH7750_WTCNT_A7       SH7750_A7_REG32(SH7750_WTCNT_REGOFS)
-#define SH7750_WTCNT_KEY      0x5A00 /* When WTCNT byte register written,
-                                           you have to set the upper byte to
-                                           0x5A */
+#define SH7750_WTCNT_KEY      0x5A00 /* When WTCNT byte register written, you */
+                                     /* have to set the upper byte to 0x5A */
 
 /* Watchdog Timer Control/Status register - WTCSR */
 #define SH7750_WTCSR_REGOFS   0xC0000C /* offset */
 #define SH7750_WTCSR          SH7750_P4_REG32(SH7750_WTCSR_REGOFS)
 #define SH7750_WTCSR_A7       SH7750_A7_REG32(SH7750_WTCSR_REGOFS)
-#define SH7750_WTCSR_KEY      0xA500 /* When WTCSR byte register written,
-                                           you have to set the upper byte to
-                                           0xA5 */
+#define SH7750_WTCSR_KEY      0xA500 /* When WTCSR byte register written, you */
+                                     /* have to set the upper byte to 0xA5 */
 #define SH7750_WTCSR_TME      0x80 /* Timer enable (1-upcount start) */
 #define SH7750_WTCSR_MODE     0x40 /* Timer Mode Select: */
 #define SH7750_WTCSR_MODE_WT  0x40 /*    Watchdog Timer Mode */
@@ -540,10 +537,10 @@
 #define SH7750_RCR2_RTCEN      0x08 /* RTC Crystal Oscillator is Operated */
 #define SH7750_RCR2_ADJ        0x04 /* 30-Second Adjastment */
 #define SH7750_RCR2_RESET      0x02 /* Frequency divider circuits are reset */
-#define SH7750_RCR2_START      0x01 /* 0 - sec, min, hr, day-of-week, month,
-                                           year counters are stopped
-                                       1 - sec, min, hr, day-of-week, month,
-                                           year counters operate normally */
+#define SH7750_RCR2_START      0x01 /* 0 - sec, min, hr, day-of-week, month, */
+                                    /*     year counters are stopped */
+                                    /* 1 - sec, min, hr, day-of-week, month, */
+                                    /*     year counters operate normally */
 /*
  * Bus State Controller - BSC
  */
@@ -554,96 +551,98 @@
 #define SH7750_BCR1_ENDIAN    0x80000000 /* Endianness (1 - little endian) */
 #define SH7750_BCR1_MASTER    0x40000000 /* Master/Slave mode (1-master) */
 #define SH7750_BCR1_A0MPX     0x20000000 /* Area 0 Memory Type (0-SRAM,1-MPX) */
-#define SH7750_BCR1_IPUP      0x02000000 /* Input Pin Pull-up Control:
-                                              0 - pull-up resistor is on for
-                                                  control input pins
-                                              1 - pull-up resistor is off */
-#define SH7750_BCR1_OPUP      0x01000000 /* Output Pin Pull-up Control:
-                                              0 - pull-up resistor is on for
-                                                  control output pins
-                                              1 - pull-up resistor is off */
-#define SH7750_BCR1_A1MBC     0x00200000 /* Area 1 SRAM Byte Control Mode:
-                                              0 - Area 1 SRAM is set to
-                                                  normal mode
-                                              1 - Area 1 SRAM is set to byte
-                                                  control mode */
-#define SH7750_BCR1_A4MBC     0x00100000 /* Area 4 SRAM Byte Control Mode:
-                                              0 - Area 4 SRAM is set to
-                                                  normal mode
-                                              1 - Area 4 SRAM is set to byte
-                                                  control mode */
-#define SH7750_BCR1_BREQEN    0x00080000 /* BREQ Enable:
-                                              0 - External requests are  not
-                                                  accepted
-                                              1 - External requests are
-                                                  accepted */
-#define SH7750_BCR1_PSHR      0x00040000 /* Partial Sharing Bit:
-                                              0 - Master Mode
-                                              1 - Partial-sharing Mode */
-#define SH7750_BCR1_MEMMPX    0x00020000 /* Area 1 to 6 MPX Interface:
-                                              0 - SRAM/burst ROM interface
-                                              1 - MPX interface */
-#define SH7750_BCR1_HIZMEM    0x00008000 /* High Impendance Control. Specifies
-                                              the state of A[25:0], BS\, CSn\,
-                                              RD/WR\, CE2A\, CE2B\ in standby
-                                              mode and when bus is released:
-                                              0 - signals go to High-Z mode
-                                              1 - signals driven */
-#define SH7750_BCR1_HIZCNT    0x00004000 /* High Impendance Control. Specifies
-                                              the state of the RAS\, RAS2\, WEn\,
-                                              CASn\, DQMn, RD\, CASS\, FRAME\,
-                                              RD2\ signals in standby mode and
-                                              when bus is released:
-                                              0 - signals go to High-Z mode
-                                              1 - signals driven */
+#define SH7750_BCR1_IPUP      0x02000000 /* Input Pin Pull-up Control: */
+                                         /*   0 - pull-up resistor is on for */
+                                         /*       control input pins */
+                                         /*   1 - pull-up resistor is off */
+#define SH7750_BCR1_OPUP      0x01000000 /* Output Pin Pull-up Control: */
+                                         /*   0 - pull-up resistor is on for */
+                                         /*       control output pins */
+                                         /*   1 - pull-up resistor is off */
+#define SH7750_BCR1_A1MBC     0x00200000 /* Area 1 SRAM Byte Control Mode: */
+                                         /*   0 - Area 1 SRAM is set to */
+                                         /*       normal mode */
+                                         /*   1 - Area 1 SRAM is set to byte */
+                                         /*       control mode */
+#define SH7750_BCR1_A4MBC     0x00100000 /* Area 4 SRAM Byte Control Mode: */
+                                         /*   0 - Area 4 SRAM is set to */
+                                         /*       normal mode */
+                                         /*   1 - Area 4 SRAM is set to byte */
+                                         /*       control mode */
+#define SH7750_BCR1_BREQEN    0x00080000 /* BREQ Enable: */
+                                         /*   0 - External requests are  not */
+                                         /*       accepted */
+                                         /*   1 - External requests are */
+                                         /*       accepted */
+#define SH7750_BCR1_PSHR      0x00040000 /* Partial Sharing Bit: */
+                                         /*   0 - Master Mode */
+                                         /*   1 - Partial-sharing Mode */
+#define SH7750_BCR1_MEMMPX    0x00020000 /* Area 1 to 6 MPX Interface: */
+                                         /*   0 - SRAM/burst ROM interface */
+                                         /*   1 - MPX interface */
+#define SH7750_BCR1_HIZMEM    0x00008000 /* High Impendance Control. */
+                                         /*   Specifies the state of A[25:0], */
+                                         /*   BS\, CSn\, RD/WR\, CE2A\, CE2B\ */
+                                         /*   in standby mode and when bus is */
+                                         /*   released: */
+                                         /*   0 - signals go to High-Z mode */
+                                         /*   1 - signals driven */
+#define SH7750_BCR1_HIZCNT    0x00004000 /* High Impendance Control. */
+                                         /*   Specifies the state of the */
+                                         /*   RAS\, RAS2\, WEn\, CASn\, DQMn, */
+                                         /*   RD\, CASS\, FRAME\, RD2\ */
+                                         /*   signals in standby mode and */
+                                         /* when bus is released: */
+                                         /*   0 - signals go to High-Z mode */
+                                         /*   1 - signals driven */
 #define SH7750_BCR1_A0BST     0x00003800 /* Area 0 Burst ROM Control */
 #define SH7750_BCR1_A0BST_SRAM    0x0000 /*   Area 0 accessed as SRAM i/f */
-#define SH7750_BCR1_A0BST_ROM4    0x0800 /*   Area 0 accessed as burst ROM
-                                                   interface, 4 cosequtive access */
-#define SH7750_BCR1_A0BST_ROM8    0x1000 /*   Area 0 accessed as burst ROM
-                                                   interface, 8 cosequtive access */
-#define SH7750_BCR1_A0BST_ROM16   0x1800 /*   Area 0 accessed as burst ROM
-                                                   interface, 16 cosequtive access */
-#define SH7750_BCR1_A0BST_ROM32   0x2000 /*   Area 0 accessed as burst ROM
-                                                   interface, 32 cosequtive access */
+#define SH7750_BCR1_A0BST_ROM4    0x0800 /*   Area 0 accessed as burst ROM */
+                                         /*   interface, 4 cosequtive access */
+#define SH7750_BCR1_A0BST_ROM8    0x1000 /*   Area 0 accessed as burst ROM */
+                                         /*   interface, 8 cosequtive access */
+#define SH7750_BCR1_A0BST_ROM16   0x1800 /*   Area 0 accessed as burst ROM */
+                                         /*   interface, 16 cosequtive access */
+#define SH7750_BCR1_A0BST_ROM32   0x2000 /*   Area 0 accessed as burst ROM */
+                                         /*   interface, 32 cosequtive access */
 
 #define SH7750_BCR1_A5BST     0x00000700 /* Area 5 Burst ROM Control */
 #define SH7750_BCR1_A5BST_SRAM    0x0000 /*   Area 5 accessed as SRAM i/f */
-#define SH7750_BCR1_A5BST_ROM4    0x0100 /*   Area 5 accessed as burst ROM
-                                                   interface, 4 cosequtive access */
-#define SH7750_BCR1_A5BST_ROM8    0x0200 /*   Area 5 accessed as burst ROM
-                                                   interface, 8 cosequtive access */
-#define SH7750_BCR1_A5BST_ROM16   0x0300 /*   Area 5 accessed as burst ROM
-                                                   interface, 16 cosequtive access */
-#define SH7750_BCR1_A5BST_ROM32   0x0400 /*   Area 5 accessed as burst ROM
-                                                   interface, 32 cosequtive access */
+#define SH7750_BCR1_A5BST_ROM4    0x0100 /*   Area 5 accessed as burst ROM */
+                                         /*   interface, 4 cosequtive access */
+#define SH7750_BCR1_A5BST_ROM8    0x0200 /*   Area 5 accessed as burst ROM */
+                                         /*   interface, 8 cosequtive access */
+#define SH7750_BCR1_A5BST_ROM16   0x0300 /*   Area 5 accessed as burst ROM */
+                                         /*   interface, 16 cosequtive access */
+#define SH7750_BCR1_A5BST_ROM32   0x0400 /*   Area 5 accessed as burst ROM */
+                                         /*   interface, 32 cosequtive access */
 
 #define SH7750_BCR1_A6BST     0x000000E0 /* Area 6 Burst ROM Control */
 #define SH7750_BCR1_A6BST_SRAM    0x0000 /*   Area 6 accessed as SRAM i/f */
-#define SH7750_BCR1_A6BST_ROM4    0x0020 /*   Area 6 accessed as burst ROM
-                                                   interface, 4 cosequtive access */
-#define SH7750_BCR1_A6BST_ROM8    0x0040 /*   Area 6 accessed as burst ROM
-                                                   interface, 8 cosequtive access */
-#define SH7750_BCR1_A6BST_ROM16   0x0060 /*   Area 6 accessed as burst ROM
-                                                   interface, 16 cosequtive access */
-#define SH7750_BCR1_A6BST_ROM32   0x0080 /*   Area 6 accessed as burst ROM
-                                                   interface, 32 cosequtive access */
+#define SH7750_BCR1_A6BST_ROM4    0x0020 /*   Area 6 accessed as burst ROM */
+                                         /*   interface, 4 cosequtive access */
+#define SH7750_BCR1_A6BST_ROM8    0x0040 /*   Area 6 accessed as burst ROM */
+                                         /*   interface, 8 cosequtive access */
+#define SH7750_BCR1_A6BST_ROM16   0x0060 /*   Area 6 accessed as burst ROM */
+                                         /*   interface, 16 cosequtive access */
+#define SH7750_BCR1_A6BST_ROM32   0x0080 /*   Area 6 accessed as burst ROM */
+                                         /*   interface, 32 cosequtive access */
 
 #define SH7750_BCR1_DRAMTP        0x001C /* Area 2 and 3 Memory Type */
-#define SH7750_BCR1_DRAMTP_2SRAM_3SRAM   0x0000 /* Area 2 and 3 are SRAM or MPX
-                                                   interface. */
-#define SH7750_BCR1_DRAMTP_2SRAM_3SDRAM  0x0008 /* Area 2 - SRAM/MPX, Area 3 -
-                                                   synchronous DRAM */
-#define SH7750_BCR1_DRAMTP_2SDRAM_3SDRAM 0x000C /* Area 2 and 3 are synchronous
-                                                   DRAM interface */
-#define SH7750_BCR1_DRAMTP_2SRAM_3DRAM   0x0010 /* Area 2 - SRAM/MPX, Area 3 -
-                                                   DRAM interface */
-#define SH7750_BCR1_DRAMTP_2DRAM_3DRAM   0x0014 /* Area 2 and 3 are DRAM
-                                                   interface */
-
-#define SH7750_BCR1_A56PCM    0x00000001 /* Area 5 and 6 Bus Type:
-                                                   0 - SRAM interface
-                                                   1 - PCMCIA interface */
+#define SH7750_BCR1_DRAMTP_2SRAM_3SRAM   0x0000 /* Area 2 and 3 are SRAM or */
+                                                /* MPX interface. */
+#define SH7750_BCR1_DRAMTP_2SRAM_3SDRAM  0x0008 /* Area 2 - SRAM/MPX, Area 3 */
+                                                /* synchronous DRAM */
+#define SH7750_BCR1_DRAMTP_2SDRAM_3SDRAM 0x000C /* Area 2 and 3 are */
+                                                /* synchronous DRAM interface */
+#define SH7750_BCR1_DRAMTP_2SRAM_3DRAM   0x0010 /* Area 2 - SRAM/MPX, Area 3 */
+                                                /* DRAM interface */
+#define SH7750_BCR1_DRAMTP_2DRAM_3DRAM   0x0014 /* Area 2 and 3 are DRAM */
+                                                /* interface */
+
+#define SH7750_BCR1_A56PCM    0x00000001 /* Area 5 and 6 Bus Type: */
+                                         /*   0 - SRAM interface */
+                                         /*   1 - PCMCIA interface */
 
 /* Bus Control Register 2 (half) - BCR2 */
 #define SH7750_BCR2_REGOFS    0x800004 /* offset */
@@ -668,16 +667,16 @@
 #define SH7750_BCR2_SZ_8      1 /* 8 bits */
 #define SH7750_BCR2_SZ_16     2 /* 16 bits */
 #define SH7750_BCR2_SZ_32     3 /* 32 bits */
-#define SH7750_BCR2_PORTEN    0x0001 /* Port Function Enable :
-                                        0 - D51-D32 are not used as a port
-                                        1 - D51-D32 are used as a port */
+#define SH7750_BCR2_PORTEN    0x0001 /* Port Function Enable */
+                                     /* 0 - D51-D32 are not used as a port */
+                                     /* 1 - D51-D32 are used as a port */
 
 /* Wait Control Register 1 - WCR1 */
 #define SH7750_WCR1_REGOFS    0x800008 /* offset */
 #define SH7750_WCR1           SH7750_P4_REG32(SH7750_WCR1_REGOFS)
 #define SH7750_WCR1_A7        SH7750_A7_REG32(SH7750_WCR1_REGOFS)
-#define SH7750_WCR1_DMAIW     0x70000000 /* DACK Device Inter-Cycle Idle
-                                                   specification */
+#define SH7750_WCR1_DMAIW     0x70000000 /* DACK Device Inter-Cycle Idle */
+                                         /*   specification */
 #define SH7750_WCR1_DMAIW_S   28
 #define SH7750_WCR1_A6IW      0x07000000 /* Area 6 Inter-Cycle Idle spec. */
 #define SH7750_WCR1_A6IW_S    24
@@ -794,8 +793,8 @@
 #define SH7750_MCR_RASD       0x80000000 /* RAS Down mode */
 #define SH7750_MCR_MRSET      0x40000000 /* SDRAM Mode Register Set */
 #define SH7750_MCR_PALL       0x00000000 /* SDRAM Precharge All cmd. Mode */
-#define SH7750_MCR_TRC        0x38000000 /* RAS Precharge Time at End of
-                                            Refresh: */
+#define SH7750_MCR_TRC        0x38000000 /* RAS Precharge Time at End of */
+                                         /* Refresh: */
 #define SH7750_MCR_TRC_0      0x00000000 /*    0 */
 #define SH7750_MCR_TRC_3      0x08000000 /*    3 */
 #define SH7750_MCR_TRC_6      0x10000000 /*    6 */
@@ -809,10 +808,10 @@
 #define SH7750_MCR_TCAS_1     0x00000000 /*    1 */
 #define SH7750_MCR_TCAS_2     0x00800000 /*    2 */
 
-#define SH7750_MCR_TPC        0x00380000 /* DRAM: RAS Precharge Period
-                                            SDRAM: minimum number of cycles
-                                            until the next bank active cmd
-                                            is output after precharging */
+#define SH7750_MCR_TPC        0x00380000 /* DRAM: RAS Precharge Period */
+                                         /* SDRAM: minimum number of cycles */
+                                         /* until the next bank active cmd */
+                                         /* is output after precharging */
 #define SH7750_MCR_TPC_S      19
 #define SH7750_MCR_TPC_SDRAM_1 0x00000000 /* 1 cycle */
 #define SH7750_MCR_TPC_SDRAM_2 0x00080000 /* 2 cycles */
@@ -823,9 +822,10 @@
 #define SH7750_MCR_TPC_SDRAM_7 0x00300000 /* 7 cycles */
 #define SH7750_MCR_TPC_SDRAM_8 0x00380000 /* 8 cycles */
 
-#define SH7750_MCR_RCD        0x00030000 /* DRAM: RAS-CAS Assertion Delay time
-                                            SDRAM: bank active-read/write cmd
-                                            delay time */
+#define SH7750_MCR_RCD         0x00030000 /* DRAM: RAS-CAS Assertion Delay */
+                                          /*   time */
+                                          /* SDRAM: bank active-read/write */
+                                          /*   command delay time */
 #define SH7750_MCR_RCD_DRAM_2  0x00000000 /* DRAM delay 2 clocks */
 #define SH7750_MCR_RCD_DRAM_3  0x00010000 /* DRAM delay 3 clocks */
 #define SH7750_MCR_RCD_DRAM_4  0x00020000 /* DRAM delay 4 clocks */
@@ -841,10 +841,10 @@
 #define SH7750_MCR_TRWL_4     0x00006000 /* 4 */
 #define SH7750_MCR_TRWL_5     0x00008000 /* 5 */
 
-#define SH7750_MCR_TRAS       0x00001C00 /* DRAM: CAS-Before-RAS Refresh RAS
-                                            asserting period
-                                            SDRAM: Command interval after
-                                            synchronous DRAM refresh */
+#define SH7750_MCR_TRAS       0x00001C00 /* DRAM: CAS-Before-RAS Refresh RAS */
+                                         /* asserting period */
+                                         /* SDRAM: Command interval after */
+                                         /* synchronous DRAM refresh */
 #define SH7750_MCR_TRAS_DRAM_2         0x00000000 /* 2 */
 #define SH7750_MCR_TRAS_DRAM_3         0x00000400 /* 3 */
 #define SH7750_MCR_TRAS_DRAM_4         0x00000800 /* 4 */
@@ -898,30 +898,30 @@
 #define SH7750_PCR            SH7750_P4_REG32(SH7750_PCR_REGOFS)
 #define SH7750_PCR_A7         SH7750_A7_REG32(SH7750_PCR_REGOFS)
 
-#define SH7750_PCR_A5PCW      0xC000 /* Area 5 PCMCIA Wait - Number of wait
-                                        states to be added to the number of
-                                        waits specified by WCR2 in a low-speed
-                                        PCMCIA wait cycle */
+#define SH7750_PCR_A5PCW      0xC000 /* Area 5 PCMCIA Wait - Number of wait */
+                                     /* states to be added to the number of */
+                                     /* waits specified by WCR2 in a */
+                                     /* low-speed PCMCIA wait cycle */
 #define SH7750_PCR_A5PCW_0    0x0000 /*    0 waits inserted */
 #define SH7750_PCR_A5PCW_15   0x4000 /*    15 waits inserted */
 #define SH7750_PCR_A5PCW_30   0x8000 /*    30 waits inserted */
 #define SH7750_PCR_A5PCW_50   0xC000 /*    50 waits inserted */
 
-#define SH7750_PCR_A6PCW      0x3000 /* Area 6 PCMCIA Wait - Number of wait
-                                        states to be added to the number of
-                                        waits specified by WCR2 in a low-speed
-                                        PCMCIA wait cycle */
+#define SH7750_PCR_A6PCW      0x3000 /* Area 6 PCMCIA Wait - Number of wait */
+                                     /* states to be added to the number of */
+                                     /* waits specified by WCR2 in a */
+                                     /* low-speed PCMCIA wait cycle */
 #define SH7750_PCR_A6PCW_0    0x0000 /*    0 waits inserted */
 #define SH7750_PCR_A6PCW_15   0x1000 /*    15 waits inserted */
 #define SH7750_PCR_A6PCW_30   0x2000 /*    30 waits inserted */
 #define SH7750_PCR_A6PCW_50   0x3000 /*    50 waits inserted */
 
-#define SH7750_PCR_A5TED      0x0E00 /* Area 5 Address-OE\/WE\ Assertion Delay,
-                                        delay time from address output to
-                                        OE\/WE\ assertion on the connected
-                                        PCMCIA interface */
+#define SH7750_PCR_A5TED      0x0E00 /* Area 5 Addr-OE\/WE\ Assertion Delay */
+                                     /* delay time from address output to */
+                                     /* OE\/WE\ assertion on the connected */
+                                     /* PCMCIA interface */
 #define SH7750_PCR_A5TED_S    9
-#define SH7750_PCR_A6TED      0x01C0 /* Area 6 Address-OE\/WE\ Assertion Delay */
+#define SH7750_PCR_A6TED      0x01C0 /* Area 6 Addr-OE\/WE\ Assertion Delay */
 #define SH7750_PCR_A6TED_S    6
 
 #define SH7750_PCR_TED_0WS    0 /* 0 Waits inserted */
@@ -933,10 +933,10 @@
 #define SH7750_PCR_TED_12WS   6 /* 12 Waits inserted */
 #define SH7750_PCR_TED_15WS   7 /* 15 Waits inserted */
 
-#define SH7750_PCR_A5TEH      0x0038 /* Area 5 OE\/WE\ Negation Address delay,
-                                        address hold delay time from OE\/WE\
-                                        negation in a write on the connected
-                                        PCMCIA interface */
+#define SH7750_PCR_A5TEH      0x0038 /* Area 5 OE\/WE\ Negation Addr delay, */
+                                     /* address hold delay time from OE\/WE\ */
+                                     /* negation in a write on the connected */
+                                     /* PCMCIA interface */
 #define SH7750_PCR_A5TEH_S    3
 
 #define SH7750_PCR_A6TEH      0x0007 /* Area 6 OE\/WE\ Negation Address delay */
@@ -957,9 +957,9 @@
 #define SH7750_RTCSR_A7       SH7750_A7_REG32(SH7750_RTCSR_REGOFS)
 
 #define SH7750_RTCSR_KEY      0xA500 /* RTCSR write key */
-#define SH7750_RTCSR_CMF      0x0080 /* Compare-Match Flag (indicates a
-                                        match between the refresh timer
-                                        counter and refresh time constant) */
+#define SH7750_RTCSR_CMF      0x0080 /* Compare-Match Flag (indicates a */
+                                     /* match between the refresh timer */
+                                     /* counter and refresh time constant) */
 #define SH7750_RTCSR_CMIE     0x0040 /* Compare-Match Interrupt Enable */
 #define SH7750_RTCSR_CKS      0x0038 /* Refresh Counter Clock Selects */
 #define SH7750_RTCSR_CKS_DIS          0x0000 /* Clock Input Disabled */
@@ -972,8 +972,8 @@
 #define SH7750_RTCSR_CKS_CKIO_DIV4096 0x0038 /* Bus Clock / 4096 */
 
 #define SH7750_RTCSR_OVF      0x0004 /* Refresh Count Overflow Flag */
-#define SH7750_RTCSR_OVIE     0x0002 /* Refresh Count Overflow Interrupt
-                                        Enable */
+#define SH7750_RTCSR_OVIE     0x0002 /* Refresh Count Overflow Interrupt */
+                                     /*   Enable */
 #define SH7750_RTCSR_LMTS     0x0001 /* Refresh Count Overflow Limit Select */
 #define SH7750_RTCSR_LMTS_1024 0x0000 /* Count Limit is 1024 */
 #define SH7750_RTCSR_LMTS_512  0x0001 /* Count Limit is 512 */
@@ -1076,9 +1076,9 @@
 #define SH7750_CHCR_SSA_AMEM8   0xC0000000 /* 8-bit attribute memory space */
 #define SH7750_CHCR_SSA_AMEM16  0xE0000000 /* 16-bit attribute memory space */
 
-#define SH7750_CHCR_STC       0x10000000 /* Source Address Wait Control Select,
-                                                   specifies CS5 or CS6 space wait
-                                                   control for PCMCIA access */
+#define SH7750_CHCR_STC       0x10000000 /* Source Addr Wait Control Select */
+                                         /*   specifies CS5 or CS6 space wait */
+                                         /*   control for PCMCIA access */
 
 #define SH7750_CHCR_DSA       0x0E000000 /* Source Address Space Attribute */
 #define SH7750_CHCR_DSA_PCMCIA  0x00000000 /* Reserved in PCMCIA access */
@@ -1090,10 +1090,10 @@
 #define SH7750_CHCR_DSA_AMEM8   0x0C000000 /* 8-bit attribute memory space */
 #define SH7750_CHCR_DSA_AMEM16  0x0E000000 /* 16-bit attribute memory space */
 
-#define SH7750_CHCR_DTC       0x01000000 /* Destination Address Wait Control
-                                              Select, specifies CS5 or CS6
-                                              space wait control for PCMCIA
-                                              access */
+#define SH7750_CHCR_DTC       0x01000000 /* Destination Address Wait Control */
+                                         /*   Select, specifies CS5 or CS6 */
+                                         /*   space wait control for PCMCIA */
+                                         /*   access */
 
 #define SH7750_CHCR_DS        0x00080000 /* DREQ\ Select : */
 #define SH7750_CHCR_DS_LOWLVL 0x00000000 /*   Low Level Detection */
@@ -1122,49 +1122,49 @@
 #define SH7750_CHCR_SM_DEC    0x00002000 /*   Source Addr Decremented */
 
 #define SH7750_CHCR_RS        0x00000F00 /* Request Source Select: */
-#define SH7750_CHCR_RS_ER_DA_EA_TO_EA   0x000 /* External Request, Dual Address
-                                                   Mode (External Addr Space->
-                                                   External Addr Space) */
-#define SH7750_CHCR_RS_ER_SA_EA_TO_ED   0x200 /* External Request, Single
-                                                   Address Mode (External Addr
-                                                   Space -> External Device) */
-#define SH7750_CHCR_RS_ER_SA_ED_TO_EA   0x300 /* External Request, Single
-                                                   Address Mode, (External
-                                                   Device -> External Addr
-                                                   Space) */
-#define SH7750_CHCR_RS_AR_EA_TO_EA      0x400 /* Auto-Request (External Addr
-                                                   Space -> External Addr Space) */
-
-#define SH7750_CHCR_RS_AR_EA_TO_OCP     0x500 /* Auto-Request (External Addr
-                                                   Space -> On-chip Peripheral
-                                                   Module) */
-#define SH7750_CHCR_RS_AR_OCP_TO_EA     0x600 /* Auto-Request (On-chip
-                                                   Peripheral Module ->
-                                                   External Addr Space */
-#define SH7750_CHCR_RS_SCITX_EA_TO_SC   0x800 /* SCI Transmit-Data-Empty intr
-                                                   transfer request (external
-                                                   address space -> SCTDR1) */
-#define SH7750_CHCR_RS_SCIRX_SC_TO_EA   0x900 /* SCI Receive-Data-Full intr
-                                                   transfer request (SCRDR1 ->
-                                                   External Addr Space) */
-#define SH7750_CHCR_RS_SCIFTX_EA_TO_SC  0xA00 /* SCIF Transmit-Data-Empty intr
-                                                   transfer request (external
-                                                   address space -> SCFTDR1) */
-#define SH7750_CHCR_RS_SCIFRX_SC_TO_EA  0xB00 /* SCIF Receive-Data-Full intr
-                                                   transfer request (SCFRDR2 ->
-                                                   External Addr Space) */
-#define SH7750_CHCR_RS_TMU2_EA_TO_EA    0xC00 /* TMU Channel 2 (input capture
-                                                   interrupt), (external address
-                                                   space -> external address
-                                                   space) */
-#define SH7750_CHCR_RS_TMU2_EA_TO_OCP   0xD00 /* TMU Channel 2 (input capture
-                                                   interrupt), (external address
-                                                   space -> on-chip peripheral
-                                                   module) */
-#define SH7750_CHCR_RS_TMU2_OCP_TO_EA   0xE00 /* TMU Channel 2 (input capture
-                                                   interrupt), (on-chip
-                                                   peripheral module -> external
-                                                   address space) */
+#define SH7750_CHCR_RS_ER_DA_EA_TO_EA   0x000 /* External Request, Dual Addr */
+                                              /*   Mode, External Addr Space */
+                                              /*   -> External Addr Space) */
+#define SH7750_CHCR_RS_ER_SA_EA_TO_ED   0x200 /* External Request, Single */
+                                              /*   Address Mode (Ext. Addr */
+                                              /*   Space -> External Device) */
+#define SH7750_CHCR_RS_ER_SA_ED_TO_EA   0x300 /* External Request, Single */
+                                              /*   Address Mode, (External */
+                                              /*   Device -> External Addr */
+                                              /*   Space) */
+#define SH7750_CHCR_RS_AR_EA_TO_EA      0x400 /* Auto-Request (External Addr */
+                                              /*   Space -> Ext. Addr Space) */
+
+#define SH7750_CHCR_RS_AR_EA_TO_OCP     0x500 /* Auto-Request (External Addr */
+                                              /*   Space -> On-chip */
+                                              /*   Peripheral Module) */
+#define SH7750_CHCR_RS_AR_OCP_TO_EA     0x600 /* Auto-Request (On-chip */
+                                              /*   Peripheral Module -> */
+                                              /*   External Addr Space */
+#define SH7750_CHCR_RS_SCITX_EA_TO_SC   0x800 /* SCI Transmit-Data-Empty intr */
+                                              /*   transfer request (external */
+                                              /*   address space -> SCTDR1) */
+#define SH7750_CHCR_RS_SCIRX_SC_TO_EA   0x900 /* SCI Receive-Data-Full intr */
+                                              /*   transfer request (SCRDR1 */
+                                              /*   -> External Addr Space) */
+#define SH7750_CHCR_RS_SCIFTX_EA_TO_SC  0xA00 /* SCIF TX-Data-Empty intr */
+                                              /*   transfer request (external */
+                                              /*   address space -> SCFTDR1) */
+#define SH7750_CHCR_RS_SCIFRX_SC_TO_EA  0xB00 /* SCIF Receive-Data-Full intr */
+                                              /*   transfer request (SCFRDR2 */
+                                              /*   -> External Addr Space) */
+#define SH7750_CHCR_RS_TMU2_EA_TO_EA    0xC00 /* TMU Channel 2 (input capture */
+                                              /*   interrupt), (external */
+                                              /*   address space -> external */
+                                              /*   address space) */
+#define SH7750_CHCR_RS_TMU2_EA_TO_OCP   0xD00 /* TMU Channel 2 (input capture */
+                                              /*   interrupt), (external */
+                                              /*   address space -> on-chip */
+                                              /*   peripheral module) */
+#define SH7750_CHCR_RS_TMU2_OCP_TO_EA   0xE00 /* TMU Channel 2 (input capture */
+                                              /*   interrupt), (on-chip */
+                                              /*   peripheral module -> */
+                                              /*   external address space) */
 
 #define SH7750_CHCR_TM        0x00000080 /* Transmit mode: */
 #define SH7750_CHCR_TM_CSTEAL 0x00000000 /*     Cycle Steal Mode */
@@ -1255,22 +1255,22 @@
 #define SH7750_ICR_MAI        0x4000 /* NMI Interrupt Mask */
 
 #define SH7750_ICR_NMIB       0x0200 /* NMI Block Mode: */
-#define SH7750_ICR_NMIB_BLK   0x0000 /*   NMI requests held pending while
-                                           SR.BL bit is set to 1 */
-#define SH7750_ICR_NMIB_NBLK  0x0200 /*   NMI requests detected when SR.BL bit
-                                           set to 1 */
+#define SH7750_ICR_NMIB_BLK   0x0000 /*   NMI requests held pending while */
+                                     /*     SR.BL bit is set to 1 */
+#define SH7750_ICR_NMIB_NBLK  0x0200 /*   NMI requests detected when SR.BL */
+                                     /*     bit set to 1 */
 
 #define SH7750_ICR_NMIE       0x0100 /* NMI Edge Select: */
-#define SH7750_ICR_NMIE_FALL  0x0000 /*   Interrupt request detected on falling
-                                           edge of NMI input */
-#define SH7750_ICR_NMIE_RISE  0x0100 /*   Interrupt request detected on rising
-                                           edge of NMI input */
+#define SH7750_ICR_NMIE_FALL  0x0000 /*   Interrupt request detected on */
+                                     /*     falling edge of NMI input */
+#define SH7750_ICR_NMIE_RISE  0x0100 /*   Interrupt request detected on */
+                                     /*     rising edge of NMI input */
 
 #define SH7750_ICR_IRLM       0x0080 /* IRL Pin Mode: */
-#define SH7750_ICR_IRLM_ENC   0x0000 /*   IRL\ pins used as a level-encoded
-                                           interrupt requests */
-#define SH7750_ICR_IRLM_RAW   0x0080 /*   IRL\ pins used as a four independent
-                                           interrupt requests */
+#define SH7750_ICR_IRLM_ENC   0x0000 /*   IRL\ pins used as a level-encoded */
+                                     /*     interrupt requests */
+#define SH7750_ICR_IRLM_RAW   0x0080 /*   IRL\ pins used as a four */
+                                     /*     independent interrupt requests */
 
 /*
  * User Break Controller registers
diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index b0579aa0f1..6b39de417f 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -22,11 +22,11 @@
  * THE SOFTWARE.
  */
 /*
-   Shix 2.0 board by Alexis Polti, described at
-   https://web.archive.org/web/20070917001736/perso.enst.fr/~polti/realisations/shix20
-
-   More information in target/sh4/README.sh4
-*/
+ * Shix 2.0 board by Alexis Polti, described at
+ * https://web.archive.org/web/20070917001736/perso.enst.fr/~polti/realisations/shix20
+ *
+ * More information in target/sh4/README.sh4
+ */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 58af1a1edb..4f765b339b 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -104,9 +104,10 @@ static void sh_timer_write(void *opaque, hwaddr offset,
     case OFFSET_TCR:
         ptimer_transaction_begin(s->timer);
         if (s->enabled) {
-            /* Pause the timer if it is running.  This may cause some
-               inaccuracy dure to rounding, but avoids a whole lot of other
-               messyness.  */
+            /*
+             * Pause the timer if it is running. This may cause some inaccuracy
+             * dure to rounding, but avoids a whole lot of other messyness
+             */
             ptimer_stop(s->timer);
         }
         freq = s->freq;
-- 
2.21.4


