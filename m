Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414553849B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:19:04 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhAd-0000z3-Au
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzb-0003cL-OB
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzZ-00063J-TH
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653923257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lNb/5F2vAV8IDFgSzr0MPhlnhPYTLhqMSK1w6y1gT8=;
 b=NKQGIe5TwozVTzIMdwxEYzbVnaCO3IAeIF3NzBgNLB6T9ehYbiH7XQeYpxgcL9G4GKzKrw
 rW5Ux+VfLE1LxFT6/C2VS+IaBhbfyIOlvovaEjXp8NMmnatUT6p1o06nKX4g3LJhCZPjSl
 eVVWCMo5ZyfvRrme47u/eFjbKI9+jCY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-kNTMoYg8MQqmwamHXu1ofg-1; Mon, 30 May 2022 11:07:36 -0400
X-MC-Unique: kNTMoYg8MQqmwamHXu1ofg-1
Received: by mail-ed1-f70.google.com with SMTP id
 k21-20020aa7d2d5000000b0042dcac48313so3373104edr.8
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lNb/5F2vAV8IDFgSzr0MPhlnhPYTLhqMSK1w6y1gT8=;
 b=TcpIuH588y+Ba/NHeS1dVnIVCefa8LNHTtPD1yycvgykZHysEP4zQio0dpbZ8IqohI
 mpwY67Do9KdSqkEzDyAoGnyFMoaDzbW8VZDgMLCfORafxh9LWLALxb7P27fJkDgAFAFj
 Lz9MDzNOlNOiSTzW1+il2GVYMFQa6wOOzbagbpqcPsVnIp9oLRDrFcH04gkxNq9nx8e1
 vSCXXNHDUdUM0ELnNi0zeGTkbGmRGrbObrtduAmd/DA1eom3zNpfjcfrJVk9wnGWpyCg
 dPn0KrzphzlrR6ZKjFFHsXjUDB4wsuz48kYAkHnsd9+d8dYHsf9b3LNCvr0612krYGe8
 6b7A==
X-Gm-Message-State: AOAM531AG0CBtMGihhKHz1vK4at/M+zhZp298B/Mg4wLFcldc7nR0f/N
 mKvbE8W5eaQdsbXMgTpR/IXhvyPw9cA3JgIFMiW9Z4pp9zrt4GY1os+iBHb1GTe/Y6tGeUwfBYL
 h1HAeC3F447DHJoJLdZ6U2MoPGSTSXiZ3sYIFw/mlHYYr3TljBtto665du/cuZtfmI6Y=
X-Received: by 2002:a17:907:9712:b0:6ff:c09:33a2 with SMTP id
 jg18-20020a170907971200b006ff0c0933a2mr24379319ejc.50.1653923254290; 
 Mon, 30 May 2022 08:07:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSHV34oAI1ePItBP5QEIQco3qxuSu2aYNQmvcdMbIz9M9BjepF65OTM/nXQ+j/Z8CTcELo5w==
X-Received: by 2002:a17:907:9712:b0:6ff:c09:33a2 with SMTP id
 jg18-20020a170907971200b006ff0c0933a2mr24379289ejc.50.1653923253931; 
 Mon, 30 May 2022 08:07:33 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 y12-20020a170906524c00b006f3ef214e2csm4142476ejm.146.2022.05.30.08.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:07:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v5 08/10] hmp: add filtering of statistics by provider
Date: Mon, 30 May 2022 17:07:12 +0200
Message-Id: <20220530150714.756954-9-pbonzini@redhat.com>
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

Allow the user to request statistics for a single provider of interest.
Extracted from a patch by Mark Kanda.

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
index c501d1fa2b..a71887e54c 100644
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



