Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1652807D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 11:10:03 +0200 (CEST)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWjq-0001sG-6L
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 05:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWd1-0001tK-8x
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWcz-0007OT-BO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652691776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TgAZI+MF3K/J0JPSBXUMUhZvdYjcVsWVqm+XOymwc/s=;
 b=a/xspd0N7PoyhnAWcYwsUU06iY51dmJWm6Q3nXUbNI35vvngDDNyLNW+sCT2OnFTwY6X1a
 mKgaWNa9F5TXmbl4/BmN4CXjJSemK948wkgcofEVOtmDgyqfS3UFu9MY1HbyD0u4bjb/Sr
 NC+0cUi5xwoyTPU8BYTifgash+wkqoY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-rH1CxobTOy2OeRcbWCNOyQ-1; Mon, 16 May 2022 05:02:55 -0400
X-MC-Unique: rH1CxobTOy2OeRcbWCNOyQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 ay24-20020a056402203800b0042a96a76ba5so3288381edb.20
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 02:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TgAZI+MF3K/J0JPSBXUMUhZvdYjcVsWVqm+XOymwc/s=;
 b=TveKedhMXeKRTIRRcPRFufEvKvRpxw3H3HQbzTQAg+ap5ueoxXEm4j2f6b17jDXRXE
 sFT3PZzfYGPWbbhImg2s92Xd/8qlIesfMYPnLy6bkVh1oSf4Vpre5bkeVjXeturFaFv2
 jdN0wdwYkOl6emJm/vnVFe5MmfO4GKGxsteuRVcF8JLXrgDLAEnS3VyrSPVO8h1MyG0C
 /b4JXFlJDb4UeuL726wlxcpyLX7sOaSYWMoClFwHNPToH5Zd5rVWgRNMwizvUyWN/S0P
 DhePeu5Ot2c5TVmqYUpAmvPsl2IWvFpliKv1HGzgkRS5YO3qA4SEZfrDRpeZcHRfJRE5
 fZ6g==
X-Gm-Message-State: AOAM533c4RjdC1ebQXczJBZhivix4m3ogBDiK46D6Wj9AnfWuhVcquub
 Ah9+MuW7Pun2Me7OsqGX84vHCOQ8ygQSECu4gw/WGpPJB65O8p3eqs3DyL7kKEw/NfINZ1j/0z2
 CPevLdWOJ5SxUP/v47y1AeYtMNPjJWnsvxAMhrwC52VMsFBPUIJ9MFFZ9LpG5akLZ5jU=
X-Received: by 2002:a17:906:c14b:b0:6f8:e6bb:f8d5 with SMTP id
 dp11-20020a170906c14b00b006f8e6bbf8d5mr14214181ejc.4.1652691773399; 
 Mon, 16 May 2022 02:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvC6ovN9UtxAmLQ/SuERYaDAk0iaigSqLE5PLdFRZ27KIp2TZjQxyiVIVuxqlnRWJwMP6xRg==
X-Received: by 2002:a17:906:c14b:b0:6f8:e6bb:f8d5 with SMTP id
 dp11-20020a170906c14b00b006f8e6bbf8d5mr14214151ejc.4.1652691773066; 
 Mon, 16 May 2022 02:02:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 28-20020a170906005c00b006f4c557b7d2sm3444637ejg.203.2022.05.16.02.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 02:02:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, dgilbert@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH v3 7/8] qmp: add filtering of statistics by name
Date: Mon, 16 May 2022 11:02:33 +0200
Message-Id: <20220516090234.1195907-6-pbonzini@redhat.com>
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

Allow retrieving only a subset of statistics.  This can be useful
for example in order to plot a subset of the statistics many times
a second.

KVM publishes ~40 statistics for each vCPU on x86; retrieving and
serializing all of them would be useless

Another use will be in HMP in the following patch; implementing the
filter in the backend is easy enough that it was deemed okay to make
this a public interface.

Example:

{ "execute": "query-stats",
  "arguments": {
    "target": "vcpu",
    "vcpus": [ "/machine/unattached/device[2]",
               "/machine/unattached/device[4]" ],
    "providers": [
      { "provider": "kvm",
        "names": [ "l1d_flush", "exits" ] } } }

{ "return": {
    "vcpus": [
      { "path": "/machine/unattached/device[2]"
        "providers": [
          { "provider": "kvm",
            "stats": [ { "name": "l1d_flush", "value": 41213 },
                       { "name": "exits", "value": 74291 } ] } ] },
      { "path": "/machine/unattached/device[4]"
        "providers": [
          { "provider": "kvm",
            "stats": [ { "name": "l1d_flush", "value": 16132 },
                       { "name": "exits", "value": 57922 } ] } ] } ] } }

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c     | 17 +++++++++++------
 include/monitor/stats.h |  4 ++--
 monitor/qmp-cmds.c      | 10 +++++++---
 qapi/stats.json         |  6 +++++-
 4 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 12e003fdd2..403bc42ce0 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2311,7 +2311,7 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
-static void query_stats_cb(StatsResultList **result, StatsTarget target,
+static void query_stats_cb(StatsResultList **result, StatsTarget target, strList *names,
                            strList *targets, Error **errp);
 static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
 
@@ -3713,6 +3713,7 @@ typedef struct StatsArgs {
         StatsResultList **stats;
         StatsSchemaList **schema;
     } result;
+    strList *names;
     Error **errp;
 } StatsArgs;
 
@@ -3926,7 +3927,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
     return descriptors;
 }
 
