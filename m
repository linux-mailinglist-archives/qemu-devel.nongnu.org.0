Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB8126093
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 12:12:02 +0100 (CET)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihtir-0003bR-D5
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 06:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ihtWk-0003zZ-1V
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:59:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ihtWi-0001Yy-KE
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:59:29 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33658)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ihtWi-0001U0-BS
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:59:28 -0500
Received: by mail-wr1-x444.google.com with SMTP id b6so5547414wrq.0
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjDJrz6x/SGN471YkmM/0ztom5/w9/oR2o+AFj80PtQ=;
 b=qsiq10gGXkKpkjtndeMa0YzmhXow3734kohC5sUAoc+NbOyXSEzhywOPk86eu2yIil
 wx9RZ2A49xYkCZdNyf36zWGyOPWCv2rWCXOho0tS7ifS4H4VDPbsiP+f2cX/aKnQb/wS
 WPc74fdkKGk27dnJ5wBrXCSvc4gViMIM1daantBQPc4fSbL+Ba1uN51J9x5209zoBk7b
 LQv7zlVrhd0dmTqQHRaE2WEUzxfEJy8DJCsZqHP5ibLh6IF33srDAYaY5YuDEE2Dpd3t
 FnMcy47LQDrpto978sYIZCSgZGI28PQ11Hh0D80ibWuLciFwtPwzavLysfsMltJe/LmA
 2QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjDJrz6x/SGN471YkmM/0ztom5/w9/oR2o+AFj80PtQ=;
 b=XgxBVS6FHWulWHrpZvZQNHGitoXFhXgfjpgH7+uSNO0xC5KvXCfyvlgm2AYk2ouJnV
 4wKTxm0kLf120HYGcmt4Nb48a2C0oq+DT8YiyuMZq4wGty2o8xp93d9UaJyX7gaSQXAC
 Yei7pSBW4ps5a5xIeN751PFRkkf8Q28Nb6m3/4eng9tjVYR4uQHliUzOWWfK5kft8DRw
 5txmg42tiF+NUShaX1kqaVWWqVOt+qBO+abmVDLy7IBMwfdhtJxtCKF9Td4pzUvXypTD
 haNaLYS649Hgb6qnUMuQisvzluQRctL04iMsP4QilIKdNuE/+KoBtJERsdUrLlj6TQPy
 PUaw==
X-Gm-Message-State: APjAAAVMfnOE5b9wLNba+BEOzP0nHBai9dMe4XN2gf2X4osnBTvRAtcA
 5dfW0STPxAxgz4C4r5jyG2MTIQ==
X-Google-Smtp-Source: APXvYqzJUuHh6e0ivXkD6Lj4XxopvEtWbAo5NzhW01wJFb9yZKsAkfotOQSk7ZUdoC/L/zEgwIR5Rg==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr8876623wrs.92.1576753167174;
 Thu, 19 Dec 2019 02:59:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a1sm5967336wrr.80.2019.12.19.02.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:59:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D2E81FFAC;
 Thu, 19 Dec 2019 10:49:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 22/25] linux-user: log page table changes under -d page
Date: Thu, 19 Dec 2019 10:49:31 +0000
Message-Id: <20191219104934.866-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219104934.866-1-alex.bennee@linaro.org>
References: <20191219104934.866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPU_LOG_PAGE flag is woefully underused and could stand to do
extra duty tracking page changes. If the user doesn't want to see the
details as things change they still have the tracepoints available.

We push the locking into log_page_dump and pass a reason for the
banner text.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191205122518.10010-5-alex.bennee@linaro.org>

diff --git a/include/exec/log.h b/include/exec/log.h
index 9bd1e4aa20b..fcc7b9e00ba 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -69,15 +69,14 @@ static inline void log_disas(void *code, unsigned long size)
 
 #if defined(CONFIG_USER_ONLY)
 /* page_dump() output to the log file: */
-static inline void log_page_dump(void)
+static inline void log_page_dump(const char *operation)
 {
-    QemuLogFile *logfile;
-    rcu_read_lock();
-    logfile = atomic_rcu_read(&qemu_logfile);
+    FILE *logfile = qemu_log_lock();
     if (logfile) {
-        page_dump(logfile->fd);
+        qemu_log("page layout changed following %s\n", operation);
+        page_dump(logfile);
     }
-    rcu_read_unlock();
+    qemu_log_unlock(logfile);
 }
 #endif
 #endif
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 470a8bf79ed..7f4e3cd6271 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -963,7 +963,7 @@ int main(int argc, char **argv)
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         qemu_log("guest_base  0x%lx\n", guest_base);
-        log_page_dump();
+        log_page_dump("binary load");
 
         qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
         qemu_log("end_code    0x" TARGET_ABI_FMT_lx "\n", info->end_code);
diff --git a/linux-user/main.c b/linux-user/main.c
index 6ff7851e86f..8718d03ee21 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -826,7 +826,7 @@ int main(int argc, char **argv, char **envp)
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         qemu_log("guest_base  0x%lx\n", guest_base);
-        log_page_dump();
+        log_page_dump("binary load");
 
         qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
         qemu_log("end_code    0x" TARGET_ABI_FMT_lx "\n", info->end_code);
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 0b1b43ac3c0..3d90fa459ca 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "trace.h"
+#include "exec/log.h"
 #include "qemu.h"
 
 //#define DEBUG_MMAP
@@ -539,10 +540,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     page_set_flags(start, start + len, prot | PAGE_VALID);
  the_end:
     trace_target_mmap_complete(start);
-#ifdef DEBUG_MMAP
-    page_dump(stdout);
-    printf("\n");
-#endif
+    if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
+        log_page_dump(__func__);
+    }
     tb_invalidate_phys_range(start, start + len);
     mmap_unlock();
     return start;
-- 
2.20.1


