Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9862B53848A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:17:33 +0200 (CEST)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvh99-0005FG-9T
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzd-0003dd-E6
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzb-00063W-As
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653923258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXM4f18ZB8rLO0mkcXF/18A85L4Z02SoK1bMAVyW6vU=;
 b=g1hGBt7Bagk0+EGVq4LibIV8qkDmF1ongJ2NWXBY1HNckiBnoSxZDRpW0RU683MjWbbkBO
 pQH2NzzFaqcFNJ+t7oTr9+uijSGTjXOwBCVVNwTZWkjXoGhgYZBWl023XHS6aE/89NZ+SJ
 PpQk3JT0U/kE0o3Yz2NjDRUAiiyPb2o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-uOot4DLQPVG_4CFxW8UjxA-1; Mon, 30 May 2022 11:07:37 -0400
X-MC-Unique: uOot4DLQPVG_4CFxW8UjxA-1
Received: by mail-ed1-f72.google.com with SMTP id
 o17-20020a50fd91000000b0042dbded81deso4239128edt.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXM4f18ZB8rLO0mkcXF/18A85L4Z02SoK1bMAVyW6vU=;
 b=Ksr18XFlUoDND75NE3sWUO7mOKKCBWnT3mr68KQwzWbhPhQIXv0U5gIxHj/USkMIAo
 86vxYQaEFhU5FzAAPQYNtM9A2QY3R6TcpABlh+Le4XYnleXVRab/jhGzBnFpKRvFdoMh
 0n0g9P6bI1UzLsUHr5fbTlfsXFpj/OhFA/R1GePk/qA7NOJdX/E+nq8vLiC7JfTWQpC2
 9ocoV9zhSAXH2q2jnbiSAjsKVUDv/1m4ZGrA8c2gA9JpmjpP7eazsWdlZTtud+Twi883
 TJyCfE7klvHiZfhLbmoO5F7PiimIHzydLl431h0/V8/jFMZva0sCiJb80rdlviuCHQlk
 bctQ==
X-Gm-Message-State: AOAM531aV1M8q2daqyfQxyE29WJeplLy+e0yHQ2dQthA6j1ilFDkA2Wy
 koeP+wDHWs03SDNiljey+9TW5csn4n/NTTMNO5KQm+mbSLEKqJOAx4tIRaCo8hC5VKRyPJU0xll
 KumRHBFuRWACr5uqptaA8+sSsg4FEMEDt2eu3o8lKhxGA0G4V4++L94RIf4yvdkBI0dE=
X-Received: by 2002:a05:6402:3312:b0:42d:bf2e:1869 with SMTP id
 e18-20020a056402331200b0042dbf2e1869mr11524477eda.348.1653923255980; 
 Mon, 30 May 2022 08:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8Y8EqMaafZub3SnVKwnK2rpQ8rJrru/V/BZ0/unEU6yXbjabFvBKTp3tj4MeLWxxFQiLgeA==
X-Received: by 2002:a05:6402:3312:b0:42d:bf2e:1869 with SMTP id
 e18-20020a056402331200b0042dbf2e1869mr11524452eda.348.1653923255627; 
 Mon, 30 May 2022 08:07:35 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 v27-20020a50d59b000000b0042dd2f2bec7sm1735326edi.56.2022.05.30.08.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:07:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v5 09/10] qmp: add filtering of statistics by name
Date: Mon, 30 May 2022 17:07:13 +0200
Message-Id: <20220530150714.756954-10-pbonzini@redhat.com>
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
 include/monitor/stats.h |  2 +-
 monitor/qmp-cmds.c      |  7 ++++++-
 qapi/stats.json         |  6 +++++-
 4 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 66c4ac1ac6..f90f0602bc 100644
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
 
@@ -3921,7 +3922,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
 }
 
 static void query_stats(StatsResultList **result, StatsTarget target,
-                        int stats_fd, Error **errp)
+                        strList *names, int stats_fd, Error **errp)
 {
     struct kvm_stats_desc *kvm_stats_desc;
     struct kvm_stats_header *kvm_stats_header;
@@ -3963,6 +3964,9 @@ static void query_stats(StatsResultList **result, StatsTarget target,
 
         /* Add entry to the list */
         stats = (void *)stats_data + pdesc->offset;
+        if (!apply_str_list_filter(pdesc->name, names)) {
+            continue;
+        }
         stats_list = add_kvmstat_entry(pdesc, stats, stats_list, errp);
     }
 
@@ -4024,8 +4028,8 @@ static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
         error_propagate(kvm_stats_args->errp, local_err);
         return;
     }
-    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU, stats_fd,
-                kvm_stats_args->errp);
+    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU,
+                kvm_stats_args->names, stats_fd, kvm_stats_args->errp);
     close(stats_fd);
 }
 
@@ -4046,7 +4050,7 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
 }
 
 static void query_stats_cb(StatsResultList **result, StatsTarget target,
-                           strList *targets, Error **errp)
+                           strList *names, strList *targets, Error **errp)
 {
     KVMState *s = kvm_state;
     CPUState *cpu;
@@ -4060,7 +4064,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
             error_setg_errno(errp, errno, "KVM errno, stats: ioctl failed");
             return;
         }
-        query_stats(result, target, stats_fd, errp);
+        query_stats(result, target, names, stats_fd, errp);
         close(stats_fd);
         break;
     }
@@ -4068,6 +4072,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
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