-static void query_stats(StatsResultList **result, StatsTarget target,
+static void query_stats(StatsResultList **result, StatsTarget target, strList *names,
                         int stats_fd, Error **errp)
 {
     struct kvm_stats_desc *kvm_stats_desc;
@@ -3969,6 +3970,9 @@ static void query_stats(StatsResultList **result, StatsTarget target,
 
         /* Add entry to the list */
         stats = (void *)stats_data + pdesc->offset;
+        if (!str_in_list(pdesc->name, names)) {
+            continue;
+        }
         stats_list = add_kvmstat_entry(pdesc, stats, stats_list, errp);
     }
 
@@ -4030,8 +4034,8 @@ static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
         error_propagate(kvm_stats_args->errp, local_err);
         return;
     }
-    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU, stats_fd,
-                kvm_stats_args->errp);
+    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU,
+                kvm_stats_args->names, stats_fd, kvm_stats_args->errp);
     close(stats_fd);
 }
 
@@ -4052,7 +4056,7 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
 }
 
 static void query_stats_cb(StatsResultList **result, StatsTarget target,
-                           strList *targets, Error **errp)
+                           strList *names, strList *targets, Error **errp)
 {
     KVMState *s = kvm_state;
     CPUState *cpu;
@@ -4066,7 +4070,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
             error_setg(errp, "KVM stats: ioctl failed");
             return;
         }
-        query_stats(result, target, stats_fd, errp);
+        query_stats(result, target, names, stats_fd, errp);
         close(stats_fd);
         break;
     }
@@ -4074,6 +4078,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
     {
         StatsArgs stats_args;
         stats_args.result.stats = result;
+        stats_args.names = names;
         stats_args.errp = errp;
         CPU_FOREACH(cpu) {
             if (!str_in_list(cpu->parent_obj.canonical_path, targets)) {
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index acfd975df9..b4123044f7 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -11,8 +11,8 @@
 #include "qapi/qapi-types-stats.h"
 
 typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
-                              strList *targets, Error **errp);
-typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
+                              strList *names, strList *targets, Error **errp);
+typedef void SchemaRetrieveFunc(StatsSchemaList **, Error **);
 
 /*
  * Register callbacks for the QMP query-stats command.
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 4d8a08879a..27b3d6ea74 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -483,15 +483,18 @@ static strList *stats_target_filter(StatsFilter *filter)
 }
 
 static bool stats_provider_requested(StatsProvider provider,
-                                     StatsFilter *filter)
+                                     StatsFilter *filter,
+                                     strList **p_names)
 {
     StatsRequestList *request;
 
     if (!filter->has_providers) {
+        *p_names = NULL;
         return true;
     }
     for (request = filter->providers; request; request = request->next) {
         if (request->value->provider == provider) {
+            *p_names = request->value->has_names ? request->value->names : NULL;
             return true;
         }
     }
@@ -505,8 +508,9 @@ StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
     StatsCallbacks *entry;
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
-        if (stats_provider_requested(entry->provider, filter)) {
-            entry->stats_cb(&stats_results, filter->target, targets, errp);
+        strList *names = NULL;
+        if (stats_provider_requested(entry->provider, filter, &names)) {
+            entry->stats_cb(&stats_results, filter->target, names, targets, errp);
         }
     }
 
diff --git a/qapi/stats.json b/qapi/stats.json
index 88190ae19b..95508b5a41 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -74,11 +74,14 @@
 # Indicates a set of statistics that should be returned by query-stats.
 #
 # @provider: provider for which to return statistics.
+
+# @names: statistics to be returned (all if omitted).
 #
 # Since: 7.1
 ##
 { 'struct': 'StatsRequest',
-  'data': { 'provider': 'StatsProvider' } }
+  'data': { 'provider': 'StatsProvider',
+            '*names': [ 'str' ] } }
 
 ##
 # @StatsVCPUFilter:
@@ -98,6 +101,7 @@
 # that target:
 # - which vCPUs to request statistics for
 # - which provider to request statistics from
+# - which values to return within each provider
 #
 # Since: 7.1
 ##
-- 
2.36.0


