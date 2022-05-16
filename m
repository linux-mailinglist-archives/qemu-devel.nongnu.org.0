Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839295292E0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:29:29 +0200 (CEST)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiHQ-0002ra-Jz
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhE-0005ze-MF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhB-0006Tn-8t
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EwacSxVVq5DCqrJ0MGG9nUZJJ6qFhoC3LDigYbXEkyg=;
 b=O3s1ppQKOusqKwIsN+G4CyIrskUIkbv46CzeHEU13cz1gqpam6qCx91huVw8dDuhGA0Rcg
 psVDKJ4Hs1TCq9Zq9gFrHPEzWZNQR/0ULjxoTN8qQUYYuSOsQOnAuRfx2gqNUQRVhXku5q
 Rum3G7wV6+WWkLWws1ULgl1rr97ZFdY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-keZscXwxN0yE6AXA4GRLsA-1; Mon, 16 May 2022 16:51:59 -0400
X-MC-Unique: keZscXwxN0yE6AXA4GRLsA-1
Received: by mail-ed1-f72.google.com with SMTP id
 n9-20020aa7d049000000b0042aab725949so3390614edo.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EwacSxVVq5DCqrJ0MGG9nUZJJ6qFhoC3LDigYbXEkyg=;
 b=7RHkyqxwYLn31xpER4mztjDevnpintQDlmdawpPsZuTR9L3gSqEFrcCdwREcztUeT+
 ioF/kZyhyGQtJ7s5OZVgI1sdGtHI9M0r4DK3uHSzwvWl9ZHiAJPSzivsnI5EejRcGl5z
 I98jwbPmpL0aaSCvWCvOmVH8lj6tu7ennUXy0dGGSUz/W2CMwP2VOlwfM1B7gXP2DjLo
 sCyMcMLBt/tuupx6STz3hDhEVumDEdDd7zJz5kSPFysI4l7ozWVgC5sCgntGPhRupJyf
 +yOaZb+y+IskDD8ixbr+Brb96hJEmlzUIYRLLpOK58Hjvnc/aC7g8L031XYE5KjF/dac
 Ohfg==
X-Gm-Message-State: AOAM53213LGpOomwnblXZhuopXsD7UtepZ4fI83NFJSj9lwxXDCWKZxs
 P0d3TDjg/sja4ZPTAZQx0VIxxJCLZSDiaf3x1VeU9Dz/Y5NXmOdk1JCncjfEof6KwxX0od4uxrH
 i9J3o9D5KG5394cSQ2R6ckP/EfGGrpqVkuNqKb/M8qYGoPpovKsb4omqIQtX5
X-Received: by 2002:a17:907:3f8f:b0:6f3:d4a0:e80c with SMTP id
 hr15-20020a1709073f8f00b006f3d4a0e80cmr16473660ejc.709.1652734317876; 
 Mon, 16 May 2022 13:51:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMd/2JSWn/cqwlCt5luJhdbI4/57IiK7gO1fffrODAeourWvBunTWrv/bamAnx9hd3ezDaQw==
X-Received: by 2002:a17:907:3f8f:b0:6f3:d4a0:e80c with SMTP id
 hr15-20020a1709073f8f00b006f3d4a0e80cmr16473626ejc.709.1652734317367; 
 Mon, 16 May 2022 13:51:57 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 jy16-20020a170907763000b006fa6a51459asm166836ejc.96.2022.05.16.13.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:51:56 -0700 (PDT)
Date: Mon, 16 May 2022 16:51:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL v2 29/86] hw/cxl/host: Add support for CXL Fixed Memory Windows.
Message-ID: <20220516204913.542894-30-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

The concept of these is introduced in [1] in terms of the
description the CEDT ACPI table. The principal is more general.
Unlike once traffic hits the CXL root bridges, the host system
memory address routing is implementation defined and effectively
static once observable by standard / generic system software.
Each CXL Fixed Memory Windows (CFMW) is a region of PA space
which has fixed system dependent routing configured so that
accesses can be routed to the CXL devices below a set of target
root bridges. The accesses may be interleaved across multiple
root bridges.

For QEMU we could have fully specified these regions in terms
of a base PA + size, but as the absolute address does not matter
it is simpler to let individual platforms place the memory regions.

ExampleS:
-cxl-fixed-memory-window targets.0=cxl.0,size=128G
-cxl-fixed-memory-window targets.0=cxl.1,size=128G
-cxl-fixed-memory-window targets.0=cxl0,targets.1=cxl.1,size=256G,interleave-granularity=2k

Specifies
* 2x 128G regions not interleaved across root bridges, one for each of
  the root bridges with ids cxl.0 and cxl.1
* 256G region interleaved across root bridges with ids cxl.0 and cxl.1
with a 2k interleave granularity.

