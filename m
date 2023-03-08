Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2C6AFBD2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiL9-0000x8-Uv; Tue, 07 Mar 2023 20:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiL7-0000nc-At
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiL5-0001YK-83
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvXrSdmjxjxzGODrxbz+n6TWMukma32X8pz1bxfaXDc=;
 b=Eovnxg1rkY+WBa3qsQwY+xQZ+qeXhE1ZXjqe06SjmKRXxTk8FVq6MmrAz32uwld+Cj9f5h
 dN5zcAcyUzeWAkoRdyRL+zCetF2dqvifwMLYpBdOIOMBFCBgPyiF7WiYoxmhfSaqYqZAdm
 nzmUJHsR28ygjDkWj8oYQ+3TlP6isPY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-qHBJZ0GYN4WxH3myAlR0Pg-1; Tue, 07 Mar 2023 20:11:29 -0500
X-MC-Unique: qHBJZ0GYN4WxH3myAlR0Pg-1
Received: by mail-ed1-f69.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so21287106eda.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237887;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zvXrSdmjxjxzGODrxbz+n6TWMukma32X8pz1bxfaXDc=;
 b=ineRoxB41kjUs1fVc65VSnx1uEP8TbaYjM8VKs9nxaxuTVpD7bqLPp9bUeEuoKeZzh
 S3m7YTOmHH9XR5eULLFPDLvsSwhrIMVaqgxPHAD3Tm60UosHlITkVxIzqputmV51MIny
 9ehH9gQDyFpCv6Ko0dRFyNDLcvjM5v8i8NiK+G88KLYPflrJDHGu2daBxuOq1jf4tBGZ
 +s0RkR50BFJ3mamSFfbVk3XNOu/niVhq7NWzTHXtfwXcPI+IGWnTHlYM+75u4OlGXs0l
 pw/gNQawXg09v2uwbq2OrnKpAbXYpg7QZQqLvEdrLpNRnpABW/YWEpSx8FdLSQIje1uf
 bkkQ==
X-Gm-Message-State: AO0yUKUSiIzMmv9cTUol9s/Z2dGqoTLRtCsAPTnAjT/9ivSyPq+9/spL
 /3sc3GVBLHkSNmiXqOprbWLi4lOt9HV9EEUDDT1songA31FADKkCI9Kor78Btklwzmis/0Hp6bH
 Pc1cpXd4CpLEtUkdnp/hPzHE09YTCQBYWNVkmfIjm6B+aENnHJy2WskQ/8B9NO9zPK4Mp
X-Received: by 2002:a17:907:98a3:b0:88a:1ea9:a5ea with SMTP id
 ju3-20020a17090798a300b0088a1ea9a5eamr16379032ejc.65.1678237887675; 
 Tue, 07 Mar 2023 17:11:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8fzqRUExeKq74ilBxvpiR6hlj0bhDQfWJ0kLCF48mWBbUWWB0fetHCqrffXuqCceggA5tNFw==
X-Received: by 2002:a17:907:98a3:b0:88a:1ea9:a5ea with SMTP id
 ju3-20020a17090798a300b0088a1ea9a5eamr16379017ejc.65.1678237887386; 
 Tue, 07 Mar 2023 17:11:27 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 se18-20020a170906ce5200b008d6e551e1bcsm6752398ejb.2.2023.03.07.17.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:26 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 11/73] cryptodev: Support query-stats QMP command
Message-ID: <f2b901098e14ad1aaffab82464917b8679499cc5.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: zhenwei pi <pizhenwei@bytedance.com>

Now we can use "query-stats" QMP command to query statistics of
crypto devices. (Originally this was designed to show statistics
by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
querying configuration info by "query-cryptodev", and querying
runtime performance info by "query-stats". This makes sense!)

Example:
~# virsh qemu-monitor-command vm '{"execute": "query-stats", \
   "arguments": {"target": "cryptodev"} }' | jq
{
  "return": [
    {
      "provider": "cryptodev",
      "stats": [
        {
          "name": "asym-verify-bytes",
          "value": 7680
        },
        ...
        {
          "name": "asym-decrypt-ops",
          "value": 32
        },
        {
          "name": "asym-encrypt-ops",
          "value": 48
        }
      ],
      "qom-path": "/objects/cryptodev0" # support asym only
    },
    {
      "provider": "cryptodev",
      "stats": [
        {
          "name": "asym-verify-bytes",
          "value": 0
        },
        ...
        {
          "name": "sym-decrypt-bytes",
          "value": 5376
        },
        ...
      ],
      "qom-path": "/objects/cryptodev1" # support asym/sym
    }
  ],
  "id": "libvirt-422"
}

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-12-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/stats.json        |  10 ++-
 backends/cryptodev.c   | 155 +++++++++++++++++++++++++++++++++++++++++
 stats/stats-hmp-cmds.c |   5 ++
 stats/stats-qmp-cmds.c |   2 +
 4 files changed, 170 insertions(+), 2 deletions(-)

