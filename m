Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F0440AA7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:36:37 +0200 (CEST)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsHU-0002an-DQ
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqX-0006KY-W2
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqW-0004yF-9k
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:45 -0400
Received: by mail-wm1-x32d.google.com with SMTP id v127so10395926wme.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4GsX7ujibAVB1FOlsAotPgTfAySJiSfKMFDwh7bY+6E=;
 b=fy60szucdv+blTBwDwG+A0O85Ft8AqXWS2b4kWqvmuH6/YBLXItzI5un2W+vhOZ/YG
 4rR3UwJ43tN06JWCnHQKHkaOoafrTRGCr8X34JCQgU1Kv4bUk3Ky83aZ1d7nse9dusQt
 McJU4n+5/O3zT66RjcB9aX65oaZ5HAFPdS+QrZYEcvZFI1UKW5A807CVslTjZ0mK2Rbm
 z+nPTlQuyMH4i5TcNoWr1YMo8ztXfoz63OdlOWEWg+//Lu09q+WlEdwAhnwoFZOBU4Rl
 0HW+gqDZ5AUx4DR5vv3APwcxhOIxN6TJ6RnAmb65yx4nGIgm/Z50TAvZY/wMODLKILhc
 SaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4GsX7ujibAVB1FOlsAotPgTfAySJiSfKMFDwh7bY+6E=;
 b=RJ1WPio85C1jgKvQWUZv5m2FxzNlHE76VrKM0AbkQpuFob/iQuJWnjEcKj6kU43vvg
 LBdLg/k2Z2qeUkGkCJs/9+nLHHtt95IiY7ZLwpFvvrV2mpnPuWRDo7rRtdzepL+su5rp
 xaAccf4d2PqTodDuxf1FBf4AzeslGM0H9L8GP3tnMCF9dCI4kNi11GpGbmbCP4fjQLBh
 fVx3g0E2Vux/6xczMW5LgTFJCTSGt9OIDfvmVCKJUs0vYDlLk3wroUabfos6tiS8EHoI
 rDlMI/P1tIBu8puelP6Ddz7WyDmIpG+Dlx53ew+QUypU144fh1j/rzfynErkB9JxEuUL
 jiwA==
X-Gm-Message-State: AOAM532/K8XdzMfZAIWYwmAtPiTj31l9fR7rXNxB5ZNaOqts+3pRBOy6
 Q+vILWaonH6Kc6IB/YwHU3iOozwzjHs=
X-Google-Smtp-Source: ABdhPJxUZ/hHcaYhwQDE/vBXcYFvBLzltqA5HHV6iYTJqs9sjP+YhGf7k0wI3gA6W6atPfVv+2/YYw==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr27163472wmq.34.1635613722764; 
 Sat, 30 Oct 2021 10:08:42 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 r15sm10003784wru.9.2021.10.30.10.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] hw/timer/sh_timer: Remove use of hw_error
Date: Sat, 30 Oct 2021 19:06:15 +0200
Message-Id: <20211030170615.2636436-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The hw_error function calls abort and is not meant to be used by
devices. Use qemu_log_mask instead to log and ignore invalid accesses.
Also fix format strings to allow dropping type casts of hwaddr and use
__func__ instead of hard coding function name in the message which
were wrong in two cases.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <f818dc3dd2ac8c3b3d53067f316a716d7f9683d8.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 587fa9414aa..c72c327bfaf 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/memory.h"
-#include "hw/hw.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "hw/timer/tmu012.h"
@@ -75,11 +75,10 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
         if (s->feat & TIMER_FEAT_CAPT) {
             return s->tcpr;
         }
-        /* fall through */
-    default:
-        hw_error("sh_timer_read: Bad offset %x\n", (int)offset);
-        return 0;
     }
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
+                  __func__, offset);
+    return 0;
 }
 
 static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
@@ -134,7 +133,8 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
             }
             /* fallthrough */
         default:
-            hw_error("sh_timer_write: Reserved TPSC value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved TPSC value\n", __func__);
         }
         switch ((value & TIMER_TCR_CKEG) >> 3) {
         case 0:
@@ -147,7 +147,8 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
             }
             /* fallthrough */
         default:
-            hw_error("sh_timer_write: Reserved CKEG value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved CKEG value\n", __func__);
         }
         switch ((value & TIMER_TCR_ICPE) >> 6) {
         case 0:
@@ -159,7 +160,8 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
             }
             /* fallthrough */
         default:
-            hw_error("sh_timer_write: Reserved ICPE value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved ICPE value\n", __func__);
         }
         if ((value & TIMER_TCR_UNF) == 0) {
             s->int_level = 0;
@@ -168,13 +170,15 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
         value &= ~TIMER_TCR_UNF;
 
         if ((value & TIMER_TCR_ICPF) && (!(s->feat & TIMER_FEAT_CAPT))) {
-            hw_error("sh_timer_write: Reserved ICPF value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved ICPF value\n", __func__);
         }
 
         value &= ~TIMER_TCR_ICPF; /* capture not supported */
 
         if (value & TIMER_TCR_RESERVED) {
-            hw_error("sh_timer_write: Reserved TCR bits set\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved TCR bits set\n", __func__);
         }
         s->tcr = value;
         ptimer_set_limit(s->timer, s->tcor, 0);
@@ -192,7 +196,8 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
         }
         /* fallthrough */
     default:
-        hw_error("sh_timer_write: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, offset);
     }
     sh_timer_update(s);
 }
@@ -262,7 +267,9 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset, unsigned size)
     trace_sh_timer_read(offset);
     if (offset >= 0x20) {
         if (!(s->feat & TMU012_FEAT_3CHAN)) {
-            hw_error("tmu012_write: Bad channel offset %x\n", (int)offset);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad channel offset 0x%" HWADDR_PRIx "\n",
+                          __func__, offset);
         }
         return sh_timer_read(s->timer[2], offset - 0x20);
     }
@@ -280,7 +287,8 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset, unsigned size)
         return s->tocr;
     }
 
-    hw_error("tmu012_write: Bad offset %x\n", (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, offset);
     return 0;
 }
 
@@ -292,7 +300,9 @@ static void tmu012_write(void *opaque, hwaddr offset,
     trace_sh_timer_write(offset, value);
     if (offset >= 0x20) {
         if (!(s->feat & TMU012_FEAT_3CHAN)) {
-            hw_error("tmu012_write: Bad channel offset %x\n", (int)offset);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad channel offset 0x%" HWADDR_PRIx "\n",
+                          __func__, offset);
         }
         sh_timer_write(s->timer[2], offset - 0x20, value);
         return;
@@ -315,7 +325,7 @@ static void tmu012_write(void *opaque, hwaddr offset,
             sh_timer_start_stop(s->timer[2], value & (1 << 2));
         } else {
             if (value & (1 << 2)) {
-                hw_error("tmu012_write: Bad channel\n");
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad channel\n", __func__);
             }
         }
 
-- 
2.31.1


