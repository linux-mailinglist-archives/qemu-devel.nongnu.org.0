Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7DF3BDDED
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 21:17:20 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0qZL-0003gh-RG
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 15:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m0qXP-00031V-I9
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:15:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m0qXN-0003vr-DY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:15:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q17so245604wrv.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 12:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SPMyOq5Wvvo3dgH6djgGwx1IYio9YYNItPb4BKshS6Q=;
 b=pSez69BkoHBvOFGXH8HueSlwD/cdS/uS6uSasqsUIg5bi7rvlvQhth19H3sJSr34zs
 F5gll8/S5pQcc4mPjZXz6W+K+0HntGWWSQgOwDDVvP1kOwz1X8iWKYqGTjZjm0dBy0p4
 n1LMToZOY8+E43VHsHtNweAoBN1DFXrMCCGGfwJ4l8xwm6XmFXNIzRpZvqixlrm+oYqD
 oPpoU3wxZ4Y+VSW7I3I2d0Suj+4b4NASbcOtktqufEazneVIEC0YIxInJ8zSpMpSQVKS
 tlVQK2FfWvcOoJYFaRIewaDCAW2rTK9uEA6WtGDDyi7ctg7lKNeoUmTsEEG+13YLGBCm
 5asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SPMyOq5Wvvo3dgH6djgGwx1IYio9YYNItPb4BKshS6Q=;
 b=JyxhfYbbWCVQS/oWrgBX4IdnZ+y2m5crHfvPqQyiZvNheVed39rpSCdnMi6zn7tWf1
 MeaGEyIpeRauVK3KE7Y+lQfcnSsJV4ANuN4DnmLjihtGpHlhBm6DL236CdEmQfn2leOr
 /vQUf1KOrZYtoWqmouZT7IXt/hjqZBaMvLkifJlyUtCbXVoCF6aWEdQUBufUdSiWi4bq
 L/VW1OSEDX9iOj7NRJldoOgW69zAKbErxFVBcWvjdVLjmssYMsBOOMzYpILFm5duKXNW
 eV2BAiRtFSkU9DDGDaSHn0PD/m7Bf8VVLdjZQY4OLkzqtHGWX3GqF3PEUpzmkdt73ua5
 gkaA==
X-Gm-Message-State: AOAM532dEvu4cOMBxfROSxsVEfYFvqdPOKU/77C/6WvSlQy6mk4Vj0Xf
 n6rrTizqISi8qpbewV7cPzA=
X-Google-Smtp-Source: ABdhPJwbMpohsJ+1nrLqGDaL17HEB+Mbc2I5IuuSXn+rCO/gR0XyWWEqwzLX6nm77mRawwiWV3CQhQ==
X-Received: by 2002:a5d:644c:: with SMTP id d12mr5997538wrw.129.1625598914444; 
 Tue, 06 Jul 2021 12:15:14 -0700 (PDT)
Received: from lb01556.speedport.ip
 (p200300f11706da9e87913749ebbd0132.dip0.t-ipconnect.de.
 [2003:f1:1706:da9e:8791:3749:ebbd:132])
 by smtp.gmail.com with ESMTPSA id p3sm3791522wmq.17.2021.07.06.12.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 12:15:14 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
X-Google-Original-From: Li Zhang <li.zhang@ionos.com>
To: armbru@redhat.com, marcandre.lureau@gmail.com,
 pankaj.gupta.linux@gmail.com, qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] qmp: Support chardev-change for QMP device
Date: Tue,  6 Jul 2021 21:14:51 +0200
Message-Id: <20210706191452.127893-1-li.zhang@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=zhlcindy@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <li.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some scenarios, we'd like to hot-add a monitor device.  But QEMU
doesn't support that, yet.  It does support hot-swapping character
backends with QMP command chardev-change.  This lets us pre-add a
monitor with a null character backend, then chardev-change to a
socket backend.  Except the chardev-change fails with "Chardev user
does not support chardev hotswap" because monitors don't provide the
required callback.  Implement it for QMP monitors.

Signed-off-by: Li Zhang <li.zhang@ionos.com>
---
v3 -> v2: 
  * rework the patch according.
  * refactor the source code of chardev.

 monitor/monitor-internal.h |  1 +
 monitor/monitor.c          |  4 +-
 monitor/qmp.c              | 83 +++++++++++++++++++++++++++-----------
 3 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 9c3a09cb01..162f73119b 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -182,5 +182,6 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name);
 void help_cmd(Monitor *mon, const char *name);
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
 int hmp_compare_cmd(const char *name, const char *list);
