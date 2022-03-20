Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456B4E1D11
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:19:41 +0100 (CET)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzDP-0000C6-Ua
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:19:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5j-0008Ju-0y
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:45 -0400
Received: from [2607:f8b0:4864:20::1030] (port=45828
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5h-0003Q6-9U
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:42 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so12524633pjl.4
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2ya2A1S2MCUsCKLp1XEUHbTLCi7pkZD7YHsJk5p0As=;
 b=iUwwjRQMsUrAZcnFxnhCZ+NMvTBPzOZQl/4LKpTwXCriBx3VVeBB/NBnpW+KS9BBpE
 CsbOgtX7zzjGFwYw0G8PnQLUO6fPOlZFGFRg1OHrLxcf9Y620M8tba5Udm3WS3bQwHoe
 lAJpfa8/Y/03sGoqBvjKPbHPGtYcdZMUpgt+m8i2QF6HQ+Lspp6uFTWcxw1Veo/t52d+
 IBBrpMZoTZm2obIKQkcpmIs/P/9e8BTfhecR9oy2lX7aZM2HpiPjRm77pYHexQ9PnMCn
 /ZG0sPf3l5ThlP8rPXi6/Expp5apAt3UMRt7KphL4hLGvuW85df0Zn+Lc3ggkUQwpvUR
 wcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b2ya2A1S2MCUsCKLp1XEUHbTLCi7pkZD7YHsJk5p0As=;
 b=MkOXPmISuEFhTANOotMsB0eHYWRQTqnI2ejeJFaVQlA1Lz6+ZniOHBGhZFtwmXZqNG
 fdTSWQ5i/1e4y4EgX7110cJXP/0OCnAlbXqfJLiNbBGGoWxrYV0OBRWhwmESL8je16/H
 2HrhYkaHEH84C5asgyS8Eo5lTmOP1w3BX/m4OVmoJjmSVs3JQ/TgLb1L90zh7SeDGV8s
 elUHl9jp2qJTqLslmYjeiVw2qoXAG7M59R3uNHm4DXWogTcfkVlB0qv4BdxhOVS6qU/M
 bVlo6laJKOkEN7V+KfBOwfctwK9mTpNTzmNVvMa1OTYKXb/tULNy5m0wyqPUGYZb9Hkf
 axXw==
X-Gm-Message-State: AOAM532DIXAjPz32giZxwjBAooZlq7rpihQ7rpJLjYW1pvdhhCbJ7YYv
 lh7jRTflvrbVXjN1nlL+TkYx28oJN98jYg==
X-Google-Smtp-Source: ABdhPJxEECvR/DJ96Pailr59ZrsfbTb75yR+EAhcVYaPlUF2QSyXgW1Gd4fQrfv+XXAwNEwqowPv7w==
X-Received: by 2002:a17:90b:4b4b:b0:1be:fd9a:c279 with SMTP id
 mi11-20020a17090b4b4b00b001befd9ac279mr32567083pjb.83.1647796299913; 
 Sun, 20 Mar 2022 10:11:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 03/36] util/log: Pass Error pointer to qemu_set_log
