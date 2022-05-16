Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFBD528097
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 11:13:59 +0200 (CEST)
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWne-0006rW-TK
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 05:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWd2-0001wN-BK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWd0-0007Oe-K6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652691778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzqSppjpfAh1TGK2khHL4FpRe1zpCn/m2KlpoVzVRBQ=;
 b=CAkCn31Ik4Cxow0Je9DH84dKtadvjYGYYSGPFyQh6AQrFW5H42PJ3CED8CuGnnFHOXgTqR
 GfXKBQn/I0jGvCXhNu9zhu0Rozp4JuklBsSxR05L0Ke4lwpud4EoxkHkhHXD00m+WuoNMF
 GqElKMeynRF1Tpw6H8mU5u1wTqzKeVk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-ZsP17mlwPTyc_QtXMKwlWA-1; Mon, 16 May 2022 05:02:57 -0400
X-MC-Unique: ZsP17mlwPTyc_QtXMKwlWA-1
Received: by mail-ed1-f70.google.com with SMTP id
 bc17-20020a056402205100b0042aa0e072d3so2976774edb.17
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 02:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UzqSppjpfAh1TGK2khHL4FpRe1zpCn/m2KlpoVzVRBQ=;
 b=Glihw/krN/fUl0rJZXxCRhmHujZyKiW50AhN1Dm5zHzgSNhOeMKia4bTKoeNNI0oI1
 hOur0q4OPsDjWNjMKuBEJDj/8IvRJq6dFlKdd47tNkDDvpXm/wrjSq3i02Xsw94WHigk
 0ScaE8T73Wn0pHbuxirVW/YA0ZhkBuL65e/WY6EcV2zvFozdJKqvUmKzW4Q3xTfzxi3v
 BeckfbQss0RUs81ADKk2X7A517gMF7uRf0goJ9rcsAOG3CGiMUQEgfkV2SVKI/9Q61IM
 Y3tlACrqlZKCA2D/Qt8LlDOrMFwff3OC7OPmIobWV09334vhC6lumYi+RXto14MU0RAY
 KxAQ==
X-Gm-Message-State: AOAM533GWwK2BOGgrYewnaHNqKws0LhkaBrbI2pt7lQ+WzmNQwWHxlIX
 5FYXacxfYGrvJYQ+vwlJAWWEf+ODaBbeSMYalSGK2OV8ieSsNN1cb/5iNzZtg+18gSJkLUeYxK8
 6KoTetajpcCN56tYjYjGk6xqVfIZiUUh7ncEg5G2XkISJYDaygE2m9SaM7rt7QFYDKWE=
X-Received: by 2002:a17:906:6a0f:b0:6f5:15cf:2e5 with SMTP id
 qw15-20020a1709066a0f00b006f515cf02e5mr13930128ejc.584.1652691775241; 
 Mon, 16 May 2022 02:02:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy95QWf4jTFA19qmFbBy0p40K2hMhJIZ+Hm6NKCb8aeeXTq2TZJtoiD/wBkvaopFWAlodEccw==
X-Received: by 2002:a17:906:6a0f:b0:6f5:15cf:2e5 with SMTP id
 qw15-20020a1709066a0f00b006f515cf02e5mr13930109ejc.584.1652691774924; 
 Mon, 16 May 2022 02:02:54 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a056402048c00b0042aa153e73esm2785411edv.12.2022.05.16.02.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 02:02:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, dgilbert@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH v3 8/8] hmp: add filtering of statistics by name
Date: Mon, 16 May 2022 11:02:34 +0200
Message-Id: <20220516090234.1195907-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516090058.1195767-1-pbonzini@redhat.com>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
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

Extracted from a patch by Mark Kanda.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx |  8 ++++----
 monitor/hmp-cmds.c   | 35 +++++++++++++++++++++++++----------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index d4d8a1e618..767aafd1ea 100644
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
index 4fa671fe0a..cff4e3ff10 100644
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


