Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D7E5E1B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 18:55:00 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOPL8-00040E-M0
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 12:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iOPD2-0003LM-N9
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 12:46:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iOPCz-0001E5-PN
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 12:46:36 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54801)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iOPCv-00019M-2f; Sat, 26 Oct 2019 12:46:29 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MBltM-1iGfRX2Ivc-00C7xi; Sat, 26 Oct 2019 18:45:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 03/11] esp: add pseudo-DMA as used by Macintosh
Date: Sat, 26 Oct 2019 18:45:38 +0200
Message-Id: <20191026164546.30020-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191026164546.30020-1-laurent@vivier.eu>
References: <20191026164546.30020-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:un7dwh8lY+wTFT2qZTagINt3GKFGF0NN7767wjC6GaoiALmqx4E
 f9c+9rSIZ6kH+YWdsFsWi9szr4IWpuGb9LIqepG2KzXrXnSkRQiGmTZr4WQPJzRdy5f/8nu
 vSsliZVj2jS6UayWaQ10xAnH8VA88v1+H0s9IsfbmYNPf6neDRfxC+S9DOsyjwyluMD4wI+
 DDrwnRdGMvoOipMSpwNRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IRNgl60KmVI=:PzadbbT4Dz8jgsPcuhwjG6
 s749HEW6CZXyA6MPX+LJNmJQI1g31p6uHggZLSLjTjn1ZHjrqnjm3g8VlIEggq3gW/zzIRFHr
 vyc+vgolWxSCzIijhIdB+SLzXVaOfiQ5RfTLhxWr+XUHpgLuAJaLB5UnoaKVxynpDs9JBKrB7
 AynrF4urgf+VgOjjBVOwLlL/wUWjkGyOmZkLOMD2ThH2WxiTC6j2CAxQKCbZjh8PrMjCvwu/V
 1N2bvi7eUDO1IOoYUaHa2qR1UaFJEV8GNANn/P0WlL38LqM2yLPCaZ0W1xnQymmJmEHgyYP5U
 OL/YwObv9Piuja7pJHgNyht+vJjSZqoWNTJWqnx9noxgHoNS9mVvFSnpp+JhLGOsqXsA7mEUm
 EPJnbeb9jrnH/IWcnURulb70uaD6m8o+r9ylpFK8Y2OrOyuAhvp+meWtDZ8ukFmR4hAjkAKnf
 D8q8vzjFp2dSPYFR8cwTL1jVAaW5tL+amzenB4lw3cxhcF+42B7PVqonn2K7+ZDnch9ZdLRJE
 d9XnaNqTfFaM+ekWCDMpHYE2STlZmOcM1dMgTcYTxli8frxczVS7KJMYbdmB54QlJ8xod2w+B
 bXon9l8dgEH5T5Zb/+PausG2Z9LdmsPwL8I5OiyuDmI7e3saZbScwNX2y3kWm+xmPg4yTJ4Up
 LdCMd866aUpnHAX/9OhyHiTos5vrK83gjCYgAq2Fj3P0FADmayHCDG3oujKpbwsx/S93h/jQO
 5ro3UIx7EHvlJlwCqfXY3BKAG4OFWkguqH37HJjOm8rm3PFRvzUKkX878T/hFwVlGzhpgO42J
 GPxNPa3Idi0g9mFkaKflTZ0Ddhht6yWY20CESqzDgSu1LPIPLtM+3FRRJJenqwnlQkdFdb8Is
 dEqkna11jnrkH+VrW4Wg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no DMA in Quadra 800, so the CPU reads/writes the data from the
PDMA register (offset 0x100, ESP_PDMA in hw/m68k/q800.c) and copies them
to/from the memory.

There is a nice assembly loop in the kernel to do that, see
linux/drivers/scsi/mac_esp.c:MAC_ESP_PDMA_LOOP().

The start of the transfer is triggered by the DREQ interrupt (see linux
mac_esp_send_pdma_cmd()), the CPU polls on the IRQ flag to start the
transfer after a SCSI command has been sent (in Quadra 800 it goes
through the VIA2, the via2-irq line and the vIFR register)