+void monitor_flush_locked(Monitor *mon);
 
 #endif
diff --git a/monitor/monitor.c b/monitor/monitor.c
index b90c0f4051..1b05ef3bdb 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -154,8 +154,6 @@ static inline bool monitor_is_hmp_non_interactive(const Monitor *mon)
     return !monitor_uses_readline(container_of(mon, MonitorHMP, common));
 }
 
-static void monitor_flush_locked(Monitor *mon);
-
 static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
                                   void *opaque)
 {
@@ -169,7 +167,7 @@ static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
 }
 
 /* Caller must hold mon->mon_lock */
-static void monitor_flush_locked(Monitor *mon)
+void monitor_flush_locked(Monitor *mon)
 {
     int rc;
     size_t len;
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527b6f..92c704373f 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -46,6 +46,8 @@ struct QMPRequest {
 typedef struct QMPRequest QMPRequest;
 
 QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
+static void monitor_qmp_setup_handlers_bh(void *opaque);
+static void monitor_backend_init(MonitorQMP *mon, Chardev *chr);
 
 static bool qmp_oob_enabled(MonitorQMP *mon)
 {
@@ -481,6 +483,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
     g_queue_free(mon->qmp_requests);
 }
 
+static bool mointor_in_list(Monitor *mon)
+{
+    Monitor *mon_tmp;
+    QTAILQ_FOREACH(mon_tmp, &mon_list, entry) {
+        if (mon_tmp == mon) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static int monitor_qmp_change(void *opaque)
+{
+    MonitorQMP *mon = opaque;
+
+    monitor_data_init(&mon->common, true, false,
+            qemu_chr_has_feature(mon->common.chr.chr,
+                                 QEMU_CHAR_FEATURE_GCONTEXT));
+    monitor_backend_init(mon, mon->common.chr.chr);
+    qemu_mutex_lock(&mon->common.mon_lock);
+    if (mon->common.out_watch) {
+        mon->common.out_watch = 0;
+        monitor_flush_locked(&mon->common);
+    }
+    qemu_mutex_unlock(&mon->common.mon_lock);
+
+    return 0;
+}
+
 static void monitor_qmp_setup_handlers_bh(void *opaque)
 {
     MonitorQMP *mon = opaque;
@@ -491,30 +522,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
     assert(context);
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                              monitor_qmp_read, monitor_qmp_event,
-                             NULL, &mon->common, context, true);
-    monitor_list_append(&mon->common);
+                             monitor_qmp_change, &mon->common, context, true);
+
+    if (!mointor_in_list(&mon->common))
+        monitor_list_append(&mon->common);
 }
 
-void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
+static void monitor_backend_init(MonitorQMP *mon, Chardev *chr)
 {
-    MonitorQMP *mon = g_new0(MonitorQMP, 1);
-
-    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
-        g_free(mon);
-        return;
-    }
-    qemu_chr_fe_set_echo(&mon->common.chr, true);
-
-    /* Note: we run QMP monitor in I/O thread when @chr supports that */
-    monitor_data_init(&mon->common, true, false,
-                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
-
-    mon->pretty = pretty;
-
-    qemu_mutex_init(&mon->qmp_queue_lock);
-    mon->qmp_requests = g_queue_new();
-
-    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
     if (mon->common.use_io_thread) {
         /*
          * Make sure the old iowatch is gone.  It's possible when
@@ -532,7 +547,29 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
     } else {
         qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                                  monitor_qmp_read, monitor_qmp_event,
-                                 NULL, &mon->common, NULL, true);
-        monitor_list_append(&mon->common);
+                                 monitor_qmp_change, &mon->common, NULL, true);
+        if (!mointor_in_list(&mon->common)) {
+            monitor_list_append(&mon->common);
+        }
+    }
+}
+
+void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
+{
+    MonitorQMP *mon = g_new0(MonitorQMP, 1);
+
+    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
+        g_free(mon);
+        return;
     }
+    qemu_chr_fe_set_echo(&mon->common.chr, true);
+     /* Note: we run QMP monitor in I/O thread when @chr supports that */
+    monitor_data_init(&mon->common, true, false,
+                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
+
+    mon->pretty = pretty;
+    qemu_mutex_init(&mon->qmp_queue_lock);
+    mon->qmp_requests = g_queue_new();
+    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
+    monitor_backend_init(mon, chr);
 }
-- 
2.25.1


