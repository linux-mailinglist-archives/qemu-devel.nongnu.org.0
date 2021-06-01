Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B5397548
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:19:30 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5Ev-0004vn-Ee
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo5Dj-00049D-VY
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:18:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo5Dg-0007gH-Cw
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622557091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U9y1YJWGNcrpuZ8ZMhwKwhTDXuccYSUdGdQqjB/Iau4=;
 b=XHe11R/Plfq8h8RS+DTUQUXN1PhbQAos7EzzKRFBAtu/Vu51xcpu5sJKDXQt/pLuYP3emI
 /aMdyjKImj5JfQ01KdrR22Ud6UUSW8oXyRlgOjmslqTMc8guCu4TqUQRBOzxkVB9XbcJv9
 H2VBpCEiWgij4uucr8vHYI7IDYUwU8o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-4FsovktqMGixtiF3NOrwcQ-1; Tue, 01 Jun 2021 10:18:10 -0400
X-MC-Unique: 4FsovktqMGixtiF3NOrwcQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 a12-20020ac8108c0000b029023c90fba3dcso1849379qtj.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 07:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U9y1YJWGNcrpuZ8ZMhwKwhTDXuccYSUdGdQqjB/Iau4=;
 b=ItISRInpxPe9OfvIB2vMTI4fjwu3y86z0ysJH04crWMHKQjse8qy7hNbWhzh5k6H91
 iHZoShg0gZVKWer/0SDZKcfeK2loe6yYFRBkrmfTNdk76SD88dWM48M10skf41FwkaB7
 qbCV3pl0vIh3ZHZJdOe+C4l7fvQnJRjPZdS7BjAR97axf3kslZyf0EQl4V5Q901sBG3R
 ccS9fj+5YC2THP2f3Mz/Kwz+m1/wEJ7AAUQK1EAuNroGvv1+YxF+2j9grz7TCX0TUIGP
 k6rITcurNWzYGKKkPwywolcoM9kHmcAiTSBtuy5lkSy6UpstGUdnpHUq+2RXyIbSB8Xz
 KAVA==
X-Gm-Message-State: AOAM531tfoCgEYCQlKWirk7YBqGS0lejwhirePn1tCYQfQSSqtPi2urq
 hvYCzdp6JwsBIw4ogMBg6zXpJCoKjjnf543WGAuqODJoC6JXwaawsalrxV+g3DACjTWh8WifW61
 UlGqsN8OHh+QISgQyScOWbFweFQ3/jr0IpaQOlHRpVUOB1OcEUcQfl/Q5HC2EUfOq
X-Received: by 2002:a37:2751:: with SMTP id n78mr2635630qkn.242.1622557088914; 
 Tue, 01 Jun 2021 07:18:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6wGoezkGGYlwFdtEEQ7hWu4ejIzqdHiehojbJpVyDGTBH2bqOaSBsNXoT67RrGUyRj/GcJw==
X-Received: by 2002:a37:2751:: with SMTP id n78mr2635597qkn.242.1622557088588; 
 Tue, 01 Jun 2021 07:18:08 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id c68sm10535451qkd.112.2021.06.01.07.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:18:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Date: Tue,  1 Jun 2021 10:18:05 -0400
Message-Id: <20210601141805.206582-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, huangy81@chinatelecom.cn,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Chuan Zheng <zhengchuan@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two commands are missing when adding the QMP sister commands.  Add them,
so developers can play with them easier.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: Chuan Zheng <zhengchuan@huawei.com>
Cc: huangy81@chinatelecom.cn
Signed-off-by: Peter Xu <peterx@redhat.com>
---
v2:
- rebase to "migration/dirtyrate: make sample page count configurable"
---
 hmp-commands-info.hx  | 13 ++++++++++++
 hmp-commands.hx       | 14 +++++++++++++
 include/monitor/hmp.h |  2 ++
 migration/dirtyrate.c | 47 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ab0c7aa5eea..f8a9141dd8a 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -880,3 +880,16 @@ SRST
   ``info replay``
     Display the record/replay information: mode and the current icount.
 ERST
+
+    {
+        .name       = "dirty_rate",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show dirty rate information",
+        .cmd        = hmp_info_dirty_rate,
+    },
+
+SRST
+  ``info dirty_rate``
+    Display the vcpu dirty rate information.
+ERST
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 2d21fe5ad42..84dcc3aae6c 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1727,3 +1727,17 @@ ERST
         .flags      = "p",
     },
 
+SRST
+``calc_dirty_rate`` *second*
+  Start a round of dirty rate measurement with the period specified in *second*.
+  The result of the dirty rate measurement may be observed with ``info
+  dirty_rate`` command.
+ERST
+
+    {
+        .name       = "calc_dirty_rate",
+        .args_type  = "second:l,sample_pages_per_GB:l?",
+        .params     = "second [sample_pages_per_GB]",
+        .help       = "start a round of guest dirty rate measurement",
+        .cmd        = hmp_calc_dirty_rate,
+    },
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 605d57287ae..3baa1058e2c 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -129,5 +129,7 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
+void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
+void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 2ee3890721a..320c56ba2c4 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -20,6 +20,9 @@
 #include "ram.h"
 #include "trace.h"
 #include "dirtyrate.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qmp/qdict.h"
 
 static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
 static struct DirtyRateStat DirtyStat;
@@ -447,3 +450,47 @@ struct DirtyRateInfo *qmp_query_dirty_rate(Error **errp)
 {
     return query_dirty_rate_info();
 }
+
+void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
+{
+    DirtyRateInfo *info = query_dirty_rate_info();
+
+    monitor_printf(mon, "Status: %s\n",
+                   DirtyRateStatus_str(info->status));
+    monitor_printf(mon, "Start Time: %"PRIi64" (ms)\n",
+                   info->start_time);
+    monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
+                   info->sample_pages);
+    monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
+                   info->calc_time);
+    monitor_printf(mon, "Dirty rate: ");
+    if (info->has_dirty_rate) {
+        monitor_printf(mon, "%"PRIi64" (MB/s)\n", info->dirty_rate);
+    } else {
+        monitor_printf(mon, "(not ready)\n");
+    }
+    g_free(info);
+}
+
+void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
+{
+    int64_t sec = qdict_get_try_int(qdict, "second", 0);
+    int64_t sample_pages = qdict_get_try_int(qdict, "sample_pages_per_GB", -1);
+    bool has_sample_pages = (sample_pages != -1);
+    Error *err = NULL;
+
+    if (!sec) {
+        monitor_printf(mon, "Incorrect period length specified!\n");
+        return;
+    }
+
+    qmp_calc_dirty_rate(sec, has_sample_pages, sample_pages, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "Starting dirty rate measurement with period %"PRIi64
+                   " seconds\n", sec);
+    monitor_printf(mon, "[Please use 'info dirty_rate' to check results]\n");
+}
-- 
2.31.1


