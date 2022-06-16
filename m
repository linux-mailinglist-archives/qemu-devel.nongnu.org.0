Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52E54DD0F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:42:05 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l4m-00024l-AQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvV-0001c5-HA
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvT-0002qG-K7
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QS43H9MfTeK/E+sJBrLOh6npRZDt1PPjvkyJAJn1Qzk=;
 b=bjGNFMqMqWK4RV2QBKrHqfvxCEFolRgEgXEvK3l74at15wuPxXzRKOHVr1ZvPLTz2sS/QY
 DVPUgDuqn8uSGbGSavgcrF0XElBZwCkf8kuJtY/fn8GEdT96HWuNX6s+PeodEjSPIEDmKH
 /w7ZPxLjcSpCy0S1VXxtoAMUx4SJ9EM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628--HrzNyfaOJaftyJ5yZz97Q-1; Thu, 16 Jun 2022 04:32:25 -0400
X-MC-Unique: -HrzNyfaOJaftyJ5yZz97Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 w14-20020a056402268e00b0043556edda4dso76700edd.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QS43H9MfTeK/E+sJBrLOh6npRZDt1PPjvkyJAJn1Qzk=;
 b=6lgjukUMiSx2S+8LBaIajiwgWPDE01tdfGZ/5aeE2JoUJH+M9OtHkDKm/3FQsMyJUG
 Qgwz+ZKysQk6xcAOLeYJuN58bqsQrwCVK2IQfT7ND+2Lgoh72gWZzTqU7grI5jztDGJ5
 boTgOURBvOeJkgNN9qOqza08iFOjkPUyDMLoxJWgn50CrmPcFmqqgU9Hk95GJtE9ga22
 OIyoWTCIKJIxtd7tFgn65OuzFCN1hcIEm3zNgLAo30HWS9pDXvBilwYTbcbOiC+utj4U
 dDsiVVSMsQdga8Q+iW8cLb3/BLyUbvHY7wlOKTiV71b3aM0J+2iZG6BAI4vuyXMLmvjt
 Vb6g==
X-Gm-Message-State: AJIora9beFLb4n1WtggpB9OAOLsx1+ajAizptWPW4lDQM6myd4adDTX8
 BeQz9M0Pd2x3lCvMSCzss66Fb36sdx5pWmyPBZPLTzRC2R/XYFSJxaCUhujJQkg5fHtsTgtPB+V
 7RzCOR00pj8PXsu2lL495QG8qMr6tdzAlHwfAnWSoeSphf4HkMs17AfbttDztwaqzq7c=
X-Received: by 2002:a17:906:6a1c:b0:70a:fd95:ee6a with SMTP id
 qw28-20020a1709066a1c00b0070afd95ee6amr3557914ejc.36.1655368343893; 
 Thu, 16 Jun 2022 01:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRFHviVXL6u0AQpybj4Buec2cnJYTEeANMgIiuO2gVAujkrW7Arg3RArjnHAizkdHpGi+ATg==
X-Received: by 2002:a17:906:6a1c:b0:70a:fd95:ee6a with SMTP id
 qw28-20020a1709066a1c00b0070afd95ee6amr3557893ejc.36.1655368343539; 
 Thu, 16 Jun 2022 01:32:23 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 kw25-20020a170907771900b007044ae2538esm491092ejc.33.2022.06.16.01.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 06/21] qmp: add filtering of statistics by provider
Date: Thu, 16 Jun 2022 10:31:54 +0200
Message-Id: <20220616083209.117397-7-pbonzini@redhat.com>
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

If a provider is specified more than once in the filter, each request
will be included separately in the output.

Extracted from a patch by Mark Kanda.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c     |  3 ++-
 include/monitor/stats.h |  4 +++-
 monitor/hmp-cmds.c      |  2 +-
 monitor/qmp-cmds.c      | 41 ++++++++++++++++++++++++++++++++---------
 qapi/stats.json         | 19 +++++++++++++++++--
 5 files changed, 55 insertions(+), 14 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 547de842fd..2e819beaeb 100644
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
index 8c50feeaa9..80a523dd29 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -17,10 +17,12 @@ typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
 /*
  * Register callbacks for the QMP query-stats command.
  *
+ * @provider: stats provider checked against QMP command arguments
  * @stats_fn: routine to query stats:
  * @schema_fn: routine to query stat schemas:
  */
-void add_stats_callbacks(StatRetrieveFunc *stats_fn,
+void add_stats_callbacks(StatsProvider provider,
+                         StatRetrieveFunc *stats_fn,
                          SchemaRetrieveFunc *schemas_fn);
 
 /*
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 04d5ee8fb7..9180cf1841 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2397,7 +2397,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         goto exit_no_print;
     }
 
-    schema = qmp_query_stats_schemas(&err);
+    schema = qmp_query_stats_schemas(false, STATS_PROVIDER__MAX, &err);
     if (err) {
         goto exit;
     }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5f8f1e620b..e49ab345d7 100644
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
 
@@ -465,12 +468,18 @@ void add_stats_callbacks(StatRetrieveFunc *stats_fn,
 
 static bool invoke_stats_cb(StatsCallbacks *entry,
                             StatsResultList **stats_results,
-                            StatsFilter *filter,
+                            StatsFilter *filter, StatsRequest *request,
                             Error **errp)
 {
     strList *targets = NULL;
     ERRP_GUARD();
 
+    if (request) {
+        if (request->provider != entry->provider) {
+            return true;
+        }
+    }
+
     switch (filter->target) {
     case STATS_TARGET_VM:
         break;
@@ -500,27 +509,41 @@ StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
 {
     StatsResultList *stats_results = NULL;
     StatsCallbacks *entry;
+    StatsRequestList *request;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        if (!invoke_stats_cb(entry, &stats_results, filter, errp)) {
-            break;
+        if (filter->has_providers) {
+            for (request = filter->providers; request; request = request->next) {
+                if (!invoke_stats_cb(entry, &stats_results, filter,
+                                     request->value, errp)) {
+                    break;
+                }
+            }
+        } else {
+            if (!invoke_stats_cb(entry, &stats_results, filter, NULL, errp)) {
+                break;
+            }
         }
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
     ERRP_GUARD();
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        entry->schemas_cb(&stats_results, errp);
-        if (*errp) {
-            qapi_free_StatsSchemaList(stats_results);
-            return NULL;
+        if (!has_provider || provider == entry->provider) {
+            entry->schemas_cb(&stats_results, errp);
+            if (*errp) {
+                qapi_free_StatsSchemaList(stats_results);
+                return NULL;
+            }
         }
     }
 
diff --git a/qapi/stats.json b/qapi/stats.json
index 8c9abb57f1..503918ea4c 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -69,6 +69,18 @@
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
@@ -86,11 +98,14 @@
 # request statistics and optionally the required subset of information for
 # that target:
 # - which vCPUs to request statistics for
+# - which providers to request statistics from
 #
 # Since: 7.1
 ##
 { 'union': 'StatsFilter',
-        'base': { 'target': 'StatsTarget' },
+  'base': {
+      'target': 'StatsTarget',
+      '*providers': [ 'StatsRequest' ] },
   'discriminator': 'target',
   'data': { 'vcpu': 'StatsVCPUFilter' } }
 
@@ -226,5 +241,5 @@
 # Since: 7.1
 ##
 { 'command': 'query-stats-schemas',
-  'data': { },
+  'data': { '*provider': 'StatsProvider' },
   'returns': [ 'StatsSchema' ] }
-- 
2.36.1



