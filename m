Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C426344051E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:53:20 +0200 (CEST)
Received: from localhost ([::1]:56770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZoN-0001oH-Sk
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJH-0007hN-Rc
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:21:12 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJE-0005c4-Ji
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:21:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E186475619C;
 Fri, 29 Oct 2021 23:20:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0553C7561D5; Fri, 29 Oct 2021 23:20:44 +0200 (CEST)
Message-Id: <97bc2a38991f33fd0c8cc2e4d0a3a29b20c47d1f.1635541329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635541329.git.balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 28/30] hw/timer/sh_timer: Do not wrap lines that are not
 too long
Date: Fri, 29 Oct 2021 23:02:09 +0200
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

It's more readable to keep things on one line if it fits the length limit.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 2038adfb0a..250ad41b48 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -82,8 +82,7 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
     }
 }
 
-static void sh_timer_write(void *opaque, hwaddr offset,
-                            uint32_t value)
+static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
 {
     SHTimerState *s = opaque;
     int freq;
@@ -256,8 +255,7 @@ typedef struct {
     int feat;
 } tmu012_state;
 
-static uint64_t tmu012_read(void *opaque, hwaddr offset,
-                            unsigned size)
+static uint64_t tmu012_read(void *opaque, hwaddr offset, unsigned size)
 {
     tmu012_state *s = opaque;
 
@@ -336,8 +334,7 @@ static const MemoryRegionOps tmu012_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void tmu012_init(MemoryRegion *sysmem, hwaddr base,
-                 int feat, uint32_t freq,
+void tmu012_init(MemoryRegion *sysmem, hwaddr base, int feat, uint32_t freq,
                  qemu_irq ch0_irq, qemu_irq ch1_irq,
                  qemu_irq ch2_irq0, qemu_irq ch2_irq1)
 {
-- 
2.21.4


