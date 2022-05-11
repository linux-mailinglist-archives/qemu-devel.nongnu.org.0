Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F2522EFA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:08:41 +0200 (CEST)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noiKm-0007P6-FE
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1h-0006YG-KF
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1f-0002rX-Uj
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652258935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noKfh4wOcP7cBJnkXkTaNxPldL6w7TQ4RxY/JFN41sI=;
 b=GGGT7GIrSznH0Pn4jTjO6H9oBRdTVE2iTLpwvIAxd+O6nQIoz/KV333zMQExAoPv7TloSm
 TRCVQQD2W7zyoTLu+e9F7jy0H/8W7KCc4U+fpVDu54QBXfe5bf/V+AyCtjA90E5fa8VkFU
 RMGYvVk7s/z2f4YUOaQxM7ppihrHgZQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-heuWP4IANOG4FeGQaWwhcA-1; Wed, 11 May 2022 04:48:54 -0400
X-MC-Unique: heuWP4IANOG4FeGQaWwhcA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so509649wmj.0
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 01:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=noKfh4wOcP7cBJnkXkTaNxPldL6w7TQ4RxY/JFN41sI=;
 b=l+pS1ruYl3rmJJPlAl2xMtqaZLSnaCW7ud4hUVIXOhAGwN4QOJgb3p9Y3+DnuX2T8c
 HtUFacNrixwup2gm6mFQHxscbIr3D31TdhIATWzNkmeTE4G0MgHwOLhfec1XbmOggttz
 UZYJcWfZDaY9IKEnbt1p4qDt/NfOQVXhrdI0cuHS8dHgXHI8Ye+nA6bW5cXjnDtc5SUa
 ZtJW7J3ho+DxH3Wbtizh0EYn772r/0Z/oHgoumR/t3kQjr7f7RG51d6mICPD+1OiujUI
 Id9vxFWi0VO4wzhnDOskjXLkRSQ+yId3jvKJ74neUO/LZgVkFseewFTU3SmuuPqxj2CB
 4M9g==
X-Gm-Message-State: AOAM532CB1cdHQS6rFXexMx5qN2tCCpy2ZuJWAJiA5h4qKTw9GvMmmu9
 p+YNuEVv74IMFT63HN6cQI4Yirj6zEfU9yFoRvRwsAy+LGsc3dMhW5uabFz0OZKhQVjxV4ev8mS
 Vs64ffskuMWjLc801+iFpI25pHEP1fChblcp2U4uhQ7/4O6hvMHzXbcmCJMZFw0OuCu0=
X-Received: by 2002:a05:600c:1d18:b0:394:6469:abec with SMTP id
 l24-20020a05600c1d1800b003946469abecmr3670663wms.89.1652258932577; 
 Wed, 11 May 2022 01:48:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPeMO821pRoAfRuUN3AuBD4+OJ4pEYTyY3JfZpYt5yB+FCpKsjhcsKolrEzRcz2hYBDK10uQ==
X-Received: by 2002:a05:600c:1d18:b0:394:6469:abec with SMTP id
 l24-20020a05600c1d1800b003946469abecmr3670627wms.89.1652258932212; 
 Wed, 11 May 2022 01:48:52 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0a5200b003942a244ec8sm1571739wmq.13.2022.05.11.01.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:48:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 6/8] hmp: add filtering of statistics by provider
Date: Wed, 11 May 2022 10:48:31 +0200
Message-Id: <20220511084833.195963-7-pbonzini@redhat.com>
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

Allow the user to request statistics for a single provider of interest.
Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 monitor/hmp-cmds.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 26c5d2498b..4f4ecbfbfb 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2291,6 +2291,7 @@ static StatsSchemaValueList *find_schema_value_list(
 }
 
 static void print_stats_results(Monitor *mon, StatsTarget target,
+                                bool show_provider,
                                 StatsResult *result,
                                 StatsSchemaList *schema)
 {
@@ -2305,8 +2306,10 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
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
@@ -2347,7 +2350,8 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
 }
 
 /* Create the StatsFilter that is needed for an "info stats" invocation.  */
-static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
+static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
+                                 StatsProvider provider)
 {
     StatsFilter *filter = g_malloc0(sizeof(*filter));
 
@@ -2369,12 +2373,27 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
     default:
         break;
     }
+
+    if (provider == STATS_PROVIDER__MAX) {
+        return filter;
+    }
+
+    /* "info stats" can only query either one or all the providers.  */
+    StatsRequest *request = g_new0(StatsRequest, 1);
+    request->provider = provider;
+    StatsRequestList *request_list = g_new0(StatsRequestList, 1);
+    QAPI_LIST_PREPEND(request_list, request);
+    filter->has_providers = true;
+    filter->providers = request_list;
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
     g_autoptr(StatsFilter) filter = NULL;
@@ -2387,19 +2406,27 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
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
 
-    schema = qmp_query_stats_schemas(false, 0, &err);
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
-- 
2.36.0


