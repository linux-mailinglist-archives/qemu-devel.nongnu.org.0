Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970C508F60
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:27:32 +0200 (CEST)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF35-0007aK-H3
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjF-0006cS-UH
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:07:01 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjE-0001OH-77
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:07:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id v12so2518069plv.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fQR19rVt1keBu2rrRIYBg7sKmNRFnuKf5yFDcZrxQ60=;
 b=FTMm8sw9osd5gRoDlSlEZGeMkHrej+ZiMxr2D9wxXS+Vj1awd6MGCtAKKvFGC7zaZQ
 gzPt8Nu7eCLxx2qujQ9IosE6u1uaHSXPoaNNJ+EFpl9HknZLKmO+Aj3g2xYXozZ+6y6g
 QipsFllkBTAH7UpqQd11XeFlKnAAA8NPQgW9dvGfvMwGFPso2HPvf6hZlyHuTb0v2Q6F
 4M3tNDeFvhcCnqnC2a3ImAajNGqNKyuxIVnp5FOvNAJLOALlzGp6XF93QrVyb1qkKK0P
 PDHUopLxyqW5WLYY36L/Jm10+OypsVI40CgZUvUY5i6KUD2AIyPNcZDuShWnBWGf3+Ai
 vdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fQR19rVt1keBu2rrRIYBg7sKmNRFnuKf5yFDcZrxQ60=;
 b=nPUTMxCJ2iJDZM3OBrR7kN6ltOq9fMtEtCKXmbfAnpx1fRnKzN/KJbaXyWuBJH25CL
 XGQCDzCz4TTzje+60ksIVsDPKBtHquVhHXWQf/IF+ISGhw6RmJ6KoGG6Nmsrqq9h1lMk
 3ZKhrCLFIIGpQeJMYm3bupFeUTJCg4uXSXVdHpIZJcTMSIIW/9qj2/ND5hPdZo/SNmTk
 a9XTq5uSFpC8FKHejKgzM1OiTe1pozjhTL841jfNWgK/Jil4RIWcYyPnQOy/+Gm++fq1
 VzF6R+LRbxWxg+qiWMohWWrcqcxAmiOuiD3Sb6EDhXwjkmoLafjR4Mlt0YSOYb79W51h
 zWaQ==
X-Gm-Message-State: AOAM530R6v/HNTMgsVG7MVwp+vzzz6MrLiAW8Ym7zq7YZKG3BOaXFTTZ
 UdZcOVVHd3o3DjJdJcJY832M+aYpNLEC7g==
X-Google-Smtp-Source: ABdhPJz2NI1Izrb+QnjhypmINuCnXkCsdK3Rzipw27sAW9jUmmH9NslT7oH1q/6oukq9YwRYV0GWyw==
X-Received: by 2002:a17:902:850b:b0:158:27a2:66eb with SMTP id
 bj11-20020a170902850b00b0015827a266ebmr22483475plb.5.1650478018985; 
 Wed, 20 Apr 2022 11:06:58 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/39] util/log: Limit RCUCloseFILE to file closing
Date: Wed, 20 Apr 2022 11:06:17 -0700
Message-Id: <20220420180618.1183855-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FILE* for global_file.  We can perform an rcu_read on that
just as easily as RCUCloseFILE*.  This simplifies a couple of
places, where previously we required taking the rcu_read_lock
simply to avoid racing to dereference RCUCloseFile->fd.

Only allocate the RCUCloseFile prior to call_rcu.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-39-richard.henderson@linaro.org>
---
 util/log.c | 68 +++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/util/log.c b/util/log.c
