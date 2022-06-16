Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EFB54DD11
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:42:08 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l4p-0002EJ-F6
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvU-0001bk-Sp
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvS-0002ov-6i
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6adHh8A0c0VJAWmBKS01WwbcdCA2rGuJLJ+le4u0rGs=;
 b=ZwYQh0Ll/HgtFJWkL9vJXkUhLdHhGsXE1iJ5pfzqRMORLgB13eCIF+nfSRR5UVtppby9mQ
 WRHxiY/k5hgBHKM9iEVZAZix7ly6OGn5di3JhKKpYcdbZ2Luea43Y4RY52wS8fl+omVGhq
 X1vySOdNH4HHxNTzUWKME+mqou+cuqI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-bWuxKUisMe2FhSdb_XQ18g-1; Thu, 16 Jun 2022 04:32:23 -0400
X-MC-Unique: bWuxKUisMe2FhSdb_XQ18g-1
Received: by mail-ed1-f69.google.com with SMTP id
 j4-20020aa7ca44000000b0042dd12a7bc5so754261edt.13
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6adHh8A0c0VJAWmBKS01WwbcdCA2rGuJLJ+le4u0rGs=;
 b=fEHu2BgzEwrENc+XKsFFDLg8UDIEZKIgyPCgwRNkfd1KsdsjOvspHnM2xe57hs0b9V
 /vt6E4VE6okHhAslvHZbC9I2LbKzoukQNQlTLOZlmH69R94VKlvViCxlp4dQn+wPZChW
 KUXIjAqL9VAb9uVizLWmWMEX71M7d2DKp+kAwTlUfxQWyWgVrL9zDl0zwdroak5jgtDL
 V1UDVY5qbxh6W9+aCMT1exdPvLk2h0Dlx3CZSkLLrbvX6CmZfemPpR+r3I5CRvzBn1ze
 1JBQDWlT49CUApcWljsta3SyAVgBde1Q70A7QpfqGA/zs5Tsws9M+Ml5B/fBRQlIyG3f
 MxPw==
X-Gm-Message-State: AJIora/YRRutVFYxAj7xcYwDBa6mnzHerZin3++t/HEOWnBbBq79hRDf
 2AHdEAWOcB9ScQIJLJ6UbohJztY2DPwT4Jv6RdyV1Ljk6hOC/Ih1F5t58GIFr/sKFoAG5j00teU
 p4ymQ7G/496DEnvGz8BgovBhU0mbdE3wzpbdOvBB61BM0LFlHaT3FEjza39nuWXyx5gk=
X-Received: by 2002:a17:906:c154:b0:711:ce44:a0a0 with SMTP id
 dp20-20020a170906c15400b00711ce44a0a0mr3545937ejc.420.1655368341669; 
 Thu, 16 Jun 2022 01:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tULrqz5a36nDxJYA4hml840sNNN2miS7vW9eSgokr7xmMHFKWc2+BbI+rmgUl910MxYpqjAA==
X-Received: by 2002:a17:906:c154:b0:711:ce44:a0a0 with SMTP id
 dp20-20020a170906c15400b00711ce44a0a0mr3545917ejc.420.1655368341370; 
 Thu, 16 Jun 2022 01:32:21 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b006fea43db5c1sm503358ejt.21.2022.06.16.01.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Kanda <mark.kanda@oracle.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 05/21] hmp: add basic "info stats" implementation
Date: Thu, 16 Jun 2022 10:31:53 +0200
Message-Id: <20220616083209.117397-6-pbonzini@redhat.com>
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

From: Mark Kanda <mark.kanda@oracle.com>

Add an HMP command to retrieve statistics collected at run-time.
The command will retrieve and print either all VM-level statistics,
or all vCPU-level statistics for the currently selected CPU.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx  |  13 +++
 include/monitor/hmp.h |   1 +
 monitor/hmp-cmds.c    | 190 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 834bed089e..28757768f7 100644
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
index 622c783c32..04d5ee8fb7 100644
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
@@ -2239,3 +2241,191 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
+{
+    const char *unit = NULL;
+    monitor_printf(mon, "    %s (%s%s", value->name, StatsType_str(value->type),
+                   value->has_unit || value->exponent ? ", " : "");
+
+    if (value->has_unit) {
+        if (value->unit == STATS_UNIT_SECONDS) {
+            unit = "s";
+        } else if (value->unit == STATS_UNIT_BYTES) {
+            unit = "B";
+        }
+    }
+
+    if (unit && value->base == 10 &&
+        value->exponent >= -18 && value->exponent <= 18 &&
+        value->exponent % 3 == 0) {
+        monitor_printf(mon, "%s", si_prefix(value->exponent));
+    } else if (unit && value->base == 2 &&
+               value->exponent >= 0 && value->exponent <= 60 &&
+               value->exponent % 10 == 0) {
+
+        monitor_printf(mon, "%s", iec_binary_prefix(value->exponent));
+    } else if (value->exponent) {
+        /* Use exponential notation and write the unit's English name */
+        monitor_printf(mon, "* %d^%d%s",
+                       value->base, value->exponent,
+                       value->has_unit ? " " : "");
+        unit = NULL;
+    }
+
+    if (value->has_unit) {
+        monitor_printf(mon, "%s", unit ? unit : StatsUnit_str(value->unit));
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
+    g_autoptr(StatsSchemaList) schema = NULL;
+    g_autoptr(StatsResultList) stats = NULL;
+    g_autoptr(StatsFilter) filter = NULL;
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
+        print_stats_results(mon, target, entry->value, schema);
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
2.36.1



