Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA0C538486
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:16:24 +0200 (CEST)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvh82-0003bd-Jn
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzb-0003cD-EC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzY-000639-Rg
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653923256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SogE1l02KogvUO/2yTSaAwaw8oXDpfL2EYKwUvlNF/w=;
 b=TnXRtdHtIVmyOYeg9B1bnyJzBsnbQGwA8Eknnihxqv4WptdsAkdyVBtHxbPn51Q0TkIDZP
 9DvTG5uAZEThiHMo+96rxTXuwyqHzjV5RhYiNCRM1BdgBOtw83PQMZzPF7Rd7FlVQsOqrC
 GP2N4dtuqgs/AtCbf3Q06ln0ZOkFUwM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-MCSAHVBnPK6_iBCSc-A72Q-1; Mon, 30 May 2022 11:07:32 -0400
X-MC-Unique: MCSAHVBnPK6_iBCSc-A72Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 k7-20020aa7d8c7000000b0042dd4a5a393so1661920eds.11
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SogE1l02KogvUO/2yTSaAwaw8oXDpfL2EYKwUvlNF/w=;
 b=cxtFuU4sacuT2TX3m6ppwr+oA27ivIyQDAz4kjYtKd/iRaF18n5sgbPV5hDIJ9R7x1
 Q2YTANjIQH/5k5u+OWM6+SsrlpogXYTTofGP+DgyaOz06C8jMgUUv8fE/5SMY7+4ysh0
 HqOJi+gPkX2HOVzrA0yz19rY2C90fh4ntwKTvSFMADMM1ZAjEfPQkxYdr+/Age/v0Nhl
 MdTzfHMDJ+QCkuScu9PvCq/G8S+tQDtV0tOoIjdP7yegCRW9BS+PPjM0Vb7aVUXZA3Qx
 z95ncvaQQjZXBaBL2jwjJ0A+sIf7r/GyuulwEai5FNNM5xOFgqMTBUUYJritAfU69fpL
 pYTQ==
X-Gm-Message-State: AOAM530KW3S3AlPg4Nr3ubX1144bGOraDaH1e5mvlFzIf/ZaqpmGCrH/
 VKARPyJXH6fc8ErHsPtjzupxmsrXO4+hul3awG904dik4fh7hQrhv3fjuXqHQO/12e90fW3Ne6O
 jgLEZ6yWSpanOeEJmUyCmmErDy6MlXYVNRf49aIvz6gTZDYjn+p1jKme9hWhbygXm9N4=
X-Received: by 2002:a17:907:94ca:b0:6fe:c28b:7cb2 with SMTP id
 dn10-20020a17090794ca00b006fec28b7cb2mr38402947ejc.625.1653923251105; 
 Mon, 30 May 2022 08:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrn09srnXVHT6EDaAiafVPSPmbUFHMR/TVMiJZndtfG11ziA+ohFtFUXTZzdhujc9VItc3Dw==
X-Received: by 2002:a17:907:94ca:b0:6fe:c28b:7cb2 with SMTP id
 dn10-20020a17090794ca00b006fec28b7cb2mr38402917ejc.625.1653923250723; 
 Mon, 30 May 2022 08:07:30 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 j23-20020a170906411700b006feb6438264sm4146481ejk.93.2022.05.30.08.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:07:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, dgilbert@redhat.com, Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH v5 06/10] hmp: add basic "info stats" implementation
Date: Mon, 30 May 2022 17:07:10 +0200
Message-Id: <20220530150714.756954-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530150714.756954-1-pbonzini@redhat.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

From: Mark Kanda <mark.kanda@oracle.com>

Add an HMP command to retrieve statistics collected at run-time.
The command will retrieve and print either all VM-level statistics,
or all vCPU-level statistics for the currently selected CPU.

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
index 622c783c32..55b83c0a3a 100644
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
+        value->exponent >= -9 && value->exponent <= 0 &&
+        value->exponent % 3 == 0) {
+        monitor_printf(mon, "%s", si_prefix(value->exponent));
+    } else if (unit && value->base == 2 &&
+               value->exponent >= 0 && value->exponent <= 40 &&
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



