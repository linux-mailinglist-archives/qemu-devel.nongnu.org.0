Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A554DD9B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:54:02 +0200 (CEST)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lGL-0005Ql-OO
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvc-0001dw-1R
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvZ-0002qv-Fq
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrZKZJJGTa9/FjXaE6cM6pHCdchukzS67tFNB2xY2bE=;
 b=DtBD1kWuu3zubiqnRpTIQbIF/THD36UWS/0knJHB5yoqX7O2qmrFQXjKC3+RaE+mXf8Agy
 NXDEVUiNYrcDSDDx7iXiGf9mzIhqZzXVlwThafzXkBx/zDfl7KW+C/nVj3vRJG4LKOgAaZ
 TNr6jQbbfKVlKdxEszTcrIxNN3i6bV4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-uFLZlzidPaeuCR2_Tq1KTg-1; Thu, 16 Jun 2022 04:32:31 -0400
X-MC-Unique: uFLZlzidPaeuCR2_Tq1KTg-1
Received: by mail-ej1-f71.google.com with SMTP id
 q5-20020a17090676c500b00704ffb95131so314123ejn.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrZKZJJGTa9/FjXaE6cM6pHCdchukzS67tFNB2xY2bE=;
 b=VcT3Atz/meacEIFWJBVDOZqQ6EWAN5Mzx1i0NikMrCEa0iEHG9VgqmdyyQStZHDEPk
 z6G+iTqQWCdmSiSyzJKh72GlivtCzWqPYsvc9ERrrVhYB1UcSg+yjOktCpWTGB4k2qac
 PicB/XdYivodo1FKMaQBApjH3LMeSkADE5gAzX4k1fuwMXVeSxxiRahyMisnJ+V1t/RQ
 /cvb/E3m+ZzyIkOtXuXA07h6gB0nPb+Eo6uYM8hotMrZAYgfJXy+UY/vOIxz6lMVN/oD
 uxM3BroY8Kbi21zxOwFF7Cs1i0Nb4YvAGb23RI+6iV1KdgavMlSddRpwcjtrrODnd3gS
 GNsA==
X-Gm-Message-State: AJIora9FpLByVLvztK1gfLN4ui73QULZ6AYP2yRb6BBeaPjGjXP989q1
 /6eOeC6Ql/Z/8wZufyY+8Tk2WJs4sF2pTNaNrqp8N1hSOpqCZ6QbvYNuw6NtaYHVTODAuB1fFhq
 a2y7i+wMHjVQsRO6FP1kJNg3RMaPQ6zGZyfwIqMoC9TW61Da0DVAO632vI68M0OUDE3c=
X-Received: by 2002:a17:907:160f:b0:70f:cceb:d78c with SMTP id
 hb15-20020a170907160f00b0070fccebd78cmr3449790ejc.247.1655368349721; 
 Thu, 16 Jun 2022 01:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZ6tF4BgDsl+DszKnG3+0QiL4BC8uHwMEhMsups0HPazKeRZMsaweK8EdEhdVPpvH7s15aMw==
X-Received: by 2002:a17:907:160f:b0:70f:cceb:d78c with SMTP id
 hb15-20020a170907160f00b0070fccebd78cmr3449774ejc.247.1655368349324; 
 Thu, 16 Jun 2022 01:32:29 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a170906293200b006f3ef214e20sm481336ejd.134.2022.06.16.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 08/21] qmp: add filtering of statistics by name
Date: Thu, 16 Jun 2022 10:31:56 +0200
Message-Id: <20220616083209.117397-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Allow retrieving only a subset of statistics.  This can be useful
for example in order to plot a subset of the statistics many times
a second: KVM publishes ~40 statistics for each vCPU on x86; retrieving
and serializing all of them would be useless.

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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c     | 17 +++++++++++------
 include/monitor/stats.h |  2 +-
 monitor/qmp-cmds.c      |  7 ++++++-
 qapi/stats.json         |  6 +++++-
 4 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 2e819beaeb..ba3210b1c1 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2312,7 +2312,7 @@ bool kvm_dirty_ring_enabled(void)
 }
 
 static void query_stats_cb(StatsResultList **result, StatsTarget target,
-                           strList *targets, Error **errp);
+                           strList *names, strList *targets, Error **errp);
 static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
 
 static int kvm_init(MachineState *ms)
