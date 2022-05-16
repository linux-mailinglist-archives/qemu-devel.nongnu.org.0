Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C71528078
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 11:10:01 +0200 (CEST)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWjo-0001lS-2d
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 05:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWcs-0001jO-7V
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWcp-0007Mt-Pf
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652691766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhBoIdIC/g/xBCiF1CKVdxabF40cX/HqBigrIUUXWoM=;
 b=O0wOKX3AEh02IWSAVDY+dP6g0LvqHUF4YGLnAJoRylCLksX7s9OF/HPFTdRTSFBjoAq0Sr
 vasqZ/Ophdx5+HmE2YHo3wSIVNVaKK+6TktDpYuf43cj7H+mW6G2H6q8w0e7DRtdE2RWZb
 ULHrhRasub8qOt7AO20huz+O9clePog=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-EqvyErL2Psu_z8xTjFn4BQ-1; Mon, 16 May 2022 05:02:45 -0400
X-MC-Unique: EqvyErL2Psu_z8xTjFn4BQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 jx8-20020a170906ca4800b006f88b28f2f6so5499486ejb.11
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 02:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fhBoIdIC/g/xBCiF1CKVdxabF40cX/HqBigrIUUXWoM=;
 b=YOGnFxxnN/MgoGWXR/nA/nzPst9mSVHNIzYBc2XhVjO8GZb0//02ZF2mM17PmpjYJf
 PNoq3AwZ+ufu51T6EiZrJTW5emvtaVaEN94QPuAlxHOGVzBPQ3LcoQSu1AKkLoe9u/jH
 AeZwEEq/OIzPREDTTljfQc0jtpNNvzVxzox8ZcgkG61CKP2iKn2S2KJjguBqx/rAKOFV
 lmsjJfzr1hmzZJ6PCEomQ568wncL6TFb9OA/vWqQ5EPmwBa1GsUoIcxFCskJS87f47Wi
 tE5XwuXz1LP3RwtDc3UHUBB3b1KBUB91GMnRaATQ8RcAr9oIDzp9t3fhHu7U9+A21h9D
 qgrg==
X-Gm-Message-State: AOAM530dSSiWyrJaUk6vDQtqDiIxXuu/ajzFmT9DP8YaYYlKt7KbY8tU
 oD+6gdke92Cc5FNspZe/TRGZ/DhR3vyQiMOElA9w8ptFbdSDTfKb/lUb6nT+0syxBP52NuzrUH7
 ohIHaWA7B8XTxRWphydeoOLATODUyr98TBTX8TLi0NyTNInYC9CunUEzgzF4CVlH2X5o=
X-Received: by 2002:aa7:d88f:0:b0:42a:adb3:be01 with SMTP id
 u15-20020aa7d88f000000b0042aadb3be01mr5668884edq.219.1652691763604; 
 Mon, 16 May 2022 02:02:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpo9FWFXYlzeY+BTK8kRkfOlpNVEkYeRCDitLcu2htARmCn4zd3FRLAurzFpK7UNoWhqmzzg==
X-Received: by 2002:aa7:d88f:0:b0:42a:adb3:be01 with SMTP id
 u15-20020aa7d88f000000b0042aadb3be01mr5668845edq.219.1652691763258; 
 Mon, 16 May 2022 02:02:43 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a170906518f00b006f3ef214df1sm3490371ejk.87.2022.05.16.02.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 02:02:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, dgilbert@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH v3 5/8] qmp: add filtering of statistics by provider
Date: Mon, 16 May 2022 11:02:31 +0200
Message-Id: <20220516090234.1195907-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516090058.1195767-1-pbonzini@redhat.com>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Allow retrieving the statistics from a specific provider only.
This can be used in the future by HMP commands such as "info
sync-profile" or "info profile".  The next patch also adds
filter-by-provider capabilities to the HMP equivalent of
query-stats, "info stats".

Example:

{ "execute": "query-stats",
  "arguments": {
    "target": "vm",
    "providers": [
      { "provider": "kvm" } ] } }

The QAPI is a bit more verbose than just a list of StatsProvider,
so that it can be subsequently extended with filtering of statistics
by name.

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c     |  3 ++-
 include/monitor/stats.h |  4 +++-
 monitor/hmp-cmds.c      |  2 +-
 monitor/qmp-cmds.c      | 33 +++++++++++++++++++++++++++++----
 qapi/stats.json         | 17 +++++++++++++++--
 5 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 28f8a45205..12e003fdd2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2644,7 +2644,8 @@ static int kvm_init(MachineState *ms)
     }
 
     if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