The Macintosh hardware includes hardware handshaking to prevent the CPU
from reading invalid data or writing data faster than the peripheral
device can accept it.

This is the "blind mode", and from the doc:
"Approximate maximum SCSI transfer rates within a blocks are 1.4 MB per
second for blind transfers in the Macintosh II"

Some references can be found in:
  Apple Macintosh Family Hardware Reference, ISBN 0-201-19255-1
  Guide to the Macintosh Family Hardware, ISBN-0-201-52405-8

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/scsi/esp.h |  15 +++
 hw/scsi/esp.c         | 278 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 284 insertions(+), 9 deletions(-)

diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index adab63d1c9..6ba47dac41 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -14,10 +14,18 @@ typedef void (*ESPDMAMemoryReadWriteFunc)(void *opaque, uint8_t *buf, int len);
 
 typedef struct ESPState ESPState;
 
+enum pdma_origin_id {
+    PDMA,
+    TI,
+    CMD,
+    ASYNC,
+};
+
 struct ESPState {
     uint8_t rregs[ESP_REGS];
     uint8_t wregs[ESP_REGS];
     qemu_irq irq;
+    qemu_irq irq_data;
     uint8_t chip_id;
     bool tchi_written;
     int32_t ti_size;
@@ -48,6 +56,12 @@ struct ESPState {
     ESPDMAMemoryReadWriteFunc dma_memory_write;
     void *dma_opaque;
     void (*dma_cb)(ESPState *s);
+    uint8_t pdma_buf[32];
+    int pdma_origin;
+    uint32_t pdma_len;
+    uint32_t pdma_start;
+    uint32_t pdma_cur;
+    void (*pdma_cb)(ESPState *s);
 };
 
 #define TYPE_ESP "esp"
@@ -59,6 +73,7 @@ typedef struct {
     /*< public >*/
 
     MemoryRegion iomem;
+    MemoryRegion pdma;
     uint32_t it_shift;
     ESPState esp;
 } SysBusESPState;
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 0230ede21d..f8fc30cccb 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -38,6 +38,8 @@
  * http://www.ibiblio.org/pub/historic-linux/early-ports/Sparc/NCR/NCR89C100.txt
  * and
  * http://www.ibiblio.org/pub/historic-linux/early-ports/Sparc/NCR/NCR53C9X.txt
+ *
+ * On Macintosh Quadra it is a NCR53C96.
  */
 
 static void esp_raise_irq(ESPState *s)
@@ -58,6 +60,16 @@ static void esp_lower_irq(ESPState *s)
     }
 }
 
+static void esp_raise_drq(ESPState *s)
+{
+    qemu_irq_raise(s->irq_data);
+}
+
+static void esp_lower_drq(ESPState *s)
+{
+    qemu_irq_lower(s->irq_data);
+}
+
 void esp_dma_enable(ESPState *s, int irq, int level)
 {
     if (level) {
@@ -84,6 +96,30 @@ void esp_request_cancelled(SCSIRequest *req)
     }
 }
 
