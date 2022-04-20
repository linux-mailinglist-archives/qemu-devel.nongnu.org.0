Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C321508F55
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:24:37 +0200 (CEST)
Received: from localhost ([::1]:47406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF0G-0001gp-LD
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjE-0006bL-UT
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:07:01 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjD-0001Ny-AM
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:07:00 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso2772219pjj.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=24qJPC1oFAO3Id/yaILSHNoaXDm+P/+xDRz86KIt45U=;
 b=x0qrO7uLDZDDUgkkVsiXjRfZagK4HkX3hTzqX5/SINlT4vbvXnvIzpBMWNr+Wtjx+z
 C3KAWmZntYNvZNEiUdUJ0uzedCDorCIesynOFjL+/2CV2CfxXitXOT/z4nJFkSIYdtz4
 /IgpNhna80UHj+QJyW9LNHx7PmBxCXxUiytrXNTh+KynHZCLElPScS0XR5dEbN+m0QOj
 eVcKEzIYy1D6J7OmSwLgVKEhOPsfasw7SkIStMCA9clWxF6FcB27tbTcUlwKeH14zwn8
 qz1VKg0C8bfc/PvIWz+zJ/jroAteRhe1NAf5GCcG+fJaJmDNg9zopmZVRSt+EA0hGHuK
 dX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=24qJPC1oFAO3Id/yaILSHNoaXDm+P/+xDRz86KIt45U=;
 b=uDOMnfk0QWvxuzUN3E4T8JJ3XTMonpIf0VmI2GvPhJs+RDSA4kw75qFZC53WKDPw2f
 QFUhboiuXALbf+iihPtBgdfljSJPrNmpTeImn15pyfi9aV7yy5JPXf96SGUH682txJde
 ySHKZX4cxytnIATPzBJnEszfmoIbaDXWw9Udehw8FdaaJDUla5hL+fhCeueQfHpNp7OS
 xlG6IupVHvaN4jWT82Rv5BO4J6bqX2YT1nPSgpt/5eM1JFS35ASezZtd6Oo7g/0Wqv3N
 EqyInxWoKpE5Ss+Ho/pNmW0g/CUtNGYs2wtTELKFTbQHXOtmO5rOZuY44aUdNTV4+gq3
 pb+A==
X-Gm-Message-State: AOAM530eoiV4EtwdPoCya6gOWYMSB5Df2hqc8AeuMoJt5ItgqpD+4P/D
 /C+lWvN4TzQE/KgVsWXdHlAjPGCrpGyA6w==
X-Google-Smtp-Source: ABdhPJz/OgbnLOURIKIsgtbDR4J6Bungn+P/4bUruwK4VnTwh/HzMlPhzxd9i9z1JsznFt8iareAAQ==
X-Received: by 2002:a17:902:c941:b0:158:f9ca:7769 with SMTP id
 i1-20020a170902c94100b00158f9ca7769mr16258391pla.161.1650478017803; 
 Wed, 20 Apr 2022 11:06:57 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/39] util/log: Rename QemuLogFile to RCUCloseFILE
Date: Wed, 20 Apr 2022 11:06:16 -0700
Message-Id: <20220420180618.1183855-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

s/QemuLogFile/RCUCloseFILE/
s/qemu_logfile_free/rcu_close_file/

Emphasize that this is only a carrier for passing a pointer
to call_rcu for closing, and not the real logfile.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-38-richard.henderson@linaro.org>
---
 util/log.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/util/log.c b/util/log.c
index 21da961d8d..eb6e85b2f0 100644
--- a/util/log.c
+++ b/util/log.c
@@ -29,15 +29,15 @@
 #include "qemu/rcu.h"
 
 
-typedef struct QemuLogFile {
+typedef struct RCUCloseFILE {
     struct rcu_head rcu;
     FILE *fd;
-} QemuLogFile;
+} RCUCloseFILE;
 
 /* Mutex covering the other global_* variables. */
 static QemuMutex global_mutex;
 static char *global_filename;
-static QemuLogFile *global_file;
+static RCUCloseFILE *global_file;
 
 int qemu_loglevel;
 static int log_append = 0;
@@ -52,7 +52,7 @@ bool qemu_log_enabled(void)
 /* Returns true if qemu_log() will write somewhere other than stderr. */
 bool qemu_log_separate(void)
 {
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
     bool res = false;
 
     rcu_read_lock();
@@ -68,7 +68,7 @@ bool qemu_log_separate(void)
 
 FILE *qemu_log_trylock(void)
 {
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
 
     rcu_read_lock();
     logfile = qatomic_rcu_read(&global_file);
@@ -108,14 +108,12 @@ static void __attribute__((__constructor__)) startup(void)
     qemu_mutex_init(&global_mutex);
 }
 
-static void qemu_logfile_free(QemuLogFile *logfile)
+static void rcu_close_file(RCUCloseFILE *r)
 {
-    g_assert(logfile);
-
-    if (logfile->fd != stderr) {
-        fclose(logfile->fd);
+    if (r->fd != stderr) {
+        fclose(r->fd);
     }
-    g_free(logfile);
+    g_free(r);
 }
 
 /* enable or disable low levels log */
@@ -124,7 +122,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 {
     bool need_to_open_file;
     bool daemonized;
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
@@ -178,7 +176,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
     if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
-        call_rcu(logfile, qemu_logfile_free, rcu);
+        call_rcu(logfile, rcu_close_file, rcu);
         logfile = NULL;
     }
 
@@ -196,7 +194,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             if (daemonized) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
-                /* This will skip closing logfile in qemu_logfile_free. */
+                /* This will skip closing logfile in rcu_close_file. */
                 fd = stderr;
             }
         } else {
@@ -207,7 +205,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
         log_append = 1;
 
-        logfile = g_new0(QemuLogFile, 1);
+        logfile = g_new0(RCUCloseFILE, 1);
         logfile->fd = fd;
         qatomic_rcu_set(&global_file, logfile);
     }
-- 
2.34.1


