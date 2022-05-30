Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB1538488
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:16:33 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvh8C-0003oB-9o
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzi-0003g1-DJ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzg-000641-OQ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653923263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLhXjY6rKgLe+f59XTcBR4qtIYCyiwXQPvmwiUxl0zo=;
 b=bVVTZWi2Kx8Hk9QNrP+g8NEnllVm8PXVRL/MltSRtv0W52w87PWVRGXCxiRrBZA+9o2GwH
 YWpNleHh2saLWlO6BHMbsGunW+cmieUNfzcSskHR1ot7Cue4kTKuxdEASgeICzKouZ62Ij
 xaQbsCJj8AmkE8UhgYybwB/C15eMHds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-GltYjDEePd2iqbDZKThbjw-1; Mon, 30 May 2022 11:07:39 -0400
X-MC-Unique: GltYjDEePd2iqbDZKThbjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k124-20020a1ca182000000b003973db7d1a0so70090wme.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLhXjY6rKgLe+f59XTcBR4qtIYCyiwXQPvmwiUxl0zo=;
 b=d2aLoNBgJsOudffJLeyaXsg0KlOkGjSo9ElVWdpOWFw6kQzfQzzke4kDUVcE0Ks17T
 cyn4JvQzrQ4KY2twFZR5uqu4VSuo+F9nyExbUzb//7HEVI4+ZQaK0V5c5773Zv4DSZ7G
 y6T6sUcamASgDdlharzO7pad2fSH2nthEuQpulVbUx4eBbOX3W/Wj9X4EmsW2zTYuMU4
 mmMgg/MCqY00wusJwx2A5yT3woG4Z8gkeYWeiH0kweXPZvwXexKxeA2fE+OYHXka22uX
 vVRhwSnPFjp3IyIamWBNrJUd003vwfYrM+qpStq4poPuHUstIhseo1iqfu59iOUBPjmE
 bGfw==
X-Gm-Message-State: AOAM530sfb/hSCCgpULUwAfY4qKc1KemsNvpjnREGH4ylF6gWfMlRHf+
 l4a88a9lsQwxDIW/xjMynMDwgqPZk3RthHYN/NbV3vMfCZWAeYXtbGnB/72nkCErbMmkcBD94oy
 LOnHY8XJPx9Q3+tFZ4HK270PuvXkBQ/uAhn7u0FFx2kqLNdL7qnVPAlVWPzg6YbCaiqY=
X-Received: by 2002:a05:600c:502a:b0:397:44d1:d5b6 with SMTP id
 n42-20020a05600c502a00b0039744d1d5b6mr19478088wmr.57.1653923257770; 
 Mon, 30 May 2022 08:07:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz581ND6eiMY6tUg2a7yaPZD61xnbooWnNVxbIjVCNOO/9tFeBE2Fz9w38H9RU44BSwYrfk9w==
X-Received: by 2002:a05:600c:502a:b0:397:44d1:d5b6 with SMTP id
 n42-20020a05600c502a00b0039744d1d5b6mr19478050wmr.57.1653923257301; 
 Mon, 30 May 2022 08:07:37 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a05600c41d600b003942a244ebesm10436682wmh.3.2022.05.30.08.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:07:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v5 10/10] hmp: add filtering of statistics by name
Date: Mon, 30 May 2022 17:07:14 +0200
Message-Id: <20220530150714.756954-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530150714.756954-1-pbonzini@redhat.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
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

Allow the user to request only a specific subset of statistics.
This can be useful when working on a feature or optimization that is
known to affect that statistic.

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx |  8 ++++----
 monitor/hmp-cmds.c   | 35 ++++++++++++++++++++++++++---------
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index a67040443b..3ffa24bd67 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -897,10 +897,10 @@ ERST
 
     {
         .name       = "stats",
-        .args_type  = "target:s,provider:s?",
-        .params     = "target [provider]",
-        .help       = "show statistics for the given target (vm or vcpu); optionally filter by "
-                      "provider",
+        .args_type  = "target:s,names:s?,provider:s?",
+        .params     = "target [names] [provider]",
+        .help       = "show statistics for the given target (vm or vcpu); optionally filter by"
+                      "name (comma-separated list, or * for all) and provider",
         .cmd        = hmp_info_stats,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a71887e54c..8775f69ff1 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2359,10 +2359,12 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
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
@@ -2383,15 +2385,29 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
         break;
     }
 
-    if (provider == STATS_PROVIDER__MAX) {
+    if (!names && provider == STATS_PROVIDER__MAX) {
         return filter;
     }
 
-    /* "info stats" can only query either one or all the providers.  */
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
-    filter->providers = g_new0(StatsRequestList, 1);
-    filter->providers->value = g_new0(StatsRequest, 1);
-    filter->providers->value->provider = provider;
+    filter->providers = request_list;
     return filter;
 }
 
@@ -2399,6 +2415,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
 {
     const char *target_str = qdict_get_str(qdict, "target");
     const char *provider_str = qdict_get_try_str(qdict, "provider");
+    const char *names = qdict_get_try_str(qdict, "names");
 
     StatsProvider provider = STATS_PROVIDER__MAX;
     StatsTarget target;
@@ -2429,11 +2446,11 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
 
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
2.36.1


