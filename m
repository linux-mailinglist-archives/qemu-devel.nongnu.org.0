Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA58A75F8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 23:10:48 +0200 (CEST)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5G4d-0001dD-E5
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 17:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1i5FaB-0007oX-Cp
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:39:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1i5Fa9-0000bs-DA
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:39:19 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37054)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1i5Fa9-0000b7-4d
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:39:17 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x83KXkFY066132;
 Tue, 3 Sep 2019 20:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2019-08-05;
 bh=oZ0s9yF6gcYfk3LvvZg62OIK3EiJMIcidaiEEw1KttY=;
 b=QuD43jlNxaDltMTQjOYeEMxoAMQ/3+8qfUw4EdkL2l4poUKu2B9txAtQTc5pbXNlQoYB
 JIE9QcCohHjCOOIpnnSYqDgbdic0UGGJW7xILQV/Dpnodm4+U+bCzfQLkZmM52+2JvM6
 vKk5rjFS9i6x9qXVVgyvsyO8JIY31rOpjTWKihTYPe8eQRsX6qtq6w6Zwq3qsgPRx65b
 FuZ7r8mVLIUSIsBrfO9JO2seF8qVsOYO9k2bni+rDGwqbqT7/kML6Cm73h1XyIvlIz6U
 Zj2jY8Ox9eQIo6czj+qwy9duYVk3O1/7YeCr/j+p6woZsnA4rWgRz6ozinQ3NpfRNl0T YQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2usy4u832n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Sep 2019 20:39:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x83KcKYZ188116;
 Tue, 3 Sep 2019 20:39:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2usu5118dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Sep 2019 20:39:11 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x83Kd9KM017745;
 Tue, 3 Sep 2019 20:39:09 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Sep 2019 13:39:08 -0700
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 16:37:55 -0400
Message-Id: <44c1faab6ab54f4ff06d7ff62e3aef9fd2a0f2c7.1567534653.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1567534653.git.jag.raman@oracle.com>
References: <cover.1567534653.git.jag.raman@oracle.com>
In-Reply-To: <cover.1567534653.git.jag.raman@oracle.com>
References: <cover.1567534653.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909030207
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909030206
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: [Qemu-devel] [RFC v3 PATCH 29/45] multi-process: refractor vl.c
 code to re-use in remote
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, john.g.johnson@oracle.com,
 kraxel@redhat.com, jag.raman@oracle.com, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 New patch in v3

 Makefile.objs        |   2 +
 remote/Makefile.objs |   1 +
 vl-parse.c           | 157 +++++++++++++++++++++++++++++++++++++++++++++++++++
 vl.c                 | 150 +-----------------------------------------------
 vl.h                 |  54 ++++++++++++++++++
 5 files changed, 215 insertions(+), 149 deletions(-)
 create mode 100644 vl-parse.c
 create mode 100644 vl.h

diff --git a/Makefile.objs b/Makefile.objs
index 0668509..f817cf6 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -104,6 +104,8 @@ qemu-seccomp.o-libs := $(SECCOMP_LIBS)
 
 common-obj-$(CONFIG_FDT) += device_tree.o
 
+common-obj-y += vl-parse.o
+
 ######################################################################
 # qapi
 
diff --git a/remote/Makefile.objs b/remote/Makefile.objs
index cbb3065..c1349ad 100644
--- a/remote/Makefile.objs
+++ b/remote/Makefile.objs
@@ -2,3 +2,4 @@ remote-pci-obj-$(CONFIG_MPQEMU) += remote-main.o
 remote-pci-obj-$(CONFIG_MPQEMU) += pcihost.o
 remote-pci-obj-$(CONFIG_MPQEMU) += machine.o
 remote-pci-obj-$(CONFIG_MPQEMU) += iohub.o
