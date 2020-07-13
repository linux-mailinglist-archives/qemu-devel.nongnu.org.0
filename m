Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8062221CC8C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 02:36:43 +0200 (CEST)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jumSY-0006XN-JL
	for lists+qemu-devel@lfdr.de; Sun, 12 Jul 2020 20:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1jumNK-0006LM-LK
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 20:31:18 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:59069 helo=mxct.zte.com.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1jumNH-0004gN-B1
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 20:31:18 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 14846B8AB32330C5BF54
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 08:31:12 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notes_smtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id 06D0UqCI002382
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 08:30:52 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020071308305469-4262429 ;
 Mon, 13 Jul 2020 08:30:54 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: Remove superfluous breaks
Date: Mon, 13 Jul 2020 08:34:04 +0800
Message-Id: <1594600444-23272-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-07-13 08:30:54,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-07-13 08:30:53, Serialize complete at 2020-07-13 08:30:53
X-MAIL: mse-fl1.zte.com.cn 06D0UqCI002382
Received-SPF: pass client-ip=202.103.147.172;
 envelope-from=wang.yi59@zte.com.cn; helo=mxct.zte.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/12 20:30:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: wang.yi59@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>,
 wang.liang82@zte.com.cn, xue.zhihong@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liao Pingfang <liao.pingfang@zte.com.cn>

Remove superfluous breaks, as there is a "return" before them.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
---
 hw/block/pflash_cfi01.c     |  1 -
 hw/display/cirrus_vga.c     |  1 -
 hw/display/qxl-logger.c     |  2 --
 hw/gpio/max7310.c           |  3 ---
 hw/i386/intel_iommu.c       |  1 -
 hw/input/pxa2xx_keypad.c    | 10 ----------
 hw/intc/armv7m_nvic.c       |  1 -
 hw/net/lan9118.c            |  2 --
 hw/usb/ccid-card-emulated.c |  1 -
 9 files changed, 22 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 8ab1d66..f0fcd63 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -213,7 +213,6 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, hwaddr offset)
     default:
         trace_pflash_device_info(offset);
         return 0;
-        break;
     }
     /* Replicate responses for each device in bank. */
     if (pfl->device_width < pfl->bank_width) {
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 212d6f5..02d9ed0 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -1637,7 +1637,6 @@ static int cirrus_vga_read_cr(CirrusVGAState * s, unsigned reg_index)
 	return s->vga.cr[s->vga.cr_index];
     case 0x26:			// Attribute Controller Index Readback (R)
 	return s->vga.ar_index & 0x3f;
-	break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: inport cr_index 0x%02x\n", reg_index);
diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
index 2ec6d8f..c15175b 100644
--- a/hw/display/qxl-logger.c
+++ b/hw/display/qxl-logger.c
@@ -161,7 +161,6 @@ static int qxl_log_cmd_draw(PCIQXLDevice *qxl, QXLDrawable *draw, int group_id)
     switch (draw->type) {
     case QXL_DRAW_COPY:
         return qxl_log_cmd_draw_copy(qxl, &draw->u.copy, group_id);
-        break;
     }
     return 0;
 }
@@ -180,7 +179,6 @@ static int qxl_log_cmd_draw_compat(PCIQXLDevice *qxl, QXLCompatDrawable *draw,
     switch (draw->type) {
     case QXL_DRAW_COPY:
         return qxl_log_cmd_draw_copy(qxl, &draw->u.copy, group_id);
-        break;
     }
     return 0;
 }
diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index bebb403..4f78774 100644
--- a/hw/gpio/max7310.c
+++ b/hw/gpio/max7310.c
@@ -51,11 +51,9 @@ static uint8_t max7310_rx(I2CSlave *i2c)
     switch (s->command) {
     case 0x00:	/* Input port */
         return s->level ^ s->polarity;
-        break;
 
     case 0x01:	/* Output port */
         return s->level & ~s->direction;
-        break;
 
     case 0x02:	/* Polarity inversion */
         return s->polarity;
@@ -65,7 +63,6 @@ static uint8_t max7310_rx(I2CSlave *i2c)
 
     case 0x04:	/* Timeout */
         return s->status;
-        break;
 
     case 0xff:	/* Reserved */
         return 0xff;
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index c56398e..7b390ca 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3163,7 +3163,6 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
                               index, entry->irte.sid_vtype);
             /* Take this as verification failure. */
             return -VTD_FR_IR_SID_ERR;
-            break;
         }
     }
 
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 62aa6f6..7f2f739 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -192,10 +192,8 @@ static uint64_t pxa2xx_keypad_read(void *opaque, hwaddr offset,
             s->kpc &= ~(KPC_DI);
         qemu_irq_lower(s->irq);
         return tmp;
-        break;
     case KPDK:
         return s->kpdk;
-        break;
     case KPREC:
         tmp = s->kprec;
         if(tmp & KPREC_OF1)
@@ -207,31 +205,23 @@ static uint64_t pxa2xx_keypad_read(void *opaque, hwaddr offset,
         if(tmp & KPREC_UF0)
             s->kprec &= ~(KPREC_UF0);
         return tmp;
-        break;
     case KPMK:
         tmp = s->kpmk;
         if(tmp & KPMK_MKP)
             s->kpmk &= ~(KPMK_MKP);
         return tmp;
-        break;
     case KPAS:
         return s->kpas;
-        break;
     case KPASMKP0:
         return s->kpasmkp[0];
-        break;
     case KPASMKP1:
         return s->kpasmkp[1];
-        break;
     case KPASMKP2:
         return s->kpasmkp[2];
-        break;
     case KPASMKP3:
         return s->kpasmkp[3];
-        break;
     case KPKDI:
         return s->kpkdi;
-        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad read offset 0x%"HWADDR_PRIx"\n",
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 3c4b6e6..720ac97 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1275,7 +1275,6 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
     case 0xd90: /* MPU_TYPE */
         /* Unified MPU; if the MPU is not present this value is zero */
         return cpu->pmsav7_dregion << 8;
-        break;
     case 0xd94: /* MPU_CTRL */
         return cpu->env.v7m.mpu_ctrl[attrs.secure];
     case 0xd98: /* MPU_RNR */
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 8e2a432..e35f00f 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -931,10 +931,8 @@ static uint32_t do_mac_read(lan9118_state *s, int reg)
                | (s->conf.macaddr.a[2] << 16) | (s->conf.macaddr.a[3] << 24);
     case MAC_HASHH:
         return s->mac_hashh;
-        break;
     case MAC_HASHL:
         return s->mac_hashl;
-        break;
     case MAC_MII_ACC:
         return s->mac_mii_acc;
     case MAC_MII_DATA:
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 7d6105e..0f1afd6 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -350,7 +350,6 @@ static void *event_thread(void *arg)
         case VEVENT_LAST: /* quit */
             vevent_delete(event);
             return NULL;
-            break;
         default:
             break;
         }
-- 
2.9.5


