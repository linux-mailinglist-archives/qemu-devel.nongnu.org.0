Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD32F95AB
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 22:57:53 +0100 (CET)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G3U-000202-8t
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 16:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzv-0005f6-Ru
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:11 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzs-0005Ux-QZ
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920448; x=1642456448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NQebl6mgctfISjanfViNAPYey6gAcg35l858xX2pIXI=;
 b=FDDCy+cEVPLjaTPcoHymduUTkzkSZSCS25COrfAFVBOXIFtJwILAWa6t
 dJNU3NzWEANTfOz2CQmUHnYJzJfhHVsvY1LMRtH6r2pAB4HB3vAtn46D8
 AGQ7lH5+DVwU/LVi+rP502vdYewRjqotLYyfVKDEFVrpabvNaNCpL48bG
 ZCXE8WahWX5kmobFHtc2V2ch9d1zPoxMADciPGcl5lVxSbm7qafIXMqst
 aABWLi24UUYHaiW/K61INoKX6N1/LKMO4n/vIfLnMvs4UgufAqgYNa1oW
 75kpvt+CMxwRiAziVLZZ+9KjSgjehJo6anm/9A0B1n5dyxxueXHuvx3Wo g==;
IronPort-SDR: /H4/AoIwJIvMyIAx6PC96O9z/LBrDghtH5QRBCsEjwK50WtyMWMD2ZsWHu3qjMJiSTu2eQ/AuV
 0DddFbrqFkTrH0dfW66YAMkGw6ksWI1QzZ9zpj6bmOBxWraFbk8ggRbe0rFxk8F1NBhrU9vTKc
 jph5tN6/WoIZUi6HWV3fwgN+I1ZDVW7C58SSI/ntBFpbzkmksh1gMpCd4bV3pAdk1QVE2QG+Su
 3b8n7NuTVu3xLKI3KNSGIas8JZ7ai8PZjYZl0E+MwMZ1M2bB1i5Q8VdWFBwfurCn9bSVzDDL5W
 GlQ=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645960"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:05 +0800
IronPort-SDR: WEkzHN4IfSEtqAhOo6eO67JelEIHTC7XF1QCjKZTL0v7rwqAV78MUyMjKWb+PwBcZ8X0groGln
 30ft8LveTeVCIx852+wN67ioRu5W/rJGWHEjTaSZNZZPKe5hsHxUbX5I6BILMbogBF5sn4iOKM
 XZtr9HvV67HwPvnoG+IOMWAt1KXgge0KaAY3+fBB93U7MbkH/NZ2kJN5ogJWaswjUE6+fqUQg0
 Yt8EmYW8ew7oxNF8zT6iIu6C6scNLFSdfSAqtYCeAKOvfk8IbIv+yRcyynpWU1ogn7Nb9oxldQ
 0sLvHpXSf5rozi9woJkPMxEX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:44 -0800
IronPort-SDR: jqX/lXnjQYQM3+QiMpTsJY/0JmrtDXB0soteEbsT7A/40UWz6FbesDa3+L2h0+aAO0km59BiDs
 VkX+qRUudHarrpsC9Fmi+wQ+6/zuuXEI33lmiZIKfxqE4x8DbiVAEvK09dx05MBts751f9f2Jm
 VcES9wUuHsV/+2vKv4Nzn3w3OfyOjR3tM9J1KOA4lhlDk3IEtWEmbWATgpa87Pm0YFhGHerwgT
 dKuLlo5FGaKbOxuK2yIko8GHRCi0neWTIP2V9MsWSOoHY530iJ82J5Lc3ev6g/imb5MrLMOPC2
 KsE=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:05 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/12] hw/block: m25p80: Implement AAI-WP command support for
 SST flashes
