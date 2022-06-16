Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0954E54DD04
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:37:19 +0200 (CEST)
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l0A-0004Rp-3V
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvR-0001az-95
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvO-0002ne-HO
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYBRYiawYtP09jyU7ci5CXeY5D1qb2ObZJkrD/tnmFg=;
 b=NQPQp6JCXKfMB6a+6cgrP8x54yCsXB0OqP/kI67e+mM94w7iujrdIdQe/tjnbvsge7bdhy
 p4OZ0ooWU1wapiLTEzuqJSawY8s2Io9JMWmh+wvNSLe9l4JxRejuoHWHOo+qyp4+waCXwa
 0xrT6DWNGOLYchbQBpBjAE0Rl1VsYSc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-0tJRGMcVNwmri-IkR7da2A-1; Thu, 16 Jun 2022 04:32:19 -0400
X-MC-Unique: 0tJRGMcVNwmri-IkR7da2A-1
Received: by mail-ed1-f69.google.com with SMTP id
 cy18-20020a0564021c9200b0042dc7b4f36fso776788edb.4
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYBRYiawYtP09jyU7ci5CXeY5D1qb2ObZJkrD/tnmFg=;
 b=CzUYeUwHYsJc8YTL3+o2wN4vw5zRTs6Oav6eG9PhknLhojA0sj4+M29fxhlDXYmJIC
 6etjRQ9IIBX48dUMZL4Ky+XJHqG745uXrfYK7P+ia+wm9yNz6UdD2ZWpvnEP5x81EM4f
 /izxWh/9iIN+asl0dO8VP3ssWbpy4H+hYQ+INo1JsstC9uxT7XitTHw9snOCoJGYDTwD
 G4GIBHGoUQjAycyeFIQ2SLKv+xyj861yiQM1pfQWAffGiE9VMSz4+5aj69yebRzE8EJ7
 CQKoGdqzXVlTTv3wdTa6F4RU/IuOpGC40dDnBxcUHwPUmwqXpPzlOIoj8QGzvK1hQW2Y
 JMAw==
X-Gm-Message-State: AJIora9Z/wnldvKZrtlga5bCHogtQ8sJl9j9V5oK+QgBg9Wblluo/0AL
 tkv94d15qgfPpkUFdus055ladhssdnMdYngM5H+8HzzK4CUcZYovvwbFPHv/mPH9nERDTJ3jGGL
 VMhwQReTjY49V3ybwYlYjKzgVDatu8U59jl+Qi2QmzfF5dNewydwyW3TWjtggRpNTnzo=
X-Received: by 2002:a17:906:72cf:b0:712:20aa:46c7 with SMTP id
 m15-20020a17090672cf00b0071220aa46c7mr3392422ejl.768.1655368338278; 
 Thu, 16 Jun 2022 01:32:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tL4EtWeFyxV24Vsg9Fn0EMRtoBqVNno0SIa7pWTcqHzRpUT7xPIPMVqEcxaLXj70+Bi7yuPw==
X-Received: by 2002:a17:906:72cf:b0:712:20aa:46c7 with SMTP id
 m15-20020a17090672cf00b0071220aa46c7mr3392407ejl.768.1655368337964; 
 Thu, 16 Jun 2022 01:32:17 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a50ed04000000b004318ba244dcsm1291058eds.10.2022.06.16.01.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PULL 03/21] qmp: add filtering of statistics by target vCPU
Date: Thu, 16 Jun 2022 10:31:51 +0200
Message-Id: <20220616083209.117397-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a simple filtering of statistics, that allows to retrieve
statistics for a subset of the guest vCPUs.  This will be used for
example by the HMP monitor, in order to retrieve the statistics
for the currently selected CPU.

Example:
{ "execute": "query-stats",
  "arguments": {
    "target": "vcpu",
    "vcpus": [ "/machine/unattached/device[2]",
               "/machine/unattached/device[4]" ] } }

Extracted from a patch by Mark Kanda.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c     |  9 +++++++--
 include/monitor/stats.h | 11 ++++++++++-
 monitor/qmp-cmds.c      | 34 +++++++++++++++++++++++++++++++++-
 qapi/stats.json         | 24 +++++++++++++++++++-----
 4 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7cc9e33bab..547de842fd 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2311,7 +2311,8 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
