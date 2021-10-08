Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5B426A47
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:54:55 +0200 (CEST)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoSk-0002xk-S6
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJo-0006O1-Cx
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:40 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:37159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJi-00072V-7B
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:40 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MyK1E-1myJsk3ANw-00yhlG; Fri, 08
 Oct 2021 13:45:22 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] macfb: add trace events for reading and writing the
 control registers
Date: Fri,  8 Oct 2021 13:45:11 +0200
Message-Id: <20211008114518.757615-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SN2TGNsFluwGTy6ubeUfM+EB+euKKMcxROCHud8xn1fOyb4BiYy
 wAFzbm++AUcPwh8N+SlPt0A+cpaobQKSZCtzwxXbpCxk/JSefySb3NXJofoXJrUD223CuPz
 8PJAST32w3flHBSZnImrg7GFr1Vh4xstElRPIjEm9TRqja8l7mQY9udIciGF9vWIL2/4aoz
 ZSZUM5R3oIlqnm5SbquUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TxUD7p9s7qg=:GWoxo3Uj+fEs4w8DmGzc5D
 G7yUHUGMORhxiaTpVA9uViB/YLqFliB7wO4nS9rNxQ7PI0yL2C5X6hpWGHzOdNkrC7etJVHZ7
 gDoykkvhEv/2y/I1KfrcYutDNkatdjegZnulA3AAbdjMEkxtlgpXvEzeVYvbwJy0RLAZtjHpT
 vSCjnDwFRh1uWfh1/ydL0WvtD4B22O3hr7SbL6qEXliJY+2FWEPVelQQ69+lYOdGeODnJuCpz
 zmbGnEtmyEl/UfF4AsKVOm1N0D/KYMGCNPpsQInNclCqSqcwKX/lkQIPyTkeNiqGnLGIATKyv
 SpQFLJaWXAGGDHbiS2ZHPA/760lJTF5/ib9Qxd0W27UdJcdDJ7EqVgcuUkR15jQbCjwIJX91Q
 ihUDmJxlyPHW2Gm65vpDvBxWmgn4Q6zEDwAYKaGLw45tDesHl4kSXNIBF12LGqUblbIbIPZEj
 b02Mk/gDew9/S31oMcKE26jX7cxvEW13fFz91VUOcW3X7UOK92/krU8Ya7lEUDYfFyYgIrvJ8
 eaBIMSymYEV8gZ2KfV4SKA1yhk00pAqeT/m96jICz88//nJVOMN9eLcmBcXRxcHpFKOH+b4cB
 93fGQbImjpcLN+bp/iF9iFcSzprZPcC+yrRuEBndErEqkD3E7opPFbHcST3tTTyVEW4KyMi6C
 hFzSYyHNt7eNUdJy62D8eFcEu+K8wgX5VFN/1RyVDQv9+eaqtGN/uH+j+xryU1YeYzUrsIQYj
 ypat47VNpGNGTQMhUxw1B6FBbM+dTaZ5qADBUw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c      | 8 +++++++-
 hw/display/trace-events | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index f88f5a652394..1128a51c9836 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
 #define VIDEO_BASE 0x00001000
 #define DAFB_BASE  0x00800000
@@ -289,7 +290,10 @@ static uint64_t macfb_ctrl_read(void *opaque,
                                 hwaddr addr,
                                 unsigned int size)
 {
-    return 0;
+    uint64_t val = 0;
+
+    trace_macfb_ctrl_read(addr, val, size);
+    return val;
 }
 
 static void macfb_ctrl_write(void *opaque,
@@ -311,6 +315,8 @@ static void macfb_ctrl_write(void *opaque,
         }
         break;
     }
+
+    trace_macfb_ctrl_write(addr, val, size);
 }
 
 static const MemoryRegionOps macfb_ctrl_ops = {
diff --git a/hw/display/trace-events b/hw/display/trace-events
index f03f6655bcb7..f227de1bb96b 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -167,3 +167,7 @@ sm501_disp_ctrl_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_disp_ctrl_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_2d_engine_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_2d_engine_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+
+# macfb.c
+macfb_ctrl_read(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %u"
+macfb_ctrl_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %u"
-- 
2.31.1