Date: Sun, 20 Mar 2022 10:11:02 -0700
Message-Id: <20220320171135.2704502-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Do not force exit within qemu_set_log.  Pass an Error
value back up the stack as per usual.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h                   |  2 +-
 bsd-user/main.c                      |  2 +-
 linux-user/main.c                    |  2 +-
 monitor/misc.c                       |  7 ++++++-
 qemu-img.c                           |  2 +-
 qemu-io.c                            |  2 +-
 qemu-nbd.c                           |  2 +-
 scsi/qemu-pr-helper.c                |  2 +-
 softmmu/vl.c                         |  4 ++--
 storage-daemon/qemu-storage-daemon.c |  2 +-
 tests/unit/test-logging.c            |  2 +-
 util/log.c                           | 10 +++++-----
 12 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 08b0cd0bb3..64f28785ae 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -147,7 +147,7 @@ typedef struct QEMULogItem {
 
 extern const QEMULogItem qemu_log_items[];
 
-void qemu_set_log(int log_flags);
+void qemu_set_log(int log_flags, Error **errp);
 void qemu_set_log_filename(const char *filename, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
 bool qemu_log_in_addr_range(uint64_t addr);
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 08f43af235..0c8aa1ae90 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -414,7 +414,7 @@ int main(int argc, char **argv)
             qemu_print_log_usage(stdout);
             exit(1);
         }
-        qemu_set_log(mask);
+        qemu_set_log(mask, &error_fatal);
     }
 
     if (optind >= argc) {
diff --git a/linux-user/main.c b/linux-user/main.c
index 2b06350688..6aed4929ab 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -679,7 +679,7 @@ int main(int argc, char **argv, char **envp)
 
     log_mask = last_log_mask | (enable_strace ? LOG_STRACE : 0);
     if (log_mask) {
-        qemu_set_log(log_mask);
+        qemu_set_log(log_mask, &error_fatal);
     }
 
     if (!trace_init_backends()) {
diff --git a/monitor/misc.c b/monitor/misc.c
index b1839cb8ee..8e8b8e18c7 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -429,6 +429,7 @@ static void hmp_log(Monitor *mon, const QDict *qdict)
 {
     int mask;
     const char *items = qdict_get_str(qdict, "items");
+    Error *err = NULL;
 
     if (!strcmp(items, "none")) {
         mask = 0;
@@ -439,7 +440,11 @@ static void hmp_log(Monitor *mon, const QDict *qdict)
             return;
         }
     }
-    qemu_set_log(mask);
+
+    qemu_set_log(mask, &err);
+    if (err) {
+        error_report_err(err);
+    }
 }
 
 static void hmp_singlestep(Monitor *mon, const QDict *qdict)
diff --git a/qemu-img.c b/qemu-img.c
index 5dffb3e616..498f6d3646 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5442,7 +5442,7 @@ int main(int argc, char **argv)
         exit(1);
     }
     trace_init_file();
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
     /* find the command */
     for (cmd = img_cmds; cmd->name != NULL; cmd++) {
diff --git a/qemu-io.c b/qemu-io.c
index 3924639b92..49957a980e 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -634,7 +634,7 @@ int main(int argc, char **argv)
         exit(1);
     }
     trace_init_file();
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
     /* initialize commands */
     qemuio_add_command(&quit_cmd);
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 713e7557a9..bf9c5fedce 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -804,7 +804,7 @@ int main(int argc, char **argv)
         exit(1);
     }
     trace_init_file();
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
     socket_activation = check_socket_activation();
     if (socket_activation == 0) {
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index f281daeced..1f2a84c534 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -1001,7 +1001,7 @@ int main(int argc, char **argv)
         exit(EXIT_FAILURE);
     }
     trace_init_file();
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
 #ifdef CONFIG_MPATH
     dm_init();
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0b81f61535..73296015af 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2569,9 +2569,9 @@ static void qemu_process_early_options(void)
             qemu_print_log_usage(stdout);
             exit(1);
         }
-        qemu_set_log(mask);
+        qemu_set_log(mask, &error_fatal);
     } else {
-        qemu_set_log(0);
+        qemu_set_log(0, &error_fatal);
     }
 
     qemu_add_default_firmwarepath();
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index dd18b2cde8..cdaf69f764 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -392,7 +392,7 @@ int main(int argc, char *argv[])
     if (!trace_init_backends()) {
         return EXIT_FAILURE;
     }
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
     qemu_init_main_loop(&error_fatal);
     process_options(argc, argv, false);
diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index ccb819f193..93c6d666e8 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -123,7 +123,7 @@ static void test_logfile_write(gconstpointer data)
      * In cases where a logging backend other than log is used,
      * this is needed.
      */
-    qemu_set_log(CPU_LOG_TB_OUT_ASM);
+    qemu_set_log(CPU_LOG_TB_OUT_ASM, &error_abort);
     file_path = g_build_filename(dir, "qemu_test_log_write0.log", NULL);
     file_path1 = g_build_filename(dir, "qemu_test_log_write1.log", NULL);
 
diff --git a/util/log.c b/util/log.c
index ffa66a267e..00773ab717 100644
--- a/util/log.c
+++ b/util/log.c
@@ -73,7 +73,7 @@ static void qemu_logfile_free(QemuLogFile *logfile)
 }
 
 /* enable or disable low levels log */
-void qemu_set_log(int log_flags)
+void qemu_set_log(int log_flags, Error **errp)
 {
     bool need_to_open_file = false;
     QemuLogFile *logfile;
@@ -103,9 +103,9 @@ void qemu_set_log(int log_flags)
         if (logfilename) {
             logfile->fd = fopen(logfilename, log_append ? "a" : "w");
             if (!logfile->fd) {
-                g_free(logfile);
-                perror(logfilename);
-                _exit(1);
+                error_setg_errno(errp, errno, "Error opening logfile %s",
+                                 logfilename);
+                return;
             }
             /* In case we are a daemon redirect stderr to logfile */
             if (is_daemonized()) {
@@ -159,7 +159,7 @@ void qemu_set_log_filename(const char *filename, Error **errp)
     }
 
     qemu_log_close();
-    qemu_set_log(qemu_loglevel);
+    qemu_set_log(qemu_loglevel, errp);
 }
 
 /* Returns true if addr is in our debug filter or no filter defined
-- 
2.25.1


