Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052F510047
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:21:06 +0200 (CEST)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njM3t-0004za-Ju
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzP-0005RQ-Pr
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzN-0005WG-BB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id bg25so10591064wmb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=blltVQxUfRMgB02brI2aMVLkDz9/5gETTf5irezxr4g=;
 b=jyS6MNO2bFiEUa8xFdvU+st823skqoviXfpDe6BUZKj+1CvcUYwlFbi8xZd0fXh8Jp
 bCQ2QFpDBGI7Q8dmZUHk4Udjghv2dPhKfUZsgUbtcdc4VtoumMvggoM4HGZmgaM+BfCk
 DDTt7UICEVjjLgddrJ5CdJznPLQqhGscaoCTHdTTb5jzGkpWeVuRX0sF192VPY6i0g0W
 UZit3ry2DH7uSp7rS8/+/f0AR69iPzfLPjTSxras0SWFYneXioFGNfG36djgAp88sJUD
 j45eERfyV2Nyvt4+Uk+A5feuuUD7BxlSYjHf8j8fSEBdLiPhNXffvCrXsCdBiqPvyUZt
 yTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=blltVQxUfRMgB02brI2aMVLkDz9/5gETTf5irezxr4g=;
 b=WVngQP3cfWVE1n+9U81gxHYHVba/UNSI8sBH1RCacSMA3gAJbkdUpZnfBuPBPPAJq8
 UIXz+Uitih+qGw7k26Z1HHb4zSdQzrWN5P71c92gmQA8/EVrfCKFMHaaRrJ24cEYMAtr
 Kv2JcwWb0sn9Nx8zFHFGApQ5gGXEVLkD1Hb7rz4IKB1nnUCePGgsqrERKBsfPzIpNmIi
 Ymb9AUSSZY4q7foc/jQRGo7F6YtNNR+atkJMDCpfUSIP+YBh8P96W08dU9TXqoV7EQsp
 0LtaMBAGKMzqX4utwldL3A7xKaHbiOWYqunGwitPqcKtcVHFTthdPdZ7qk38HDcTM5xV
 UTjQ==
X-Gm-Message-State: AOAM533uU9uvPikZm5VeJeDnFRZxdnPgnPw6YGQ58oAWI13T7tIbGB3Y
 vyWlU0WptvL+LltRDfBijrxJuL49aYAi0A==
X-Google-Smtp-Source: ABdhPJxhtYgS3c4Lz8CeGRlkzlLlbOdZSH5o/EuGwlhT29TlX1MWsbK6hjeqHdbmLhq3MCYdM5gV5A==
X-Received: by 2002:a05:600c:1d8b:b0:38e:c518:ccc4 with SMTP id
 p11-20020a05600c1d8b00b0038ec518ccc4mr21762775wms.54.1650982584042; 
 Tue, 26 Apr 2022 07:16:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm11206464wmr.13.2022.04.26.07.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:16:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] qmp: add filtering of statistics by target vCPU
Date: Tue, 26 Apr 2022 16:16:14 +0200
Message-Id: <20220426141619.304611-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426141619.304611-1-pbonzini@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com, armbru@redhat.com, dgilbert@redhat.com
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
 qapi/stats.json         | 16 ++++++++++++++--
 4 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4a753d4445..bfd81039a1 100644
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
index 97825b25fa..5e3f4c9685 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -448,13 +448,30 @@ void add_stats_callbacks(StatRetrieveFunc *stats_fn,
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
@@ -497,3 +514,18 @@ void add_stats_schema(StatsSchemaList **schema_results,
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
index bcc897258a..26ee69588f 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -65,6 +65,16 @@
 { 'enum': 'StatsTarget',
   'data': [ 'vm', 'vcpu' ] }
 
+##
+# @StatsVCPUFilter:
+#
+# @vcpus: list of qom paths for the desired vCPU objects.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsVCPUFilter',
+  'data': { '*vcpus': [ 'str' ] } }
+
 ##
 # @StatsFilter:
 #
@@ -73,8 +83,10 @@
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
2.35.1



