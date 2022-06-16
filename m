Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C1F54DD3A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:46:41 +0200 (CEST)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l9E-00086k-Fy
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvd-0001er-0z
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvb-0002r5-1w
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iq+gOHxdsaq8yaaQJvJQCIAWrFSqRvFdx05ykqq+UlU=;
 b=gSEwp0ZxQLVAxy02RU0BQd5FjR6UY49nTpKbtgynDyBe3qLjqTrYn4RvVm0Pdi5/9ZflBb
 Murzh7hCSlttKzX0mZ+pCeuS3jAY+2e+ljqstj+5Ld4aYwTrHuqqRMIlaGPZFJhh7dcgg0
 Q8kzDbZzl+UwPlS8VmEaIisnm7CB4T8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-DDN-gZf_OlC_h6N2U4_Duw-1; Thu, 16 Jun 2022 04:32:33 -0400
X-MC-Unique: DDN-gZf_OlC_h6N2U4_Duw-1
Received: by mail-ed1-f70.google.com with SMTP id
 a4-20020a056402168400b0042dc5b94da6so766848edv.10
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iq+gOHxdsaq8yaaQJvJQCIAWrFSqRvFdx05ykqq+UlU=;
 b=ohn3JRAAOhjq03v+jNqmsekp276AmEZFx+e+Bu1zKSBIgzjZJXKYa6Pk8e/YhtFDJx
 1ch/skxk7MoRpDGtP/rz4tLck5bSs4XVDjYOzUd7ac6T9qFirbno1H4wrTBSv0KeRDpi
 VrihVj/yTiOwq8V2biiTps+WQqaMfB3QCFe0tBn+6QNehFMRBK4obGr+V88ebGuSliXU
 tU6pdEXWLIFYlWGTFGQQ/P3CNPJkNENK84iIwCk6PTbOJe0lku2H8ZFDokRcR4UmTThr
 3f00+YbiwRJCdlYM6mpgpC4g9VkP3jaxYerGlFhsq4Hs8riGEX5RXZ1pRVu+GVVDBEIn
 WUlA==
X-Gm-Message-State: AJIora9w47ipYa9kdAXRAYZx4Bv1j5iO+CmX2L1a8EC4X3EndqV3iMM6
 H0U1GDATP1MYUeXgMiE0DQjC+16QvYSCRUiV/gzEw1oYNaPYLXRmzvpKXEq/gICfwGJXYxaqR+C
 +p8wAp8+f0py3jBhw4yaUCBjjyuL4Ae/wZI1tX9xT+d8RYdw0SoRGFTXJAb9L0543Afs=
X-Received: by 2002:a17:907:c24:b0:711:d4c6:9161 with SMTP id
 ga36-20020a1709070c2400b00711d4c69161mr3526974ejc.760.1655368351810; 
 Thu, 16 Jun 2022 01:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vin+zgrMos17KDPvebkruzC3Fo24dKxZPOStJF7AYzsFot3U8px6xXZLKzNcduolCx4p9E/w==
X-Received: by 2002:a17:907:c24:b0:711:d4c6:9161 with SMTP id
 ga36-20020a1709070c2400b00711d4c69161mr3526956ejc.760.1655368351519; 
 Thu, 16 Jun 2022 01:32:31 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a05640212ca00b0042de29d8fc0sm1244188edx.94.2022.06.16.01.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 09/21] hmp: add filtering of statistics by name
Date: Thu, 16 Jun 2022 10:31:57 +0200
Message-Id: <20220616083209.117397-10-pbonzini@redhat.com>
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

Allow the user to request only a specific subset of statistics.
This can be useful when working on a feature or optimization that is
known to affect that statistic.

Example:

   (qemu) info stats vcpu halt_poll_fail_ns
   provider: kvm
       halt_poll_fail_ns (cumulative, ns): 0

In case multiple providers have the same statistic, the provider can be
specified too:

   (qemu) info stats vcpu halt_poll_fail_ns kvm
   provider: kvm
       halt_poll_fail_ns (cumulative, ns): 0

Extracted from a patch by Mark Kanda.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
index 9278439533..47a27326ee 100644
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



