Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16043510054
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:23:18 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njM61-0001Pr-6Y
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzT-0005WB-Kq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njLzR-0005XL-WB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:16:31 -0400
Received: by mail-wm1-x335.google.com with SMTP id m62so664388wme.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nfdO2sYNKXTeTasqug03s+bRk5Drhel5X5eJOGvauiM=;
 b=NY9bZ2WUjd5s9m62ic5PCx9UyzV7AM16HuVkvqVvz2BekGi6vpRlpyCyjK1chh2SeO
 yRkvCG6UkB2BQWw32St2B0lSzUWa/LOTHFaUn1BEnjrKEE5TM3VaegZ6BVVfrgFdPULX
 Zbr3e0xH1GVjbasIsBbj1Lx3p9NIMduGuR7YFBapIS6gZknPJHyMl2SxwYZesNphRCx9
 mB3YyOk6f27Mm6ol5L3yg0Gwvhauvj0oLxr3QDIlCGqMCTg1BJiKOwoRAigYdGA0pXaQ
 0SDoNlLqcOczOE/WoHUxGlE5iXR8jBn9ZbMaDw3lkpaHx0u9zkdxRZbBtrMlXLwi1Mxc
 jwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nfdO2sYNKXTeTasqug03s+bRk5Drhel5X5eJOGvauiM=;
 b=jMqi7rKTucAeLyGgmB/5uHysiHuSY7UoEPtDVNaxyXcvf2ZKbZI0NlKLpD4vlqglSD
 XtQ9ibbKJobqrk+OkKYb7T1Xzk7dlga7CGGlH37Ztk8qU7vd908lQgqyjOqdj7ljci92
 Vb9y0RqJsYnnuGJFqjvcZv8K2sCkqBdt0ndkwI2K+KBJniNuD1ym4CCrDY3hBb52MJQF
 DVcJWw3qzrWAX03T5SeNln3TM4nMq4atLbE+RAKdyqTwR+LjYXnaprA5m9HLAUW47yY1
 KPuZCwnf5cgh87h9BMPUOjdCHOR32/Uqh847r5QsKkV2qx3TXLDiRh++IqBm/i/9c1VG
 L6Jw==
X-Gm-Message-State: AOAM530KgFo9d9f/dBRBGeV46V07odQbrrJETQLc0TeAbyCtM7CwRg1e
 I8LyGNT2w5WnLY5qk2s6bYeQFX7/KZG6AA==
X-Google-Smtp-Source: ABdhPJwKfzG3HmDBBqC+R9OqDJMnOMrPqvQvLODofIPGQMWNbNlqGp5JJbOUp8lRuicQ8K7b85RuZg==
X-Received: by 2002:a1c:721a:0:b0:38e:c24d:7b8d with SMTP id
 n26-20020a1c721a000000b0038ec24d7b8dmr31212207wmc.83.1650982588638; 
 Tue, 26 Apr 2022 07:16:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm11206464wmr.13.2022.04.26.07.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:16:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] hmp: add filtering of statistics by name
Date: Tue, 26 Apr 2022 16:16:19 +0200
Message-Id: <20220426141619.304611-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426141619.304611-1-pbonzini@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, armbru@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the user to request only a specific subset of statistics.
This can be useful when working on a feature or optimization that is
known to affect that statistic.

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx |  8 ++++----
 monitor/hmp-cmds.c   | 35 +++++++++++++++++++++++++----------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 1a3e16175f..d533036bc9 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -897,10 +897,10 @@ ERST
 
     {
         .name       = "stats",
-        .args_type  = "target:s,provider:s?",
-        .params     = "target [provider]",
-        .help       = "show statistics for the given target (vm or vcpu); optionally filter by "
-	              "provider",
+        .args_type  = "target:s,names:s?,provider:s?",
+        .params     = "target [names] [provider]",
+        .help       = "show statistics for the given target (vm or vcpu); optionally filter by"
+	              "name (comma-separated list, or * for all) and provider",
         .cmd        = hmp_info_stats,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2bce9d7016..4150d76fd9 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2340,10 +2340,12 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
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
@@ -2364,15 +2366,27 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
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
@@ -2382,6 +2396,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
 {
     const char *target_str = qdict_get_str(qdict, "target");
     const char *provider_str = qdict_get_try_str(qdict, "provider");
+    const char *names = qdict_get_try_str(qdict, "names");
 
     StatsProvider provider = STATS_PROVIDER__MAX;
     StatsTarget target;
@@ -2412,11 +2427,11 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
 
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
2.35.1