+static void set_pdma(ESPState *s, enum pdma_origin_id origin,
+                     uint32_t index, uint32_t len)
+{
+    s->pdma_origin = origin;
+    s->pdma_start = index;
+    s->pdma_cur = index;
+    s->pdma_len = len;
+}
+
+static uint8_t *get_pdma_buf(ESPState *s)
+{
+    switch (s->pdma_origin) {
+    case PDMA:
+        return s->pdma_buf;
+    case TI:
+        return s->ti_buf;
+    case CMD:
+        return s->cmdbuf;
+    case ASYNC:
+        return s->async_buf;
+    }
+    return NULL;
+}
+
 static int get_cmd_cb(ESPState *s)
 {
     int target;
@@ -125,7 +161,14 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
         if (dmalen > buflen) {
             return 0;
         }
-        s->dma_memory_read(s->dma_opaque, buf, dmalen);
+        if (s->dma_memory_read) {
+            s->dma_memory_read(s->dma_opaque, buf, dmalen);
+        } else {
+            memcpy(s->pdma_buf, buf, dmalen);
+            set_pdma(s, PDMA, 0, dmalen);
+            esp_raise_drq(s);
+            return 0;
+        }
     } else {
         dmalen = s->ti_size;
         if (dmalen > TI_BUFSZ) {
@@ -177,6 +220,16 @@ static void do_cmd(ESPState *s, uint8_t *buf)
     do_busid_cmd(s, &buf[1], busid);
 }
 
+static void satn_pdma_cb(ESPState *s)
+{
+    if (get_cmd_cb(s) < 0) {
+        return;
+    }
+    if (s->pdma_cur != s->pdma_start) {
+        do_cmd(s, get_pdma_buf(s) + s->pdma_start);
+    }
+}
+
 static void handle_satn(ESPState *s)
 {
     uint8_t buf[32];
@@ -186,11 +239,22 @@ static void handle_satn(ESPState *s)
         s->dma_cb = handle_satn;
         return;
     }
+    s->pdma_cb = satn_pdma_cb;
     len = get_cmd(s, buf, sizeof(buf));
     if (len)
         do_cmd(s, buf);
 }
 
+static void s_without_satn_pdma_cb(ESPState *s)
+{
+    if (get_cmd_cb(s) < 0) {
+        return;
+    }
+    if (s->pdma_cur != s->pdma_start) {
+        do_busid_cmd(s, get_pdma_buf(s) + s->pdma_start, 0);
+    }
+}
+
 static void handle_s_without_atn(ESPState *s)
 {
     uint8_t buf[32];
@@ -200,18 +264,36 @@ static void handle_s_without_atn(ESPState *s)
         s->dma_cb = handle_s_without_atn;
         return;
     }
+    s->pdma_cb = s_without_satn_pdma_cb;
     len = get_cmd(s, buf, sizeof(buf));
     if (len) {
         do_busid_cmd(s, buf, 0);
     }
 }
 
+static void satn_stop_pdma_cb(ESPState *s)
+{
+    if (get_cmd_cb(s) < 0) {
+        return;
+    }
+    s->cmdlen = s->pdma_cur - s->pdma_start;
+    if (s->cmdlen) {
+        trace_esp_handle_satn_stop(s->cmdlen);
+        s->do_cmd = 1;
+        s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
+        s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
+        s->rregs[ESP_RSEQ] = SEQ_CD;
+        esp_raise_irq(s);
+    }
+}
+
 static void handle_satn_stop(ESPState *s)
 {
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_satn_stop;
         return;
     }
+    s->pdma_cb = satn_stop_pdma_cb;;
     s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
     if (s->cmdlen) {
         trace_esp_handle_satn_stop(s->cmdlen);
@@ -223,16 +305,31 @@ static void handle_satn_stop(ESPState *s)
     }
 }
 
