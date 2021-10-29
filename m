Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF1440511
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:48:49 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZk0-0001M5-HH
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJ3-0007FH-OV
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:20:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:19921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJ1-0005aG-Iq
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:20:57 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4A27575620B;
 Fri, 29 Oct 2021 23:20:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9F90E756078; Fri, 29 Oct 2021 23:20:43 +0200 (CEST)
Message-Id: <0f185653528c99eeeb2b4e4afb8b818d93298c20.1635541329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635541329.git.balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 10/30] hw/char/sh_serial: Rename type sh_serial_state to
 SHSerialState
Date: Fri, 29 Oct 2021 23:02:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Coding style says types should be camel case.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/sh_serial.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 2d6ea0042e..bc5e0c4404 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -73,9 +73,9 @@ typedef struct {
     qemu_irq txi;
     qemu_irq tei;
     qemu_irq bri;
-} sh_serial_state;
+} SHSerialState;
 
-static void sh_serial_clear_fifo(sh_serial_state *s)
+static void sh_serial_clear_fifo(SHSerialState *s)
 {
     memset(s->rx_fifo, 0, SH_RX_FIFO_LENGTH);
     s->rx_cnt = 0;
@@ -86,7 +86,7 @@ static void sh_serial_clear_fifo(sh_serial_state *s)
 static void sh_serial_write(void *opaque, hwaddr offs,
                             uint64_t val, unsigned size)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     unsigned char ch;
 
     trace_sh_serial_write(size, offs, val);
@@ -204,7 +204,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
 static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                                unsigned size)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     uint32_t ret = UINT32_MAX;
 
 #if 0
@@ -309,12 +309,12 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
     return ret;
 }
 
-static int sh_serial_can_receive(sh_serial_state *s)
+static int sh_serial_can_receive(SHSerialState *s)
 {
     return s->scr & (1 << 4);
 }
 
-static void sh_serial_receive_break(sh_serial_state *s)
+static void sh_serial_receive_break(SHSerialState *s)
 {
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
         s->sr |= (1 << 4);
@@ -323,13 +323,13 @@ static void sh_serial_receive_break(sh_serial_state *s)
 
 static int sh_serial_can_receive1(void *opaque)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     return sh_serial_can_receive(s);
 }
 
 static void sh_serial_timeout_int(void *opaque)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
 
     s->flags |= SH_SERIAL_FLAG_RDF;
     if (s->scr & (1 << 6) && s->rxi) {
@@ -339,7 +339,7 @@ static void sh_serial_timeout_int(void *opaque)
 
 static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
 
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
         int i;
@@ -369,7 +369,7 @@ static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
 
 static void sh_serial_event(void *opaque, QEMUChrEvent event)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     if (event == CHR_EVENT_BREAK) {
         sh_serial_receive_break(s);
     }
@@ -390,9 +390,7 @@ void sh_serial_init(MemoryRegion *sysmem,
                     qemu_irq tei_source,
                     qemu_irq bri_source)
 {
-    sh_serial_state *s;
-
-    s = g_malloc0(sizeof(sh_serial_state));
+    SHSerialState *s = g_malloc0(sizeof(*s));
 
     s->feat = feat;
     s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
-- 
2.21.4