+remote-pci-obj-$(CONFIG_MPQEMU) +=../vl-parse.o
diff --git a/vl-parse.c b/vl-parse.c
new file mode 100644
index 0000000..d3716d1
--- /dev/null
+++ b/vl-parse.c
@@ -0,0 +1,157 @@
+/*
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "qemu/cutils.h"
+#include "qemu/error-report.h"
+#include "hw/qdev.h"
+#include "monitor/qdev.h"
+#include "sysemu/sysemu.h"
+#include "qemu/option.h"
+#include "qemu-options.h"
+#include "sysemu/blockdev.h"
+
+#include "chardev/char.h"
+#include "monitor/monitor.h"
+#include "qemu/config-file.h"
+
+#include "sysemu/arch_init.h"
+
+#include "vl.h"
+
+/***********************************************************/
+/* QEMU Block devices */
+
+static const QEMUOption qemu_options[] = {
+    { "h", 0, QEMU_OPTION_h, QEMU_ARCH_ALL },
+#define QEMU_OPTIONS_GENERATE_OPTIONS
+#include "qemu-options-wrapper.h"
+    { NULL },
+};
+
+const QEMUOption *lookup_opt(int argc, char **argv,
+                                    const char **poptarg, int *poptind)
+{
+    const QEMUOption *popt;
+    int optind = *poptind;
+    char *r = argv[optind];
+    const char *optarg;
+
+    loc_set_cmdline(argv, optind, 1);
+    optind++;
+    /* Treat --foo the same as -foo.  */
+    if (r[1] == '-') {
+        r++;
+    }
+    popt = qemu_options;
+    if (!popt) {
+        error_report("No valide qemu_options");
+    }
+    for (;;) {
+        if (!popt->name) {
+            error_report("invalid option*");
+            exit(1);
+            popt++;
+            continue;
+        }
+        if (!strcmp(popt->name, r + 1)) {
+            break;
+        }
+        popt++;
+    }
+    if (popt->flags & HAS_ARG) {
+        if (optind >= argc) {
+            error_report("optind %d, argc %d", optind, argc);
+            error_report("requires an argument");
+            exit(1);
+        }
+        optarg = argv[optind++];
+        loc_set_cmdline(argv, optind - 2, 2);
+    } else {
+        optarg = NULL;
+    }
+
+    *poptarg = optarg;
+    *poptind = optind;
+
+    return popt;
+}
+
+int drive_init_func(void *opaque, QemuOpts *opts, Error **errp)
+{
+    BlockInterfaceType *block_default_type = opaque;
+
+    if (!drive_new(opts, *block_default_type, errp)) {
+        error_report_err(*errp);
+    }
+
+    return 0;
+}
+
+#if defined(CONFIG_MPQEMU)
+int rdrive_init_func(void *opaque, QemuOpts *opts, Error **errp)
+{
+    DeviceState *dev;
+
+    dev = qdev_remote_add(opts, false /* this is drive */, errp);
+    if (!dev) {
+        error_setg(errp, "qdev_remote_add failed for drive.");
+        return -1;
+    }
+    object_unref(OBJECT(dev));
+    return 0;
+}
+#endif
+
+#if defined(CONFIG_MPQEMU)
+int rdevice_init_func(void *opaque, QemuOpts *opts, Error **errp)
+{
+    DeviceState *dev;
+
+    dev = qdev_remote_add(opts, true /* this is device */, errp);
+    if (!dev) {
+        error_setg(errp, "qdev_remote_add failed for device.");
+        return -1;
+    }
+    return 0;
+}
+#endif
+
+int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
+{
+    DeviceState *dev;
+    const char *remote = NULL;
+
+    remote = qemu_opt_get(opts, "rid");
+    if (remote) {
+        return 0;
+    }
+
+    dev = qdev_device_add(opts, errp);
+    if (!dev) {
+        return -1;
+    }
+    object_unref(OBJECT(dev));
+    return 0;
+}
diff --git a/vl.c b/vl.c
index f7dae56..dc2558c 100644
--- a/vl.c
+++ b/vl.c
@@ -37,6 +37,7 @@
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qlist.h"
+#include "vl.h"
 
 #ifdef CONFIG_SDL
 #if defined(__APPLE__) || defined(main)
@@ -1133,52 +1134,6 @@ static int cleanup_add_fd(void *opaque, QemuOpts *opts, Error **errp)
 /***********************************************************/
 /* QEMU Block devices */
 