index eb6e85b2f0..df0710720f 100644
--- a/util/log.c
+++ b/util/log.c
@@ -37,7 +37,7 @@ typedef struct RCUCloseFILE {
 /* Mutex covering the other global_* variables. */
 static QemuMutex global_mutex;
 static char *global_filename;
-static RCUCloseFILE *global_file;
+static FILE *global_file;
 
 int qemu_loglevel;
 static int log_append = 0;
@@ -46,46 +46,44 @@ static GArray *debug_regions;
 /* Returns true if qemu_log() will really write somewhere. */
 bool qemu_log_enabled(void)
 {
-    return global_file != NULL;
+    return qatomic_read(&global_file) != NULL;
 }
 
 /* Returns true if qemu_log() will write somewhere other than stderr. */
 bool qemu_log_separate(void)
 {
-    RCUCloseFILE *logfile;
-    bool res = false;
-
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&global_file);
-    if (logfile && logfile->fd != stderr) {
-        res = true;
-    }
-    rcu_read_unlock();
-    return res;
+    FILE *logfile = qatomic_read(&global_file);
+    return logfile && logfile != stderr;
 }
 
 /* Lock/unlock output. */
 
 FILE *qemu_log_trylock(void)
 {
-    RCUCloseFILE *logfile;
+    FILE *logfile;
 
     rcu_read_lock();
-    logfile = qatomic_rcu_read(&global_file);
+    /*
+     * FIXME: typeof_strip_qual, as used by qatomic_rcu_read,
+     * does not work with pointers to undefined structures,
+     * such as we have with struct _IO_FILE and musl libc.
+     * Since all we want is a read of a pointer, cast to void**,
+     * which does work with typeof_strip_qual.
+     */
+    logfile = qatomic_rcu_read((void **)&global_file);
     if (logfile) {
-        qemu_flockfile(logfile->fd);
-        return logfile->fd;
+        qemu_flockfile(logfile);
     } else {
         rcu_read_unlock();
-        return NULL;
     }
+    return logfile;
 }
 
-void qemu_log_unlock(FILE *fd)
+void qemu_log_unlock(FILE *logfile)
 {
-    if (fd) {
-        fflush(fd);
-        qemu_funlockfile(fd);
+    if (logfile) {
+        fflush(logfile);
+        qemu_funlockfile(logfile);
         rcu_read_unlock();
     }
 }
@@ -110,9 +108,7 @@ static void __attribute__((__constructor__)) startup(void)
 
 static void rcu_close_file(RCUCloseFILE *r)
 {
-    if (r->fd != stderr) {
-        fclose(r->fd);
-    }
+    fclose(r->fd);
     g_free(r);
 }
 
@@ -122,7 +118,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 {
     bool need_to_open_file;
     bool daemonized;
-    RCUCloseFILE *logfile;
+    FILE *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
@@ -176,37 +172,37 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
     if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
-        call_rcu(logfile, rcu_close_file, rcu);
+        if (logfile != stderr) {
+            RCUCloseFILE *r = g_new0(RCUCloseFILE, 1);
+            r->fd = logfile;
+            call_rcu(r, rcu_close_file, rcu);
+        }
         logfile = NULL;
     }
 
     if (!logfile && need_to_open_file) {
-        FILE *fd;
-
         if (filename) {
-            fd = fopen(filename, log_append ? "a" : "w");
-            if (!fd) {
+            logfile = fopen(filename, log_append ? "a" : "w");
+            if (!logfile) {
                 error_setg_errno(errp, errno, "Error opening logfile %s",
                                  filename);
                 return false;
             }
             /* In case we are a daemon redirect stderr to logfile */
             if (daemonized) {
-                dup2(fileno(fd), STDERR_FILENO);
-                fclose(fd);
+                dup2(fileno(logfile), STDERR_FILENO);
+                fclose(logfile);
                 /* This will skip closing logfile in rcu_close_file. */
-                fd = stderr;
+                logfile = stderr;
             }
         } else {
             /* Default to stderr if no log file specified */
             assert(!daemonized);
-            fd = stderr;
+            logfile = stderr;
         }
 
         log_append = 1;
 
-        logfile = g_new0(RCUCloseFILE, 1);
-        logfile->fd = fd;
         qatomic_rcu_set(&global_file, logfile);
     }
     return true;
-- 
2.34.1