-static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp);
+static void query_stats_cb(StatsResultList **result, StatsTarget target,
+                           strList *targets, Error **errp);
 static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
 
 static int kvm_init(MachineState *ms)
@@ -4038,7 +4039,8 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
     close(stats_fd);
 }
 
-static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp)
+static void query_stats_cb(StatsResultList **result, StatsTarget target,
+                           strList *targets, Error **errp)
 {
     KVMState *s = kvm_state;
     CPUState *cpu;
@@ -4062,6 +4064,9 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target, Error *
         stats_args.result.stats = result;
         stats_args.errp = errp;
         CPU_FOREACH(cpu) {
+            if (!apply_str_list_filter(cpu->parent_obj.canonical_path, targets)) {
+                continue;
+            }
             run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
         }
         break;
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index 912eeadb2f..8c50feeaa9 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -11,7 +11,7 @@
 #include "qapi/qapi-types-stats.h"
 
 typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
-                              Error **errp);
+                              strList *targets, Error **errp);
 typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
 
 /*
@@ -31,4 +31,13 @@ void add_stats_entry(StatsResultList **, StatsProvider, const char *id,
 void add_stats_schema(StatsSchemaList **, StatsProvider, StatsTarget,
                       StatsSchemaValueList *);
 
+/*
+ * True if a string matches the filter passed to the stats_fn callabck,
+ * false otherwise.
+ *
+ * Note that an empty list means no filtering, i.e. all strings will
+ * return true.
+ */
+bool apply_str_list_filter(const char *string, strList *list);
+
 #endif /* STATS_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a6ac8d7473..5f8f1e620b 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -468,9 +468,26 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
                             StatsFilter *filter,
                             Error **errp)
 {
+    strList *targets = NULL;
     ERRP_GUARD();
 
-    entry->stats_cb(stats_results, filter->target, errp);
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+        break;
+    case STATS_TARGET_VCPU:
+        if (filter->u.vcpu.has_vcpus) {
+            if (!filter->u.vcpu.vcpus) {
+                /* No targets allowed?  Return no statistics.  */
+                return true;
+            }
+            targets = filter->u.vcpu.vcpus;
+        }
+        break;
+    default:
+        abort();
+    }
+
+    entry->stats_cb(stats_results, filter->target, targets, errp);
     if (*errp) {
         qapi_free_StatsResultList(*stats_results);
         *stats_results = NULL;
@@ -536,3 +553,18 @@ void add_stats_schema(StatsSchemaList **schema_results,
     entry->stats = stats_list;
     QAPI_LIST_PREPEND(*schema_results, entry);
 }
+
+bool apply_str_list_filter(const char *string, strList *list)
+{
+    strList *str_list = NULL;
+
+    if (!list) {
+        return true;
+    }
+    for (str_list = list; str_list; str_list = str_list->next) {
+        if (g_str_equal(string, str_list->value)) {
+            return true;
+        }
+    }
+    return false;
+}
diff --git a/qapi/stats.json b/qapi/stats.json
index df7c4d886c..8c9abb57f1 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -70,15 +70,29 @@
   'data': [ 'vm', 'vcpu' ] }
 
 ##
-# @StatsFilter:
+# @StatsVCPUFilter:
 #
-# The arguments to the query-stats command; specifies a target for which to
-# request statistics.
+# @vcpus: list of QOM paths for the desired vCPU objects.
 #
 # Since: 7.1
 ##
-{ 'struct': 'StatsFilter',
-  'data': { 'target': 'StatsTarget' } }
+{ 'struct': 'StatsVCPUFilter',
+  'data': { '*vcpus': [ 'str' ] } }
+
+##
+# @StatsFilter:
+#
+# The arguments to the query-stats command; specifies a target for which to
+# request statistics and optionally the required subset of information for
+# that target:
+# - which vCPUs to request statistics for
+#
+# Since: 7.1
+##
+{ 'union': 'StatsFilter',
+        'base': { 'target': 'StatsTarget' },
+  'discriminator': 'target',
+  'data': { 'vcpu': 'StatsVCPUFilter' } }
 
 ##
 # @StatsValue:
-- 
2.36.1