diff --git a/qapi/stats.json b/qapi/stats.json
index 57db5b1c74..1f5d3c59ab 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -50,10 +50,14 @@
 #
 # Enumeration of statistics providers.
 #
+# @kvm: since 7.1
+#
+# @cryptodev: since 8.0
+#
 # Since: 7.1
 ##
 { 'enum': 'StatsProvider',
-  'data': [ 'kvm' ] }
+  'data': [ 'kvm', 'cryptodev' ] }
 
 ##
 # @StatsTarget:
@@ -65,10 +69,12 @@
 #
 # @vcpu: statistics that apply to a single virtual CPU.
 #
+# @cryptodev: statistics that apply to a crypto device. since 8.0
+#
 # Since: 7.1
 ##
 { 'enum': 'StatsTarget',
-  'data': [ 'vm', 'vcpu' ] }
+  'data': [ 'vm', 'vcpu', 'cryptodev' ] }
 
 ##
 # @StatsRequest:
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 7c10a2e1cb..94ca393cee 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -23,8 +23,10 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/cryptodev.h"
+#include "sysemu/stats.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-cryptodev.h"
+#include "qapi/qapi-types-stats.h"
 #include "qapi/visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
@@ -32,6 +34,28 @@
 #include "qom/object_interfaces.h"
 #include "hw/virtio/virtio-crypto.h"
 
+#define SYM_ENCRYPT_OPS_STR "sym-encrypt-ops"
+#define SYM_DECRYPT_OPS_STR "sym-decrypt-ops"
+#define SYM_ENCRYPT_BYTES_STR "sym-encrypt-bytes"
+#define SYM_DECRYPT_BYTES_STR "sym-decrypt-bytes"
+
+#define ASYM_ENCRYPT_OPS_STR "asym-encrypt-ops"
+#define ASYM_DECRYPT_OPS_STR "asym-decrypt-ops"
+#define ASYM_SIGN_OPS_STR "asym-sign-ops"
+#define ASYM_VERIFY_OPS_STR "asym-verify-ops"
+#define ASYM_ENCRYPT_BYTES_STR "asym-encrypt-bytes"
+#define ASYM_DECRYPT_BYTES_STR "asym-decrypt-bytes"
+#define ASYM_SIGN_BYTES_STR "asym-sign-bytes"
+#define ASYM_VERIFY_BYTES_STR "asym-verify-bytes"
+
+typedef struct StatsArgs {
+    union StatsResultsType {
+        StatsResultList **stats;
+        StatsSchemaList **schema;
+    } result;
+    strList *names;
+    Error **errp;
+} StatsArgs;
 
 static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
 
@@ -435,6 +459,134 @@ static void cryptodev_backend_finalize(Object *obj)
     }
 }
 