-#define HD_OPTS "media=disk"
-#define CDROM_OPTS "media=cdrom"
-#define FD_OPTS ""
-#define PFLASH_OPTS ""
-#define MTD_OPTS ""
-#define SD_OPTS ""
-
-#if defined(CONFIG_MPQEMU)
-static int rdrive_init_func(void *opaque, QemuOpts *opts, Error **errp)
-{
-    DeviceState *dev;
-
-    dev = qdev_remote_add(opts, false /* this is drive */, errp);
-    if (!dev) {
-        error_setg(errp, "qdev_remote_add failed for drive.");
-        return -1;
-    }
-    object_unref(OBJECT(dev));
-    return 0;
-}
-#endif
-
-static int pass;
-
-static int drive_init_func(void *opaque, QemuOpts *opts, Error **errp)
-{
-    BlockInterfaceType *block_default_type = opaque;
-
-#if defined(CONFIG_MPQEMU)
-    const char *remote;
-
-    remote = qemu_opt_get(opts, "remote");
-    if (pass && remote) {
-        return rdrive_init_func(opaque, opts, errp);
-    } else {
-        if (!remote && !pass) {
-            drive_new(opts, *block_default_type, errp);
-        }
-    }
-
-    return 0;
-#else
-    return drive_new(opts, *block_default_type, errp) == NULL;
-#endif
-}
-
 static int drive_enable_snapshot(void *opaque, QemuOpts *opts, Error **errp)
 {
     if (qemu_opt_get(opts, "snapshot") == NULL) {
@@ -1860,21 +1815,6 @@ static void help(int exitcode)
     exit(exitcode);
 }
 
-#define HAS_ARG 0x0001
-
-typedef struct QEMUOption {
-    const char *name;
-    int flags;
-    int index;
-    uint32_t arch_mask;
-} QEMUOption;
-
-static const QEMUOption qemu_options[] = {
-    { "h", 0, QEMU_OPTION_h, QEMU_ARCH_ALL },
-#define QEMU_OPTIONS_GENERATE_OPTIONS
-#include "qemu-options-wrapper.h"
-    { NULL },
-};
 
 typedef struct VGAInterfaceInfo {
     const char *opt_name;    /* option name */
@@ -2221,43 +2161,6 @@ static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
     return qdev_device_help(opts);
 }
 
-#if defined(CONFIG_MPQEMU)
-static int rdevice_init_func(void *opaque, QemuOpts *opts, Error **errp)
-{
-    DeviceState *dev;
-
-    dev = qdev_remote_add(opts, true /* this is device */, errp);
-    if (!dev) {
-        error_setg(errp, "qdev_remote_add failed for device.");
-        return -1;
-    }
-    object_unref(OBJECT(dev));
-    return 0;
-}
-#endif
-
-static int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
-{
-    DeviceState *dev;
-
-#if defined(CONFIG_MPQEMU)
-    const char *remote;
-
-    remote = qemu_opt_get(opts, "remote");
-    if (remote) {
-        /* This will be a remote process */
-        return rdevice_init_func(opaque, opts, errp);
-    }
-#endif
-
-    dev = qdev_device_add(opts, errp);
-    if (!dev) {
-        return -1;
-    }
-    object_unref(OBJECT(dev));
-    return 0;
-}
-
 static int chardev_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     Error *local_err = NULL;
@@ -2587,46 +2490,6 @@ static void qemu_run_machine_init_done_notifiers(void)
     notifier_list_notify(&machine_init_done_notifiers, NULL);
 }
 
-static const QEMUOption *lookup_opt(int argc, char **argv,
-                                    const char **poptarg, int *poptind)
-{
-    const QEMUOption *popt;
-    int optind = *poptind;
-    char *r = argv[optind];
-    const char *optarg;
-
-    loc_set_cmdline(argv, optind, 1);
-    optind++;
-    /* Treat --foo the same as -foo.  */
-    if (r[1] == '-')
-        r++;
-    popt = qemu_options;
-    for(;;) {
-        if (!popt->name) {
-            error_report("invalid option");
-            exit(1);
-        }
-        if (!strcmp(popt->name, r + 1))
-            break;
-        popt++;
-    }
-    if (popt->flags & HAS_ARG) {
-        if (optind >= argc) {
-            error_report("requires an argument");
-            exit(1);
-        }
-        optarg = argv[optind++];
-        loc_set_cmdline(argv, optind - 2, 2);
-    } else {
-        optarg = NULL;
-    }
-
-    *poptarg = optarg;
-    *poptind = optind;
-
-    return popt;
-}
-
 static MachineClass *select_machine(void)
 {
     GSList *machines = object_class_get_list(TYPE_MACHINE, false);
@@ -4429,17 +4292,6 @@ int main(int argc, char **argv, char **envp)
     /* Check if IGD GFX passthrough. */
     igd_gfx_passthru();
 
-#if defined(CONFIG_MPQEMU)
-    /*
-     * Parse the list for remote drives here as we launch PCIProxyDev here and
-     * need PCI host initialized. As a TODO: could defer init of PCIProxyDev instead.
-     */
-    if (qemu_opts_foreach(qemu_find_opts("drive"), drive_init_func,
-                          &machine_class->block_default_type, &error_fatal)) {
-        exit(0);
-    }
-#endif
-
     /* init generic devices */
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     qemu_opts_foreach(qemu_find_opts("device"),
diff --git a/vl.h b/vl.h
new file mode 100644
index 0000000..8c40fed
--- /dev/null
+++ b/vl.h
@@ -0,0 +1,54 @@
+/*
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef VL_H
+#define VL_H
+
+/***********************************************************/
+/* QEMU Block devices */
+
+#define HD_OPTS "media=disk"
+#define CDROM_OPTS "media=cdrom"
+#define FD_OPTS ""
+#define PFLASH_OPTS ""
+#define MTD_OPTS ""
+#define SD_OPTS ""
+
+
+#define HAS_ARG 0x0001
+typedef struct QEMUOption {
+    const char *name;
+    int flags;
+    int index;
+    uint32_t arch_mask;
+} QEMUOption;
+
+const QEMUOption *lookup_opt(int argc, char **argv,
+                                    const char **poptarg, int *poptind);
+
+int drive_init_func(void *opaque, QemuOpts *opts, Error **errp);
+int device_init_func(void *opaque, QemuOpts *opts, Error **errp);
+int rdrive_init_func(void *opaque, QemuOpts *opts, Error **errp);
+int rdevice_init_func(void *opaque, QemuOpts *opts, Error **errp);
+
+#endif /* VL_H */
+
-- 
1.8.3.1


