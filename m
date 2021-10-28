Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A843E959
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:08:35 +0200 (CEST)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBhS-0001F4-2c
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWU-0003aT-8B
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:14 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWQ-0008SZ-7X
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B85147561D3;
 Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5EB8A75605E; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <4a2a061c03f7b9349a8c0c17cd287e86e0e25920.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 05/23] hw/char/sh_serial: Rename type sh_serial_state to
 SHSerialState
Date: Thu, 28 Oct 2021 21:27:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

Coding style says types should be camel case.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/sh_serial.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 6ffab376d8..b93b403555 100644
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
@@ -203,7 +203,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
 static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                                unsigned size)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     uint32_t ret = ~0;
 
 #if 0
@@ -305,12 +305,12 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
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
@@ -319,13 +319,13 @@ static void sh_serial_receive_break(sh_serial_state *s)
 
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
@@ -335,7 +335,7 @@ static void sh_serial_timeout_int(void *opaque)
 
 static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
 
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
         int i;
@@ -365,7 +365,7 @@ static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
 
 static void sh_serial_event(void *opaque, QEMUChrEvent event)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     if (event == CHR_EVENT_BREAK) {
         sh_serial_receive_break(s);
     }
@@ -386,9 +386,7 @@ void sh_serial_init(MemoryRegion *sysmem,
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


