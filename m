Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C149B44154E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:30:08 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhShj-0000ei-U5
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfg-000600-4f; Mon, 01 Nov 2021 04:28:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfe-00086V-4B; Mon, 01 Nov 2021 04:27:59 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MVJZv-1mFAad44Qh-00SMER; Mon, 01
 Nov 2021 09:27:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] hw/input/lasips2: Move LASIPS2State declaration to
 'hw/input/lasips2.h'
Date: Mon,  1 Nov 2021 09:27:46 +0100
Message-Id: <20211101082747.2524909-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101082747.2524909-1-laurent@vivier.eu>
References: <20211101082747.2524909-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RpkfCmiRDLupRVEyYLVHr4RnyDj8zP76pJckPtOT2vzxwq2jrCV
 w4PO3ofsWHLJXVaXFPSH28mA9rhzGhWY3IUybl6Z9v4552kGroGewROHTBP+KAoOKHm6OBk
 cY4JRQM/0MkFrqIrVB605GBnCtGiLuqye0rkNao4z5HsELKTBB4Y3jWTJW12amVtb1BqubU
 1lJ3+OSdnsFWNwTxqkKjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zpQAy5oH68k=:LuyMKKjYxjBz2vn6YhepFb
 GxX7wDAlhmPsGz0anMF09aCqNqrpmLv4q7mBx6L+RVcrqBd4UvDZpK1hqLIPHQs08OBZD+5mK
 Jm/IOFEI+adCK8rZIFD7x4PRKqD1M2+VVol4lcsByQ5I7z4bUnYLc5Kkb0ZcTloeNhQsLgMW3
 vDG9HqGleVK4VLSoO/rHiiMZzN+mbLcBpg5ktLQJagQNHxZtl2aYdYWQQq7/z6KJpOOdcIDs7
 9Kaq+0U2dVTHk4ogCNBsMgQzOeJeLSBh/UdF4Bto3caSZ7Qi4uRPLeaXWEqK0EkbAAsHj1FHz
 kBy4uUEDYQcJ/kqhq+dL5ifmrNy1ETe146+/DbBudeQ45cAcZLchcIRWrg+DCzpM4DUA4pUfQ
 OtdDoEmJZufnkuVVofj4lE74w6kP0HAH+X2KaMpr+q6KL3o1m6cKcybLCUDAZxzrTm58GXI5N
 nuG2gBELR9JIs0IdSRCoAMVFc9CfEK33svqFbKHiEeMWYtPRj4kkOVjwF8sNrQrgRhIELBlsB
 bsw0Aa1Wx0miJhvlvAz+yRnoqPie9xyPcnFX9PHyZ51Pa/pMcNgDkRnP5rjOW3ATYpWitmIzO
 KXO9IDe0j9lA3HQJPHjIkspkXv9/pw+kcgXVH2nC6WoCccqIKpp4zq9KGTlwhSzDv05S4nPRP
 +Tx/9/ZVwgDy8wLQSfK4as208KpEILtwW1kLxDr3rRVKMFtLsbGfXDM7/PRDjQwXXHh4=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to use the OBJECT_DECLARE_SIMPLE_TYPE() macro to QOM'ify
this device in the next commit. To make its review simpler, as a
first step move the LASIPS2State and LASIPS2Port declarations to
'hw/input/lasips2.h'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-Id: <20210920064048.2729397-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/lasips2.c         | 18 ------------------
 include/hw/input/lasips2.h | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 68d741d34215..0f8362f17bc1 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -33,24 +33,6 @@
 #include "hw/irq.h"
 
 
-struct LASIPS2State;
-typedef struct LASIPS2Port {
-    struct LASIPS2State *parent;
-    MemoryRegion reg;
-    void *dev;
-    uint8_t id;
-    uint8_t control;
-    uint8_t buf;
-    bool loopback_rbne;
-    bool irq;
-} LASIPS2Port;
-
-typedef struct LASIPS2State {
-    LASIPS2Port kbd;
-    LASIPS2Port mouse;
-    qemu_irq irq;
-} LASIPS2State;
-
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
     .version_id = 0,
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 0cd7b59064a9..c88f1700162a 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -11,6 +11,24 @@
 
 #define TYPE_LASIPS2 "lasips2"
 
+struct LASIPS2State;
+typedef struct LASIPS2Port {
+    struct LASIPS2State *parent;
+    MemoryRegion reg;
+    void *dev;
+    uint8_t id;
+    uint8_t control;
+    uint8_t buf;
+    bool loopback_rbne;
+    bool irq;
+} LASIPS2Port;
+
+typedef struct LASIPS2State {
+    LASIPS2Port kbd;
+    LASIPS2Port mouse;
+    qemu_irq irq;
+} LASIPS2State;
+
 void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
 
 #endif /* HW_INPUT_LASIPS2_H */
-- 
2.31.1


