Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED86396A85
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 02:58:54 +0200 (CEST)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnsk9-0004xY-9b
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 20:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lnsif-0004Gt-VP
 for qemu-devel@nongnu.org; Mon, 31 May 2021 20:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lnsib-0007XL-Lw
 for qemu-devel@nongnu.org; Mon, 31 May 2021 20:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622509034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cPOmeDay+Uid0UT6ncOBF5u4MoM2pJYOaSyuuLRfha4=;
 b=clE9s5iiaVhvQuMs1r/a/ond85foq0YDPywgo/cw9tu1e8TeYdhKvy29phmjx6ELpKGEeu
 tr6SfEgdpILqW0dlZt1uyu9UBNyko6EXoDEoG/7aiC0sJI1mD07qpR/fBLZXU8C0zqOi4V
 zP9hpb932ghS58vWaL/2vO529u7EdMU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-bx2rSC4EOeeUPGcb0Hw1og-1; Mon, 31 May 2021 20:57:12 -0400
X-MC-Unique: bx2rSC4EOeeUPGcb0Hw1og-1
Received: by mail-qk1-f199.google.com with SMTP id
 k125-20020a3788830000b02903a65618d46cso10595490qkd.3
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 17:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPOmeDay+Uid0UT6ncOBF5u4MoM2pJYOaSyuuLRfha4=;
 b=gYjacptiKDDEAqW7OfITInamYoAsiWkZuy78b3pXq7x3STxlQ+aZUV78fPD2yOt1iC
 ipXQ3U1XnbfKCoOy3HbiFJJg8SmWoV2UbRrgpm5KPRzsqmwkCBGhzXiZ7nxlyV7GS7Uq
 uIaoN3UhawGFtg5uP8IvjGRHXWlpPryLdtd2AM3DHglHf8+yy1mKrtMh2osmuem9rK+I
 cirlf7VKFih7hiiyYVNSxitf+pZ52awOVzPQzJd7QCXmC0oun5D526u4U52hhQuI2ZiU
 bVqN0GnOBPc6+HPGY1bKTwpAq/ZwMukhxCofNlkb3P4co+PocDFwyDGcRf/Oeb+bk13G
 w+bw==
X-Gm-Message-State: AOAM530TA7zEB5H5C2QT1XwxE1/af1xuxF0xbWfpyPTADyMbrLAA05KU
 mitpzv9izbLkyMyHUv7CvTJzsu3X4gU5Vu88XYitKfHE1JwMR+gtulAy4CHcJRsInN2uf1FllVA
 qqVsBdMSIJF5u2/qHji7ZU/dgNvK9Jug3BXnvOmB3tYr/9kr3kuWKnLf3zyR2Fy3f
X-Received: by 2002:a05:6214:2486:: with SMTP id
 gi6mr19651254qvb.54.1622509031738; 
 Mon, 31 May 2021 17:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxwyrsq+sQiutpS8twYLYn34SRQrpZXE7q17woyT0VjM0HiH7DOGp0J38tqGZRAtuolmSf0A==
X-Received: by 2002:a05:6214:2486:: with SMTP id
 gi6mr19651234qvb.54.1622509031469; 
 Mon, 31 May 2021 17:57:11 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id 11sm9569908qtt.0.2021.05.31.17.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 17:57:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Date: Mon, 31 May 2021 20:57:08 -0400
Message-Id: <20210601005708.189888-1-peterx@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
PS: I really doubt whether this is working as expected... I ran one 200MB/s
workload inside, what I measured is 20MB/s with current algorithm...  Sampling
512 pages out of 1G mem is not wise enough I guess, especially that assumes
dirty workload is spread across the memories while it's normally not the case..
---
 hmp-commands-info.hx  | 13 +++++++++++++
 hmp-commands.hx       | 14 ++++++++++++++
 include/monitor/hmp.h |  2 ++
 migration/dirtyrate.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)

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
index 2d21fe5ad42..4c27fb91f7d 100644
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
+        .args_type  = "second:l",
+        .params     = "second",
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
index ccb98147e89..382287d2912 100644
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
@@ -424,3 +427,43 @@ struct DirtyRateInfo *qmp_query_dirty_rate(Error **errp)
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
+    Error *err = NULL;
+
+    if (!sec) {
+        monitor_printf(mon, "Incorrect period length specified!\n");
+        return;
+    }
+
+    qmp_calc_dirty_rate(sec, &err);
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


