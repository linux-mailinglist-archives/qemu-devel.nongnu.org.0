Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905152805B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 11:07:19 +0200 (CEST)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWhC-0004Qg-Dy
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 05:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWcn-0001gu-8h
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWcl-0007MB-2D
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652691762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAz6VvdrSrO0UXQwBb7vQOWgH0WwFgWzQ436Eg4Z1QU=;
 b=Sp/Z60u2kl4wqrL1NdXbuVzdaKfzFNBt1yE44W6FC0bj6gB2H8LvgLQlXEVR6HbPC8x00q
 ane8dEVWr8p6RC+9NYXjH+JxMDPbJoKwz4SzKyThMoO/giQ1t1iV4L5fiYDZiJd4wbOyS/
 ITK/xkFDJETtBzhe0RMLBovxlolUc24=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-FwPeIZDtOa-2Mr-f5iNr_Q-1; Mon, 16 May 2022 05:02:41 -0400
X-MC-Unique: FwPeIZDtOa-2Mr-f5iNr_Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa15-20020a170907868f00b006f4c89bf2e3so5458810ejc.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 02:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KAz6VvdrSrO0UXQwBb7vQOWgH0WwFgWzQ436Eg4Z1QU=;
 b=NjCya/Dd1jgsJ6M5nnkZHzb2Kq5m3hKRrWR7YL+f1D/P9AH/qgQ7BdO3PTkkCWZc3o
 X8JnX/BEaWy8RJ2c9Z9P+/5PXW3BIieHYGlOeJM3FFxHEciDw85RMFxwPCiq8ycvysPy
 NjaYsZOP0HSNBc+a/aUCKX/xkqm0dz7FGKNA+aJyHPbgK9etlKxlIPPhN+qJSKKpULuP
 NrWKMQHxO5eVkgiBQvnl3iXeIGeLM8ZFWI9MEdSz7m1hEDFtB+exuJGjZnVN7PjZvxap
 bIrPYIDooOPhF5egwBNLefs2bAjp1SAuL45bPChSaTxCU26QeC9peFcHD+pu4UumAIxF
 hZxg==
X-Gm-Message-State: AOAM533cQbF/+isBCOFd6qhkwq7//r2K069dR6BSLQAxFu/h/TVp3cUT
 JgRX/mUqx/ckz63btp8Ww+v+krr9c+bPaQzzpIUgcpuILtwQCu6kpZi5W3inwW5nb5GyH5QrgqJ
 OmFSatZXW/f2pQm5tOq+Pa1o0+UYUsYlf4FyDKQhHqpVpGjf+pVaqbR6P43vvpq17g7U=
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id
 jg9-20020a170907970900b006fdc0e1c86bmr13790703ejc.600.1652691759594; 
 Mon, 16 May 2022 02:02:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkN8/j19WIBqBTjsBY3MNmxmXyTepAAjg3tYwhRfdTEqvzdDYHbsalJ21HJjT6HC1SpQU27Q==
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id
 jg9-20020a170907970900b006fdc0e1c86bmr13790678ejc.600.1652691759314; 
 Mon, 16 May 2022 02:02:39 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a0564020f1900b0042ab1735552sm1359586eda.66.2022.05.16.02.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 02:02:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, dgilbert@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH v3 3/8] qmp: add filtering of statistics by target vCPU
Date: Mon, 16 May 2022 11:02:29 +0200
Message-Id: <20220516090234.1195907-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516090058.1195767-1-pbonzini@redhat.com>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c     |  9 +++++++--
 include/monitor/stats.h |  9 ++++++++-
 monitor/qmp-cmds.c      | 34 +++++++++++++++++++++++++++++++++-
 qapi/stats.json         | 20 +++++++++++++++++---
 4 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 6a6bbe2994..28f8a45205 100644
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
@@ -4049,7 +4050,8 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
     close(stats_fd);
 }
 
-static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp)
+static void query_stats_cb(StatsResultList **result, StatsTarget target,
+                           strList *targets, Error **errp)
 {
     KVMState *s = kvm_state;
     CPUState *cpu;
@@ -4073,6 +4075,9 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target, Error *
         stats_args.result.stats = result;
         stats_args.errp = errp;
         CPU_FOREACH(cpu) {
+            if (!str_in_list(cpu->parent_obj.canonical_path, targets)) {
+                continue;
+            }
             run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
         }
         break;
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index 89552ab06f..92a1df3072 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -10,7 +10,8 @@
 
 #include "qapi/qapi-types-stats.h"
 
-typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target, Error **errp);
+typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
+                              strList *targets, Error **errp);
 typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
 
 /*
@@ -30,4 +31,10 @@ void add_stats_entry(StatsResultList **, StatsProvider, const char *id,
 void add_stats_schema(StatsSchemaList **, StatsProvider, StatsTarget,
                       StatsSchemaValueList *);
 
+/*
+ * True if a string matches the filter passed to the stats_fn callabck,
+ * false otherwise.
+ */
+bool str_in_list(const char *string, strList *list);
+
 #endif /* STATS_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index d83faeca88..1ec7409bc2 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -463,13 +463,30 @@ void add_stats_callbacks(StatRetrieveFunc *stats_fn,
     QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
 }
 
+static strList *stats_target_filter(StatsFilter *filter)
+{
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+        return NULL;
+    case STATS_TARGET_VCPU:
+        if (!filter->u.vcpu.has_vcpus) {
+            return NULL;
+        }
+        return filter->u.vcpu.vcpus;
+        break;
+    default:
+        abort();
+    }
+}
+
 StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
 {
     StatsResultList *stats_results = NULL;
+    strList *targets = stats_target_filter(filter);
     StatsCallbacks *entry;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        entry->stats_cb(&stats_results, filter->target, errp);
+        entry->stats_cb(&stats_results, filter->target, targets, errp);
     }
 
     return stats_results;
@@ -512,3 +529,18 @@ void add_stats_schema(StatsSchemaList **schema_results,
     entry->stats = stats_list;
     QAPI_LIST_PREPEND(*schema_results, entry);
 }
+
+bool str_in_list(const char *string, strList *list)
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
index 382223e197..859fc0f459 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -68,16 +68,30 @@
 { 'enum': 'StatsTarget',
   'data': [ 'vm', 'vcpu' ] }
 
+##
+# @StatsVCPUFilter:
+#
+# @vcpus: list of QOM paths for the desired vCPU objects.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsVCPUFilter',
+  'data': { '*vcpus': [ 'str' ] } }
+
 ##
 # @StatsFilter:
 #
 # The arguments to the query-stats command; specifies a target for which to
-# request statistics.
+# request statistics and optionally the required subset of information for
+# that target:
+# - which vCPUs to request statistics for
 #
 # Since: 7.1
 ##
-{ 'struct': 'StatsFilter',
-  'data': { 'target': 'StatsTarget' } }
+{ 'union': 'StatsFilter',
+        'base': { 'target': 'StatsTarget' },
+  'discriminator': 'target',
+  'data': { 'vcpu': 'StatsVCPUFilter' } }
 
 ##
 # @StatsValue:
-- 
2.36.0