+static void write_response_pdma_cb(ESPState *s)
+{
+    s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
+    s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
+    s->rregs[ESP_RSEQ] = SEQ_CD;
+    esp_raise_irq(s);
+}
+
 static void write_response(ESPState *s)
 {
     trace_esp_write_response(s->status);
     s->ti_buf[0] = s->status;
     s->ti_buf[1] = 0;
     if (s->dma) {
-        s->dma_memory_write(s->dma_opaque, s->ti_buf, 2);
-        s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
-        s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
-        s->rregs[ESP_RSEQ] = SEQ_CD;
+        if (s->dma_memory_write) {
+            s->dma_memory_write(s->dma_opaque, s->ti_buf, 2);
+            s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
+            s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
+            s->rregs[ESP_RSEQ] = SEQ_CD;
+        } else {
+            set_pdma(s, TI, 0, 2);
+            s->pdma_cb = write_response_pdma_cb;
+            esp_raise_drq(s);
+            return;
+        }
     } else {
         s->ti_size = 2;
         s->ti_rptr = 0;
@@ -254,6 +351,41 @@ static void esp_dma_done(ESPState *s)
     esp_raise_irq(s);
 }
 
+static void do_dma_pdma_cb(ESPState *s)
+{
+    int to_device = (s->ti_size < 0);
+    int len = s->pdma_cur - s->pdma_start;
+    if (s->do_cmd) {
+        s->ti_size = 0;
+        s->cmdlen = 0;
+        s->do_cmd = 0;
+        do_cmd(s, s->cmdbuf);
+        return;
+    }
+    s->dma_left -= len;
+    s->async_buf += len;
+    s->async_len -= len;
+    if (to_device) {
+        s->ti_size += len;
+    } else {
+        s->ti_size -= len;
+    }
+    if (s->async_len == 0) {
+        scsi_req_continue(s->current_req);
+        /*
+         * If there is still data to be read from the device then
+         * complete the DMA operation immediately.  Otherwise defer
+         * until the scsi layer has completed.
+         */
+        if (to_device || s->dma_left != 0 || s->ti_size == 0) {
+            return;
+        }
+    }
+
+    /* Partially filled a scsi buffer. Complete immediately.  */
+    esp_dma_done(s);
+}
+
 static void esp_do_dma(ESPState *s)
 {
     uint32_t len;
@@ -268,7 +400,14 @@ static void esp_do_dma(ESPState *s)
         trace_esp_do_dma(s->cmdlen, len);
         assert (s->cmdlen <= sizeof(s->cmdbuf) &&
                 len <= sizeof(s->cmdbuf) - s->cmdlen);
-        s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
+        if (s->dma_memory_read) {
+            s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
+        } else {
+            set_pdma(s, CMD, s->cmdlen, len);
+            s->pdma_cb = do_dma_pdma_cb;
+            esp_raise_drq(s);
+            return;
+        }
         trace_esp_handle_ti_cmd(s->cmdlen);
         s->ti_size = 0;
         s->cmdlen = 0;
@@ -285,9 +424,23 @@ static void esp_do_dma(ESPState *s)
     }
     to_device = (s->ti_size < 0);
     if (to_device) {
-        s->dma_memory_read(s->dma_opaque, s->async_buf, len);
+        if (s->dma_memory_read) {
+            s->dma_memory_read(s->dma_opaque, s->async_buf, len);
+        } else {
+            set_pdma(s, ASYNC, 0, len);
+            s->pdma_cb = do_dma_pdma_cb;
+            esp_raise_drq(s);
+            return;
+        }
     } else {
-        s->dma_memory_write(s->dma_opaque, s->async_buf, len);
+        if (s->dma_memory_write) {
+            s->dma_memory_write(s->dma_opaque, s->async_buf, len);
+        } else {
+            set_pdma(s, ASYNC, 0, len);
+            s->pdma_cb = do_dma_pdma_cb;
+            esp_raise_drq(s);
+            return;
+        }
     }
     s->dma_left -= len;
     s->async_buf += len;
@@ -421,6 +574,7 @@ void esp_hard_reset(ESPState *s)
 static void esp_soft_reset(ESPState *s)
 {
     qemu_irq_lower(s->irq);
+    qemu_irq_lower(s->irq_data);
     esp_hard_reset(s);
 }
 
@@ -610,6 +764,28 @@ static bool esp_mem_accepts(void *opaque, hwaddr addr,
     return (size == 1) || (is_write && size == 4);
 }
 
+static bool esp_pdma_needed(void *opaque)
+{
+    ESPState *s = opaque;
+    return s->dma_memory_read == NULL && s->dma_memory_write == NULL &&
+           s->dma_enabled;
+}
+
+static const VMStateDescription vmstate_esp_pdma = {
+    .name = "esp/pdma",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = esp_pdma_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BUFFER(pdma_buf, ESPState),
+        VMSTATE_INT32(pdma_origin, ESPState),
+        VMSTATE_UINT32(pdma_len, ESPState),
+        VMSTATE_UINT32(pdma_start, ESPState),
+        VMSTATE_UINT32(pdma_cur, ESPState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_esp = {
     .name ="esp",
     .version_id = 4,
@@ -631,6 +807,10 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT32(do_cmd, ESPState),
         VMSTATE_UINT32(dma_left, ESPState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_esp_pdma,
+        NULL
     }
 };
 
@@ -661,6 +841,82 @@ static const MemoryRegionOps sysbus_esp_mem_ops = {
     .valid.accepts = esp_mem_accepts,
 };
 
+static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
+                                  uint64_t val, unsigned int size)
+{
+    SysBusESPState *sysbus = opaque;
+    ESPState *s = &sysbus->esp;
+    uint32_t dmalen;
+    uint8_t *buf = get_pdma_buf(s);
+
+    dmalen = s->rregs[ESP_TCLO];
+    dmalen |= s->rregs[ESP_TCMID] << 8;
+    dmalen |= s->rregs[ESP_TCHI] << 16;
+    if (dmalen == 0 || s->pdma_len == 0) {
+        return;
+    }
+    switch (size) {
+    case 1:
+        buf[s->pdma_cur++] = val;
+        s->pdma_len--;
+        dmalen--;
+        break;
+    case 2:
+        buf[s->pdma_cur++] = val >> 8;
+        buf[s->pdma_cur++] = val;
+        s->pdma_len -= 2;
+        dmalen -= 2;
+        break;
+    }
+    s->rregs[ESP_TCLO] = dmalen & 0xff;
+    s->rregs[ESP_TCMID] = dmalen >> 8;
+    s->rregs[ESP_TCHI] = dmalen >> 16;
+    if (s->pdma_len == 0 && s->pdma_cb) {
+        esp_lower_drq(s);
+        s->pdma_cb(s);
+        s->pdma_cb = NULL;
+    }
+}
+
+static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    SysBusESPState *sysbus = opaque;
+    ESPState *s = &sysbus->esp;
+    uint8_t *buf = get_pdma_buf(s);
+    uint64_t val = 0;
+
+    if (s->pdma_len == 0) {
+        return 0;
+    }
+    switch (size) {
+    case 1:
+        val = buf[s->pdma_cur++];
+        s->pdma_len--;
+        break;
+    case 2:
+        val = buf[s->pdma_cur++];
+        val = (val << 8) | buf[s->pdma_cur++];
+        s->pdma_len -= 2;
+        break;
+    }
+
+    if (s->pdma_len == 0 && s->pdma_cb) {
+        esp_lower_drq(s);
+        s->pdma_cb(s);
+        s->pdma_cb = NULL;
+    }
+    return val;
+}
+
+static const MemoryRegionOps sysbus_esp_pdma_ops = {
+    .read = sysbus_esp_pdma_read,
+    .write = sysbus_esp_pdma_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 2,
+};
+
 static const struct SCSIBusInfo esp_scsi_info = {
     .tcq = false,
     .max_target = ESP_MAX_DEVS,
@@ -693,12 +949,16 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
     ESPState *s = &sysbus->esp;
 
     sysbus_init_irq(sbd, &s->irq);
+    sysbus_init_irq(sbd, &s->irq_data);
     assert(sysbus->it_shift != -1);
 
     s->chip_id = TCHI_FAS100A;
     memory_region_init_io(&sysbus->iomem, OBJECT(sysbus), &sysbus_esp_mem_ops,
-                          sysbus, "esp", ESP_REGS << sysbus->it_shift);
+                          sysbus, "esp-regs", ESP_REGS << sysbus->it_shift);
     sysbus_init_mmio(sbd, &sysbus->iomem);
+    memory_region_init_io(&sysbus->pdma, OBJECT(sysbus), &sysbus_esp_pdma_ops,
+                          sysbus, "esp-pdma", 2);
+    sysbus_init_mmio(sbd, &sysbus->pdma);
 
     qdev_init_gpio_in(dev, sysbus_esp_gpio_demux, 2);
 
-- 
2.21.0


