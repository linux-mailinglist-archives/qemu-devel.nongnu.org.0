Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342B658ADF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:21:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp4Q-0008I0-Nm; Thu, 29 Dec 2022 04:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp41-0008BR-LH
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:19:02 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp3x-0006vy-OZ
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:19:01 -0500
X-QQ-mid: bizesmtp73t1672305522t82f3zzo
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:41 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: Q4gfBD3K7t9qRpbykUcPA9dxgHPJlNzU/lXSRJZC+WCn2ZIfVrCPrlWpMaoAE
 6Iu6UyxTglgyWkIc+5i/CyFO1zeFtEBRyzD7Ju5uMlwtH4TBFvODA8XOpPiSrm//oBsPzhw
 Mkcvxvcp3G28rfT08N7EWurSSx4xkYJFUp1ACQWU5dwZ6edxut8hCA7j9mM2fM9QXpaPUFH
 I9LEDqa8QD1+7plzGUQVPImBEAv3zoJZoDU6MPzXzHNF4dxbt8Gxd95UUhl3sht0fAi4eya
 JmQqq+UbH2nuDZ/MOv1SoDhDlHdorvA/WpyqySBTLSDyx6+q37BN43Y4LisMzkGpXUxjYdH
 FzSTrI/qEIAWj7eKbR5Rgpa0V0DkgRjLyYibC5dYOFimUD5KnA=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 04/12] hw/char: riscv_htif: Use conventional 's' for
 HTIFState
Date: Thu, 29 Dec 2022 17:18:20 +0800
Message-Id: <20221229091828.1945072-5-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: <20221229091828.1945072-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU source codes tend to use 's' to represent the hardware state.
Let's use it for HTIFState.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/char/riscv_htif.c | 64 ++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index e7e319ca1d..f28976b110 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -85,7 +85,7 @@ static int htif_can_recv(void *opaque)
  */
 static void htif_recv(void *opaque, const uint8_t *buf, int size)
 {
-    HTIFState *htifstate = opaque;
+    HTIFState *s = opaque;
 
     if (size != 1) {
         return;
@@ -97,10 +97,10 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
      *        will drop characters
      */
 
-    uint64_t val_written = htifstate->pending_read;
+    uint64_t val_written = s->pending_read;
     uint64_t resp = 0x100 | *buf;
 
-    htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
+    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
 }
 
 /*
@@ -142,7 +142,7 @@ static int htif_be_change(void *opaque)
  * For RV32, the tohost register is zero-extended, so only device=0 and
  * command=0 (i.e. HTIF syscalls/exit codes) are supported.
  */
-static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
+static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
 {
     uint8_t device = val_written >> HTIF_DEV_SHIFT;
     uint8_t cmd = val_written >> HTIF_CMD_SHIFT;
@@ -174,11 +174,11 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
         /* HTIF Console */
         if (cmd == HTIF_CONSOLE_CMD_GETC) {
             /* this should be a queue, but not yet implemented as such */
-            htifstate->pending_read = val_written;
-            htifstate->env->mtohost = 0; /* clear to indicate we read */
+            s->pending_read = val_written;
+            s->env->mtohost = 0; /* clear to indicate we read */
             return;
         } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
-            qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
+            qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
             resp = 0x100 | (uint8_t)payload;
         } else {
             qemu_log("HTIF device %d: unknown command\n", device);
@@ -194,31 +194,31 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
      * With this code disabled, qemu works with bbl priv v1.9.1 and v1.10.
      * HTIF needs protocol documentation and a more complete state machine.
      *
-     *  while (!htifstate->fromhost_inprogress &&
-     *      htifstate->env->mfromhost != 0x0) {
+     *  while (!s->fromhost_inprogress &&
+     *      s->env->mfromhost != 0x0) {
      *  }
      */
-    htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
-    htifstate->env->mtohost = 0; /* clear to indicate we read */
+    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
+    s->env->mtohost = 0; /* clear to indicate we read */
 }
 
-#define TOHOST_OFFSET1 (htifstate->tohost_offset)
-#define TOHOST_OFFSET2 (htifstate->tohost_offset + 4)
-#define FROMHOST_OFFSET1 (htifstate->fromhost_offset)
-#define FROMHOST_OFFSET2 (htifstate->fromhost_offset + 4)
+#define TOHOST_OFFSET1      (s->tohost_offset)
+#define TOHOST_OFFSET2      (s->tohost_offset + 4)
+#define FROMHOST_OFFSET1    (s->fromhost_offset)
+#define FROMHOST_OFFSET2    (s->fromhost_offset + 4)
 
 /* CPU wants to read an HTIF register */
 static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
 {
-    HTIFState *htifstate = opaque;
+    HTIFState *s = opaque;
     if (addr == TOHOST_OFFSET1) {
-        return htifstate->env->mtohost & 0xFFFFFFFF;
+        return s->env->mtohost & 0xFFFFFFFF;
     } else if (addr == TOHOST_OFFSET2) {
-        return (htifstate->env->mtohost >> 32) & 0xFFFFFFFF;
+        return (s->env->mtohost >> 32) & 0xFFFFFFFF;
     } else if (addr == FROMHOST_OFFSET1) {
-        return htifstate->env->mfromhost & 0xFFFFFFFF;
+        return s->env->mfromhost & 0xFFFFFFFF;
     } else if (addr == FROMHOST_OFFSET2) {
-        return (htifstate->env->mfromhost >> 32) & 0xFFFFFFFF;
+        return (s->env->mfromhost >> 32) & 0xFFFFFFFF;
     } else {
         qemu_log("Invalid htif read: address %016" PRIx64 "\n",
             (uint64_t)addr);
@@ -230,25 +230,25 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
 static void htif_mm_write(void *opaque, hwaddr addr,
                           uint64_t value, unsigned size)
 {
-    HTIFState *htifstate = opaque;
+    HTIFState *s = opaque;
     if (addr == TOHOST_OFFSET1) {
-        if (htifstate->env->mtohost == 0x0) {
-            htifstate->allow_tohost = 1;
-            htifstate->env->mtohost = value & 0xFFFFFFFF;
+        if (s->env->mtohost == 0x0) {
+            s->allow_tohost = 1;
+            s->env->mtohost = value & 0xFFFFFFFF;
         } else {
-            htifstate->allow_tohost = 0;
+            s->allow_tohost = 0;
         }
     } else if (addr == TOHOST_OFFSET2) {
-        if (htifstate->allow_tohost) {
-            htifstate->env->mtohost |= value << 32;
-            htif_handle_tohost_write(htifstate, htifstate->env->mtohost);
+        if (s->allow_tohost) {
+            s->env->mtohost |= value << 32;
+            htif_handle_tohost_write(s, s->env->mtohost);
         }
     } else if (addr == FROMHOST_OFFSET1) {
-        htifstate->fromhost_inprogress = 1;
-        htifstate->env->mfromhost = value & 0xFFFFFFFF;
+        s->fromhost_inprogress = 1;
+        s->env->mfromhost = value & 0xFFFFFFFF;
     } else if (addr == FROMHOST_OFFSET2) {
-        htifstate->env->mfromhost |= value << 32;
-        htifstate->fromhost_inprogress = 0;
+        s->env->mfromhost |= value << 32;
+        s->fromhost_inprogress = 0;
     } else {
         qemu_log("Invalid htif write: address %016" PRIx64 "\n",
             (uint64_t)addr);
-- 
2.34.1


