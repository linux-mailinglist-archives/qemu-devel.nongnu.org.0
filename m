Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD83A59A6
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 18:41:36 +0200 (CEST)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsTB1-00067d-Vr
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 12:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7R-0006sa-HQ
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 12:37:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41224
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7P-0001as-8F
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 12:37:53 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7B-0006x0-1B; Sun, 13 Jun 2021 17:37:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com
Date: Sun, 13 Jun 2021 17:37:34 +0100
Message-Id: <20210613163738.2141-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/5] dp8393x: checkpatch fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also fix a simple comment typo of "constrainst" to "constraints".

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 231 +++++++++++++++++++++++++----------------------
 1 file changed, 122 insertions(+), 109 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 533a8304d0..56af08f0fe 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -29,14 +29,14 @@
 #include <zlib.h>
 #include "qom/object.h"
 
-//#define DEBUG_SONIC
+/* #define DEBUG_SONIC */
 
 #define SONIC_PROM_SIZE 0x1000
 
 #ifdef DEBUG_SONIC
 #define DPRINTF(fmt, ...) \
 do { printf("sonic: " fmt , ##  __VA_ARGS__); } while (0)
-static const char* reg_names[] = {
+static const char *reg_names[] = {
     "CR", "DCR", "RCR", "TCR", "IMR", "ISR", "UTDA", "CTDA",
     "TPS", "TFC", "TSA0", "TSA1", "TFS", "URDA", "CRDA", "CRBA0",
     "CRBA1", "RBWC0", "RBWC1", "EOBC", "URRA", "RSA", "REA", "RRP",
@@ -185,7 +185,8 @@ struct dp8393xState {
     AddressSpace as;
 };
 
-/* Accessor functions for values which are formed by
+/*
+ * Accessor functions for values which are formed by
  * concatenating two 16 bit device registers. By putting these
  * in their own functions with a uint32_t return type we avoid the
  * pitfall of implicit sign extension where ((x << 16) | y) is a
@@ -350,8 +351,7 @@ static void dp8393x_do_read_rra(dp8393xState *s)
     }
 
     /* Warn the host if CRBA now has the last available resource */
-    if (s->regs[SONIC_RRP] == s->regs[SONIC_RWP])
-    {
+    if (s->regs[SONIC_RRP] == s->regs[SONIC_RWP]) {
         s->regs[SONIC_ISR] |= SONIC_ISR_RBE;
         dp8393x_update_irq(s);
     }
@@ -364,7 +364,8 @@ static void dp8393x_do_software_reset(dp8393xState *s)
 {
     timer_del(s->watchdog);
 
-    s->regs[SONIC_CR] &= ~(SONIC_CR_LCAM | SONIC_CR_RRRA | SONIC_CR_TXP | SONIC_CR_HTX);
+    s->regs[SONIC_CR] &= ~(SONIC_CR_LCAM | SONIC_CR_RRRA | SONIC_CR_TXP |
+                           SONIC_CR_HTX);
     s->regs[SONIC_CR] |= SONIC_CR_RST | SONIC_CR_RXDIS;
 }
 
@@ -490,8 +491,10 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
 
         /* Handle Ethernet checksum */
         if (!(s->regs[SONIC_TCR] & SONIC_TCR_CRCI)) {
-            /* Don't append FCS there, to look like slirp packets
-             * which don't have one */
+            /*
+             * Don't append FCS there, to look like slirp packets
+             * which don't have one
+             */
         } else {
             /* Remove existing FCS */
             tx_len -= 4;
@@ -558,26 +561,34 @@ static void dp8393x_do_command(dp8393xState *s, uint16_t command)
 
     s->regs[SONIC_CR] |= (command & SONIC_CR_MASK);
 
-    if (command & SONIC_CR_HTX)
+    if (command & SONIC_CR_HTX) {
         dp8393x_do_halt_transmission(s);
-    if (command & SONIC_CR_TXP)
+    }
+    if (command & SONIC_CR_TXP) {
         dp8393x_do_transmit_packets(s);
-    if (command & SONIC_CR_RXDIS)
+    }
+    if (command & SONIC_CR_RXDIS) {
         dp8393x_do_receiver_disable(s);
-    if (command & SONIC_CR_RXEN)
+    }
+    if (command & SONIC_CR_RXEN) {
         dp8393x_do_receiver_enable(s);
-    if (command & SONIC_CR_STP)
+    }
+    if (command & SONIC_CR_STP) {
         dp8393x_do_stop_timer(s);
-    if (command & SONIC_CR_ST)
+    }
+    if (command & SONIC_CR_ST) {
         dp8393x_do_start_timer(s);
-    if (command & SONIC_CR_RST)
+    }
+    if (command & SONIC_CR_RST) {
         dp8393x_do_software_reset(s);
+    }
     if (command & SONIC_CR_RRRA) {
         dp8393x_do_read_rra(s);
         s->regs[SONIC_CR] &= ~SONIC_CR_RRRA;
     }
-    if (command & SONIC_CR_LCAM)
+    if (command & SONIC_CR_LCAM) {
         dp8393x_do_load_cam(s);
+    }
 }
 
 static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
@@ -587,24 +598,24 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
     uint16_t val = 0;
 
     switch (reg) {
-        /* Update data before reading it */
-        case SONIC_WT0:
-        case SONIC_WT1:
-            dp8393x_update_wt_regs(s);
-            val = s->regs[reg];
-            break;
-        /* Accept read to some registers only when in reset mode */
-        case SONIC_CAP2:
-        case SONIC_CAP1:
-        case SONIC_CAP0:
-            if (s->regs[SONIC_CR] & SONIC_CR_RST) {
-                val = s->cam[s->regs[SONIC_CEP] & 0xf][2* (SONIC_CAP0 - reg) + 1] << 8;
-                val |= s->cam[s->regs[SONIC_CEP] & 0xf][2* (SONIC_CAP0 - reg)];
-            }
-            break;
-        /* All other registers have no special contrainst */
-        default:
-            val = s->regs[reg];
+    /* Update data before reading it */
+    case SONIC_WT0:
+    case SONIC_WT1:
+        dp8393x_update_wt_regs(s);
+        val = s->regs[reg];
+        break;
+    /* Accept read to some registers only when in reset mode */
+    case SONIC_CAP2:
+    case SONIC_CAP1:
+    case SONIC_CAP0:
+        if (s->regs[SONIC_CR] & SONIC_CR_RST) {
+            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg) + 1] << 8;
+            val |= s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg)];
+        }
+        break;
+    /* All other registers have no special contraints */
+    default:
+        val = s->regs[reg];
     }
 
     DPRINTF("read 0x%04x from reg %s\n", val, reg_names[reg]);
@@ -622,75 +633,75 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
     DPRINTF("write 0x%04x to reg %s\n", (uint16_t)val, reg_names[reg]);
 
     switch (reg) {
-        /* Command register */
-        case SONIC_CR:
-            dp8393x_do_command(s, val);
-            break;
-        /* Prevent write to read-only registers */
-        case SONIC_CAP2:
-        case SONIC_CAP1:
-        case SONIC_CAP0:
-        case SONIC_SR:
-        case SONIC_MDT:
-            DPRINTF("writing to reg %d invalid\n", reg);
-            break;
-        /* Accept write to some registers only when in reset mode */
-        case SONIC_DCR:
-            if (s->regs[SONIC_CR] & SONIC_CR_RST) {
-                s->regs[reg] = val & 0xbfff;
-            } else {
-                DPRINTF("writing to DCR invalid\n");
-            }
-            break;
-        case SONIC_DCR2:
-            if (s->regs[SONIC_CR] & SONIC_CR_RST) {
-                s->regs[reg] = val & 0xf017;
-            } else {
-                DPRINTF("writing to DCR2 invalid\n");
-            }
-            break;
-        /* 12 lower bytes are Read Only */
-        case SONIC_TCR:
-            s->regs[reg] = val & 0xf000;
-            break;
-        /* 9 lower bytes are Read Only */
-        case SONIC_RCR:
-            s->regs[reg] = val & 0xffe0;
-            break;
-        /* Ignore most significant bit */
-        case SONIC_IMR:
-            s->regs[reg] = val & 0x7fff;
-            dp8393x_update_irq(s);
-            break;
-        /* Clear bits by writing 1 to them */
-        case SONIC_ISR:
-            val &= s->regs[reg];
-            s->regs[reg] &= ~val;
-            if (val & SONIC_ISR_RBE) {
-                dp8393x_do_read_rra(s);
-            }
-            dp8393x_update_irq(s);
-            break;
-        /* The guest is required to store aligned pointers here */
-        case SONIC_RSA:
-        case SONIC_REA:
-        case SONIC_RRP:
-        case SONIC_RWP:
-            if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
-                s->regs[reg] = val & 0xfffc;
-            } else {
-                s->regs[reg] = val & 0xfffe;
-            }
-            break;
-        /* Invert written value for some registers */
-        case SONIC_CRCT:
-        case SONIC_FAET:
-        case SONIC_MPT:
-            s->regs[reg] = val ^ 0xffff;
-            break;
-        /* All other registers have no special contrainst */
-        default:
-            s->regs[reg] = val;
+    /* Command register */
+    case SONIC_CR:
+        dp8393x_do_command(s, val);
+        break;
+    /* Prevent write to read-only registers */
+    case SONIC_CAP2:
+    case SONIC_CAP1:
+    case SONIC_CAP0:
+    case SONIC_SR:
+    case SONIC_MDT:
+        DPRINTF("writing to reg %d invalid\n", reg);
+        break;
+    /* Accept write to some registers only when in reset mode */
+    case SONIC_DCR:
+        if (s->regs[SONIC_CR] & SONIC_CR_RST) {
+            s->regs[reg] = val & 0xbfff;
+        } else {
+            DPRINTF("writing to DCR invalid\n");
+        }
+        break;
+    case SONIC_DCR2:
+        if (s->regs[SONIC_CR] & SONIC_CR_RST) {
+            s->regs[reg] = val & 0xf017;
+        } else {
+            DPRINTF("writing to DCR2 invalid\n");
+        }
+        break;
+    /* 12 lower bytes are Read Only */
+    case SONIC_TCR:
+        s->regs[reg] = val & 0xf000;
+        break;
+    /* 9 lower bytes are Read Only */
+    case SONIC_RCR:
+        s->regs[reg] = val & 0xffe0;
+        break;
+    /* Ignore most significant bit */
+    case SONIC_IMR:
+        s->regs[reg] = val & 0x7fff;
+        dp8393x_update_irq(s);
+        break;
+    /* Clear bits by writing 1 to them */
+    case SONIC_ISR:
+        val &= s->regs[reg];
+        s->regs[reg] &= ~val;
+        if (val & SONIC_ISR_RBE) {
+            dp8393x_do_read_rra(s);
+        }
+        dp8393x_update_irq(s);
+        break;
+    /* The guest is required to store aligned pointers here */
+    case SONIC_RSA:
+    case SONIC_REA:
+    case SONIC_RRP:
+    case SONIC_RWP:
+        if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+            s->regs[reg] = val & 0xfffc;
+        } else {
+            s->regs[reg] = val & 0xfffe;
+        }
+        break;
+    /* Invert written value for some registers */
+    case SONIC_CRCT:
+    case SONIC_FAET:
+    case SONIC_MPT:
+        s->regs[reg] = val ^ 0xffff;
+        break;
+    /* All other registers have no special contrainst */
+    default:
+        s->regs[reg] = val;
     }
 
     if (reg == SONIC_WT0 || reg == SONIC_WT1) {
@@ -747,17 +758,18 @@ static int dp8393x_receive_filter(dp8393xState *s, const uint8_t * buf,
     }
 
     /* Check broadcast */
-    if ((s->regs[SONIC_RCR] & SONIC_RCR_BRD) && !memcmp(buf, bcast, sizeof(bcast))) {
+    if ((s->regs[SONIC_RCR] & SONIC_RCR_BRD) &&
+         !memcmp(buf, bcast, sizeof(bcast))) {
         return SONIC_RCR_BC;
     }
 
     /* Check CAM */
     for (i = 0; i < 16; i++) {
         if (s->regs[SONIC_CE] & (1 << i)) {
-             /* Entry enabled */
-             if (!memcmp(buf, s->cam[i], sizeof(s->cam[i]))) {
-                 return 0;
-             }
+            /* Entry enabled */
+            if (!memcmp(buf, s->cam[i], sizeof(s->cam[i]))) {
+                return 0;
+            }
         }
     }
 
@@ -938,7 +950,8 @@ static void dp8393x_reset(DeviceState *dev)
     s->regs[SONIC_SR] = 0x0004; /* only revision recognized by Linux/mips */
     s->regs[SONIC_CR] = SONIC_CR_RST | SONIC_CR_STP | SONIC_CR_RXDIS;
     s->regs[SONIC_DCR] &= ~(SONIC_DCR_EXBUS | SONIC_DCR_LBR);
-    s->regs[SONIC_RCR] &= ~(SONIC_RCR_LB0 | SONIC_RCR_LB1 | SONIC_RCR_BRD | SONIC_RCR_RNT);
+    s->regs[SONIC_RCR] &= ~(SONIC_RCR_LB0 | SONIC_RCR_LB1 | SONIC_RCR_BRD |
+                            SONIC_RCR_RNT);
     s->regs[SONIC_TCR] |= SONIC_TCR_NCRS | SONIC_TCR_PTX;
     s->regs[SONIC_TCR] &= ~SONIC_TCR_BCM;
     s->regs[SONIC_IMR] = 0;
-- 
2.20.1


