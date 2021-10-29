Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A9344010B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:15:55 +0200 (CEST)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVTu-0007Ky-Lk
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUwA-0007je-Iz
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:41:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUw1-0006TN-Pb
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:41:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C2E207561C8;
 Fri, 29 Oct 2021 18:40:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CD8BF7561CF; Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Message-Id: <f4873d699329afd8e329d1fdaefe432cda8d6dce.1635524617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635524616.git.balaton@eik.bme.hu>
References: <cover.1635524616.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 23/25] hw/timer/sh_timer: Do not wrap lines that are not
 too long
Date: Fri, 29 Oct 2021 18:23:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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