Date: Sun, 17 Jan 2021 13:53:53 -0800
Message-Id: <20210117215403.2277103-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Auto Address Increment (AAI) Word-Program is a special command of
SST flashes. AAI-WP allows multiple bytes of data to be programmed
without re-issuing the next sequential address location.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-id: 1608688825-81519-2-git-send-email-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/block/m25p80.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 63278cbda5..b744a58d1c 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -360,6 +360,7 @@ typedef enum {
     QPP_4 = 0x34,
     RDID_90 = 0x90,
     RDID_AB = 0xab,
+    AAI_WP = 0xad,
 
     ERASE_4K = 0x20,
     ERASE4_4K = 0x21,
@@ -456,6 +457,7 @@ struct Flash {
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
+    bool aai_enable;
     uint8_t ear;
 
     int64_t dirty_page;
@@ -671,6 +673,11 @@ static void complete_collecting_data(Flash *s)
     case PP4_4:
         s->state = STATE_PAGE_PROGRAM;
         break;
+    case AAI_WP:
+        /* AAI programming starts from the even address */
+        s->cur_addr &= ~BIT(0);
+        s->state = STATE_PAGE_PROGRAM;
+        break;
     case READ:
     case READ4:
     case FAST_READ:
@@ -769,6 +776,7 @@ static void reset_memory(Flash *s)
     s->write_enable = false;
     s->reset_enable = false;
     s->quad_enable = false;
+    s->aai_enable = false;
 
     switch (get_man(s)) {
     case MAN_NUMONYX:
@@ -974,6 +982,11 @@ static void decode_qio_read_cmd(Flash *s)
     s->state = STATE_COLLECTING_DATA;
 }
 
+static bool is_valid_aai_cmd(uint32_t cmd)
+{
+    return cmd == AAI_WP || cmd == WRDI || cmd == RDSR;
+}
+
 static void decode_new_cmd(Flash *s, uint32_t value)
 {
     int i;
@@ -985,6 +998,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->reset_enable = false;
     }
 
+    if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "M25P80: Invalid cmd within AAI programming sequence");
+    }
+
     switch (value) {
 
     case ERASE_4K:
@@ -1104,6 +1122,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case WRDI:
         s->write_enable = false;
+        if (get_man(s) == MAN_SST) {
+            s->aai_enable = false;
+        }
         break;
     case WREN:
         s->write_enable = true;
@@ -1114,6 +1135,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         if (get_man(s) == MAN_MACRONIX) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
+        if (get_man(s) == MAN_SST) {
+            s->data[0] |= (!!s->aai_enable) << 6;
+        }
+
         s->pos = 0;
         s->len = 1;
         s->data_read_loop = true;
@@ -1261,6 +1286,24 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case RSTQIO:
         s->quad_enable = false;
         break;
+    case AAI_WP:
+        if (get_man(s) == MAN_SST) {
+            if (s->write_enable) {
+                if (s->aai_enable) {
+                    s->state = STATE_PAGE_PROGRAM;
+                } else {
+                    s->aai_enable = true;
+                    s->needed_bytes = get_addr_length(s);
+                    s->state = STATE_COLLECTING_DATA;
+                }
+            } else {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "M25P80: AAI_WP with write protect\n");
+            }
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
+        }
+        break;
     default:
         s->pos = 0;
         s->len = 1;
@@ -1306,6 +1349,17 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
         trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
         flash_write8(s, s->cur_addr, (uint8_t)tx);
         s->cur_addr = (s->cur_addr + 1) & (s->size - 1);
+
+        if (get_man(s) == MAN_SST && s->aai_enable && s->cur_addr == 0) {
+            /*
+             * There is no wrap mode during AAI programming once the highest
+             * unprotected memory address is reached. The Write-Enable-Latch
+             * bit is automatically reset, and AAI programming mode aborts.
+             */
+            s->write_enable = false;
+            s->aai_enable = false;
+        }
+
         break;
 
     case STATE_READ:
@@ -1451,6 +1505,24 @@ static const VMStateDescription vmstate_m25p80_data_read_loop = {
     }
 };
 
+static bool m25p80_aai_enable_needed(void *opaque)
+{
+    Flash *s = (Flash *)opaque;
+
+    return s->aai_enable;
+}
+
+static const VMStateDescription vmstate_m25p80_aai_enable = {
+    .name = "m25p80/aai_enable",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m25p80_aai_enable_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(aai_enable, Flash),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m25p80 = {
     .name = "m25p80",
     .version_id = 0,
@@ -1481,6 +1553,7 @@ static const VMStateDescription vmstate_m25p80 = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_m25p80_data_read_loop,
+        &vmstate_m25p80_aai_enable,
         NULL
     }
 };
-- 
2.29.2