When system software enumerates the devices below a given root bridge
it can then decide which CFMW to use. If non interleave is desired
(or possible) it can use the appropriate CFMW for the root bridge in
question.  If there are suitable devices to interleave across the
two root bridges then it may use the 3rd CFMS.

A number of other designs were considered but the following constraints
made it hard to adapt existing QEMU approaches to this particular problem.
1) The size must be known before a specific architecture / board brings
   up it's PA memory map.  We need to set up an appropriate region.
2) Using links to the host bridges provides a clean command line interface
   but these links cannot be established until command line devices have
   been added.

Hence the two step process used here of first establishing the size,
interleave-ways and granularity + caching the ids of the host bridges
and then, once available finding the actual host bridges so they can
be used later to support interleave decoding.

[1] CXL 2.0 ECN: CEDT CFMWS & QTG DSM (computeexpresslink.org / specifications)

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Markus Armbruster <armbru@redhat.com> # QAPI Schema
Message-Id: <20220429144110.25167-28-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/machine.json       | 21 +++++++++
 include/hw/cxl/cxl.h    | 21 +++++++++
 hw/cxl/cxl-host-stubs.c | 14 ++++++
 hw/cxl/cxl-host.c       | 94 +++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c            | 47 +++++++++++++++++++++
 hw/cxl/meson.build      |  6 +++
 qemu-options.hx         | 38 +++++++++++++++++
 7 files changed, 241 insertions(+)
 create mode 100644 hw/cxl/cxl-host-stubs.c
 create mode 100644 hw/cxl/cxl-host.c

diff --git a/qapi/machine.json b/qapi/machine.json
index 92480d4044..3f1eab3482 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -502,6 +502,27 @@
    'dst': 'uint16',
    'val': 'uint8' }}
 
+##
+# @CXLFixedMemoryWindowOptions:
+#
+# Create a CXL Fixed Memory Window
+#
+# @size: Size of the Fixed Memory Window in bytes. Must be a multiple
+#        of 256MiB.
+# @interleave-granularity: Number of contiguous bytes for which
+#                          accesses will go to a given interleave target.
+#                          Accepted values [256, 512, 1k, 2k, 4k, 8k, 16k]
+# @targets: Target root bridge IDs from -device ...,id=<ID> for each root
+#           bridge.
+#
+# Since 7.1
+##
+{ 'struct': 'CXLFixedMemoryWindowOptions',
+  'data': {
+      'size': 'size',
+      '*interleave-granularity': 'size',
+      'targets': ['str'] }}
+
 ##
 # @X86CPURegister32:
 #
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 8d1a7245d0..dce38124db 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -10,6 +10,9 @@
 #ifndef CXL_H
 #define CXL_H
 
+
+#include "qapi/qapi-types-machine.h"
+#include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "cxl_pci.h"
 #include "cxl_component.h"
@@ -20,10 +23,23 @@
 
 #define CXL_WINDOW_MAX 10
 
