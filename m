Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C31E32DCCB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:13:13 +0100 (CET)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwDX-0005r7-SH
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwBr-0004Yz-NI
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:11:27 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39902
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwBl-0005Oq-MI
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:11:25 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwBf-0008MJ-0e; Thu, 04 Mar 2021 22:11:18 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Thu,  4 Mar 2021 22:10:22 +0000
Message-Id: <20210304221103.6369-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
References: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 01/42] esp: checkpatch fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/esp.c | 52 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 93d9c9c7b9..6bb4025d2a 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -241,8 +241,9 @@ static void handle_satn(ESPState *s)
     }
     s->pdma_cb = satn_pdma_cb;
     len = get_cmd(s, buf, sizeof(buf));
-    if (len)
+    if (len) {
         do_cmd(s, buf);
+    }
 }
 
 static void s_without_satn_pdma_cb(ESPState *s)
@@ -398,8 +399,8 @@ static void esp_do_dma(ESPState *s)
          * handle_ti_cmd() with do_cmd != NULL (see the assert())
          */
         trace_esp_do_dma(s->cmdlen, len);
-        assert (s->cmdlen <= sizeof(s->cmdbuf) &&
-                len <= sizeof(s->cmdbuf) - s->cmdlen);
+        assert(s->cmdlen <= sizeof(s->cmdbuf) &&
+               len <= sizeof(s->cmdbuf) - s->cmdlen);
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
         } else {
@@ -445,15 +446,18 @@ static void esp_do_dma(ESPState *s)
     s->dma_left -= len;
     s->async_buf += len;
     s->async_len -= len;
-    if (to_device)
+    if (to_device) {
         s->ti_size += len;
-    else
+    } else {
         s->ti_size -= len;
+    }
     if (s->async_len == 0) {
         scsi_req_continue(s->current_req);
-        /* If there is still data to be read from the device then
-           complete the DMA operation immediately.  Otherwise defer
-           until the scsi layer has completed.  */
+        /*
+         * If there is still data to be read from the device then
+         * complete the DMA operation immediately.  Otherwise defer
+         * until the scsi layer has completed.
+         */
         if (to_device || s->dma_left != 0 || s->ti_size == 0) {
             return;
         }
@@ -490,7 +494,8 @@ void esp_command_complete(SCSIRequest *req, size_t resid)
     ESPState *s = req->hba_private;
 
     if (s->rregs[ESP_RSTAT] & STAT_INT) {
-        /* Defer handling command complete until the previous
+        /*
+         * Defer handling command complete until the previous
          * interrupt has been handled.
          */
         trace_esp_command_complete_deferred();
@@ -512,8 +517,10 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
     if (s->dma_left) {
         esp_do_dma(s);
     } else if (s->dma_counter != 0 && s->ti_size <= 0) {
-        /* If this was the last part of a DMA transfer then the
-           completion interrupt is deferred to here.  */
+        /*
+         * If this was the last part of a DMA transfer then the
+         * completion interrupt is deferred to here.
+         */
         esp_dma_done(s);
     }
 }
@@ -530,17 +537,18 @@ static void handle_ti(ESPState *s)
     dmalen = s->rregs[ESP_TCLO];
     dmalen |= s->rregs[ESP_TCMID] << 8;
     dmalen |= s->rregs[ESP_TCHI] << 16;
-    if (dmalen==0) {
-      dmalen=0x10000;
+    if (dmalen == 0) {
+        dmalen = 0x10000;
     }
     s->dma_counter = dmalen;
 
-    if (s->do_cmd)
+    if (s->do_cmd) {
         minlen = (dmalen < ESP_CMDBUF_SZ) ? dmalen : ESP_CMDBUF_SZ;
-    else if (s->ti_size < 0)
+    } else if (s->ti_size < 0) {
         minlen = (dmalen < -s->ti_size) ? dmalen : -s->ti_size;
-    else
+    } else {
         minlen = (dmalen < s->ti_size) ? dmalen : s->ti_size;
+    }
     trace_esp_handle_ti(minlen);
     if (s->dma) {
         s->dma_left = minlen;
@@ -605,8 +613,10 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
         }
         break;
     case ESP_RINTR:
-        /* Clear sequence step, interrupt register and all status bits
-           except TC */
+        /*
+         * Clear sequence step, interrupt register and all status bits
+         * except TC
+         */
         old_val = s->rregs[ESP_RINTR];
         s->rregs[ESP_RINTR] = 0;
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
@@ -664,13 +674,13 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         } else {
             s->dma = 0;
         }
-        switch(val & CMD_CMD) {
+        switch (val & CMD_CMD) {
         case CMD_NOP:
             trace_esp_mem_writeb_cmd_nop(val);
             break;
         case CMD_FLUSH:
             trace_esp_mem_writeb_cmd_flush(val);
-            //s->ti_size = 0;
+            /*s->ti_size = 0;*/
             s->rregs[ESP_RINTR] = INTR_FC;
             s->rregs[ESP_RSEQ] = 0;
             s->rregs[ESP_RFLAGS] = 0;
@@ -786,7 +796,7 @@ static const VMStateDescription vmstate_esp_pdma = {
 };
 
 const VMStateDescription vmstate_esp = {
-    .name ="esp",
+    .name = "esp",
     .version_id = 4,
     .minimum_version_id = 3,
     .fields = (VMStateField[]) {
-- 
2.20.1


