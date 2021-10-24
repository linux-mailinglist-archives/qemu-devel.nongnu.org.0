Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FDB438611
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 02:52:28 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meRkN-00067J-5Z
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 20:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meRdp-0006FR-8V
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 20:45:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meRdj-0004Ef-Lw
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 20:45:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EDE18748F48;
 Sun, 24 Oct 2021 02:45:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B7B39746333; Sun, 24 Oct 2021 02:45:28 +0200 (CEST)
Message-Id: <6a3dbc3e9972ab87dc82c80c6a35ca06014f8012.1635036053.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635036053.git.balaton@eik.bme.hu>
References: <cover.1635036053.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/5] hw/sh4: Coding style: White space fixes
Date: Sun, 24 Oct 2021 02:40:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
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
 hw/char/sh_serial.c      | 23 ++++++++++-------------
 hw/intc/sh_intc.c        | 25 ++++++++++++++++---------
 hw/pci-host/sh_pci.c     | 10 ++++------
 hw/sh4/r2d.c             | 39 ++++++++++++++++++++-------------------
 hw/sh4/sh7750.c          | 26 +++++++++++++-------------
 hw/sh4/sh7750_regnames.c |  5 +++--
 hw/sh4/sh7750_regs.h     | 18 +++++++++---------
 hw/sh4/shix.c            |  2 +-
 hw/timer/sh_timer.c      | 22 ++++++++++++++++------
 include/hw/sh4/sh.h      | 10 +++++-----
 10 files changed, 97 insertions(+), 83 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 05ae8e84ce..3fdb9f9a99 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -75,7 +75,7 @@ typedef struct {
     qemu_irq bri;
 } sh_serial_state;
 
