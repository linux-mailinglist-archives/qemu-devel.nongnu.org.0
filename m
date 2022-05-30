Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2B5383DD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:12:08 +0200 (CEST)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvh3w-0007vc-1u
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzS-0003SD-9w
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzQ-00062Q-EO
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653923247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hBfkLTsOFcjpKyvtt2m+92TbfqNjDtmmZ3ChO4WnYVE=;
 b=XAeemTNUt9XApZhDMuLgFm80toh8o/3/jT2hue67W+InXvgqBR/ag7Omg62D5UKu6zWdtj
 41qpYI6W7PazDiXRi6n2flSwrpDSGu+UT9GDshx9DjvLV6TSpAvmVOP0YC43Cuw+Te8AcN
 Qxbanf3lFMfsShQ8Q3yKIf7oYrPDzpQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-8q08FzzHP_modCDDl8q0Ew-1; Mon, 30 May 2022 11:07:26 -0400
X-MC-Unique: 8q08FzzHP_modCDDl8q0Ew-1
Received: by mail-wr1-f70.google.com with SMTP id
 g22-20020adfa496000000b002101fcd7c86so1019278wrb.11
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBfkLTsOFcjpKyvtt2m+92TbfqNjDtmmZ3ChO4WnYVE=;
 b=nW7AulHmnHYQRBPgpC6o6UgcJ7eMUGc7e5cXR7OSC/2xZ9Y83twkqz2OdMwFdvROJL
 gUGVmTlRqqhqTmvkYjT/xLFKo2+0pd/v6BZ7Nht4UxNpys4jGsac5oUt272JjdlS6a37
 64wx/5p9sFvuMHZCulLD5f1CGxxpPWrYvtP92M/xknvuJk1XCOIpLqTpt9CHQjKRZzdg
 vW9RcexItZfa+Ot5Dao9lmkFaS/fS6PYc6EZfJx6HjhUYKvINKD1LFC3+/4EmKmRaWSA
 DHHp3tk9uyFciHmHwdXYyh25Z5Cg62calFC8ZhfGTmcvpZ1m2nFyJA1Oz2zjLrH42BF+
 n7bQ==
X-Gm-Message-State: AOAM530WulxnUxWTTs4d4sDTpFek5Bktlx72fIWc6paApM8PTCfdGpKW
 un0GImVhuPbOu/uzjOi7AWk+gjDl/7LHFixUsYEeyqQ8RbV6L+a2/BVRs3MHEvLcb0G7WcqFrxX
 6e8FjDwnXUWM4OTKyl3HfadioufQUpPUm09NiALJ2UR2b/PCStvGFkp7pY1XN216bQY8=
X-Received: by 2002:adf:fb0d:0:b0:20d:97e:17ce with SMTP id
 c13-20020adffb0d000000b0020d097e17cemr47761133wrr.585.1653923244666; 
 Mon, 30 May 2022 08:07:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPl+5/lJGAqclbO/EOAbmcmFdpqAiHweDsE217sw7xjd15dVZkHMwYygQ5z96B9lwDk4tSsg==
X-Received: by 2002:adf:fb0d:0:b0:20d:97e:17ce with SMTP id
 c13-20020adffb0d000000b0020d097e17cemr47761098wrr.585.1653923244250; 
 Mon, 30 May 2022 08:07:24 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a05600c41d600b003942a244ebesm10436183wmh.3.2022.05.30.08.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:07:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v5 03/10] qmp: add filtering of statistics by target vCPU
Date: Mon, 30 May 2022 17:07:07 +0200
Message-Id: <20220530150714.756954-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530150714.756954-1-pbonzini@redhat.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
        I left the Reviewed-by here as well.

 accel/kvm/kvm-all.c     |  9 +++++++--
 include/monitor/stats.h | 11 ++++++++++-
 monitor/qmp-cmds.c      | 34 +++++++++++++++++++++++++++++++++-
 qapi/stats.json         | 24 +++++++++++++++++++-----
 4 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c027536419..d75fb3d95c 100644
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
@@ -4043,7 +4044,8 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
     close(stats_fd);
 }
 
-static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp)
+static void query_stats_cb(StatsResultList **result, StatsTarget target,
+                           strList *targets, Error **errp)
 {
     KVMState *s = kvm_state;
     CPUState *cpu;
@@ -4067,6 +4069,9 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target, Error *
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



