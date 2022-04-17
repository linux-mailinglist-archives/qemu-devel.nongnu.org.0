Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B77E504917
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:56:32 +0200 (CEST)
Received: from localhost ([::1]:57790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA4V-0007en-AB
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fK-0000PD-II
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:31 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fE-0001jc-3z
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso10875572pjv.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSJXBg/184u8r3uaJrOb0GqfAeU9RlxZON49hn1UzLA=;
 b=zHRI2GVEmflCky8UyVp4wHh2oZmcZMS72B5k6rZC88UPXnGyf2lNy/GWi05TAM8Xf/
 SAEtJ2MPLEt9RhHt9/vrpaB6PODGtfjn73r7DFQJJ+zf1dx8suUq5MrYzFCvmc4rIGAC
 0J3nyxzu4m1qwqEvmncUIEeNIbPzO34EJxr9NevAhphfeSOpSPaS7Blqpks5WUu98ZO9
 odqGX9LUyTZon90ttc2baWvz0cajqgFE9cQfaM2wDRzOyAXw0sUJczLirjj+h7iCHHt/
 +RFaDqy1dxEdpLzBsd4S2C/+cxE03jIS9re+z18LVlW8fsp4B2DssBgGznIAAt6p3O2l
 TzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSJXBg/184u8r3uaJrOb0GqfAeU9RlxZON49hn1UzLA=;
 b=i4vFITsCaXe9oVZA1Zlpe8LoA3N12qh7oDfGR/Mciu2vs/H4rSuI79J+O9ofsCHpVr
 nELbKWeeiMU0TFcCneydFrMqMcMKC/1DuBjviZYi6L8GXQo+Q8wZu/X8LAlTuDsd+d6B
 m2NWXkE7jt2f6RWGUpUA0ehXaB/OHQTFq4Td/tMGQD/4nIwIsCujUwlxYwE08YT975tC
 HL32jaRMeTXeqdR07qAz59gv+yuRG3ZgmXw2zcIHDffrwoXYeTvonndlcTNDL3gFjWRo
 M5S7DGCW/Kxd8KNVFfsk6b+IAbdkO7p5Zlg3ADJUd6iZ/qDyp/B0AtRZbgzgym88J6Wy
 v6ig==
X-Gm-Message-State: AOAM530R2ynGeWgVoFLEjc41cf9ezSdZ0CAVLsOch9VT8p471JoCg8OA
 fctmpXiLCtPsXRDPGRGmRbDHJvzhZG6W1A==
X-Google-Smtp-Source: ABdhPJwBEQEYnJmI9SwWjaR07DIy5GlnpKYol/hbwQO3kInVcUtoqNuh50Exw+U3FJPYksVhfcjs/A==
X-Received: by 2002:a17:90a:5647:b0:1d2:87a9:479a with SMTP id
 d7-20020a17090a564700b001d287a9479amr3444776pji.222.1650220221417; 
 Sun, 17 Apr 2022 11:30:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/39] util/log: Drop manual log buffering
Date: Sun, 17 Apr 2022 11:29:41 -0700
Message-Id: <20220417183019.755276-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This buffering was introduced during the Paleozoic: 9fa3e853531.

There has never been an explanation as to why we may not allow
glibc to allocate the file buffer itself.  We certainly have
many other uses of mmap and malloc during user-only startup,
so presumably whatever the issue was, it has been fixed during
the preceeding 18 years.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h |  1 -
 bsd-user/main.c    |  1 -
 linux-user/main.c  |  1 -
 util/log.c         | 21 ++++-----------------
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 5739c7e6d8..ed59ebd4a2 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -148,7 +148,6 @@ typedef struct QEMULogItem {
 extern const QEMULogItem qemu_log_items[];
 
 void qemu_set_log(int log_flags);
-void qemu_log_needs_buffers(void);
 void qemu_set_log_filename(const char *filename, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
 bool qemu_log_in_addr_range(uint64_t addr);
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 88d347d05e..08f43af235 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -405,7 +405,6 @@ int main(int argc, char **argv)
     }
 
     /* init debug */
-    qemu_log_needs_buffers();
     qemu_set_log_filename(log_file, &error_fatal);
     if (log_mask) {
         int mask;
diff --git a/linux-user/main.c b/linux-user/main.c
index fbc9bcfd5f..2b06350688 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -679,7 +679,6 @@ int main(int argc, char **argv, char **envp)
 
     log_mask = last_log_mask | (enable_strace ? LOG_STRACE : 0);
     if (log_mask) {
-        qemu_log_needs_buffers();
         qemu_set_log(log_mask);
     }
 
diff --git a/util/log.c b/util/log.c
index 2ee1500bee..ffa66a267e 100644
--- a/util/log.c
+++ b/util/log.c
@@ -72,8 +72,6 @@ static void qemu_logfile_free(QemuLogFile *logfile)
     g_free(logfile);
 }
 
-static bool log_uses_own_buffers;
-
 /* enable or disable low levels log */
 void qemu_set_log(int log_flags)
 {
@@ -121,29 +119,18 @@ void qemu_set_log(int log_flags)
             assert(!is_daemonized());
             logfile->fd = stderr;
         }
-        /* must avoid mmap() usage of glibc by setting a buffer "by hand" */
-        if (log_uses_own_buffers) {
-            static char logfile_buf[4096];
 
-            setvbuf(logfile->fd, logfile_buf, _IOLBF, sizeof(logfile_buf));
-        } else {
 #if defined(_WIN32)
-            /* Win32 doesn't support line-buffering, so use unbuffered output. */
-            setvbuf(logfile->fd, NULL, _IONBF, 0);
+        /* Win32 doesn't support line-buffering, so use unbuffered output. */
+        setvbuf(logfile->fd, NULL, _IONBF, 0);
 #else
-            setvbuf(logfile->fd, NULL, _IOLBF, 0);
+        setvbuf(logfile->fd, NULL, _IOLBF, 0);
 #endif
-            log_append = 1;
-        }
+        log_append = 1;
         qatomic_rcu_set(&qemu_logfile, logfile);
     }
 }
 
-void qemu_log_needs_buffers(void)
-{
-    log_uses_own_buffers = true;
-}
-
 /*
  * Allow the user to include %d in their logfile which will be
  * substituted with the current PID. This is useful for debugging many
-- 
2.25.1