@@ -3713,6 +3713,7 @@ typedef struct StatsArgs {
         StatsResultList **stats;
         StatsSchemaList **schema;
     } result;
+    strList *names;
     Error **errp;
 } StatsArgs;
 
@@ -3916,7 +3917,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
 }
 
 static void query_stats(StatsResultList **result, StatsTarget target,
-                        int stats_fd, Error **errp)
+                        strList *names, int stats_fd, Error **errp)
 {
     struct kvm_stats_desc *kvm_stats_desc;
     struct kvm_stats_header *kvm_stats_header;
@@ -3958,6 +3959,9 @@ static void query_stats(StatsResultList **result, StatsTarget target,
 
         /* Add entry to the list */
         stats = (void *)stats_data + pdesc->offset;
+        if (!apply_str_list_filter(pdesc->name, names)) {
+            continue;
+        }
         stats_list = add_kvmstat_entry(pdesc, stats, stats_list, errp);
     }
 
@@ -4019,8 +4023,8 @@ static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
         error_propagate(kvm_stats_args->errp, local_err);
         return;
     }
-    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU, stats_fd,
-                kvm_stats_args->errp);
+    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU,
+                kvm_stats_args->names, stats_fd, kvm_stats_args->errp);
     close(stats_fd);
 }
 
@@ -4041,7 +4045,7 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
 }
 
 static void query_stats_cb(StatsResultList **result, StatsTarget target,
-                           strList *targets, Error **errp)
+                           strList *names, strList *targets, Error **errp)
 {
     KVMState *s = kvm_state;
     CPUState *cpu;
@@ -4055,7 +4059,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
             error_setg_errno(errp, errno, "KVM stats: ioctl failed");
             return;
         }
-        query_stats(result, target, stats_fd, errp);
+        query_stats(result, target, names, stats_fd, errp);
         close(stats_fd);
         break;
     }
@@ -4063,6 +4067,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
     {
         StatsArgs stats_args;
         stats_args.result.stats = result;
+        stats_args.names = names;
         stats_args.errp = errp;
         CPU_FOREACH(cpu) {
             if (!apply_str_list_filter(cpu->parent_obj.canonical_path, targets)) {
diff --git a/include/monitor/stats.h b/include/monitor/stats.h
index 80a523dd29..fcf0983154 100644
--- a/include/monitor/stats.h
+++ b/include/monitor/stats.h
@@ -11,7 +11,7 @@
 #include "qapi/qapi-types-stats.h"
 
 typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
-                              strList *targets, Error **errp);
+                              strList *names, strList *targets, Error **errp);
 typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
 
 /*
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index e49ab345d7..7314cd813d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -472,12 +472,17 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
                             Error **errp)
 {
     strList *targets = NULL;
+    strList *names = NULL;
     ERRP_GUARD();
 
     if (request) {
         if (request->provider != entry->provider) {
             return true;
         }
+        if (request->has_names && !request->names) {
+            return true;
+        }
+        names = request->has_names ? request->names : NULL;
     }
 
     switch (filter->target) {
@@ -496,7 +501,7 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
         abort();
     }
 
-    entry->stats_cb(stats_results, filter->target, targets, errp);
+    entry->stats_cb(stats_results, filter->target, names, targets, errp);
     if (*errp) {
         qapi_free_StatsResultList(*stats_results);
         *stats_results = NULL;
diff --git a/qapi/stats.json b/qapi/stats.json
index 503918ea4c..2f8bfe8fdb 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -75,11 +75,14 @@
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
@@ -99,6 +102,7 @@
 # that target:
 # - which vCPUs to request statistics for
 # - which providers to request statistics from
+# - which named values to return within each provider
 #
 # Since: 7.1
 ##
-- 
2.36.1