+static StatsList *cryptodev_backend_stats_add(const char *name, int64_t *val,
+                                              StatsList *stats_list)
+{
+    Stats *stats = g_new0(Stats, 1);
+
+    stats->name = g_strdup(name);
+    stats->value = g_new0(StatsValue, 1);
+    stats->value->type = QTYPE_QNUM;
+    stats->value->u.scalar = *val;
+
+    QAPI_LIST_PREPEND(stats_list, stats);
+    return stats_list;
+}
+
+static int cryptodev_backend_stats_query(Object *obj, void *data)
+{
+    StatsArgs *stats_args = data;
+    StatsResultList **stats_results = stats_args->result.stats;
+    StatsList *stats_list = NULL;
+    StatsResult *entry;
+    CryptoDevBackend *backend;
+    CryptodevBackendSymStat *sym_stat;
+    CryptodevBackendAsymStat *asym_stat;
+
+    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
+        return 0;
+    }
+
+    backend = CRYPTODEV_BACKEND(obj);
+    sym_stat = backend->sym_stat;
+    if (sym_stat) {
+        stats_list = cryptodev_backend_stats_add(SYM_ENCRYPT_OPS_STR,
+                         &sym_stat->encrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(SYM_DECRYPT_OPS_STR,
+                         &sym_stat->decrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(SYM_ENCRYPT_BYTES_STR,
+                         &sym_stat->encrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add(SYM_DECRYPT_BYTES_STR,
+                         &sym_stat->decrypt_bytes, stats_list);
+    }
+
+    asym_stat = backend->asym_stat;
+    if (asym_stat) {
+        stats_list = cryptodev_backend_stats_add(ASYM_ENCRYPT_OPS_STR,
+                         &asym_stat->encrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_DECRYPT_OPS_STR,
+                         &asym_stat->decrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_SIGN_OPS_STR,
+                         &asym_stat->sign_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_VERIFY_OPS_STR,
+                         &asym_stat->verify_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_ENCRYPT_BYTES_STR,
+                         &asym_stat->encrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_DECRYPT_BYTES_STR,
+                         &asym_stat->decrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_SIGN_BYTES_STR,
+                         &asym_stat->sign_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_VERIFY_BYTES_STR,
+                         &asym_stat->verify_bytes, stats_list);
+    }
+
+    entry = g_new0(StatsResult, 1);
+    entry->provider = STATS_PROVIDER_CRYPTODEV;
+    entry->qom_path = g_strdup(object_get_canonical_path(obj));
+    entry->stats = stats_list;
+    QAPI_LIST_PREPEND(*stats_results, entry);
+
+    return 0;
+}
+
+static void cryptodev_backend_stats_cb(StatsResultList **result,
+                                       StatsTarget target,
+                                       strList *names, strList *targets,
+                                       Error **errp)
+{
+    switch (target) {
+    case STATS_TARGET_CRYPTODEV:
+    {
+        Object *objs = container_get(object_get_root(), "/objects");
+        StatsArgs stats_args;
+        stats_args.result.stats = result;
+        stats_args.names = names;
+        stats_args.errp = errp;
+
+        object_child_foreach(objs, cryptodev_backend_stats_query, &stats_args);
+        break;
+    }
+    default:
+        break;
+    }
+}
+
+static StatsSchemaValueList *cryptodev_backend_schemas_add(const char *name,
+                                 StatsSchemaValueList *list)
+{
+    StatsSchemaValueList *schema_entry = g_new0(StatsSchemaValueList, 1);
+
+    schema_entry->value = g_new0(StatsSchemaValue, 1);
+    schema_entry->value->type = STATS_TYPE_CUMULATIVE;
+    schema_entry->value->name = g_strdup(name);
+    schema_entry->next = list;
+
+    return schema_entry;
+}
+
+static void cryptodev_backend_schemas_cb(StatsSchemaList **result,
+                                         Error **errp)
+{
+    StatsSchemaValueList *stats_list = NULL;
+    const char *sym_stats[] = { SYM_ENCRYPT_OPS_STR, SYM_DECRYPT_OPS_STR,
+                                SYM_ENCRYPT_BYTES_STR, SYM_DECRYPT_BYTES_STR };
+    const char *asym_stats[] = { ASYM_ENCRYPT_OPS_STR, ASYM_DECRYPT_OPS_STR,
+                                 ASYM_SIGN_OPS_STR, ASYM_VERIFY_OPS_STR,
+                                 ASYM_ENCRYPT_BYTES_STR, ASYM_DECRYPT_BYTES_STR,
+                                 ASYM_SIGN_BYTES_STR, ASYM_VERIFY_BYTES_STR };
+
+    for (int i = 0; i < ARRAY_SIZE(sym_stats); i++) {
+        stats_list = cryptodev_backend_schemas_add(sym_stats[i], stats_list);
+    }
+
+    for (int i = 0; i < ARRAY_SIZE(asym_stats); i++) {
+        stats_list = cryptodev_backend_schemas_add(asym_stats[i], stats_list);
+    }
+
+    add_stats_schema(result, STATS_PROVIDER_CRYPTODEV, STATS_TARGET_CRYPTODEV,
+                     stats_list);
+}
+
 static void
 cryptodev_backend_class_init(ObjectClass *oc, void *data)
 {
@@ -456,6 +608,9 @@ cryptodev_backend_class_init(ObjectClass *oc, void *data)
                               cryptodev_backend_get_ops,
                               cryptodev_backend_set_ops,
                               NULL, NULL);
+
+    add_stats_callbacks(STATS_PROVIDER_CRYPTODEV, cryptodev_backend_stats_cb,
+                        cryptodev_backend_schemas_cb);
 }
 
 static const TypeInfo cryptodev_backend_info = {
diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
index 531e35d128..1f91bf8bd5 100644
--- a/stats/stats-hmp-cmds.c
+++ b/stats/stats-hmp-cmds.c
@@ -155,6 +155,8 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
         filter->u.vcpu.vcpus = vcpu_list;
         break;
     }
+    case STATS_TARGET_CRYPTODEV:
+        break;
     default:
         break;
     }
@@ -226,6 +228,9 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         int cpu_index = monitor_get_cpu_index(mon);
         filter = stats_filter(target, names, cpu_index, provider);
         break;
+    case STATS_TARGET_CRYPTODEV:
+        filter = stats_filter(target, names, -1, provider);
+        break;
     default:
         abort();
     }
diff --git a/stats/stats-qmp-cmds.c b/stats/stats-qmp-cmds.c
index bc973747fb..e214b964fd 100644
--- a/stats/stats-qmp-cmds.c
+++ b/stats/stats-qmp-cmds.c
@@ -64,6 +64,8 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
             targets = filter->u.vcpu.vcpus;
         }
         break;
+    case STATS_TARGET_CRYPTODEV:
+        break;
     default:
         abort();
     }
-- 
MST


