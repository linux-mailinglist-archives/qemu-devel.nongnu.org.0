Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7212B5FA36F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:37:35 +0200 (CEST)
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxeg-0007iL-Hk
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwd4-0003bA-0U
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcc-0007J1-Si
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NUPG4lNCqJDLyGX2mAucaMvUUR3XwTkKiVtcCXM6r7c=;
 b=IJLulGSo4nTYpHu3bDlp68eu4+ui7OAjis/7r2nfTln+OFfEawmCrE8uzkd28VaBMmg8ql
 iVbYeVuEua62oJPlFSX+bVoeQs8xBXvV0WApcMSpcVgb6tayL6z3NbDMMillV//NWsAb7u
 B1/GMJXUYFIRgWgY5g7bCE+QbncqYQo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-fPk0qxF6Pv6QZGJe_BU-ag-1; Mon, 10 Oct 2022 13:31:20 -0400
X-MC-Unique: fPk0qxF6Pv6QZGJe_BU-ag-1
Received: by mail-wm1-f70.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so7310998wma.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUPG4lNCqJDLyGX2mAucaMvUUR3XwTkKiVtcCXM6r7c=;
 b=RvRHooluvOIW4BjvF0Zd9f4RN8N7NKhNBpWXa6D5PMIYQbBbaDewIQPQg0ZVqWFKCM
 5BAMmSFI7r8wfn5pMrjzHLprN69fy/l1iC1kCvQiljUuwb5uZSS7MQGrmT6NnQYo90ZO
 OulW+Hw7d8pakLC2YY8Z6pLBKa+nudw3aeJv6qwQLBfkflxNJnrU7uuF/bsiLHbgFmew
 I5H893Jn/ypvjZTBgX8Bsq1yGZgj+1cEvcauL5ixIIa8jDBQ+HxqModKNyiABB3F1GfS
 EKFjXFX+RVyZ9Uze0ptA0AWn7m5HhZCzi8tOn31WC4V2CDBMzny0r3Icvo1RN0yGFipB
 ki+w==
X-Gm-Message-State: ACrzQf0X7lo0bI+Bvz/D77CebQ3HjMWjsEJoN1wWZ68KY48J5lQGCX0e
 Td+pwM97nEnjLHUSY5gtObGzyDpHRO+nPZvoFK7FivZaqp0u16hXSUBeao43dI9PxcQSybQtiBw
 WWFsPOc14DisHjk77rFuL9AxvWFB+L0uV+z6B5OZTJ4RDtbCR0ge/Dl2pBtQQ
X-Received: by 2002:a5d:5149:0:b0:22e:8b85:3d7d with SMTP id
 u9-20020a5d5149000000b0022e8b853d7dmr11621237wrt.55.1665423079329; 
 Mon, 10 Oct 2022 10:31:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62wMOyH5DfF4tQXFueD6QRQcxDgvaT2yJxYQ6vZTtowkutm1/5K/LUdCWvPNDbLx+WAF0KOQ==
X-Received: by 2002:a5d:5149:0:b0:22e:8b85:3d7d with SMTP id
 u9-20020a5d5149000000b0022e8b853d7dmr11621218wrt.55.1665423078978; 
 Mon, 10 Oct 2022 10:31:18 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 y3-20020a7bcd83000000b003a3170a7af9sm5472815wmj.4.2022.10.10.10.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:18 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Jonah Palmer <jonah.palmer@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 35/55] hmp: add virtio commands
Message-ID: <20221010172813.204597-36-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This patch implements the HMP versions of the virtio QMP commands.

[Jonah: Adjusted hmp monitor output format for features / statuses
	with their descriptions.]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
Message-Id: <1660220684-24909-7-git-send-email-jonah.palmer@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 310 ++++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx  |  70 ++++++++++
 3 files changed, 385 insertions(+)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a618eb1e4e..a9cf064ee8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -95,6 +95,11 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index f90eea8d01..bab86c5537 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -43,6 +43,8 @@
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -2472,3 +2474,311 @@ exit:
 exit_no_print:
     error_free(err);
 }
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    strList *pcol_list = pcol->protocols;
+    while (pcol_list) {
+        monitor_printf(mon, "\t%s", pcol_list->value);
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    strList *status_list = status->statuses;
+    while (status_list) {
+        monitor_printf(mon, "\t%s", status_list->value);
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    strList *transport_list = features->transports;
+    while (transport_list) {
+        monitor_printf(mon, "\t%s", transport_list->value);
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+
+    monitor_printf(mon, "\n");
+    strList *list = features->dev_features;
+    if (list) {
+        while (list) {
+            monitor_printf(mon, "\t%s", list->value);
+            list = list->next;
+            if (list != NULL) {
+                monitor_printf(mon, ",\n");
+            }
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    if (features->has_unknown_dev_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_dev_features);
+    }
+}
+
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->name);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_query_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %"PRId64"\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   s->device_endian);
+    monitor_printf(mon, "  status:\n");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:\n");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:\n");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features:\n");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->has_vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %"PRId64"\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %"PRId64"\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %"PRId64"\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %"PRId64"\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %"PRId64"\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %"PRId64"\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features:\n");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_query_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->name);
+    monitor_printf(mon, "  kick:                 %"PRId64"\n", s->kick);
+    monitor_printf(mon, "  call:                 %"PRId64"\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %"PRId64"\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
+
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_query_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_query_virtio_queue_element(path, queue, index != -1,
+                                         index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->name);
+    monitor_printf(mon, "  index:   %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    descs:\n");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "        addr 0x%"PRIx64" len %d",
+                       list->value->addr, list->value->len);
+        if (list->value->flags) {
+            strList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", flag->value);
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index e012035541..754b1e8408 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -923,3 +923,73 @@ SRST
   ``stats``
     Show runtime-collected statistics
 ERST
+
+    {
+        .name      = "virtio",
+        .args_type = "",
+        .params    = "",
+        .help      = "List all available virtio devices",
+        .cmd       = hmp_virtio_query,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio``
+    List all available virtio devices
+ERST
+
+    {
+        .name      = "virtio-status",
+        .args_type = "path:s",
+        .params    = "path",
+        .help      = "Display status of a given virtio device",
+        .cmd       = hmp_virtio_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-status`` *path*
+    Display status of a given virtio device
+ERST
+
+    {
+        .name      = "virtio-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given virtio queue",
+        .cmd       = hmp_virtio_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-queue-status`` *path* *queue*
+    Display status of a given virtio queue
+ERST
+
+    {
+        .name      = "virtio-vhost-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given vhost queue",
+        .cmd       = hmp_vhost_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-vhost-queue-status`` *path* *queue*
+    Display status of a given vhost queue
+ERST
+
+    {
+        .name       = "virtio-queue-element",
+        .args_type  = "path:s,queue:i,index:i?",
+        .params     = "path queue [index]",
+        .help       = "Display element of a given virtio queue",
+        .cmd        = hmp_virtio_queue_element,
+        .flags      = "p",
+    },
+
+SRST
+  ``info virtio-queue-element`` *path* *queue* [*index*]
+    Display element of a given virtio queue
+ERST
-- 
MST


