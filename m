Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E28354DD37
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:46:15 +0200 (CEST)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l8i-00085I-4R
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvZ-0001dd-Qb
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvX-0002qk-GX
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2g+8gBbCA1JqVZPzLxDO7Cbm4w8pMDb5v5OsIm+iG8=;
 b=AJvzKrVH1Mah2HD+AVUnr/DD25FyMqAmoSCHmwSzeqVQz0YSLCaMXjkF7a8jp8UiKgxx8Q
 yvjhtALIBMaegZZo+KeJtV76fkVzEWXcnjjv6QQW0BKXIBGEvJJWIQZQ2dP0ZVyTv5OyJv
 2cLusS1tM9hNn+5IfRqLMaXYVyTbZSc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-KZy2Wb7APKmu4_u7N0jc3Q-1; Thu, 16 Jun 2022 04:32:27 -0400
X-MC-Unique: KZy2Wb7APKmu4_u7N0jc3Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 s15-20020a056402520f00b004327f126170so775362edd.7
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t2g+8gBbCA1JqVZPzLxDO7Cbm4w8pMDb5v5OsIm+iG8=;
 b=kN6r2jF+WntZKS4z22YvVRgjSo0/w8JyzCNGExp3VV3XAnRbJPvpMJo41z1vUFw8Ig
 FkD0WLbBiyKiOTlN55Ae0CcSkld8V+xzq/d9AdXVU6N5vE2JcdMjlypcwAq7RCMNTdwc
 ob9xWJwhHMZMyOVgf+rWzial656EvCPtfBDJB2SUk73BGdLQKRBPutV8dNyCwmmUy849
 nxlQGvT2VnR2ESfA1JeXLGsmO9zrzaBbjEBL2+hM3UMUq9l0AfoExWILsB4cBBYT16Qh
 ZE0TfnhaxmnYW+tdThZeIHgvezwd2p+IcK4uLelOuP4RLgS6FcU+T+t6JVwa+XMeKrsB
 Wkxw==
X-Gm-Message-State: AJIora+aHK+FH1Ss5HFI3Fue9qqDRnzM4WKsXmzshZATQHS73RJwmpdd
 dv1cuNdBxIK/uWuCfO5C7/MJxCswD4J0vkfNutYDJv7FZ4HfW+RKG8M5PnkLcUSt8M0rnE2RMLf
 LWY4uVmx3e/TY+Oq3Fy8DwugSdm55VB72fS1Pj9QUVkqHIjxHZYlnpDkI0QnHdAcho+M=
X-Received: by 2002:a17:906:72d2:b0:712:302b:a1d9 with SMTP id
 m18-20020a17090672d200b00712302ba1d9mr3335084ejl.539.1655368345755; 
 Thu, 16 Jun 2022 01:32:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uLQYud4L3bIqgkaZvjzB6YMfXwCDkJzc0OQ57eqnJ9yyIdgH8McIjFOROQWkWRnjNbHFYc/g==
X-Received: by 2002:a17:906:72d2:b0:712:302b:a1d9 with SMTP id
 m18-20020a17090672d200b00712302ba1d9mr3335067ejl.539.1655368345480; 
 Thu, 16 Jun 2022 01:32:25 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ss17-20020a170907039100b006fed787478asm484239ejb.92.2022.06.16.01.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 07/21] hmp: add filtering of statistics by provider
Date: Thu, 16 Jun 2022 10:31:55 +0200
Message-Id: <20220616083209.117397-8-pbonzini@redhat.com>
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

Allow the user to request statistics for a single provider of interest.
Extracted from a patch by Mark Kanda.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx |  7 ++++---
 monitor/hmp-cmds.c   | 39 ++++++++++++++++++++++++++++++++-------
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 28757768f7..a67040443b 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -897,9 +897,10 @@ ERST
 
     {
         .name       = "stats",
-        .args_type  = "target:s",
-        .params     = "target",
-        .help       = "show statistics; target is either vm or vcpu",
+        .args_type  = "target:s,provider:s?",
+        .params     = "target [provider]",
+        .help       = "show statistics for the given target (vm or vcpu); optionally filter by "
+                      "provider",
         .cmd        = hmp_info_stats,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9180cf1841..9278439533 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2300,6 +2300,7 @@ static StatsSchemaValueList *find_schema_value_list(
 }
 
 static void print_stats_results(Monitor *mon, StatsTarget target,
+                                bool show_provider,
                                 StatsResult *result,
                                 StatsSchemaList *schema)
 {
@@ -2314,8 +2315,10 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
         return;
     }
 
-    monitor_printf(mon, "provider: %s\n",
-                   StatsProvider_str(result->provider));
+    if (show_provider) {
+        monitor_printf(mon, "provider: %s\n",
+                       StatsProvider_str(result->provider));
+    }
 
     for (stats_list = result->stats; stats_list;
              stats_list = stats_list->next,
@@ -2356,7 +2359,8 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
 }
 
 /* Create the StatsFilter that is needed for an "info stats" invocation.  */
-static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
+static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
+                                 StatsProvider provider)
 {
     StatsFilter *filter = g_malloc0(sizeof(*filter));
 
@@ -2378,12 +2382,25 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
     default:
         break;
     }
+
+    if (provider == STATS_PROVIDER__MAX) {
+        return filter;
+    }
+
+    /* "info stats" can only query either one or all the providers.  */
+    filter->has_providers = true;
+    filter->providers = g_new0(StatsRequestList, 1);
+    filter->providers->value = g_new0(StatsRequest, 1);
+    filter->providers->value->provider = provider;
     return filter;
 }
 
 void hmp_info_stats(Monitor *mon, const QDict *qdict)
 {
     const char *target_str = qdict_get_str(qdict, "target");
+    const char *provider_str = qdict_get_try_str(qdict, "provider");
+
+    StatsProvider provider = STATS_PROVIDER__MAX;
     StatsTarget target;
     Error *err = NULL;
     g_autoptr(StatsSchemaList) schema = NULL;
@@ -2396,19 +2413,27 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "invalid stats target %s\n", target_str);
         goto exit_no_print;
     }
+    if (provider_str) {
+        provider = qapi_enum_parse(&StatsProvider_lookup, provider_str, -1, &err);
+        if (err) {
+            monitor_printf(mon, "invalid stats provider %s\n", provider_str);
+            goto exit_no_print;
+        }
+    }
 
-    schema = qmp_query_stats_schemas(false, STATS_PROVIDER__MAX, &err);
+    schema = qmp_query_stats_schemas(provider_str ? true : false,
+                                     provider, &err);
     if (err) {
         goto exit;
     }
 
     switch (target) {
     case STATS_TARGET_VM:
-        filter = stats_filter(target, -1);
+        filter = stats_filter(target, -1, provider);
         break;
     case STATS_TARGET_VCPU: {}
         int cpu_index = monitor_get_cpu_index(mon);
-        filter = stats_filter(target, cpu_index);
+        filter = stats_filter(target, cpu_index, provider);
         break;
     default:
         abort();
@@ -2419,7 +2444,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         goto exit;
     }
     for (entry = stats; entry; entry = entry->next) {
-        print_stats_results(mon, target, entry->value, schema);
+        print_stats_results(mon, target, provider_str == NULL, entry->value, schema);
     }
 
 exit:
-- 
2.36.1



