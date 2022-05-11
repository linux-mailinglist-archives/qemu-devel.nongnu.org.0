Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C18522EC3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 10:54:24 +0200 (CEST)
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noi6w-0000ip-Gv
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 04:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1e-0006Rr-Cg
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1c-0002pv-92
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652258931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AA2Wg5DCFJVCXutTi9eYkN692gRcgHXwTUnSm45tvWQ=;
 b=JwUtUDIEqrb0wFE+QbsQup8zVSw6RsUaS5FKLd9zgUtzZAEZgaHutfaL1Xb5JyuNyQbXA8
 YwcQiaulNb8vaQ7jSPNwoiFZ9vyuQxXcUxVm+SrWx+ovKEZ01Gwvzb7KDIIgBx51FFS4Z1
 lV75jurftKONELcOlWUOnAfIdiCa2/I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-h9revUlOMTm_ta_-bA29NQ-1; Wed, 11 May 2022 04:48:50 -0400
X-MC-Unique: h9revUlOMTm_ta_-bA29NQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so509600wmj.0
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 01:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AA2Wg5DCFJVCXutTi9eYkN692gRcgHXwTUnSm45tvWQ=;
 b=xWtQmN+vUpzxErQR1EYIoY0BedJBh0OLIEjs6+12ExFyylIRqycyESkfJPr65wM6nZ
 p+5TefraF/5YaMM0AqPZK6UkDMsA5FtQlWVm8IEyalUsa0EFDVnAO+rwjJLXtrIS7+mw
 9CIHXKoIW2hGujt6gbDmGlUZuX+Ta1qr5Q/7Ac2QipuFJuofp+XWQVFjKxyFhKD5XMIc
 HS6W7ppvp7tuGZjiq7cyI7TnwcDgMhC0BWSY0tgGsQyuDA9JVPmzmrhBtwbGbeJIzXO7
 b44TJXJD92x1IuJUXAZ7PdPhsmBcNmmDS1iuGCyHO+WpkPj4+BHe6LtbdEP9TzpvstGc
 G2yw==
X-Gm-Message-State: AOAM530Vs+NpyhRx21QpFF1nBSmiPS+9x2b7NFaW7I+ZuYEv2bZ2YKOy
 Ohna6s4TqyQxBypvqlgKjBtZNPV9LecgzPg2uokGG940iTgg7HVHW4kiE5PZpqp1MQ8DRFiKmM0
 vOuwovbpB+6N9z4RsFA2l/iOO+ZGSx6diy3+xOyA+6jsik80FzPPenUQCBwk100XYrWQ=
X-Received: by 2002:a05:6000:1110:b0:20a:e113:8221 with SMTP id
 z16-20020a056000111000b0020ae1138221mr21121553wrw.271.1652258928887; 
 Wed, 11 May 2022 01:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZXTz5ZwZpwMgvKu2qemNu+g0d304tWnH5U6rHopfTr88cprjPj/uU/54+P0whb8GvTsXa3g==
X-Received: by 2002:a05:6000:1110:b0:20a:e113:8221 with SMTP id
 z16-20020a056000111000b0020ae1138221mr21121530wrw.271.1652258928595; 
 Wed, 11 May 2022 01:48:48 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c215100b003943558a976sm1499240wml.29.2022.05.11.01.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:48:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH v2 4/8] hmp: add basic "info stats" implementation
Date: Wed, 11 May 2022 10:48:29 +0200
Message-Id: <20220511084833.195963-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220511084833.195963-1-pbonzini@redhat.com>
References: <20220511084833.195963-1-pbonzini@redhat.com>
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

From: Mark Kanda <mark.kanda@oracle.com>

Add an HMP command to retrieve statistics collected at run-time.
The command will retrieve and print either all VM-level statistics,
or all vCPU-level statistics for the currently selected CPU.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx  |  13 +++
 include/monitor/hmp.h |   1 +
 monitor/hmp-cmds.c    | 187 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 201 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index adfa085a9b..221feab8c0 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -894,3 +894,16 @@ SRST
   ``info via``
     Show guest mos6522 VIA devices.
 ERST