+typedef struct CXLFixedWindow {
+    uint64_t size;
+    char **targets;
+    struct PXBDev *target_hbs[8];
+    uint8_t num_targets;
+    uint8_t enc_int_ways;
+    uint8_t enc_int_gran;
+    /* Todo: XOR based interleaving */
+    MemoryRegion mr;
+    hwaddr base;
+} CXLFixedWindow;
+
 typedef struct CXLState {
     bool is_enabled;
     MemoryRegion host_mr;
     unsigned int next_mr_idx;
+    GList *fixed_windows;
 } CXLState;
 
 struct CXLHost {
@@ -35,4 +51,9 @@ struct CXLHost {
 #define TYPE_PXB_CXL_HOST "pxb-cxl-host"
 OBJECT_DECLARE_SIMPLE_TYPE(CXLHost, PXB_CXL_HOST)
 
+void cxl_fixed_memory_window_config(MachineState *ms,
+                                    CXLFixedMemoryWindowOptions *object,
+                                    Error **errp);
+void cxl_fixed_memory_window_link_targets(Error **errp);
+
 #endif
diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
new file mode 100644
index 0000000000..f8fd278d5d
--- /dev/null
+++ b/hw/cxl/cxl-host-stubs.c
@@ -0,0 +1,14 @@
+/*
+ * CXL host parameter parsing routine stubs
+ *
+ * Copyright (c) 2022 Huawei
+ */
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/cxl/cxl.h"
+
+void cxl_fixed_memory_window_config(MachineState *ms,
+                                    CXLFixedMemoryWindowOptions *object,
+                                    Error **errp) {};
+
+void cxl_fixed_memory_window_link_targets(Error **errp) {};
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
new file mode 100644
index 0000000000..ec5a75cbf5
--- /dev/null
+++ b/hw/cxl/cxl-host.c
@@ -0,0 +1,94 @@
+/*
+ * CXL host parameter parsing routines
+ *
+ * Copyright (c) 2022 Huawei
+ * Modeled loosely on the NUMA options handling in hw/core/numa.c
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/bitmap.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "sysemu/qtest.h"
+#include "hw/boards.h"
+
+#include "qapi/qapi-visit-machine.h"
+#include "hw/cxl/cxl.h"
+
+void cxl_fixed_memory_window_config(MachineState *ms,
+                                    CXLFixedMemoryWindowOptions *object,
+                                    Error **errp)
+{
+    CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
+    strList *target;
+    int i;
+
+    for (target = object->targets; target; target = target->next) {
+        fw->num_targets++;
+    }
+
+    fw->enc_int_ways = cxl_interleave_ways_enc(fw->num_targets, errp);
+    if (*errp) {
+        return;
+    }
+
+    fw->targets = g_malloc0_n(fw->num_targets, sizeof(*fw->targets));
+    for (i = 0, target = object->targets; target; i++, target = target->next) {
+        /* This link cannot be resolved yet, so stash the name for now */
+        fw->targets[i] = g_strdup(target->value);
+    }
+
+    if (object->size % (256 * MiB)) {
+        error_setg(errp,
+                   "Size of a CXL fixed memory window must my a multiple of 256MiB");
+        return;
+    }
+    fw->size = object->size;
+
+    if (object->has_interleave_granularity) {
+        fw->enc_int_gran =
+            cxl_interleave_granularity_enc(object->interleave_granularity,
+                                           errp);
+        if (*errp) {
+            return;
+        }
+    } else {
+        /* Default to 256 byte interleave */
+        fw->enc_int_gran = 0;
+    }
+
+    ms->cxl_devices_state->fixed_windows =
+        g_list_append(ms->cxl_devices_state->fixed_windows, fw);
+
+    return;
+}
+
+void cxl_fixed_memory_window_link_targets(Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    if (ms->cxl_devices_state && ms->cxl_devices_state->fixed_windows) {
+        GList *it;
+
+        for (it = ms->cxl_devices_state->fixed_windows; it; it = it->next) {
+            CXLFixedWindow *fw = it->data;
+            int i;
+
+            for (i = 0; i < fw->num_targets; i++) {
+                Object *o;
+                bool ambig;
+
+                o = object_resolve_path_type(fw->targets[i],
+                                             TYPE_PXB_CXL_DEVICE,
+                                             &ambig);
+                if (!o) {
+                    error_setg(errp, "Could not resolve CXLFM target %s",
+                               fw->targets[i]);
+                    return;
+                }
+                fw->target_hbs[i] = PXB_CXL_DEV(o);
+            }
+        }
+    }
+}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 817d515783..2390c13fb6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -93,6 +93,7 @@
 #include "qemu/config-file.h"
 #include "qemu/qemu-options.h"
 #include "qemu/main-loop.h"
+#include "hw/cxl/cxl.h"
 #ifdef CONFIG_VIRTFS
 #include "fsdev/qemu-fsdev.h"
 #endif
@@ -118,6 +119,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qapi-visit-compat.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qapi/qapi-visit-ui.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-migration.h"
@@ -143,6 +145,12 @@ typedef struct BlockdevOptionsQueueEntry {
 
 typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
 
+typedef struct CXLFMWOptionQueueEntry {
+    CXLFixedMemoryWindowOptions *opts;
+    Location loc;
+    QSIMPLEQ_ENTRY(CXLFMWOptionQueueEntry) entry;
+} CXLFMWOptionQueueEntry;
+
 typedef struct ObjectOption {
     ObjectOptions *opts;
     QTAILQ_ENTRY(ObjectOption) next;
@@ -169,6 +177,8 @@ static int snapshot;
 static bool preconfig_requested;
 static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
+static QSIMPLEQ_HEAD(, CXLFMWOptionQueueEntry) CXLFMW_opts =
+    QSIMPLEQ_HEAD_INITIALIZER(CXLFMW_opts);
 static bool nographic = false;
 static int mem_prealloc; /* force preallocation of physical target memory */
 static const char *vga_model = NULL;
@@ -1153,6 +1163,24 @@ static void parse_display(const char *p)
     }
 }
 
