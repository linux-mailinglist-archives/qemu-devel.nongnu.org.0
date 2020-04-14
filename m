Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8C1A8BF2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 22:09:47 +0200 (CEST)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jORsQ-0002sx-PC
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 16:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jORpa-0006BS-1h
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jORpY-0005z4-Ts
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:06:49 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jORpY-0005yf-N6
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:06:48 -0400
Received: by mail-wr1-x441.google.com with SMTP id u13so15521559wrp.3
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 13:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Tb6fI3tVBkHUd/y7Zo+dSFehRr8QpWy7fD+f4ic+ig=;
 b=wttuBit2rudWSw4TCjpzebO7LSNobJFxOG3lmzE6092o9UW39mKyyA6MWVc90M9t41
 gu/bsMymQ+RVAyJXqyb6BqIs1JzECzshdqlSo/EmFdM4Ktbt2H+Rjsp4DEWFCmFN92oB
 ko3wIVlQ/dMRRK7/eu0RN77b6UJVAkG3lWOw5vdZoQw6umLE41FaHlzcAstlCnNmzHw0
 w7jjfu1L4gHmZMXgaAzRxuh+z+RcCRxV0sagbb9WhsbwxkQRrDi/8/xhE5dn71aD3gKj
 2jWlZCoqYdoMfCXUiHWYPOglrUxB7EnQziqIhglIUuEJYz+zDhlc/IIAa/eP91eG6ill
 N8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Tb6fI3tVBkHUd/y7Zo+dSFehRr8QpWy7fD+f4ic+ig=;
 b=Ul21illD1mxwBWhwW3606Pm14XDCGxjhdGB59kB5F1TjwbOcBdVXh4aItD2Ke0cXbD
 kNQzt7T2uDlINqp1uGStNlZNcdAob14oS5kdwjP0DBomeQ9ykpaq+PjBbcQh6sVFKrFH
 HqqcT8yKw4Ht0ZOUnmp+N+REhniInN6UH/4+QjlPFA97N9MqOheOQDdBizAYXLjwLjpI
 18jQzUFyHx64HtvXFt3ZR5sp4BXxZ+nMbUcaVwKzOuq+IOhquvf5K6J4yXm2tGeJI7sx
 WihOJvmcOnBhQYN3iWbfxURyCJ7iSQBcuOchBQKCjLIqa7dqmgR21PFRUw4oFv48kMmP
 ogjg==
X-Gm-Message-State: AGi0Pub28TF2PuOgtzmX5HaaQQNzIikMiIIbVMBkCjpbm7qG788kKcu4
 9oaLUHUEIjj51nO56CavYF5l/w==
X-Google-Smtp-Source: APiQypKU7C6T7b6gLBurE2JOwtMJvkUCdMbRhOA91cw7SxtWF2+8cC5BDBrRlJysRtPjM++8Srs6gQ==
X-Received: by 2002:adf:d087:: with SMTP id y7mr4275303wrh.321.1586894807624; 
 Tue, 14 Apr 2020 13:06:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p10sm19781721wrm.6.2020.04.14.13.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:06:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 080751FF98;
 Tue, 14 Apr 2020 21:06:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 09/17] linux-user: fix /proc/self/stat handling
Date: Tue, 14 Apr 2020 21:06:23 +0100
Message-Id: <20200414200631.12799-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414200631.12799-1-alex.bennee@linaro.org>
References: <20200414200631.12799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Brice Goglin <Brice.Goglin@inria.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the original bug report long files names in Guix caused
/proc/self/stat be truncated without the trailing ") " as specified in
proc manpage which says:
    (2) comm  %s
           The  filename of the executable, in parentheses.  This
           is visible whether or not the  executable  is  swapped
           out.

In the kernel this is currently done by do_task_stat calling
proc_task_name() which uses a structure limited by TASK_COMM_LEN (16).

Additionally it should only be reporting the executable name rather
than the full path. Fix both these failings while cleaning up the code
to use GString to build up the reported values. As the whole function
is cleaned up also adjust the white space to the current coding style.

Message-ID: <fb4c55fa-d539-67ee-c6c9-de8fb63c8488@inria.fr>
Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 43 +++++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6495ddc4cda..674f70e70a5 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7295,34 +7295,29 @@ static int open_self_stat(void *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
     TaskState *ts = cpu->opaque;
-    abi_ulong start_stack = ts->info->start_stack;
+    g_autoptr(GString) buf = g_string_new(NULL);
     int i;
 
     for (i = 0; i < 44; i++) {
-      char buf[128];
-      int len;
-      uint64_t val = 0;
-
-      if (i == 0) {
-        /* pid */
-        val = getpid();
-        snprintf(buf, sizeof(buf), "%"PRId64 " ", val);
-      } else if (i == 1) {
-        /* app name */
-        snprintf(buf, sizeof(buf), "(%s) ", ts->bprm->argv[0]);
-      } else if (i == 27) {
-        /* stack bottom */
-        val = start_stack;
-        snprintf(buf, sizeof(buf), "%"PRId64 " ", val);
-      } else {
-        /* for the rest, there is MasterCard */
-        snprintf(buf, sizeof(buf), "0%c", i == 43 ? '\n' : ' ');
-      }
+        if (i == 0) {
+            /* pid */
+            g_string_printf(buf, FMT_pid " ", getpid());
+        } else if (i == 1) {
+            /* app name */
+            gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
+            bin = bin ? bin + 1 : ts->bprm->argv[0];
+            g_string_printf(buf, "(%.15s) ", bin);
+        } else if (i == 27) {
+            /* stack bottom */
+            g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
+        } else {
+            /* for the rest, there is MasterCard */
+            g_string_printf(buf, "0%c", i == 43 ? '\n' : ' ');
+        }
 
-      len = strlen(buf);
-      if (write(fd, buf, len) != len) {
-          return -1;
-      }
+        if (write(fd, buf->str, buf->len) != buf->len) {
+            return -1;
+        }
     }
 
     return 0;
-- 
2.20.1