-        add_stats_callbacks(query_stats_cb, query_stats_schemas_cb);
+        add_stats_callbacks(STATS_PROVIDER_KVM, query_stats_cb,
+                            query_stats_schemas_cb);
     }
 
     return 0;
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index 92a1df3072..acfd975df9 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -17,10 +17,12 @@ typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
 /*
  * Register callbacks for the QMP query-stats command.
  *
+ * @provider: stats provider
  * @stats_fn: routine to query stats:
  * @schema_fn: routine to query stat schemas:
  */
-void add_stats_callbacks(StatRetrieveFunc *stats_fn,
+void add_stats_callbacks(StatsProvider provider,
+                         StatRetrieveFunc *stats_fn,
                          SchemaRetrieveFunc *schemas_fn);
 
 /*
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 5950133a11..15f1743d8c 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2388,7 +2388,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         goto exit_no_print;
     }
 
-    schema = qmp_query_stats_schemas(&err);
+    schema = qmp_query_stats_schemas(false, 0, &err);
     if (err) {
         goto exit;
     }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 1ec7409bc2..4d8a08879a 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -445,6 +445,7 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
 }
 
 typedef struct StatsCallbacks {
+    StatsProvider provider;
     StatRetrieveFunc *stats_cb;
     SchemaRetrieveFunc *schemas_cb;
     QTAILQ_ENTRY(StatsCallbacks) next;
@@ -453,10 +454,12 @@ typedef struct StatsCallbacks {
 static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
     QTAILQ_HEAD_INITIALIZER(stats_callbacks);
 
-void add_stats_callbacks(StatRetrieveFunc *stats_fn,
+void add_stats_callbacks(StatsProvider provider,
+                         StatRetrieveFunc *stats_fn,
                          SchemaRetrieveFunc *schemas_fn)
 {
     StatsCallbacks *entry = g_new(StatsCallbacks, 1);
+    entry->provider = provider;
     entry->stats_cb = stats_fn;
     entry->schemas_cb = schemas_fn;
 
@@ -479,6 +482,22 @@ static strList *stats_target_filter(StatsFilter *filter)
     }
 }
 
+static bool stats_provider_requested(StatsProvider provider,
+                                     StatsFilter *filter)
+{
+    StatsRequestList *request;
+
+    if (!filter->has_providers) {
+        return true;
+    }
+    for (request = filter->providers; request; request = request->next) {
+        if (request->value->provider == provider) {
+            return true;
+        }
+    }
+    return false;
+}
+
 StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
 {
     StatsResultList *stats_results = NULL;
@@ -486,19 +505,25 @@ StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
     StatsCallbacks *entry;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        entry->stats_cb(&stats_results, filter->target, targets, errp);
+        if (stats_provider_requested(entry->provider, filter)) {
+            entry->stats_cb(&stats_results, filter->target, targets, errp);
+        }
     }
 
     return stats_results;
 }
 
-StatsSchemaList *qmp_query_stats_schemas(Error **errp)
+StatsSchemaList *qmp_query_stats_schemas(bool has_provider,
+                                         StatsProvider provider,
+                                         Error **errp)
 {
     StatsSchemaList *stats_results = NULL;
     StatsCallbacks *entry;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        entry->schemas_cb(&stats_results, errp);
+        if (!has_provider || provider == entry->provider) {
+            entry->schemas_cb(&stats_results, errp);
+        }
     }
 
     return stats_results;
diff --git a/qapi/stats.json b/qapi/stats.json
index 859fc0f459..88190ae19b 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -68,6 +68,18 @@
 { 'enum': 'StatsTarget',
   'data': [ 'vm', 'vcpu' ] }
 
+##
+# @StatsRequest:
+#
+# Indicates a set of statistics that should be returned by query-stats.
+#
+# @provider: provider for which to return statistics.
+#
+# Since: 7.1
+##
+{ 'struct': 'StatsRequest',
+  'data': { 'provider': 'StatsProvider' } }
+
 ##
 # @StatsVCPUFilter:
 #
@@ -85,11 +97,12 @@
 # request statistics and optionally the required subset of information for
 # that target:
 # - which vCPUs to request statistics for
+# - which provider to request statistics from
 #
 # Since: 7.1
 ##
 { 'union': 'StatsFilter',
-        'base': { 'target': 'StatsTarget' },
+        'base': { 'target': 'StatsTarget', '*providers': [ 'StatsRequest' ] },
   'discriminator': 'target',
   'data': { 'vcpu': 'StatsVCPUFilter' } }
 
@@ -225,5 +238,5 @@
 # Since: 7.1
 ##
 { 'command': 'query-stats-schemas',
-  'data': { },
+  'data': { '*provider': 'StatsProvider' },
   'returns': [ 'StatsSchema' ] }
-- 
2.36.0


