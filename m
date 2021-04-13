Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7168935E878
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:43:26 +0200 (CEST)
Received: from localhost ([::1]:36694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQof-00087k-JD
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lWQj4-0003cH-Or
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 17:37:38 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lWQj3-0004iv-0G
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 17:37:38 -0400
Received: by mail-ej1-x631.google.com with SMTP id sd23so19584474ejb.12
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 14:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W50uX0dCNDEYZHalmkoWYmTgC/qjNx6tggnAP/NW/KQ=;
 b=lnCd8D3CiEh2szSsZlmuIXVdDDBTvtEK0WIkbUevN9ppaiqFEx3FCzZVIQ1F0l+MWx
 1ugZkTINXLHrLQGSoTvoTMuyS3yMGKlqWAZpaVYnReG4oSUWomrvtqsSQo0J3mFW9xZU
 A/gR5SAixgp6EhEvbzQerAjCfRi6TPMAQzVy7TizqkthUdqKzxD5EA+i7xsjYDyCvYcY
 xIagSF42FKN7dSCeNq6dIuSGZUL3SYyh4Y7we7ZuaG9sMRObjiBBF3npa8z9VfMfnwP/
 6PaNBibVwy5VRXKLcHWH/D1g3Y/CkkUy2SngOuU+DtYLKE02DKmZBbhCVZLSDZQnLGUq
 zSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W50uX0dCNDEYZHalmkoWYmTgC/qjNx6tggnAP/NW/KQ=;
 b=JScD8wLq7SrDWqpo+J1EK5qzOsM7jOvXJicnbkZ4YQh4VOttIuKEngTVOcMkzTccFE
 i8U1q4Rx7PMZq1RYRhlV8uUmj9THEoeXveMHQ7ZpZgKAql4iZbgENn8junKdt4Al7cKL
 wArr3yxuUiSJubxzr08FRMK7B3kKIsjmZ5/QszQJ+gTGlNDNVc/N0m6gpYZZnmbSeMd1
 QWuug0FhOMCgExneFoQzeVB8GRw3gZYD9PLJH3voTy+PkHQG/FCbDRJvRmjsmsCT0rC3
 p1NWMWLxIk7C0khtpQgNOWtUan6jXEy9cvYhrSP/LR72dd2dnmU7cbMSHssYSzvqLd22
 wjsA==
X-Gm-Message-State: AOAM530p3Oo99tB3/ugsiuLyZgtwVvZH0kFO3sHYIV7v73fWnLrjZoow
 wLXqsFQN9hAzZLudj9OGwJQ=
X-Google-Smtp-Source: ABdhPJyeTv6qrlgJPq6R98dUPYaMOcaCNbyrFiwQRo5vLjwGc0KPdQHlhIqYFu217q5PXUCZ31SmyQ==
X-Received: by 2002:a17:906:3a94:: with SMTP id
 y20mr33760348ejd.35.1618349855525; 
 Tue, 13 Apr 2021 14:37:35 -0700 (PDT)
Received: from lb01556.fkb.profitbricks.net
 (p200300f1170c097a386b1fde7953cb78.dip0.t-ipconnect.de.
 [2003:f1:170c:97a:386b:1fde:7953:cb78])
 by smtp.gmail.com with ESMTPSA id k16sm7687467ejv.37.2021.04.13.14.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 14:37:34 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
X-Google-Original-From: Li Zhang <li.zhang@cloud.ionos.com>
To: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
Date: Tue, 13 Apr 2021 23:34:59 +0200
Message-Id: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=zhlcindy@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>, Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some scenarios, it needs to hot-add a monitor device.
But QEMU doesn't support hotplug yet. It also works by adding
a monitor with null backend by default and then change its
backend to socket by QMP command "chardev-change".

So this patch is to support monitor chardev hotswap with QMP.

Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 v1 -> v2: 
  - Change mutex lock mon_lock section
  - Fix indentation problems

 monitor/monitor-internal.h |  3 +++
 monitor/monitor.c          |  2 +-
 monitor/qmp.c              | 43 +++++++++++++++++++++++++++++++++++---
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 9c3a09cb01..1b80c74883 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -183,4 +183,7 @@ void help_cmd(Monitor *mon, const char *name);
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
 int hmp_compare_cmd(const char *name, const char *list);
 
+gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
+                           void *opaque);
+
 #endif
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 636bcc81c5..16a3620d02 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive(const Monitor *mon)
 
 static void monitor_flush_locked(Monitor *mon);
 
-static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
+gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
                                   void *opaque)
 {
     Monitor *mon = opaque;
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 2b0308f933..5fa65401ae 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -44,6 +44,7 @@ struct QMPRequest {
     Error *err;
 };
 typedef struct QMPRequest QMPRequest;
+static void monitor_qmp_set_handlers_bh(void *opaque);
 
 QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
 
@@ -477,7 +478,36 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
     g_queue_free(mon->qmp_requests);
 }
 
-static void monitor_qmp_setup_handlers_bh(void *opaque)
+static int monitor_qmp_change(void *opaque)
+{
+    MonitorQMP *mon = opaque;
+
+    mon->common.use_io_thread = qemu_chr_has_feature(mon->common.chr.chr,
+                                QEMU_CHAR_FEATURE_GCONTEXT);
+
+    if (mon->common.use_io_thread) {
+        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread),
+                                monitor_qmp_set_handlers_bh, mon);
+    } else {
+        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
+                                 monitor_qmp_read, monitor_qmp_event,
+                                 monitor_qmp_change, &mon->common, NULL, true);
+    }
+
+    qemu_mutex_lock(&mon->common.mon_lock);
+    if (mon->common.out_watch) {
+        g_source_remove(mon->common.out_watch);
+        mon->common.out_watch = qemu_chr_fe_add_watch(&mon->common.chr,
+                                G_IO_OUT | G_IO_HUP,
+                                monitor_unblocked,
+                                &mon->common);
+    }
+    qemu_mutex_unlock(&mon->common.mon_lock);
+
+    return 0;
+}
+
+static void monitor_qmp_set_handlers_bh(void *opaque)
 {
     MonitorQMP *mon = opaque;
     GMainContext *context;
@@ -487,7 +517,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
     assert(context);
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                              monitor_qmp_read, monitor_qmp_event,
-                             NULL, &mon->common, context, true);
+                             monitor_qmp_change, &mon->common, context, true);
+
+}
+
+static void monitor_qmp_setup_handlers_bh(void *opaque)
+{
+    MonitorQMP *mon = opaque;
+    monitor_qmp_set_handlers_bh(mon);
     monitor_list_append(&mon->common);
 }
 
@@ -528,7 +565,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
     } else {
         qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                                  monitor_qmp_read, monitor_qmp_event,
-                                 NULL, &mon->common, NULL, true);
+                                 monitor_qmp_change, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
 }
-- 
2.25.1


