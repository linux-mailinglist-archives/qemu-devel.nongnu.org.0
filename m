Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F54A4B6BCB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:12:56 +0100 (CET)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwhT-0005hT-G7
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:12:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbr-00019p-J2
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:07:11 -0500
Received: from [2607:f8b0:4864:20::431] (port=36475
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbo-0001Ut-Ft
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:07:06 -0500
Received: by mail-pf1-x431.google.com with SMTP id z16so12635431pfh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 04:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1kz5UUqyzdZGMp/mxnljjWHI+CVxZCoiLHlEt1WQgM=;
 b=cqhr4/KyecY11PmtETsA7qjYn2v28QQWpyt0DYbAXBL/8XoaWjBkIg9crbaDgwfLds
 KDRVDBfJSB6//3Gx++M6EPoqOGy9dB43lssoFfIiprKBHPxNrDUZC8HVG18RqdY+mV87
 OzFPUa1cT8MYP88VqhBREfG4nuGFLWXFqj+LFG0KnJSFwZN1WX8VNw3VpS+iYKW77hix
 xPxjQ6JdjfIaz+HomPvuKxtg08+/TdvcPe8MrOXhTikcouSkh+o4ZzPMkQ3HzMJMpYBI
 r8MEZLpy/Wy46G0qeDsp3/NSzXfORhqyvga60f30vp4fcEdOTLbd6xMXEs53EsWjvG+s
 mo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J1kz5UUqyzdZGMp/mxnljjWHI+CVxZCoiLHlEt1WQgM=;
 b=L7KFdxda+A5LAWEysbOox8Y0sX/JNjF5YorsGG6mv6WvpLLCv35lY67FsZFD2c5GoO
 H6PDET0CDV42nZM55kgYv7GYjvOn8Kt6ZCkQegA/w/oly3wRozqise/bKsmHM0TGBKzx
 HlECbxQyGGvFweviSa65vSm+dTSiIuQoP7ZUn51vVdodcU3gkm7FM7yfQkqeGypBopZY
 U4b/17DoDEnc30Vk9/QmuyMvq6PUrsN3LXhbo8+MRsO5bTMyEJj/kkpBdlhE+erOuplq
 p8rIASmAarMxD/NkeSg6uKpL75ekYvczzw9l0r6kTh6yGU5eBmoSioV8VO7nmYFytGfG
 yegw==
X-Gm-Message-State: AOAM530gjfr/QJbZI16hOuoAeZHRQcSbAnKCsFRCx6sfr7+jfzEEwf0b
 bnTP1C5cRqzYdrDmi9zp51lGgqY1e98=
X-Google-Smtp-Source: ABdhPJzGRFiQTmwsQPLUbdP4y3VUucYywiQMFB9vZLLmqjhxzU1HsFYtK/T74pEQJX3nOSsG1nXO/g==
X-Received: by 2002:a63:6a89:: with SMTP id f131mr3310988pgc.108.1644926807288; 
 Tue, 15 Feb 2022 04:06:47 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id y20sm40402889pfi.78.2022.02.15.04.06.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 04:06:47 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/4] osdep: Un-inline qemu_thread_jit_execute/write
Date: Tue, 15 Feb 2022 13:06:23 +0100
Message-Id: <20220215120625.64711-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215120625.64711-1-f4bug@amsat.org>
References: <20220215120625.64711-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

qemu_thread_jit_execute() and qemu_thread_jit_write() call
pthread_jit_write_protect_np() which is declared in "pthread.h".
Since we don't want all C files to preprocess unused headers,
avoid adding yet another header here and move the function
definitions to osdep.c, un-inlining them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/osdep.h | 17 ++---------------
 util/osdep.c         | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 1e7a002339..785884728b 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -773,21 +773,8 @@ size_t qemu_get_host_physmem(void);
  * Toggle write/execute on the pages marked MAP_JIT
  * for the current thread.
  */
-#if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
-static inline void qemu_thread_jit_execute(void)
-{
-    pthread_jit_write_protect_np(true);
-}
-
-static inline void qemu_thread_jit_write(void)
-{
-    pthread_jit_write_protect_np(false);
-}
-#else
-static inline void qemu_thread_jit_write(void) {}
-static inline void qemu_thread_jit_execute(void) {}
-#endif
+void qemu_thread_jit_execute(void);
+void qemu_thread_jit_write(void);
 
 /**
  * Platforms which do not support system() return ENOSYS
diff --git a/util/osdep.c b/util/osdep.c
index 42a0a4986a..b228a53612 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -124,6 +124,26 @@ int qemu_mprotect_none(void *addr, size_t size)
 #endif
 }
 
+static void qemu_pthread_jit_write_protect(bool enabled)
+{
+#if defined(MAC_OS_VERSION_11_0) \
+        && MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+    if (__builtin_available(macOS 11.0, *)) {
+        pthread_jit_write_protect_np(enabled);
+    }
+#endif
+}
+
+void qemu_thread_jit_execute(void)
+{
+    qemu_pthread_jit_write_protect(true);
+}
+
+void qemu_thread_jit_write(void)
+{
+    qemu_pthread_jit_write_protect(false);
+}
+
 #ifndef _WIN32
 
 static int fcntl_op_setlk = -1;
-- 
2.34.1