-static void sh_serial_clear_fifo(sh_serial_state * s)
+static void sh_serial_clear_fifo(sh_serial_state *s)
 {
     memset(s->rx_fifo, 0, SH_RX_FIFO_LENGTH);
     s->rx_cnt = 0;
@@ -93,7 +93,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
     printf("sh_serial: write offs=0x%02x val=0x%02x\n",
            offs, val);
 #endif
-    switch(offs) {
+    switch (offs) {
     case 0x00: /* SMR */
         s->smr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0x7b : 0xff);
         return;
@@ -131,7 +131,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
 #endif
     }
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
-        switch(offs) {
+        switch (offs) {
         case 0x10: /* FSR */
             if (!(val & (1 << 6)))
                 s->flags &= ~SH_SERIAL_FLAG_TEND;
@@ -178,9 +178,8 @@ static void sh_serial_write(void *opaque, hwaddr offs,
         case 0x24: /* LSR */
             return;
         }
-    }
-    else {
-        switch(offs) {
+    } else {
+        switch (offs) {
 #if 0
         case 0x0c:
             ret = s->dr;
@@ -207,7 +206,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
     uint32_t ret = ~0;
 
 #if 0
-    switch(offs) {
+    switch (offs) {
     case 0x00:
         ret = s->smr;
         break;
@@ -223,7 +222,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
     }
 #endif
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
-        switch(offs) {
+        switch (offs) {
         case 0x00: /* SMR */
             ret = s->smr;
             break;
@@ -270,9 +269,8 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
             ret = 0;
             break;
         }
-    }
-    else {
-        switch(offs) {
+    } else {
+        switch (offs) {
 #if 0
         case 0x0c:
             ret = s->dr;
@@ -397,8 +395,7 @@ void sh_serial_init(MemoryRegion *sysmem,
 
     if (feat & SH_SERIAL_FEAT_SCIF) {
         s->fcr = 0;
-    }
-    else {
+    } else {
         s->dr = 0xff;
     }
 
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 84eec7d4ba..783a05fa38 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -74,7 +74,7 @@ void sh_intc_toggle_source(struct intc_source *source,
   }
 }
 
-static void sh_intc_set_irq (void *opaque, int n, int level)
+static void sh_intc_set_irq(void *opaque, int n, int level)
 {
   struct intc_desc *desc = opaque;
   struct intc_source *source = &(desc->sources[n]);
@@ -236,7 +236,7 @@ static uint64_t sh_intc_read(void *opaque, hwaddr offset,
     printf("sh_intc_read 0x%lx\n", (unsigned long) offset);
 #endif
 
-    sh_intc_locate(desc, (unsigned long)offset, &valuep, 
+    sh_intc_locate(desc, (unsigned long)offset, &valuep,
                    &enum_ids, &first, &width, &mode);
     return *valuep;
 }
@@ -257,14 +257,20 @@ static void sh_intc_write(void *opaque, hwaddr offset,
     printf("sh_intc_write 0x%lx 0x%08x\n", (unsigned long) offset, value);
 #endif
 
-    sh_intc_locate(desc, (unsigned long)offset, &valuep, 
+    sh_intc_locate(desc, (unsigned long)offset, &valuep,
                    &enum_ids, &first, &width, &mode);
 
     switch (mode) {
-    case INTC_MODE_ENABLE_REG | INTC_MODE_IS_PRIO: break;
-    case INTC_MODE_DUAL_SET: value |= *valuep; break;
-    case INTC_MODE_DUAL_CLR: value = *valuep & ~value; break;
-    default: abort();
+    case INTC_MODE_ENABLE_REG | INTC_MODE_IS_PRIO:
+        break;
+    case INTC_MODE_DUAL_SET:
+        value |= *valuep;
+        break;
+    case INTC_MODE_DUAL_CLR:
+        value = *valuep & ~value;
+        break;
+    default:
+        abort();
     }
 
     for (k = 0; k <= first; k++) {
@@ -465,7 +471,7 @@ int sh_intc_init(MemoryRegion *sysmem,
     }
 
     desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
- 
+
     memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc,
                           "interrupt-controller", 0x100000000ULL);
 
@@ -507,7 +513,8 @@ void sh_intc_set_irl(void *opaque, int n, int level)
     int i, irl = level ^ 15;
     for (i = 0; (s = sh_intc_source(s->parent, s->next_enum_id)); i++) {
         if (i == irl)
-            sh_intc_toggle_source(s, s->enable_count?0:1, s->asserted?0:1);
+            sh_intc_toggle_source(s, s->enable_count ? 0 : 1,
+                                  s->asserted ? 0 : 1);
         else
             if (s->asserted)
                 sh_intc_toggle_source(s, 0, -1);
diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 08c1562e22..719d6ca2a6 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -49,13 +49,12 @@ struct SHPCIState {
     uint32_t iobr;
 };
 
-static void sh_pci_reg_write (void *p, hwaddr addr, uint64_t val,
-                              unsigned size)
+static void sh_pci_reg_write(void *p, hwaddr addr, uint64_t val, unsigned size)
 {
     SHPCIState *pcic = p;
     PCIHostState *phb = PCI_HOST_BRIDGE(pcic);
 
-    switch(addr) {
+    switch (addr) {
     case 0 ... 0xfc:
         stl_le_p(pcic->dev->config + addr, val);
         break;
@@ -75,13 +74,12 @@ static void sh_pci_reg_write (void *p, hwaddr addr, uint64_t val,
     }
 }
 
-static uint64_t sh_pci_reg_read (void *p, hwaddr addr,
-                                 unsigned size)
+static uint64_t sh_pci_reg_read(void *p, hwaddr addr, unsigned size)
 {
     SHPCIState *pcic = p;
     PCIHostState *phb = PCI_HOST_BRIDGE(pcic);
 
-    switch(addr) {
+    switch (addr) {
     case 0 ... 0xfc:
         return ldl_le_p(pcic->dev->config + addr);
     case 0x1c0:
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 46f1fae48c..216d6e24a1 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -96,19 +96,19 @@ enum r2d_fpga_irq {
 };
 
 static const struct { short irl; uint16_t msk; } irqtab[NR_IRQS] = {
-    [CF_IDE] =   {  1, 1<<9 },
-    [CF_CD] =    {  2, 1<<8 },
-    [PCI_INTA] = {  9, 1<<14 },
-    [PCI_INTB] = { 10, 1<<13 },
-    [PCI_INTC] = {  3, 1<<12 },
-    [PCI_INTD] = {  0, 1<<11 },
-    [SM501] =    {  4, 1<<10 },
-    [KEY] =      {  5, 1<<6 },
-    [RTC_A] =    {  6, 1<<5 },
-    [RTC_T] =    {  7, 1<<4 },
-    [SDCARD] =   {  8, 1<<7 },
-    [EXT] =      { 11, 1<<0 },
-    [TP] =       { 12, 1<<15 },
+    [CF_IDE] =   {  1, 1 << 9 },
+    [CF_CD] =    {  2, 1 << 8 },
+    [PCI_INTA] = {  9, 1 << 14 },
+    [PCI_INTB] = { 10, 1 << 13 },
+    [PCI_INTC] = {  3, 1 << 12 },
+    [PCI_INTD] = {  0, 1 << 11 },
+    [SM501] =    {  4, 1 << 10 },
+    [KEY] =      {  5, 1 << 6 },
+    [RTC_A] =    {  6, 1 << 5 },
+    [RTC_T] =    {  7, 1 << 4 },
+    [SDCARD] =   {  8, 1 << 7 },
+    [EXT] =      { 11, 1 << 0 },
+    [TP] =       { 12, 1 << 15 },
 };
 
 static void update_irl(r2d_fpga_t *fpga)
@@ -306,7 +306,7 @@ static void r2d_init(MachineState *machine)
     /* NIC: rtl8139 on-board, and 2 slots. */
     for (i = 0; i < nb_nics; i++)
         pci_nic_init_nofail(&nd_table[i], pci_bus,
-                            "rtl8139", i==0 ? "2" : NULL);
+                            "rtl8139", i == 0 ? "2" : NULL);
 
     /* USB keyboard */
     usb_create_simple(usb_bus_find(-1), "usb-kbd");
@@ -321,8 +321,8 @@ static void r2d_init(MachineState *machine)
                                           SDRAM_BASE + LINUX_LOAD_OFFSET,
                                           INITRD_LOAD_OFFSET - LINUX_LOAD_OFFSET);
         if (kernel_size < 0) {
-          fprintf(stderr, "qemu: could not load kernel '%s'\n", kernel_filename);
-          exit(1);
+            fprintf(stderr, "qemu: could not load kernel '%s'\n", kernel_filename);
+            exit(1);
         }
 
         /* initialization which should be done by firmware */
@@ -330,7 +330,8 @@ static void r2d_init(MachineState *machine)
                           MEMTXATTRS_UNSPECIFIED, NULL); /* cs3 SDRAM */
         address_space_stw(&address_space_memory, SH7750_BCR2, 3 << (3 * 2),
                           MEMTXATTRS_UNSPECIFIED, NULL); /* cs3 32bit */
-        reset_info->vector = (SDRAM_BASE + LINUX_LOAD_OFFSET) | 0xa0000000; /* Start from P2 area */
+        /* Start from P2 area */
+        reset_info->vector = (SDRAM_BASE + LINUX_LOAD_OFFSET) | 0xa0000000;
     }
 
     if (initrd_filename) {
@@ -341,8 +342,8 @@ static void r2d_init(MachineState *machine)
                                           SDRAM_SIZE - INITRD_LOAD_OFFSET);
 
         if (initrd_size < 0) {
-          fprintf(stderr, "qemu: could not load initrd '%s'\n", initrd_filename);
-          exit(1);
+            fprintf(stderr, "qemu: could not load initrd '%s'\n", initrd_filename);
+            exit(1);
         }
 
         /* initialization which should be done by firmware */
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 2539924b00..1e61f9f1c8 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -78,7 +78,7 @@ typedef struct SH7750State {
     struct intc_desc intc;
 } SH7750State;
 
-static inline int has_bcr3_and_bcr4(SH7750State * s)
+static inline int has_bcr3_and_bcr4(SH7750State *s)
 {
     return s->cpu->env.features & SH_FEATURE_BCR3_AND_BCR4;
 }
@@ -87,7 +87,7 @@ static inline int has_bcr3_and_bcr4(SH7750State * s)
  * I/O ports
  */
 
-int sh7750_register_io_device(SH7750State * s, sh7750_io_device * device)
+int sh7750_register_io_device(SH7750State *s, sh7750_io_device *device)
 {
     int i;
 
@@ -102,7 +102,7 @@ int sh7750_register_io_device(SH7750State * s, sh7750_io_device * device)
 
 static uint16_t portdir(uint32_t v)
 {
-#define EVENPORTMASK(n) ((v & (1<<((n)<<1))) >> (n))
+#define EVENPORTMASK(n) ((v & (1 << ((n) << 1))) >> (n))
     return
         EVENPORTMASK(15) | EVENPORTMASK(14) | EVENPORTMASK(13) |
         EVENPORTMASK(12) | EVENPORTMASK(11) | EVENPORTMASK(10) |
@@ -114,7 +114,7 @@ static uint16_t portdir(uint32_t v)
 
 static uint16_t portpullup(uint32_t v)
 {
-#define ODDPORTMASK(n) ((v & (1<<(((n)<<1)+1))) >> (n))
+#define ODDPORTMASK(n) ((v & (1 << (((n) << 1) + 1))) >> (n))
     return
         ODDPORTMASK(15) | ODDPORTMASK(14) | ODDPORTMASK(13) |
         ODDPORTMASK(12) | ODDPORTMASK(11) | ODDPORTMASK(10) |
@@ -123,26 +123,26 @@ static uint16_t portpullup(uint32_t v)
         ODDPORTMASK(1) | ODDPORTMASK(0);
 }
 
-static uint16_t porta_lines(SH7750State * s)
+static uint16_t porta_lines(SH7750State *s)
 {
     return (s->portdira & s->pdtra) | /* CPU */
         (s->periph_portdira & s->periph_pdtra) | /* Peripherals */
         (~(s->portdira | s->periph_portdira) & s->portpullupa); /* Pullups */
 }
 
-static uint16_t portb_lines(SH7750State * s)
+static uint16_t portb_lines(SH7750State *s)
 {
     return (s->portdirb & s->pdtrb) | /* CPU */
         (s->periph_portdirb & s->periph_pdtrb) | /* Peripherals */
         (~(s->portdirb | s->periph_portdirb) & s->portpullupb); /* Pullups */
 }
 
-static void gen_port_interrupts(SH7750State * s)
+static void gen_port_interrupts(SH7750State *s)
 {
     /* XXXXX interrupts not generated */
 }
 
-static void porta_changed(SH7750State * s, uint16_t prev)
+static void porta_changed(SH7750State *s, uint16_t prev)
 {
     uint16_t currenta, changes;
     int i, r = 0;
@@ -171,7 +171,7 @@ static void porta_changed(SH7750State * s, uint16_t prev)
         gen_port_interrupts(s);
 }
 
-static void portb_changed(SH7750State * s, uint16_t prev)
+static void portb_changed(SH7750State *s, uint16_t prev)
 {
     uint16_t currentb, changes;
     int i, r = 0;
@@ -228,7 +228,7 @@ static uint32_t sh7750_mem_readw(void *opaque, hwaddr addr)
     case SH7750_BCR2_A7:
         return s->bcr2;
     case SH7750_BCR3_A7:
-        if(!has_bcr3_and_bcr4(s))
+        if (!has_bcr3_and_bcr4(s))
             error_access("word read", addr);
         return s->bcr3;
     case SH7750_FRQCR_A7:
@@ -263,7 +263,7 @@ static uint32_t sh7750_mem_readl(void *opaque, hwaddr addr)
     case SH7750_BCR1_A7:
         return s->bcr1;
     case SH7750_BCR4_A7:
-        if(!has_bcr3_and_bcr4(s))
+        if (!has_bcr3_and_bcr4(s))
             error_access("long read", addr);
         return s->bcr4;
     case SH7750_WCR1_A7:
@@ -332,7 +332,7 @@ static void sh7750_mem_writew(void *opaque, hwaddr addr,
         s->bcr2 = mem_value;
         return;
     case SH7750_BCR3_A7:
-        if(!has_bcr3_and_bcr4(s))
+        if (!has_bcr3_and_bcr4(s))
             error_access("word write", addr);
         s->bcr3 = mem_value;
         return;
@@ -384,7 +384,7 @@ static void sh7750_mem_writel(void *opaque, hwaddr addr,
         s->bcr1 = mem_value;
         return;
     case SH7750_BCR4_A7:
-        if(!has_bcr3_and_bcr4(s))
+        if (!has_bcr3_and_bcr4(s))
             error_access("long write", addr);
         s->bcr4 = mem_value;
         return;
diff --git a/hw/sh4/sh7750_regnames.c b/hw/sh4/sh7750_regnames.c
index b1f112df3e..37b3acd620 100644
--- a/hw/sh4/sh7750_regnames.c
+++ b/hw/sh4/sh7750_regnames.c
@@ -81,14 +81,15 @@ static regname_t regnames[] = {
     REGNAME(SH7750_BCR3_A7)
     REGNAME(SH7750_BCR4_A7)
     REGNAME(SH7750_SDMR2_A7)
-    REGNAME(SH7750_SDMR3_A7) {(uint32_t) - 1, NULL}
+    REGNAME(SH7750_SDMR3_A7)
+    { (uint32_t)-1, NULL }
 };
 
 const char *regname(uint32_t addr)
 {
     unsigned int i;
 
-    for (i = 0; regnames[i].regaddr != (uint32_t) - 1; i++) {
+    for (i = 0; regnames[i].regaddr != (uint32_t)-1; i++) {
         if (regnames[i].regaddr == addr)
             return regnames[i].regname;
     }
diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
index bd12b0532d..beb571d5e9 100644
--- a/hw/sh4/sh7750_regs.h
+++ b/hw/sh4/sh7750_regs.h
@@ -1015,7 +1015,7 @@
  */
 
 /* DMA Source Address Register - SAR0, SAR1, SAR2, SAR3 */
-#define SH7750_SAR_REGOFS(n)  (0xA00000 + ((n)*16)) /* offset */
+#define SH7750_SAR_REGOFS(n)  (0xA00000 + ((n) * 16)) /* offset */
 #define SH7750_SAR(n)         SH7750_P4_REG32(SH7750_SAR_REGOFS(n))
 #define SH7750_SAR_A7(n)      SH7750_A7_REG32(SH7750_SAR_REGOFS(n))
 #define SH7750_SAR0           SH7750_SAR(0)
@@ -1028,7 +1028,7 @@
 #define SH7750_SAR3_A7        SH7750_SAR_A7(3)
 
 /* DMA Destination Address Register - DAR0, DAR1, DAR2, DAR3 */
-#define SH7750_DAR_REGOFS(n)  (0xA00004 + ((n)*16)) /* offset */
+#define SH7750_DAR_REGOFS(n)  (0xA00004 + ((n) * 16)) /* offset */
 #define SH7750_DAR(n)         SH7750_P4_REG32(SH7750_DAR_REGOFS(n))
 #define SH7750_DAR_A7(n)      SH7750_A7_REG32(SH7750_DAR_REGOFS(n))
 #define SH7750_DAR0           SH7750_DAR(0)
@@ -1041,7 +1041,7 @@
 #define SH7750_DAR3_A7        SH7750_DAR_A7(3)
 
 /* DMA Transfer Count Register - DMATCR0, DMATCR1, DMATCR2, DMATCR3 */
-#define SH7750_DMATCR_REGOFS(n)  (0xA00008 + ((n)*16)) /* offset */
+#define SH7750_DMATCR_REGOFS(n)  (0xA00008 + ((n) * 16)) /* offset */
 #define SH7750_DMATCR(n)      SH7750_P4_REG32(SH7750_DMATCR_REGOFS(n))
 #define SH7750_DMATCR_A7(n)   SH7750_A7_REG32(SH7750_DMATCR_REGOFS(n))
 #define SH7750_DMATCR0_P4     SH7750_DMATCR(0)
@@ -1054,7 +1054,7 @@
 #define SH7750_DMATCR3_A7     SH7750_DMATCR_A7(3)
 
 /* DMA Channel Control Register - CHCR0, CHCR1, CHCR2, CHCR3 */
-#define SH7750_CHCR_REGOFS(n)  (0xA0000C + ((n)*16)) /* offset */
+#define SH7750_CHCR_REGOFS(n)  (0xA0000C + ((n) * 16)) /* offset */
 #define SH7750_CHCR(n)        SH7750_P4_REG32(SH7750_CHCR_REGOFS(n))
 #define SH7750_CHCR_A7(n)     SH7750_A7_REG32(SH7750_CHCR_REGOFS(n))
 #define SH7750_CHCR0          SH7750_CHCR(0)
@@ -1208,9 +1208,9 @@
 #define SH7750_PCTRA_A7       SH7750_A7_REG32(SH7750_PCTRA_REGOFS)
 
 #define SH7750_PCTRA_PBPUP(n) 0 /* Bit n is pulled up */
-#define SH7750_PCTRA_PBNPUP(n) (1 << ((n)*2+1)) /* Bit n is not pulled up */
+#define SH7750_PCTRA_PBNPUP(n) (1 << ((n) * 2 + 1)) /* Bit n is not pulled up */
 #define SH7750_PCTRA_PBINP(n) 0 /* Bit n is an input */
-#define SH7750_PCTRA_PBOUT(n) (1 << ((n)*2)) /* Bit n is an output */
+#define SH7750_PCTRA_PBOUT(n) (1 << ((n) * 2)) /* Bit n is an output */
 
 /* Port Data Register A - PDTRA(half) */
 #define SH7750_PDTRA_REGOFS   0x800030 /* offset */
@@ -1225,16 +1225,16 @@
 #define SH7750_PCTRB_A7       SH7750_A7_REG32(SH7750_PCTRB_REGOFS)
 
 #define SH7750_PCTRB_PBPUP(n) 0 /* Bit n is pulled up */
-#define SH7750_PCTRB_PBNPUP(n) (1 << ((n-16)*2+1)) /* Bit n is not pulled up */
+#define SH7750_PCTRB_PBNPUP(n) (1 << ((n - 16) * 2 + 1)) /* Bit n is not pulled up */
 #define SH7750_PCTRB_PBINP(n) 0 /* Bit n is an input */
-#define SH7750_PCTRB_PBOUT(n) (1 << ((n-16)*2)) /* Bit n is an output */
+#define SH7750_PCTRB_PBOUT(n) (1 << ((n - 16) * 2)) /* Bit n is an output */
 
 /* Port Data Register B - PDTRB(half) */
 #define SH7750_PDTRB_REGOFS   0x800044 /* offset */
 #define SH7750_PDTRB          SH7750_P4_REG32(SH7750_PDTRB_REGOFS)
 #define SH7750_PDTRB_A7       SH7750_A7_REG32(SH7750_PDTRB_REGOFS)
 
-#define SH7750_PDTRB_BIT(n) (1 << ((n)-16))
+#define SH7750_PDTRB_BIT(n) (1 << ((n) - 16))
 
 /* GPIO Interrupt Control Register - GPIOIC(half) */
 #define SH7750_GPIOIC_REGOFS  0x800048 /* offset */
diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index 6b39de417f..aa812512f0 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -48,7 +48,7 @@ static void shix_init(MachineState *machine)
     MemoryRegion *rom = g_new(MemoryRegion, 1);
     MemoryRegion *sdram = g_new(MemoryRegion, 2);
     const char *bios_name = machine->firmware ?: BIOS_FILENAME;
-    
+
     cpu = SUPERH_CPU(cpu_create(machine->cpu_type));
 
     /* Allocate memory space */
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 4f765b339b..01afcbd2b0 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -55,7 +55,7 @@ static void sh_timer_update(sh_timer_state *s)
     int new_level = s->int_level && (s->tcr & TIMER_TCR_UNIE);
 
     if (new_level != s->old_level)
-      qemu_set_irq (s->irq, new_level);
+        qemu_set_irq(s->irq, new_level);
 
     s->old_level = s->int_level;
     s->int_level = new_level;
@@ -113,11 +113,21 @@ static void sh_timer_write(void *opaque, hwaddr offset,
         freq = s->freq;
         /* ??? Need to recalculate expiry time after changing divisor.  */
         switch (value & TIMER_TCR_TPSC) {
-        case 0: freq >>= 2; break;
-        case 1: freq >>= 4; break;
-        case 2: freq >>= 6; break;
-        case 3: freq >>= 8; break;
-        case 4: freq >>= 10; break;
+        case 0:
+            freq >>= 2;
+            break;
+        case 1:
+            freq >>= 4;
+            break;
+        case 2:
+            freq >>= 6;
+            break;
+        case 3:
+            freq >>= 8;
+            break;
+        case 4:
+            freq >>= 10;
+            break;
         case 6:
         case 7:
             if (s->feat & TIMER_FEAT_EXTCLK) {
diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
index 3d5ba598d0..366cedcda0 100644
--- a/include/hw/sh4/sh.h
+++ b/include/hw/sh4/sh.h
@@ -44,14 +44,14 @@ typedef struct {
     uint16_t portbmask_trigger;
     /* Return 0 if no action was taken */
     int (*port_change_cb) (uint16_t porta, uint16_t portb,
-                           uint16_t * periph_pdtra,
-                           uint16_t * periph_portdira,
-                           uint16_t * periph_pdtrb,
-                           uint16_t * periph_portdirb);
+                           uint16_t *periph_pdtra,
+                           uint16_t *periph_portdira,
+                           uint16_t *periph_pdtrb,
+                           uint16_t *periph_portdirb);
 } sh7750_io_device;
 
 int sh7750_register_io_device(struct SH7750State *s,
-                              sh7750_io_device * device);
+                              sh7750_io_device *device);
 
 /* sh_serial.c */
 #define SH_SERIAL_FEAT_SCIF (1 << 0)
-- 
2.21.4