+
+    {
+        .name       = "stats",
+        .args_type  = "target:s",
+        .params     = "target",
+        .help       = "show statistics; target is either vm or vcpu",
+        .cmd        = hmp_info_stats,
+    },
+
+SRST
+  ``stats``
+    Show runtime-collected statistics
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d014826a..2e89a97bd6 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -133,5 +133,6 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
+void hmp_info_stats(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 93061a11af..f72dfd2dc4 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -40,6 +40,7 @@
 #include "qapi/qapi-commands-pci.h"
 #include "qapi/qapi-commands-rocker.h"
 #include "qapi/qapi-commands-run-state.h"
+#include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qapi-visit-net.h"
@@ -52,6 +53,7 @@
 #include "ui/console.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
+#include "hw/core/cpu.h"
 #include "hw/intc/intc.h"
 #include "migration/snapshot.h"
 #include "migration/misc.h"
@@ -2233,3 +2235,188 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
+{
+    const char *prefix = "";
+    monitor_printf(mon, "    %s (%s", value->name, StatsType_str(value->type));
+
+    if (value->has_unit && value->unit == STATS_UNIT_SECONDS &&
+        (value->exponent == 0 || value->base == 10) &&
+        value->exponent >= -9 && value->exponent <= 0 &&
+        value->exponent % 3 == 0) {
+
+        static const char *si_prefix[] = { "", "milli", "micro", "nano" };
+        prefix = si_prefix[value->exponent / -3];
+
+    } else if (value->has_unit && value->unit == STATS_UNIT_BYTES &&
+               (value->exponent == 0 || value->base == 2) &&
+               value->exponent >= 0 && value->exponent <= 40 &&
+               value->exponent % 10 == 0) {
+
+        static const char *si_prefix[] = {
+            "", "kilo", "mega", "giga", "tera" };
+        prefix = si_prefix[value->exponent / 10];
+
+    } else if (value->exponent) {
+        /* Print the base and exponent as "x <base>^<exp>" */
+        monitor_printf(mon, ", * %d^%d", value->base,
+                       value->exponent);
+    }
+
+    if (value->has_unit) {
+        monitor_printf(mon, " %s%s", prefix, StatsUnit_str(value->unit));
+    }
+
+    /* Print bucket size for linear histograms */
+    if (value->type == STATS_TYPE_LINEAR_HISTOGRAM && value->has_bucket_size) {
+        monitor_printf(mon, ", bucket size=%d", value->bucket_size);
+    }
+    monitor_printf(mon, ")");
+}
+
+static StatsSchemaValueList *find_schema_value_list(
+    StatsSchemaList *list, StatsProvider provider,
+    StatsTarget target)
+{
+    StatsSchemaList *node;
+
+    for (node = list; node; node = node->next) {
+        if (node->value->provider == provider &&
+            node->value->target == target) {
+            return node->value->stats;
+        }
+    }
+    return NULL;
+}
+
+static void print_stats_results(Monitor *mon, StatsTarget target,
+                                StatsResult *result,
+                                StatsSchemaList *schema)
+{
+    /* Find provider schema */
+    StatsSchemaValueList *schema_value_list =
+        find_schema_value_list(schema, result->provider, target);
+    StatsList *stats_list;
+
+    if (!schema_value_list) {
+        monitor_printf(mon, "failed to find schema list for %s\n",
+                       StatsProvider_str(result->provider));
+        return;
+    }
+
+    monitor_printf(mon, "provider: %s\n",
+                   StatsProvider_str(result->provider));
+
+    for (stats_list = result->stats; stats_list;
+             stats_list = stats_list->next,
+             schema_value_list = schema_value_list->next) {
+
+        Stats *stats = stats_list->value;
+        StatsValue *stats_value = stats->value;
+        StatsSchemaValue *schema_value = schema_value_list->value;
+
+        /* Find schema entry */
+        while (!g_str_equal(stats->name, schema_value->name)) {
+            if (!schema_value_list->next) {
+                monitor_printf(mon, "failed to find schema entry for %s\n",
+                               stats->name);
+                return;
+            }
+            schema_value_list = schema_value_list->next;
+            schema_value = schema_value_list->value;
+        }
+
+        print_stats_schema_value(mon, schema_value);
+
+        if (stats_value->type == QTYPE_QNUM) {
+            monitor_printf(mon, ": %" PRId64 "\n", stats_value->u.scalar);
+        } else if (stats_value->type == QTYPE_QLIST) {
+            uint64List *list;
+            int i;
+
+            monitor_printf(mon, ": ");
+            for (list = stats_value->u.list, i = 1;
+                 list;
+                 list = list->next, i++) {
+                monitor_printf(mon, "[%d]=%" PRId64 " ", i, list->value);
+            }
+            monitor_printf(mon, "\n");
+        }
+    }
+}
+
+/* Create the StatsFilter that is needed for an "info stats" invocation.  */
+static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
+{
+    StatsFilter *filter = g_malloc0(sizeof(*filter));
+
+    filter->target = target;
+    switch (target) {
+    case STATS_TARGET_VM:
+        break;
+    case STATS_TARGET_VCPU:
+    {
+        strList *vcpu_list = NULL;
+        CPUState *cpu = qemu_get_cpu(cpu_index);
+        char *canonical_path = object_get_canonical_path(OBJECT(cpu));
+
+        QAPI_LIST_PREPEND(vcpu_list, canonical_path);
+        filter->u.vcpu.has_vcpus = true;
+        filter->u.vcpu.vcpus = vcpu_list;
+        break;
+    }
+    default:
+        break;
+    }
+    return filter;
+}
+
+void hmp_info_stats(Monitor *mon, const QDict *qdict)
+{
+    const char *target_str = qdict_get_str(qdict, "target");
+    StatsTarget target;
+    Error *err = NULL;
+    g_autoptr(StatsFilter) filter = NULL;
+    g_autoptr(StatsSchemaList) schema = NULL;
+    g_autoptr(StatsResultList) stats = NULL;
+    StatsResultList *entry;
+
+    target = qapi_enum_parse(&StatsTarget_lookup, target_str, -1, &err);
+    if (err) {
+        monitor_printf(mon, "invalid stats target %s\n", target_str);
+        goto exit_no_print;
+    }
+
+    schema = qmp_query_stats_schemas(&err);
+    if (err) {
+        goto exit;
+    }
+
+    switch (target) {
+    case STATS_TARGET_VM:
+        filter = stats_filter(target, -1);
+        break;
+    case STATS_TARGET_VCPU: {}
+        int cpu_index = monitor_get_cpu_index(mon);
+        filter = stats_filter(target, cpu_index);
+        break;
+    default:
+        abort();
+    }
+
+    stats = qmp_query_stats(filter, &err);
+    if (err) {
+        goto exit;
+    }
+    for (entry = stats; entry; entry = entry->next) {
+        print_stats_results(mon, target, provider_str == NULL, entry->value, schema);
+    }
+
+exit:
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+    }
+exit_no_print:
+    error_free(err);
+}
-- 
2.36.0