+static void parse_cxl_fixed_memory_window(const char *optarg)
+{
+    CXLFMWOptionQueueEntry *cfmws_entry;
+    Visitor *v;
+
+    v = qobject_input_visitor_new_str(optarg, "cxl-fixed-memory-window",
+                                      &error_fatal);
+    cfmws_entry = g_new(CXLFMWOptionQueueEntry, 1);
+    visit_type_CXLFixedMemoryWindowOptions(v, NULL, &cfmws_entry->opts,
+                                           &error_fatal);
+    if (!cfmws_entry->opts) {
+        exit(1);
+    }
+    visit_free(v);
+    loc_save(&cfmws_entry->loc);
+    QSIMPLEQ_INSERT_TAIL(&CXLFMW_opts, cfmws_entry, entry);
+}
+
 static inline bool nonempty_str(const char *str)
 {
     return str && *str;
@@ -2015,6 +2043,20 @@ static void qemu_create_late_backends(void)
     qemu_semihosting_console_init();
 }
 
+static void cxl_set_opts(void)
+{
+    while (!QSIMPLEQ_EMPTY(&CXLFMW_opts)) {
+        CXLFMWOptionQueueEntry *cfmws_entry = QSIMPLEQ_FIRST(&CXLFMW_opts);
+
+        loc_restore(&cfmws_entry->loc);
+        QSIMPLEQ_REMOVE_HEAD(&CXLFMW_opts, entry);
+        cxl_fixed_memory_window_config(current_machine, cfmws_entry->opts,
+                                       &error_fatal);
+        qapi_free_CXLFixedMemoryWindowOptions(cfmws_entry->opts);
+        g_free(cfmws_entry);
+    }
+}
+
 static void qemu_resolve_machine_memdev(void)
 {
     if (ram_memdev_id) {
@@ -2661,6 +2703,7 @@ void qmp_x_exit_preconfig(Error **errp)
 
     qemu_init_board();
     qemu_create_cli_devices();
+    cxl_fixed_memory_window_link_targets(errp);
     qemu_machine_creation_done();
 
     if (loadvm) {
@@ -2841,6 +2884,9 @@ void qemu_init(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
+            case QEMU_OPTION_cxl_fixed_memory_window:
+                parse_cxl_fixed_memory_window(optarg);
+                break;
             case QEMU_OPTION_display:
                 parse_display(optarg);
                 break;
@@ -3652,6 +3698,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
     qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
+    cxl_set_opts();
 
     if (vmstate_dump_file) {
         /* dump and exit */
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
index e68eea2358..f117b99949 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -3,4 +3,10 @@ softmmu_ss.add(when: 'CONFIG_CXL',
                    'cxl-component-utils.c',
                    'cxl-device-utils.c',
                    'cxl-mailbox-utils.c',
+                   'cxl-host.c',
+               ),
+               if_false: files(
+                   'cxl-host-stubs.c',
                ))
+
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl-host-stubs.c'))
diff --git a/qemu-options.hx b/qemu-options.hx
index 796229c433..315bb18595 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -467,6 +467,44 @@ SRST
         -numa hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8
 ERST
 
+DEF("cxl-fixed-memory-window", HAS_ARG, QEMU_OPTION_cxl_fixed_memory_window,
+    "-cxl-fixed-memory-window targets.0=firsttarget,targets.1=secondtarget,size=size[,interleave-granularity=granularity]\n",
+    QEMU_ARCH_ALL)
+SRST
+``-cxl-fixed-memory-window targets.0=firsttarget,targets.1=secondtarget,size=size[,interleave-granularity=granularity]``
+    Define a CXL Fixed Memory Window (CFMW).
+
+    Described in the CXL 2.0 ECN: CEDT CFMWS & QTG _DSM.
+
+    They are regions of Host Physical Addresses (HPA) on a system which
+    may be interleaved across one or more CXL host bridges.  The system
+    software will assign particular devices into these windows and
+    configure the downstream Host-managed Device Memory (HDM) decoders
+    in root ports, switch ports and devices appropriately to meet the
+    interleave requirements before enabling the memory devices.
+
+    ``targets.X=firsttarget`` provides the mapping to CXL host bridges
+    which may be identified by the id provied in the -device entry.
+    Multiple entries are needed to specify all the targets when
+    the fixed memory window represents interleaved memory. X is the
+    target index from 0.
+
+    ``size=size`` sets the size of the CFMW. This must be a multiple of
+    256MiB. The region will be aligned to 256MiB but the location is
+    platform and configuration dependent.
+
+    ``interleave-granularity=granularity`` sets the granularity of
+    interleave. Default 256KiB. Only 256KiB, 512KiB, 1024KiB, 2048KiB
+    4096KiB, 8192KiB and 16384KiB granularities supported.
+
+    Example:
+
+    ::
+
+        -cxl-fixed-memory-window targets.0=cxl.0,targets.1=cxl.1,size=128G,interleave-granularity=512k
+
+ERST
+
 DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,
     "-add-fd fd=fd,set=set[,opaque=opaque]\n"
     "                Add 'fd' to fd 'set'\n", QEMU_ARCH_ALL)
-- 
MST


