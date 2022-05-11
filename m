Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB4522F06
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:12:35 +0200 (CEST)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noiOY-0004v9-6p
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1o-0006ka-1R
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:49:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1m-0002rw-7m
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652258941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6j9lE2Hm98HDxiGAVoAwA/H21sg/Crp4Tw0Lg8yELC8=;
 b=EVdw3r/QYHS5ofGz+92xV7ICvPTUKYWinsZSXuMTIWHeN9BobsHI9xIRdrkhW2sXMwH0uz
 3+I65B4kU+RjgPJb8098Gd1AxB0TqFAkZwPQrAcWGry3u+edcvuEa3gJ/kG0xkdSIwIUKL
 T9JyGtBNMk4bgcPEJ9I124LuBulqeaw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-9z4TyXGANaCmtb9BeV3vfw-1; Wed, 11 May 2022 04:48:59 -0400
X-MC-Unique: 9z4TyXGANaCmtb9BeV3vfw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020a056000163100b0020c9b0e9039so557509wrb.18
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 01:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6j9lE2Hm98HDxiGAVoAwA/H21sg/Crp4Tw0Lg8yELC8=;
 b=wF27EAodQVgKIT3+2nSubgL4hSoa/O2RCAJrIib7ujVPTqP8BBFO27wtwBORoc2byf
 zfuH/T3b9nJYN0o/Vl8Qaza9t/u/Xq448rITw2s6ZoC6qy8HLJ6bpbT7rG5fU+Gq5SlQ
 YgWYl/ewUvud+w42yQD8e8zpq5VSWEPxVAB9nBBN/+gsS1vktAsDWk7c72ADt7Lx3Kiq
 r7MzfInZhl51FhyKlPq4qaQRlCrL/vOqAWn3gwy1PEcH+m41uE/cSveJzQdvKxtkVEGt
 V619FqHntRCgEba2B08AOb8AaxsWrCrVYhXgBLOeQFWGV9ODe7zM1jK/NjZfoMtKQBim
 47xg==
X-Gm-Message-State: AOAM531jU04qHT5mO7r2Vw5ABpDIHlmNALM7HOUzAOqI9JsTNy03pgvw
 vbrFyIW+N9rQq2P1/vwhJ/kt+TzcPqyOnAbUs5iWTO92gnJ+d+f/m0k89HF/abQpCuDHPdFsLJL
 TSK3nlnNHkMcEp6n3oObE8eWndtQJ/gdkjtn1HXoYUw4nm4ylHooZ1MBKhl4YhVkxTrg=
X-Received: by 2002:a5d:4045:0:b0:20a:cac6:d33d with SMTP id
 w5-20020a5d4045000000b0020acac6d33dmr22686140wrp.657.1652258937942; 
 Wed, 11 May 2022 01:48:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8bph77VCSA+33U3jz/TpLqOO5Sj6JJ1FnmS0zFRpuKEllqN4WF5YUKJ7hETf33D8iR67Ezg==
X-Received: by 2002:a5d:4045:0:b0:20a:cac6:d33d with SMTP id
 w5-20020a5d4045000000b0020acac6d33dmr22686112wrp.657.1652258937530; 
 Wed, 11 May 2022 01:48:57 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 q14-20020adfcd8e000000b0020c5253d8c5sm1133977wrj.17.2022.05.11.01.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:48:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 8/8] hmp: add filtering of statistics by name
Date: Wed, 11 May 2022 10:48:33 +0200
Message-Id: <20220511084833.195963-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220511084833.195963-1-pbonzini@redhat.com>
References: <20220511084833.195963-1-pbonzini@redhat.com>
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

Allow the user to request only a specific subset of statistics.
This can be useful when working on a feature or optimization that is
known to affect that statistic.

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx |  7 ++++---
 monitor/hmp-cmds.c   | 35 +++++++++++++++++++++++++----------
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 221feab8c0..767aafd1ea 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -897,9 +897,10 @@ ERST
 
     {
         .name       = "stats",
-        .args_type  = "target:s",
-        .params     = "target",
-        .help       = "show statistics; target is either vm or vcpu",
+        .args_type  = "target:s,names:s?,provider:s?",
+        .params     = "target [names] [provider]",
+        .help       = "show statistics for the given target (vm or vcpu); optionally filter by"
+                      "name (comma-separated list, or * for all) and provider",
         .cmd        = hmp_info_stats,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 4f4ecbfbfb..86744a14eb 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2350,10 +2350,12 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
 }
 
 /* Create the StatsFilter that is needed for an "info stats" invocation.  */
-static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
-                                 StatsProvider provider)
+static StatsFilter *stats_filter(StatsTarget target, const char *names,
+                                 int cpu_index, StatsProvider provider)
 {
     StatsFilter *filter = g_malloc0(sizeof(*filter));
+    StatsProvider provider_idx;
+    StatsRequestList *request_list = NULL;
 
     filter->target = target;
     switch (target) {
@@ -2374,15 +2376,27 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
         break;
     }
 
-    if (provider == STATS_PROVIDER__MAX) {
+    if (!names && provider == STATS_PROVIDER__MAX) {
         return filter;
     }
 
-    /* "info stats" can only query either one or all the providers.  */
-    StatsRequest *request = g_new0(StatsRequest, 1);
-    request->provider = provider;
-    StatsRequestList *request_list = g_new0(StatsRequestList, 1);
-    QAPI_LIST_PREPEND(request_list, request);
+    /*
+     * "info stats" can only query either one or all the providers.  Querying
+     * by name, but not by provider, requires the creation of one filter per
+     * provider.
+     */
+    for (provider_idx = 0; provider_idx < STATS_PROVIDER__MAX; provider_idx++) {
+        if (provider == STATS_PROVIDER__MAX || provider == provider_idx) {
+            StatsRequest *request = g_new0(StatsRequest, 1);
+            request->provider = provider_idx;
+            if (names && !g_str_equal(names, "*")) {
+                request->has_names = true;
+                request->names = strList_from_comma_list(names);
+            }
+            QAPI_LIST_PREPEND(request_list, request);
+        }
+    }
+
     filter->has_providers = true;
     filter->providers = request_list;
     return filter;
@@ -2392,6 +2406,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
 {
     const char *target_str = qdict_get_str(qdict, "target");
     const char *provider_str = qdict_get_try_str(qdict, "provider");
+    const char *names = qdict_get_try_str(qdict, "names");
 
     StatsProvider provider = STATS_PROVIDER__MAX;
     StatsTarget target;
@@ -2422,11 +2437,11 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
 
     switch (target) {
     case STATS_TARGET_VM:
-        filter = stats_filter(target, -1, provider);
+        filter = stats_filter(target, names, -1, provider);
         break;
     case STATS_TARGET_VCPU: {}
         int cpu_index = monitor_get_cpu_index(mon);
-        filter = stats_filter(target, cpu_index, provider);
+        filter = stats_filter(target, names, cpu_index, provider);
         break;
     default:
         abort();
-- 
2.36.0


