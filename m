Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD59A60FFCA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:03:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7CT-0008Ov-Bo; Thu, 27 Oct 2022 14:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1oo7CO-00086D-Bz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:01:49 -0400
Received: from resqmta-c1p-023464.sys.comcast.net ([2001:558:fd00:56::b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1oo7CI-0005sZ-94
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:01:48 -0400
Received: from resomta-c1p-023266.sys.comcast.net ([96.102.18.234])
 by resqmta-c1p-023464.sys.comcast.net with ESMTP
 id o3gooH8gkHRb3o7CEoHEOj; Thu, 27 Oct 2022 18:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20211018a; t=1666893698;
 bh=wdHsXl0Ah3VWs+ND4zqpaE+Wh2LAPSwoAZu1tSEx4Tw=;
 h=Received:Received:From:To:Subject:Date:Message-Id:MIME-Version:
 Xfinity-Spam-Result;
 b=bkJgTdAMDbEz6u/HBQfP+tKXmT80aGAise3X0FGT8Z+hGKr6rogVWv42EL/K/xN6l
 3Oom8MNvTMi3rK6GVqcDvZpS5gXfu2OE5YuqU18oToD56r30A5VU+Ynq3JIgaw4FF/
 ojM/JzN937Siz67XKVA5yWPsUNzNg+dDkLduVsSpYbAu1mMx7QFjfS/I6EmagWkL0p
 AMy+BHRZWGLwIKGduEiZIbP+m4vcU4Pev7LSPco8ycZT0gxUtk7Y3rUnUSdt48ZYG9
 bCJvGp65gWBN+4nVMNiiWa5u21UbcDjY1AUL1rbQed9lhEcNqrb0pWG3dTt9OwNhQA
 O3k29+/YjciWA==
Received: from jderrick-mobl4.Home ([75.163.75.236])
 by resomta-c1p-023266.sys.comcast.net with ESMTPA
 id o7BQo587p62udo7BsodDDo; Thu, 27 Oct 2022 18:01:35 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhonhgrthhhrghnucffvghrrhhitghkuceojhhonhgrthhhrghnrdguvghrrhhitghksehlihhnuhigrdguvghvqeenucggtffrrghtthgvrhhnpedtteeljeffgfffveehhfetveefuedvheevffffhedtjeeuvdevgfeftddtheeftdenucfkphepjeehrdduieefrdejhedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehjuggvrhhrihgtkhdqmhhosghlgedrjfhomhgvpdhinhgvthepjeehrdduieefrdejhedrvdefiedpmhgrihhlfhhrohhmpehjohhnrghthhgrnhdruggvrhhrihgtkheslhhinhhugidruggvvhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepjhhonhgrthhhrghnrdguvghrrhhitghksehlihhnuhigrdguvghvpdhrtghpthhtohepmhhitghhrggvlhdrkhhrohhprggtiigvkhesshholhhiughighhmrdgtohhmpdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdprhgtphhtthhopehkfiholhhfsehrvgguhhgrthdrtghomhdprhgtphhtthhopehhrhgvihhtiiesrhgvughhrghtrdgtohhm
X-Xfinity-VMeta: sc=-100.00;st=legit
From: Jonathan Derrick <jonathan.derrick@linux.dev>
To: qemu-devel@nongnu.org
Cc: Jonathan Derrick <jonathan.derrick@linux.dev>,
 Michael Kropaczek <michael.kropaczek@solidigm.com>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v3 1/2] hw/nvme: Support for Namespaces Management from guest
 OS - create-ns
Date: Thu, 27 Oct 2022 13:00:45 -0500
Message-Id: <20221027180046.250-2-jonathan.derrick@linux.dev>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027180046.250-1-jonathan.derrick@linux.dev>
References: <20221027180046.250-1-jonathan.derrick@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:558:fd00:56::b;
 envelope-from=jonathan.derrick@linux.dev;
 helo=resqmta-c1p-023464.sys.comcast.net
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Kropaczek <michael.kropaczek@solidigm.com>

Added support for NVMEe NameSpaces Mangement allowing the guest OS to
create namespaces by issuing nvme create-ns command.
It is an extension to currently implemented Qemu nvme virtual device.
Virtual devices representing namespaces will be created and/or deleted
during Qemu's running session, at anytime.

Signed-off-by: Michael Kropaczek <michael.kropaczek@solidigm.com>
---
 docs/system/devices/nvme.rst |  55 +++++++-
 hw/nvme/cfg_key_checker.c    |  51 ++++++++
 hw/nvme/ctrl-cfg.c           | 181 +++++++++++++++++++++++++++
 hw/nvme/ctrl.c               | 204 +++++++++++++++++++++++++++++-
 hw/nvme/meson.build          |   2 +-
 hw/nvme/ns-backend.c         | 234 +++++++++++++++++++++++++++++++++++
 hw/nvme/ns.c                 | 234 ++++++++++++++++++++++++++++++-----
 hw/nvme/nvme.h               |  31 ++++-
 hw/nvme/trace-events         |   2 +
 include/block/nvme.h         |  30 +++++
 include/hw/nvme/ctrl-cfg.h   |  24 ++++
 include/hw/nvme/ns-cfg.h     |  28 +++++
 include/hw/nvme/nvme-cfg.h   | 201 ++++++++++++++++++++++++++++++
 qemu-img-cmds.hx             |   6 +
 qemu-img.c                   | 134 ++++++++++++++++++++
 15 files changed, 1380 insertions(+), 37 deletions(-)
 create mode 100644 hw/nvme/cfg_key_checker.c
 create mode 100644 hw/nvme/ctrl-cfg.c
 create mode 100644 hw/nvme/ns-backend.c
 create mode 100644 include/hw/nvme/ctrl-cfg.h
 create mode 100644 include/hw/nvme/ns-cfg.h
 create mode 100644 include/hw/nvme/nvme-cfg.h

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index 30f841ef62..13e2fbc0d6 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -92,6 +92,59 @@ There are a number of parameters available:
   attach the namespace to a specific ``nvme`` device (identified by an ``id``
   parameter on the controller device).
 
+Additional Namespaces managed by guest OS Namespaces Management
+---------------------------------------------------------------------
+
+.. code-block:: console
+
+   -device nvme,id=nvme-ctrl,serial=1234,subsys=nvme-subsys,auto-ns-path=path
+
+Parameters:
+
+``auto-ns-path=<path to nvme storage location>``
+  If specified indicates a support for dynamic management of nvme namespaces
+  by means of nvme create-ns command. This path points
+  to the storage area for backend images must exist. Additionally it requires
+  that parameter `ns-subsys` must be specified whereas parameter `drive`
+  must not. The legacy namespace backend is disabled, instead, a pair of
+  files 'nvme_<ctrl SN>_ns_<NS-ID>.cfg' and 'nvme_<ctrl SN>_ns_<NS-ID>.img'
+  will refer to respective namespaces. The create-ns, attach-ns
+  and detach-ns commands, issued at the guest side, will make changes to
+  those files accordingly.
+  For each namespace exists an image file in raw format and a config file
+  containing namespace parameters and state of the attachment allowing QEMU
+  to configure namespaces accordingly during start up. If for instance an
+  image file has a size of 0 bytes this will be interpreted as non existent
+  namespace. Issuing create-ns command will change the status in the config
+  files and and will re-size the image file accordingly so the image file
+  will be associated with the respective namespace. The main config file
+  nvme_<ctrl SN>_ctrl.cfg keeps the track of allocated capacity to the
+  namespaces within the nvme controller.
+  As it is the case of a typical hard drive, backend images together with
+  config files need to be created. For this reason the qemu-img tool has
+  been extended by adding createns command.
+
+   qemu-img createns {-S <serial> -C <total NVMe capacity>}
+                     [-N <NsId max>] {<path>}
+
+  Parameters:
+  -S and -C and <path> are mandatory, `-S` must match `serial` parameter
+  and <path> must match `auto-ns-path` parameter of "-device nvme,..."
+  specification.
+  -N is optional, if specified it will set a limit to the number of potential
+  namespaces and will reduce the number of backend images and config files
+  accordingly. As a default, a set of images of 0 bytes size and default
+  config files for 256 namespaces will be created, a total of 513 files.
+
+Please note that ``nvme-ns`` device is not required to support of dynamic
+namespaces management feature. It is not prohibited to assign a such device to
+``nvme`` device specified to support dynamic namespace management if one has
+an use case to do so, however, it will only coexist and be out of the scope of
+Namespaces Management. NsIds will be consistently managed, creation (create-ns)
+of a namespace will not allocate the NsId already being taken. If ``nvme-ns``
+device conflicts with previously created one by create-ns (the same NsId),
+it will break QEMU's start up.
+
 NVM Subsystems
 --------------
 
@@ -320,4 +373,4 @@ controller are:
 
 .. code-block:: console
 
-   echo 0000:01:00.1 > /sys/bus/pci/drivers/nvme/bind
\ No newline at end of file
+   echo 0000:01:00.1 > /sys/bus/pci/drivers/nvme/bind
diff --git a/hw/nvme/cfg_key_checker.c b/hw/nvme/cfg_key_checker.c
new file mode 100644
index 0000000000..5f19126b29
--- /dev/null
+++ b/hw/nvme/cfg_key_checker.c
@@ -0,0 +1,51 @@
+/*
+ * QEMU NVM Express Virtual Dynamic Namespace Management
+ *
+ *
+ * Copyright (c) 2022 Solidigm
+ *
+ * Authors:
+ *  Michael Kropaczek      <michael.kropaczek@solidigm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/qmp/qnum.h"
+#include "qapi/qmp/qbool.h"
+#include "qapi/error.h"
+#include "block/qdict.h"
+
+#include "nvme.h"
+
+/* Here is a need for wrapping of original Qemu dictionary retrieval
+ * APIs. In rare cases, when nvme cfg files were tampered with or the
+ * Qemu version was upgraded and a new key is expected to be existent,
+ * but is missing, it will cause segfault crash.
+ * Builtin assert statements are not covering sufficiently such cases
+ * and additionally a possibility of error handling is lacking */
+#define NVME_KEY_CHECK_ERROR_FMT "key[%s] is expected to be existent"
+int64_t qdict_get_int_chkd(const QDict *qdict, const char *key, Error **errp)
+{
+    QObject *qobject = qdict_get(qdict, key);
+    if (qobject) {
+        return qnum_get_int(qobject_to(QNum, qobject));
+    }
+
+    error_setg(errp, NVME_KEY_CHECK_ERROR_FMT, key);
+    return 0;
+}
+
+bool qdict_get_bool_chkd(const QDict *qdict, const char *key, Error **errp)
+{
+    QObject *qobject = qdict_get(qdict, key);
+    if (qobject) {
+        return qbool_get_bool(qobject_to(QBool, qobject));
+    }
+
+    error_setg(errp, NVME_KEY_CHECK_ERROR_FMT, key);
+    return false;
+}
diff --git a/hw/nvme/ctrl-cfg.c b/hw/nvme/ctrl-cfg.c
new file mode 100644
index 0000000000..8dbf25bfb2
--- /dev/null
+++ b/hw/nvme/ctrl-cfg.c
@@ -0,0 +1,181 @@
+/*
+ * QEMU NVM Express Virtual Dynamic Namespace Management
+ *
+ *
+ * Copyright (c) 2022 Solidigm
+ *
+ * Authors:
+ *  Michael Kropaczek      <michael.kropaczek@solidigm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qstring.h"
+#include "sysemu/block-backend.h"
+#include "block/qdict.h"
+#include "qemu/int128.h"
+#include "hw/nvme/nvme-cfg.h"
+
+#include "nvme.h"
+#include "trace.h"
+
+static char *nvme_create_cfg_name(NvmeCtrl *n, Error **errp)
+{
+    return c_create_cfg_name(n->params.ns_directory, n->params.serial, errp);
+}
+
+int nvme_cfg_save(NvmeCtrl *n)
+{
+    NvmeIdCtrl *id = &n->id_ctrl;
+    QDict *nvme_cfg = NULL;
+    Int128  tnvmcap128;
+    Int128  unvmcap128;
+
+    nvme_cfg = qdict_new();
+
+    memcpy(&tnvmcap128, id->tnvmcap, sizeof(tnvmcap128));
+    memcpy(&unvmcap128, id->unvmcap, sizeof(unvmcap128));
+
+#define CTRL_CFG_DEF(type, key, value, default) \
+    qdict_put_##type(nvme_cfg, key, value);
+#include "hw/nvme/ctrl-cfg.h"
+#undef CTRL_CFG_DEF
+
+    return c_cfg_save(n->params.ns_directory, n->params.serial, nvme_cfg);
+}
+
+int nvme_cfg_update(NvmeCtrl *n, uint64_t amount, NvmeNsAllocAction action)
+{
+    int ret = 0;
+    NvmeIdCtrl *id = &n->id_ctrl;
+    Int128  tnvmcap128;
+    Int128  unvmcap128;
+    Int128  amount128 = int128_make64(amount);
+
+    memcpy(&tnvmcap128, id->tnvmcap, sizeof(tnvmcap128));
+    memcpy(&unvmcap128, id->unvmcap, sizeof(unvmcap128));
+
+    switch (action) {
+    case NVME_NS_ALLOC_CHK:
+        if (int128_ge(unvmcap128, amount128)) {
+            return 0;   /* no update */
+        } else {
+            ret = -1;
+        }
+        break;
+    case NVME_NS_ALLOC:
+        if (int128_ge(unvmcap128, amount128)) {
+            unvmcap128 = int128_sub(unvmcap128, amount128);
+        } else {
+            ret = -1;
+        }
+        break;
+    case NVME_NS_DEALLOC:
+        unvmcap128 = int128_add(unvmcap128, amount128);
+        if (int128_ge(unvmcap128, tnvmcap128)) {
+            unvmcap128 = tnvmcap128;
+        }
+        break;
+    default:;
+    }
+
+    if (ret == 0) {
+        memcpy(id->unvmcap, &unvmcap128, sizeof(id->unvmcap));
+    }
+
+    return ret;
+}
+
+/* Note: id->tnvmcap and id->unvmcap are pointing to 16 bytes arrays,
+ *       but those are interpreted as 128bits int objects.
+ *       It is OK here to use Int128 because backend's namespace images cannot
+ *       exceed size of 64bit max value */
+static int nvme_cfg_validate(NvmeCtrl *n, uint64_t tnvmcap, uint64_t unvmcap,
+                             Error **errp)
+{
+    int ret = 0;
+    NvmeIdCtrl *id = &n->id_ctrl;
+    Int128  tnvmcap128;
+    Int128  unvmcap128;
+    Error *local_err = NULL;
+
+    if (unvmcap > tnvmcap) {
+        error_setg(&local_err, "nvme-cfg file is corrupted, free to allocate[%"PRIu64
+                   "] > total capacity[%"PRIu64"]",
+                   unvmcap, tnvmcap);
+    } else if (tnvmcap == (uint64_t) 0) {
+        error_setg(&local_err, "nvme-cfg file error: total capacity cannot be zero");
+    }
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        ret = -1;
+    } else {
+        tnvmcap128 = int128_make64(tnvmcap);
+        unvmcap128 = int128_make64(unvmcap);
+        memcpy(id->tnvmcap, &tnvmcap128, sizeof(id->tnvmcap));
+        memcpy(id->unvmcap, &unvmcap128, sizeof(id->unvmcap));
+    }
+
+    return ret;
+}
+
+int nvme_cfg_load(NvmeCtrl *n)
+{
+    QObject *nvme_cfg_obj = NULL;
+    QDict *nvme_cfg = NULL;
+    int ret = 0;
+    char *filename;
+    uint64_t tnvmcap;
+    uint64_t unvmcap;
+    FILE *fp;
+    char buf[NVME_CFG_MAXSIZE] = {};
+    Error *local_err = NULL;
+
+    filename = nvme_create_cfg_name(n, &local_err);
+    if (!local_err && !access(filename, F_OK)) {
+        fp = fopen(filename, "r");
+        if (fp == NULL) {
+            error_setg(&local_err, "open %s: %s", filename,
+                         strerror(errno));
+        } else {
+            if (!fread(buf,  sizeof(buf), 1, fp)) {
+                nvme_cfg_obj = qobject_from_json(buf, NULL);
+                if (!nvme_cfg_obj) {
+                    error_setg(&local_err, "Could not parse the JSON for nvme-cfg");
+                } else {
+                    nvme_cfg = qobject_to(QDict, nvme_cfg_obj);
+                    qdict_flatten(nvme_cfg);
+
+                    tnvmcap = qdict_get_int_chkd(nvme_cfg, "tnvmcap", &local_err);
+                    if (!local_err) {
+                        unvmcap = qdict_get_int_chkd(nvme_cfg, "unvmcap", &local_err);
+                    }
+                    if (!local_err) {
+                        nvme_cfg_validate(n, tnvmcap, unvmcap, &local_err);
+                    }
+                    qobject_unref(nvme_cfg_obj);
+                }
+            } else {
+                error_setg(&local_err, "Could not read nvme-cfg");
+            }
+            fclose(fp);
+        }
+    } else if (!local_err) {
+        error_setg(&local_err, "Missing nvme-cfg file");
+    }
+
+    if (local_err) {
+        error_report_err(local_err);
+        ret = -1;
+    }
+
+    g_free(filename);
+    return ret;
+}
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..d2b9d65eb9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -40,7 +40,9 @@
  *              sriov_vi_flexible=<N[optional]> \
  *              sriov_max_vi_per_vf=<N[optional]> \
  *              sriov_max_vq_per_vf=<N[optional]> \
- *              subsys=<subsys_id>
+ *              subsys=<subsys_id>, \
+ *              auto-ns-path=<path to ns storage[optional]>
+ *
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
  *              subsys=<subsys_id>,detached=<true|false[optional]>
@@ -140,6 +142,60 @@
  *   a secondary controller. The default 0 resolves to
  *   `(sriov_vq_flexible / sriov_max_vfs)`.
  *
+ * - `auto-ns-path`
+ *   If specified indicates a support for dynamic management of nvme namespaces
+ *   by means of nvme create-ns command. This path pointing
+ *   to a storage area for backend images must exist. Additionally it requires
+ *   that parameter `ns-subsys` must be specified whereas parameter `drive`
+ *   must not. The legacy namespace backend is disabled, instead, a pair of
+ *   files 'nvme_<ctrl SN>_ns_<NS-ID>.cfg' and 'nvme_<ctrl SN>_ns_<NS-ID>.img'
+ *   will refer to respective namespaces. The create-ns, attach-ns
+ *   and detach-ns commands, issued at the guest side, will make changes to
+ *   those files accordingly.
+ *   For each namespace exists an image file in raw format and a config file
+ *   containing namespace parameters and a state of the attachment allowing QEMU
+ *   to configure namespace during its start up accordingly. If for instance an
+ *   image file has a size of 0 bytes, this will be interpreted as non existent
+ *   namespace. Issuing create-ns command will change the status in the config
+ *   files and and will re-size the image file accordingly so the image file
+ *   will be associated with the respective namespace. The main config file
+ *   nvme_<ctrl SN>_ctrl.cfg keeps the track of allocated capacity to the
+ *   namespaces within the nvme controller.
+ *   As it is the case of a typical hard drive, backend images together with
+ *   config files need to be created. For this reason the qemu-img tool has
+ *   been extended by adding createns command.
+ *
+ *    qemu-img createns {-S <serial> -C <total NVMe capacity>}
+ *                      [-N <NsId max>] {<path>}
+ *
+ *   Parameters:
+ *   -S and -C and <path> are mandatory, `-S` must match `serial` parameter
+ *   and <path> must match `auto-ns-path` parameter of "-device nvme,..."
+ *   specification.
+ *   -N is optional, if specified, it will set a limit to the number of potential
+ *   namespaces and will reduce the number of backend images and config files
+ *   accordingly. As a default, a set of images of 0 bytes size and default
+ *   config files for 256 namespaces will be created, a total of 513 files.
+ *
+ *   Note 1:
+ *         If the main "-drive" is not specified with 'if=virtio', then SeaBIOS
+ *         must be built with disabled "Parallelize hardware init" to allow
+ *         a proper boot. Without it, it is probable that non deterministic
+ *         order of collecting of potential block devices for a boot will not
+ *         catch that one with guest OS. Deterministic order however will fill
+ *         up the list of potential boot devices starting with a typical ATA
+ *         devices usually containing guest OS.
+ *         SeaBIOS has a limited space to store all potential boot block devices
+ *         if there are more than 11 namespaces. (other types require less
+ *         memory so the number of 11 does not apply universally)
+ *         (above Note refers to SeaBIOS rel-1.16.0)
+ *   Note 2:
+ *         If the main "-drive" referring to guest OS is specified with
+ *         'if=virtio', then there is no need to build SeaBIOS with disabled
+ *          "Parallelize hardware init".
+ *         Block boot device 'Virtio disk PCI:xx:xx.x" will appear as a first
+ *         listed instead of an ATA device.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `shared`
@@ -262,6 +318,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_NS_MGMT]          = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_VIRT_MNGMT]       = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_DBBUF_CONFIG]     = NVME_CMD_EFF_CSUPP,
@@ -5660,6 +5717,121 @@ static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
     }
 }
 
+static NvmeNamespace *nvme_ns_mgmt_create(NvmeCtrl *n, uint32_t nsid, NvmeIdNsMgmt *id_ns, Error **errp)
+{
+    NvmeNamespace *ns = NULL;
+    Error *local_err = NULL;
+
+    if (!n->params.ns_directory) {
+        error_setg(&local_err, "create-ns not supported if 'auto-ns-path' is not specified");
+    } else if (n->namespace.blkconf.blk) {
+        error_setg(&local_err, "create-ns not supported if 'drive' is specified");
+    } else {
+        ns = nvme_ns_create(n, nsid, id_ns, &local_err);
+    }
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        ns = NULL;
+    }
+
+    return ns;
+}
+
+static uint16_t nvme_ns_mgmt(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeIdCtrl *id = &n->id_ctrl;
+    NvmeNamespace *ns;
+    NvmeIdNsMgmt id_ns = {};
+    uint8_t flags = req->cmd.flags;
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint32_t dw11 = le32_to_cpu(req->cmd.cdw11);
+    uint8_t sel = dw10 & 0xf;
+    uint8_t csi = (dw11 >> 24) & 0xf;
+    uint16_t i;
+    uint16_t ret;
+    Error *local_err = NULL;
+
+    trace_pci_nvme_ns_mgmt(nvme_cid(req), nsid, sel, csi, NVME_CMD_FLAGS_PSDT(flags));
+
+    if (!(le16_to_cpu(id->oacs) & NVME_OACS_NS_MGMT)) {
+        return NVME_NS_ATTACH_MGMT_NOTSPRD | NVME_DNR;
+    }
+
+    switch (sel) {
+    case NVME_NS_MANAGEMENT_CREATE:
+        switch (csi) {
+        case NVME_CSI_NVM:
+            if (nsid) {
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
+            ret = nvme_h2c(n, (uint8_t *)&id_ns, sizeof(id_ns), req);
+            if (ret) {
+                return ret;
+            }
+
+            uint64_t nsze = le64_to_cpu(id_ns.nsze);
+            uint64_t ncap = le64_to_cpu(id_ns.ncap);
+
+            if (ncap > nsze) {
+                return NVME_INVALID_FIELD | NVME_DNR;
+            } else if (ncap != nsze) {
+                return NVME_THIN_PROVISION_NOTSPRD | NVME_DNR;
+            }
+
+            nvme_validate_flbas(id_ns.flbas, &local_err);
+            if (local_err) {
+                error_report_err(local_err);
+                return NVME_INVALID_FORMAT | NVME_DNR;
+            }
+
+            for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+                if (nvme_ns(n, (uint32_t)i) || nvme_subsys_ns(n->subsys, (uint32_t)i)) {
+                    continue;
+                }
+                break;
+            }
+            if (i >  n->nsidMax || i >  NVME_MAX_NAMESPACES) {
+               return NVME_NS_IDNTIFIER_UNAVAIL | NVME_DNR;
+            }
+            nsid = i;
+
+            /* create ns here */
+            ns = nvme_ns_mgmt_create(n, nsid, &id_ns, &local_err);
+            if (!ns || local_err) {
+                if (local_err) {
+                    error_report_err(local_err);
+                }
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
+            if (nvme_cfg_update(n, ns->size, NVME_NS_ALLOC_CHK)) {
+                /* place for delete-ns */
+                return NVME_NS_INSUFFICIENT_CAPAC | NVME_DNR;
+            }
+            (void)nvme_cfg_update(n, ns->size, NVME_NS_ALLOC);
+            if (nvme_cfg_save(n)) {
+                (void)nvme_cfg_update(n, ns->size, NVME_NS_DEALLOC);
+                /* place for delete-ns */
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+            req->cqe.result = cpu_to_le32(nsid);
+            break;
+        case NVME_CSI_ZONED:
+            /* fall through for now */
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
+	    }
+        break;
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
@@ -5672,6 +5844,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
     uint16_t *ids = &list[1];
     uint16_t ret;
     int i;
+    Error *local_err;
 
     trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
 
@@ -5710,6 +5883,13 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_PRIVATE | NVME_DNR;
             }
 
+            ns->params.detached = false;
+            if (ns_cfg_save(n, ns, nsid) == -1) {           /* save ns cfg */
+                error_setg(&local_err, "Unable to save ns-cnf");
+                error_report_err(local_err);
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
             nvme_attach_ns(ctrl, ns);
             nvme_select_iocs_ns(ctrl, ns);
 
@@ -5720,6 +5900,13 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
 
+            ns->params.detached = true;
+            if (ns_cfg_save(n, ns, nsid) == -1) {           /* save ns cfg */
+                error_setg(&local_err, "Unable to save ns-cnf");
+                error_report_err(local_err);
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
             ctrl->namespaces[nsid] = NULL;
             ns->attached--;
 
@@ -6211,6 +6398,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_NS_MGMT:
+        return nvme_ns_mgmt(n, req);
     case NVME_ADM_CMD_NS_ATTACHMENT:
         return nvme_ns_attachment(n, req);
     case NVME_ADM_CMD_VIRT_MNGMT:
@@ -7052,7 +7241,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         params->max_ioqpairs = params->num_queues - 1;
     }
 
-    if (n->namespace.blkconf.blk && n->subsys) {
+    if (n->namespace.blkconf.blk && n->subsys && !params->ns_directory) {
         error_setg(errp, "subsystem support is unavailable with legacy "
                    "namespace ('drive' property)");
         return;
@@ -7602,7 +7791,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     nvme_init_ctrl(n, pci_dev);
 
     /* setup a namespace if the controller drive property was given */
-    if (n->namespace.blkconf.blk) {
+    if (n->namespace.blkconf.blk && !n->params.ns_directory) {
         ns = &n->namespace;
         ns->params.nsid = 1;
 
@@ -7611,6 +7800,14 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         }
 
         nvme_attach_ns(n, ns);
+    } else if (!n->namespace.blkconf.blk && n->params.ns_directory) {
+        if (nvme_cfg_load(n)) {
+            error_setg(errp, "Could not process nvme-cfg");
+            return;
+        }
+        if (nvme_ns_backend_setup(n, errp)) {
+            return;
+        }
     }
 }
 
@@ -7655,6 +7852,7 @@ static void nvme_exit(PCIDevice *pci_dev)
 
 static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
+    DEFINE_PROP_STRING("auto-ns-path", NvmeCtrl,params.ns_directory),
     DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmr.dev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
     DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
index 3cf40046ee..8900831701 100644
--- a/hw/nvme/meson.build
+++ b/hw/nvme/meson.build
@@ -1 +1 @@
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c'))
+softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c', 'ns-backend.c', 'cfg_key_checker.c', 'ctrl-cfg.c'))
diff --git a/hw/nvme/ns-backend.c b/hw/nvme/ns-backend.c
new file mode 100644
index 0000000000..82f9fcd5d9
--- /dev/null
+++ b/hw/nvme/ns-backend.c
@@ -0,0 +1,234 @@
+/*
+ * QEMU NVM Express Virtual Dynamic Namespace Management
+ *
+ *
+ * Copyright (c) 2022 Solidigm
+ *
+ * Authors:
+ *  Michael Kropaczek      <michael.kropaczek@solidigm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qstring.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
+#include "block/qdict.h"
+#include "hw/nvme/nvme-cfg.h"
+
+#include "nvme.h"
+#include "trace.h"
+
+/* caller will take ownership */
+static QDict *ns_get_bs_default_opts(bool read_only)
+{
+    QDict *bs_opts = qdict_new();
+
+    qdict_set_default_str(bs_opts, BDRV_OPT_CACHE_DIRECT, "off");
+    qdict_set_default_str(bs_opts, BDRV_OPT_CACHE_NO_FLUSH, "off");
+    qdict_set_default_str(bs_opts, BDRV_OPT_READ_ONLY,
+                          read_only ? "on" : "off");
+    qdict_set_default_str(bs_opts, BDRV_OPT_AUTO_READ_ONLY, "on");
+    qdict_set_default_str(bs_opts, "driver", "raw");
+
+    return bs_opts;
+}
+
+BlockBackend *ns_blockdev_init(const char *file, Error **errp)
+{
+    BlockBackend *blk = NULL;
+    bool read_only = false;
+    Error *local_err = NULL;
+    QDict *bs_opts;
+
+    if (access(file, F_OK)) {
+        error_setg(&local_err, "%s not found, please create one", file);
+    }
+
+    if (!local_err) {
+        bs_opts = ns_get_bs_default_opts(read_only);
+        blk = blk_new_open(file, NULL, bs_opts, BDRV_O_RDWR | BDRV_O_RESIZE, &local_err);
+    }
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+    }
+
+    return blk;
+}
+
+void ns_blockdev_activate(BlockBackend *blk,  uint64_t image_size, Error **errp)
+{
+    int ret;
+
+    ret = blk_set_perm(blk, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_WRITE_UNCHANGED,  errp);
+    if (ret < 0) {
+        return;
+    }
+    ret = blk_truncate(blk, image_size, false, PREALLOC_MODE_OFF, 0,
+                       errp);
+}
+
+int ns_storage_path_check(NvmeCtrl *n, Error **errp)
+{
+    return storage_path_check(n->params.ns_directory,  n->params.serial, errp);
+}
+
+/* caller will take ownership */
+char *ns_create_image_name(NvmeCtrl *n, uint32_t nsid, Error **errp)
+{
+    return create_image_name(n->params.ns_directory, n->params.serial, nsid, errp);
+}
+
+static char *ns_create_cfg_name(NvmeCtrl *n, uint32_t nsid, Error **errp)
+{
+    return create_cfg_name(n->params.ns_directory, n->params.serial, nsid, errp);
+}
+
+int ns_auto_check(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
+{
+    int ret = 0;
+    BlockBackend *blk = ns->blkconf.blk;
+    char *file_name_img = NULL;
+
+    file_name_img = ns_create_image_name(n, nsid, NULL);
+
+    if (!blk) {
+    } else if (!file_name_img || strcmp(blk_bs(blk)->filename, file_name_img)) {
+        ret = -1;
+    }
+
+    g_free(file_name_img);
+
+    return ret;
+}
+
+void ns_cfg_clear(NvmeNamespace *ns)
+{
+    ns->params.pi = 0;
+    ns->lbasz = 0;
+    ns->id_ns.nsze = 0;
+    ns->id_ns.ncap = 0;
+    ns->id_ns.nuse = 0;
+    ns->id_ns.nsfeat = 0;
+    ns->id_ns.flbas = 0;
+    ns->id_ns.nmic= 0;
+    ns->size = 0;
+}
+
+int ns_cfg_save(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
+{
+    QDict *ns_cfg = NULL;
+    Error *local_err = NULL;
+
+    if (ns_auto_check(n, ns, nsid)) {
+        error_setg(&local_err, "ns-cfg not saved: ns[%"PRIu32"] configured via '-device nvme-ns'", nsid);
+        error_report_err(local_err);
+        return 1;       /* not an error */
+    }
+
+    ns_cfg = qdict_new();
+
+#define NS_CFG_DEF(type, key, value, default) \
+    qdict_put_##type(ns_cfg, key, value);
+#include "hw/nvme/ns-cfg.h"
+#undef NS_CFG_DEF
+
+    return nsid_cfg_save(n->params.ns_directory, n->params.serial, ns_cfg, nsid);
+}
+
+int ns_cfg_load(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
+{
+    QObject *ns_cfg_obj = NULL;
+    QDict *ns_cfg = NULL;
+    int ret = 0;
+    char *filename;
+    FILE *fp;
+    char buf[NS_CFG_MAXSIZE] = {};
+    Error *local_err = NULL;
+
+    if (ns_auto_check(n, ns, nsid)) {
+        error_setg(&local_err, "ns-cfg not loaded: ns[%"PRIu32"] configured via '-device nvme-ns'", nsid);
+        error_report_err(local_err);
+        return 1;       /* not an error */
+    }
+
+    filename = ns_create_cfg_name(n, nsid, &local_err);
+    if (!local_err && !access(filename, F_OK)) {
+        fp = fopen(filename, "r");
+        if (fp == NULL) {
+            error_setg(&local_err, "open %s: %s", filename,
+                         strerror(errno));
+        } else {
+            if (!fread(buf,  sizeof(buf), 1, fp)) {
+                ns_cfg_obj = qobject_from_json(buf, NULL);
+                if (!ns_cfg_obj) {
+                    error_setg(&local_err, "Could not parse the JSON for ns-cfg");
+                } else {
+                    ns_cfg = qobject_to(QDict, ns_cfg_obj);
+                    qdict_flatten(ns_cfg);
+
+                    ns->params.nsid = (uint32_t)qdict_get_int_chkd(ns_cfg, "params.nsid", &local_err);      /* (uint32_t) */
+                    if (!local_err) {
+                        ns->params.detached = qdict_get_bool_chkd(ns_cfg,"params.detached", &local_err);    /* (bool) */
+                    }
+                    if (!local_err) {
+                        ns->params.pi = (uint8_t)qdict_get_int_chkd(ns_cfg, "params.pi", &local_err);       /* (uint8_t) */
+                    }
+                    if (!local_err) {
+                        ns->lbasz = (size_t)qdict_get_int_chkd(ns_cfg, "lbasz", &local_err);                /* (size_t) */
+                    }
+                    if (!local_err) {
+                        ns->id_ns.nsze = cpu_to_le64(qdict_get_int_chkd(ns_cfg, "id_ns.nsze", &local_err)); /* (uint64_t) */
+                    }
+                    if (!local_err) {
+                        ns->id_ns.ncap = cpu_to_le64(qdict_get_int_chkd(ns_cfg, "id_ns.ncap", &local_err)); /* (uint64_t) */
+                    }
+                    if (!local_err) {
+                        ns->id_ns.nuse = cpu_to_le64(qdict_get_int_chkd(ns_cfg, "id_ns.nuse", &local_err)); /* (uint64_t) */
+                    }
+                    if (!local_err) {
+                        ns->id_ns.nsfeat = (uint8_t)qdict_get_int_chkd(ns_cfg, "id_ns.nsfeat", &local_err); /* (uint8_t) */
+                    }
+                    if (!local_err) {
+                        ns->id_ns.flbas = (uint8_t)qdict_get_int_chkd(ns_cfg, "id_ns.flbas", &local_err);   /* (uint8_t) */
+                    }
+                    if (!local_err) {
+                        ns->id_ns.nmic = (uint8_t)qdict_get_int_chkd(ns_cfg, "id_ns.nmic", &local_err);     /* (uint8_t) */
+                    }
+                    if (!local_err) {
+                        /* ns->size below will be overwritten after nvme_ns_backend_sanity_chk() */
+                        ns->size = qdict_get_int_chkd(ns_cfg, "ns_size", &local_err);                       /* (uint64_t) */
+                    }
+
+                    qobject_unref(ns_cfg_obj);
+
+                    /* it is expected that ns-cfg file is consistent with paired ns-img file
+                     * here a simple check preventing against a crash */
+                    nvme_validate_flbas(ns->id_ns.flbas, &local_err);
+                }
+            } else {
+                error_setg(&local_err, "Could not read ns-cfg");
+            }
+            fclose(fp);
+        }
+    }
+    else if (!local_err){
+        error_setg(&local_err, "Missing ns-cfg file");
+    }
+
+    if (local_err) {
+        error_report_err(local_err);
+        ret = -1;
+    }
+
+    g_free(filename);
+    return ret;
+}
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be0..2aa7b01c3d 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -3,9 +3,11 @@
  *
  * Copyright (c) 2019 CNEX Labs
  * Copyright (c) 2020 Samsung Electronics
+ * Copyright (c) 2022 Solidigm
  *
  * Authors:
  *  Klaus Jensen      <k.jensen@samsung.com>
+ *  Michael Kropaczek <michael.kropaczek@solidigm.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2. See the
  * COPYING file in the top-level directory.
@@ -55,6 +57,26 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->npda = id_ns->npdg = npdg - 1;
 }
 
+#define NVME_LBAF_DFLT_CNT 8
+#define NVME_LBAF_DFLT_SIZE 16
+static unsigned int ns_get_default_lbafs(void *lbafp)
+{
+    static const NvmeLBAF lbaf[NVME_LBAF_DFLT_SIZE] = {
+        [0] = { .ds =  9           },
+        [1] = { .ds =  9, .ms =  8 },
+        [2] = { .ds =  9, .ms = 16 },
+        [3] = { .ds =  9, .ms = 64 },
+        [4] = { .ds = 12           },
+        [5] = { .ds = 12, .ms =  8 },
+        [6] = { .ds = 12, .ms = 16 },
+        [7] = { .ds = 12, .ms = 64 },
+    };
+
+    memcpy(lbafp, &lbaf[0], sizeof(lbaf));
+
+    return NVME_LBAF_DFLT_CNT;
+}
+
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     static uint64_t ns_count;
@@ -64,6 +86,11 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     uint16_t ms;
     int i;
 
+    ms = ns->params.ms;
+    if (ms && NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)) {
+        return -1;
+    }
+
     ns->csi = NVME_CSI_NVM;
     ns->status = 0x0;
 
@@ -89,7 +116,6 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->eui64 = cpu_to_be64(ns->params.eui64);
 
     ds = 31 - clz32(ns->blkconf.logical_block_size);
-    ms = ns->params.ms;
 
     id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
 
@@ -105,39 +131,25 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     ns->pif = ns->params.pif;
 
-    static const NvmeLBAF lbaf[16] = {
-        [0] = { .ds =  9           },
-        [1] = { .ds =  9, .ms =  8 },
-        [2] = { .ds =  9, .ms = 16 },
-        [3] = { .ds =  9, .ms = 64 },
-        [4] = { .ds = 12           },
-        [5] = { .ds = 12, .ms =  8 },
-        [6] = { .ds = 12, .ms = 16 },
-        [7] = { .ds = 12, .ms = 64 },
-    };
+    ns->nlbaf = ns_get_default_lbafs(&id_ns->lbaf);
 
-    ns->nlbaf = 8;
-
-    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-
-    for (i = 0; i < ns->nlbaf; i++) {
-        NvmeLBAF *lbaf = &id_ns->lbaf[i];
-        if (lbaf->ds == ds) {
-            if (lbaf->ms == ms) {
-                id_ns->flbas |= i;
-                goto lbaf_found;
+    if (ms) { /* ms from params */
+        for (i = 0; i < ns->nlbaf; i++) {
+            NvmeLBAF *lbaf = &id_ns->lbaf[i];
+            if (lbaf->ds == ds && lbaf->ms == ms) {
+                    id_ns->flbas |= i;
+                    goto lbaf_found;
             }
         }
+        /* add non-standard lba format */
+        id_ns->lbaf[ns->nlbaf].ds = ds;
+        id_ns->lbaf[ns->nlbaf].ms = ms;
+        ns->nlbaf++;
+        id_ns->flbas |= i;
+    } else {
+        i = NVME_ID_NS_FLBAS_INDEX(id_ns->flbas);
     }
 
-    /* add non-standard lba format */
-    id_ns->lbaf[ns->nlbaf].ds = ds;
-    id_ns->lbaf[ns->nlbaf].ms = ms;
-    ns->nlbaf++;
-
-    id_ns->flbas |= i;
-
-
 lbaf_found:
     id_ns_nvm->elbaf[i] = (ns->pif & 0x3) << 7;
     id_ns->nlbaf = ns->nlbaf - 1;
@@ -482,6 +494,112 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
+static void  nvme_ns_backend_sanity_chk(NvmeNamespace *ns, BlockBackend *blk, Error **errp)
+{
+    uint64_t ns_size_img = ns->size;
+    uint64_t ns_size_cfg = blk_getlength(blk);
+
+    if (ns_size_cfg != ns_size_img) {
+        error_setg(errp, "ns-backend sanity check for nsid [%"PRIu32"] failed", ns->params.nsid);
+    }
+}
+
+void nvme_validate_flbas(uint8_t flbas,  Error **errp)
+{
+    uint8_t nlbaf;
+    NvmeLBAF lbaf[NVME_LBAF_DFLT_SIZE];
+
+    nlbaf = ns_get_default_lbafs(&lbaf[0]);
+    flbas = NVME_ID_NS_FLBAS_INDEX(flbas);
+    if (flbas >= nlbaf) {
+        error_setg(errp, "FLBA size index is out of range, max supported [%"PRIu8"]", nlbaf - 1);
+    }
+}
+
+NvmeNamespace * nvme_ns_create(NvmeCtrl *n, uint32_t nsid, NvmeIdNsMgmt *id_ns, Error **errp)
+{
+    NvmeNamespace *ns = NULL;
+    DeviceState *dev = NULL;
+    uint64_t nsze = le64_to_cpu(id_ns->nsze);
+    uint64_t ncap = le64_to_cpu(id_ns->ncap);
+    uint8_t flbas = id_ns->flbas;
+    uint8_t dps = id_ns->dps;
+    uint8_t nmic = id_ns->nmic;
+    uint32_t anagrpid = le32_to_cpu(id_ns->anagrpid);
+    uint16_t endgid = le16_to_cpu(id_ns->endgid);
+    NvmeLBAF lbaf[NVME_LBAF_DFLT_SIZE];
+    size_t lbasz;
+    uint64_t image_size;
+    Error *local_err = NULL;
+    BlockBackend *blk = NULL;
+
+    /* currently not managed */
+    (void)anagrpid;
+    (void)endgid;
+
+    trace_pci_nvme_ns_create(nsid, nsze, ncap, flbas);
+
+    flbas = NVME_ID_NS_FLBAS_INDEX(flbas);
+
+    ns_get_default_lbafs(&lbaf[0]);
+    lbasz = 1 << lbaf[flbas].ds;
+    image_size = (lbasz + lbaf[flbas].ms) * nsze;
+
+    dev = qdev_try_new(TYPE_NVME_NS);
+    if (!dev) {
+        error_setg(&local_err, "Unable to allocate ns QOM (dev)");
+    }
+
+    if (!local_err) {
+        ns = NVME_NS(dev);
+        if (ns) {
+            ns->params.nsid = nsid;
+            ns->params.detached = true;
+            ns->params.pi = dps;
+            ns->id_ns.nsfeat = 0x0;     /* reporting no support for THINP */
+            ns->lbasz = lbasz;
+            ns->id_ns.flbas = id_ns->flbas;
+            ns->id_ns.nsze = cpu_to_le64(nsze);
+            ns->id_ns.ncap = cpu_to_le64(ncap);
+            ns->id_ns.nuse = cpu_to_le64(ncap);     /* at this time no usage recording */
+            ns->id_ns.nmic = nmic;
+
+            blk = n->preloaded_blk[nsid];
+            if (blk) {
+                ns_blockdev_activate(blk, image_size, &local_err);
+                if (!local_err) {
+                    ns->blkconf.blk = blk;
+                    qdev_realize_and_unref(dev, &n->bus.parent_bus, &local_err);    /* causes by extension
+                                                                                     * a call to
+                                                                                     * nvme_ns_realize() */
+                    n->preloaded_blk[nsid] = NULL;
+                }
+            } else {
+                error_setg(&local_err, "Unable to find preloaded back-end reference");
+            }
+            dev = NULL;
+
+            if (!local_err && ns_cfg_save(n, ns, nsid)) {               /* save ns cfg */
+                error_setg(&local_err, "Unable to save ns-cnf");
+            }
+        }
+    }
+
+    if (local_err) {
+        if (dev) {
+            if (blk) {
+                n->preloaded_blk[nsid] = blk;
+                blk = NULL;
+            }
+            object_unref(OBJECT(dev));
+        }
+        error_propagate(errp, local_err);
+        ns = NULL;
+    }
+
+    return ns;
+}
+
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 {
     if (nvme_ns_check_constraints(ns, errp)) {
@@ -505,6 +623,64 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
+int nvme_ns_backend_setup(NvmeCtrl *n, Error **errp)
+{
+    DeviceState *dev = NULL;
+    BlockBackend *blk;
+    NvmeNamespace *ns;
+    uint16_t i;
+    int ret = 0;
+    char *exact_filename;
+    Error *local_err = NULL;
+
+    for (i = 1; i <= NVME_MAX_NAMESPACES && !local_err; i++ ) {
+        blk = NULL;
+        exact_filename = ns_create_image_name(n, i, &local_err);
+        if (access(exact_filename, F_OK)) { /* skip if not found */
+            g_free(exact_filename);
+            continue;
+        }
+
+        n->nsidMax = i;
+
+        dev = qdev_try_new(TYPE_NVME_NS);
+        if (dev) {
+            blk = ns_blockdev_init(exact_filename, &local_err);
+        } else {
+            error_setg(&local_err, "Unable to create a new device entry");
+        }
+
+        g_free(exact_filename);
+
+        if (blk && !local_err) {
+            ns = NVME_NS(dev);
+            if (ns) {
+                if (ns_cfg_load(n, ns, i) == -1) {     /* load ns cfg */
+                    error_setg(&local_err, "Unable to load ns-cfg for ns [%"PRIu16"]", i);
+                } else  if (blk_getlength(blk)) {
+                    nvme_ns_backend_sanity_chk(ns, blk, &local_err);
+                    if (!local_err) {
+                        ns->blkconf.blk = blk;
+                        qdev_realize_and_unref(dev, &n->bus.parent_bus, &local_err);    /* causes by extension
+                                                                                         * a call to
+                                                                                         * nvme_ns_realize() */
+                    }
+                    n->preloaded_blk[i] = NULL;
+                } else {
+                    n->preloaded_blk[i] = blk;
+                }
+            }
+        }
+    }
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        ret = -1;
+    }
+
+    return ret;
+}
+
 void nvme_ns_drain(NvmeNamespace *ns)
 {
     blk_drain(ns->blkconf.blk);
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..c6194773e6 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -23,9 +23,8 @@
 #include "hw/block/block.h"
 
 #include "block/nvme.h"
+#include "hw/nvme/ctrl-cfg.h"
 
-#define NVME_MAX_CONTROLLERS 256
-#define NVME_MAX_NAMESPACES  256
 #define NVME_EUI64_DEFAULT ((uint64_t)0x5254000000000000)
 
 QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
@@ -279,6 +278,8 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
+void nvme_validate_flbas(uint8_t flbas,  Error **errp);
+NvmeNamespace * nvme_ns_create(NvmeCtrl *n, uint32_t nsid, NvmeIdNsMgmt *id_ns, Error **errp);
 
 typedef struct NvmeAsyncEvent {
     QTAILQ_ENTRY(NvmeAsyncEvent) entry;
@@ -339,6 +340,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
     case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
     case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
+    case NVME_ADM_CMD_NS_MGMT:          return "NVME_ADM_CMD_NS_MGMT";
     case NVME_ADM_CMD_NS_ATTACHMENT:    return "NVME_ADM_CMD_NS_ATTACHMENT";
     case NVME_ADM_CMD_VIRT_MNGMT:       return "NVME_ADM_CMD_VIRT_MNGMT";
     case NVME_ADM_CMD_DBBUF_CONFIG:     return "NVME_ADM_CMD_DBBUF_CONFIG";
@@ -427,6 +429,7 @@ typedef struct NvmeParams {
     uint16_t sriov_vi_flexible;
     uint8_t  sriov_max_vq_per_vf;
     uint8_t  sriov_max_vi_per_vf;
+    char     *ns_directory;     /* if empty (default) one legacy ns will be created */
 } NvmeParams;
 
 typedef struct NvmeCtrl {
@@ -485,8 +488,9 @@ typedef struct NvmeCtrl {
 
     NvmeSubsystem   *subsys;
 
-    NvmeNamespace   namespace;
+    NvmeNamespace   namespace;                  /* if ns_directory is empty this will be used */
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
+    BlockBackend    *preloaded_blk[NVME_MAX_NAMESPACES + 1];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
     NvmeSQueue      admin_sq;
@@ -509,6 +513,7 @@ typedef struct NvmeCtrl {
         uint16_t    vqrfap;
         uint16_t    virfap;
     } next_pri_ctrl_cap;    /* These override pri_ctrl_cap after reset */
+    uint16_t nsidMax;
 } NvmeCtrl;
 
 typedef enum NvmeResetType {
@@ -575,6 +580,9 @@ static inline NvmeSecCtrlEntry *nvme_sctrl_for_cntlid(NvmeCtrl *n,
     return NULL;
 }
 
+BlockBackend *ns_blockdev_init(const char *file, Error **errp);
+void ns_blockdev_activate(BlockBackend *blk,  uint64_t image_size, Error **errp);
+int nvme_ns_backend_setup(NvmeCtrl *n, Error **errp);
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
@@ -583,5 +591,22 @@ uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,
 void nvme_rw_complete_cb(void *opaque, int ret);
 uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
                        NvmeCmd *cmd);
+char *ns_create_image_name(NvmeCtrl *n, uint32_t nsid, Error **errp);
+int ns_storage_path_check(NvmeCtrl *n, Error **errp);
+int ns_auto_check(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid);
+int ns_cfg_save(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid);
+int ns_cfg_load(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid);
+int64_t qdict_get_int_chkd(const QDict *qdict, const char *key, Error **errp);
+bool qdict_get_bool_chkd(const QDict *qdict, const char *key, Error **errp);
+void ns_cfg_clear(NvmeNamespace *ns);
+int nvme_cfg_save(NvmeCtrl *n);
+int nvme_cfg_load(NvmeCtrl *n);
+
+typedef enum NvmeNsAllocAction {
+    NVME_NS_ALLOC_CHK,
+    NVME_NS_ALLOC,
+    NVME_NS_DEALLOC,
+} NvmeNsAllocAction;
+int nvme_cfg_update(NvmeCtrl *n, uint64_t ammount, NvmeNsAllocAction action);
 
 #endif /* HW_NVME_NVME_H */
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index fccb79f489..28b025ac42 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -77,6 +77,8 @@ pci_nvme_aer(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aer_aerl_exceeded(void) "aerl exceeded"
 pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8""
 pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_ns_mgmt(uint16_t cid, uint32_t nsid, uint8_t sel, uint8_t csi, uint8_t psdt) "cid %"PRIu16", nsid=%"PRIu32", sel=0x%"PRIx8", csi=0x%"PRIx8", psdt=0x%"PRIx8""
+pci_nvme_ns_create(uint16_t nsid, uint64_t nsze, uint64_t ncap, uint8_t flbas) "nsid %"PRIu16", nsze=%"PRIu64", ncap=%"PRIu64", flbas=%"PRIu8""
 pci_nvme_ns_attachment(uint16_t cid, uint8_t sel) "cid %"PRIu16", sel=0x%"PRIx8""
 pci_nvme_ns_attachment_attach(uint16_t cntlid, uint32_t nsid) "cntlid=0x%"PRIx16", nsid=0x%"PRIx32""
 pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8027b7126b..9d2e121f1a 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -592,6 +592,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_SET_FEATURES   = 0x09,
     NVME_ADM_CMD_GET_FEATURES   = 0x0a,
     NVME_ADM_CMD_ASYNC_EV_REQ   = 0x0c,
+    NVME_ADM_CMD_NS_MGMT        = 0x0d,
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
@@ -897,14 +898,18 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
+    NVME_NS_INSUFFICIENT_CAPAC  = 0x0115,
+    NVME_NS_IDNTIFIER_UNAVAIL   = 0x0116,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
     NVME_NS_PRIVATE             = 0x0119,
     NVME_NS_NOT_ATTACHED        = 0x011a,
+    NVME_THIN_PROVISION_NOTSPRD = 0x011b,
     NVME_NS_CTRL_LIST_INVALID   = 0x011c,
     NVME_INVALID_CTRL_ID        = 0x011f,
     NVME_INVALID_SEC_CTRL_STATE = 0x0120,
     NVME_INVALID_NUM_RESOURCES  = 0x0121,
     NVME_INVALID_RESOURCE_ID    = 0x0122,
+    NVME_NS_ATTACH_MGMT_NOTSPRD = 0x0129,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -1184,6 +1189,10 @@ enum NvmeIdCtrlCmic {
     NVME_CMIC_MULTI_CTRL    = 1 << 1,
 };
 
+enum NvmeNsManagementOperation {
+    NVME_NS_MANAGEMENT_CREATE = 0x0,
+};
+
 enum NvmeNsAttachmentOperation {
     NVME_NS_ATTACHMENT_ATTACH = 0x0,
     NVME_NS_ATTACHMENT_DETACH = 0x1,
@@ -1345,6 +1354,26 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint8_t     vs[3712];
 } NvmeIdNs;
 
+typedef struct QEMU_PACKED NvmeIdNsMgmt {
+    uint64_t    nsze;
+    uint64_t    ncap;
+    uint8_t     rsvd16[10];
+    uint8_t     flbas;
+    uint8_t     rsvd27[2];
+    uint8_t     dps;
+    uint8_t     nmic;
+    uint8_t     rsvd31[61];
+    uint32_t    anagrpid;
+    uint8_t     rsvd96[4];
+    uint16_t    nvmsetid;
+    uint16_t    endgid;
+    uint8_t     rsvd104[280];
+    uint64_t    lbstm;
+    uint8_t     rsvd392[120];
+    uint8_t     rsvd512[512];
+    uint8_t     vs[3072];
+} NvmeIdNsMgmt;
+
 #define NVME_ID_NS_NVM_ELBAF_PIF(elbaf) (((elbaf) >> 7) & 0x3)
 
 typedef struct QEMU_PACKED NvmeIdNsNvm {
@@ -1646,6 +1675,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsMgmt) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsNvm) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZoned) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
diff --git a/include/hw/nvme/ctrl-cfg.h b/include/hw/nvme/ctrl-cfg.h
new file mode 100644
index 0000000000..1be44cb8df
--- /dev/null
+++ b/include/hw/nvme/ctrl-cfg.h
@@ -0,0 +1,24 @@
+/*
+ * QEMU NVM Express Virtual Dynamic Namespace Management
+ * Common configuration handling for qemu-img tool and and qemu-system-xx
+ *
+ *
+ * Copyright (c) 2022 Solidigm
+ *
+ * Authors:
+ *  Michael Kropaczek      <michael.kropaczek@solidigm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef CTRL_CFG_DEF
+#define NVME_STR_(s) #s
+#define NVME_STRINGIFY(s) NVME_STR_(s)
+#define NVME_MAX_NAMESPACES  256
+#define NVME_MAX_CONTROLLERS 256
+#else
+CTRL_CFG_DEF(int, "tnvmcap", int128_get64(tnvmcap128), tnvmcap64)
+CTRL_CFG_DEF(int, "unvmcap", int128_get64(unvmcap128), unvmcap64)
+#endif
diff --git a/include/hw/nvme/ns-cfg.h b/include/hw/nvme/ns-cfg.h
new file mode 100644
index 0000000000..782a843fb5
--- /dev/null
+++ b/include/hw/nvme/ns-cfg.h
@@ -0,0 +1,28 @@
+/*
+ * QEMU NVM Express Virtual Dynamic Namespace Management
+ * Common configuration handling for qemu-img tool and qemu-system-xx
+ *
+ *
+ * Copyright (c) 2022 Solidigm
+ *
+ * Authors:
+ *  Michael Kropaczek      <michael.kropaczek@solidigm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#ifdef NS_CFG_DEF
+NS_CFG_DEF(int, "params.nsid", (int64_t)ns->params.nsid, nsid)
+NS_CFG_DEF(bool, "params.detached", ns->params.detached, true)
+NS_CFG_DEF(int, "params.pi", (int64_t)ns->params.pi, 0)
+NS_CFG_DEF(int, "lbasz", (int64_t)ns->lbasz, 0)
+NS_CFG_DEF(int, "id_ns.nsze", le64_to_cpu(ns->id_ns.nsze), 0)
+NS_CFG_DEF(int, "id_ns.ncap", le64_to_cpu(ns->id_ns.ncap), 0)
+NS_CFG_DEF(int, "id_ns.nuse", le64_to_cpu(ns->id_ns.nuse), 0)
+NS_CFG_DEF(int, "id_ns.nsfeat", (int64_t)ns->id_ns.nsfeat, 0)
+NS_CFG_DEF(int, "id_ns.flbas", (int64_t)ns->id_ns.flbas, 0)
+NS_CFG_DEF(int, "id_ns.nmic", (int64_t)ns->id_ns.nmic, 0)
+NS_CFG_DEF(int, "ns_size", ns->size, 0)
+#endif
diff --git a/include/hw/nvme/nvme-cfg.h b/include/hw/nvme/nvme-cfg.h
new file mode 100644
index 0000000000..6b1faf5945
--- /dev/null
+++ b/include/hw/nvme/nvme-cfg.h
@@ -0,0 +1,201 @@
+/*
+ * QEMU NVM Express Virtual Dynamic Namespace Management
+ * Common configuration handling for qemu-img tool and qemu-system-xx
+ *
+ *
+ * Copyright (c) 2022 Solidigm
+ *
+ * Authors:
+ *  Michael Kropaczek      <michael.kropaczek@solidigm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#include "hw/nvme/ctrl-cfg.h"
+
+#define NS_CFG_MAXSIZE 1024
+#define NS_FILE_FMT "%s/nvme_%s_ns_%03d"
+#define NS_IMG_EXT ".img"
+#define NS_CFG_EXT ".cfg"
+
+#define NVME_FILE_FMT "%s/nvme_%s_ctrl"
+#define NVME_CFG_EXT ".cfg"
+
+#define NVME_CFG_MAXSIZE 512
+static inline int storage_path_check(char *ns_directory, char *serial, Error **errp)
+{
+    int ret = 0;
+    Error *local_err = NULL;
+
+    ret = access(ns_directory, F_OK);
+    if (ret < 0) {
+        error_setg(&local_err,
+                         "Path '%s' to nvme controller's storage area with serial no: '%s' must exist",
+                          ns_directory, serial);
+    }
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        ret = -1;
+    }
+
+    return ret;
+}
+
+
+static inline char *c_create_cfg_name(char *ns_directory, char *serial, Error **errp)
+{
+    char *file_name = NULL;
+    Error *local_err = NULL;
+
+    storage_path_check(ns_directory, serial, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+    } else {
+        file_name = g_strdup_printf(NVME_FILE_FMT NVME_CFG_EXT,
+                                   ns_directory, serial);
+    }
+
+    return file_name;
+}
+
+static inline char *create_fmt_name(const char *fmt, char *ns_directory, char *serial, uint32_t nsid, Error **errp)
+{
+    char *file_name = NULL;
+    Error *local_err = NULL;
+
+    storage_path_check(ns_directory, serial, errp);
+    if (local_err) {
+        error_propagate(errp, local_err);
+    } else {
+        file_name = g_strdup_printf(fmt, ns_directory, serial, nsid);
+    }
+
+    return file_name;
+}
+
+static inline char *create_cfg_name(char *ns_directory, char *serial, uint32_t nsid, Error **errp)
+{
+    return create_fmt_name(NS_FILE_FMT NS_CFG_EXT, ns_directory, serial, nsid, errp);
+}
+
+
+static inline char *create_image_name(char *ns_directory, char *serial, uint32_t nsid, Error **errp)
+{
+    return create_fmt_name(NS_FILE_FMT NS_IMG_EXT, ns_directory, serial, nsid, errp);
+}
+
+static inline int nsid_cfg_save(char *ns_directory, char *serial, QDict *ns_cfg, uint32_t nsid)
+{
+    GString *json = NULL;
+    char *filename;
+    FILE *fp;
+    int ret = 0;
+    Error *local_err = NULL;
+
+    json = qobject_to_json_pretty(QOBJECT(ns_cfg), false);
+
+    if (strlen(json->str) + 2 /* '\n'+'\0' */ > NS_CFG_MAXSIZE) {
+        error_setg(&local_err, "ns-cfg allowed max size %d exceeded", NS_CFG_MAXSIZE);
+    }
+
+    filename = create_cfg_name(ns_directory, serial, nsid, &local_err);
+    if (!local_err) {
+        fp = fopen(filename, "w");
+        if (fp == NULL) {
+            error_setg(&local_err, "open %s: %s", filename,
+                         strerror(errno));
+        } else {
+            chmod(filename, 0644);
+            if (!fprintf(fp, "%s\n", json->str)) {
+                error_setg(&local_err, "could not write ns-cfg %s: %s", filename,
+                             strerror(errno));
+            }
+            fclose(fp);
+        }
+    }
+
+    if (local_err) {
+        error_report_err(local_err);
+        ret = -1;
+    }
+
+    g_string_free(json, true);
+    g_free(filename);
+    qobject_unref(ns_cfg);
+
+    return ret;
+}
+
+static inline int ns_cfg_default_save(char *ns_directory, char *serial, uint32_t nsid)
+{
+    QDict *ns_cfg = NULL;
+
+    ns_cfg = qdict_new();
+
+#define NS_CFG_DEF(type, key, value, default) \
+    qdict_put_##type(ns_cfg, key, default);
+#include "hw/nvme/ns-cfg.h"
+#undef NS_CFG_DEF
+
+    return nsid_cfg_save(ns_directory, serial, ns_cfg, nsid);
+}
+
+static inline int c_cfg_save(char *ns_directory, char *serial, QDict *nvme_cfg)
+{
+    GString *json = NULL;
+    char *filename;
+    FILE *fp;
+    int ret = 0;
+    Error *local_err = NULL;
+
+    json = qobject_to_json_pretty(QOBJECT(nvme_cfg), false);
+
+    if (strlen(json->str) + 2 /* '\n'+'\0' */ > NVME_CFG_MAXSIZE) {
+        error_setg(&local_err, "ctrl-cfg allowed max size %d exceeded",
+                    NVME_CFG_MAXSIZE);
+    }
+
+    filename = c_create_cfg_name(ns_directory, serial, &local_err);
+    if (!local_err) {
+        fp = fopen(filename, "w");
+        if (fp == NULL) {
+            error_setg(&local_err, "open %s: %s", filename,
+                         strerror(errno));
+        } else {
+            chmod(filename, 0644);
+            if (!fprintf(fp, "%s\n", json->str)) {
+                error_setg(&local_err, "could not write ctrl-cfg %s: %s",
+                            filename, strerror(errno));
+            }
+            fclose(fp);
+        }
+    }
+
+    if (local_err) {
+        error_report_err(local_err);
+        ret = -1;
+    }
+
+    g_string_free(json, true);
+    g_free(filename);
+    qobject_unref(nvme_cfg);
+
+    return ret;
+}
+
+static inline int c_cfg_default_save(char *ns_directory, char *serial, uint64_t tnvmcap64, uint64_t unvmcap64)
+{
+    QDict *nvme_cfg = NULL;
+
+    nvme_cfg = qdict_new();
+
+#define CTRL_CFG_DEF(type, key, value, default) \
+    qdict_put_##type(nvme_cfg, key, default);
+#include "hw/nvme/ctrl-cfg.h"
+#undef CTRL_CFG_DEF
+
+    return c_cfg_save(ns_directory, serial, nvme_cfg);
+}
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 1b1dab5b17..9aacb88fc9 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -57,6 +57,12 @@ SRST
 .. option:: create [--object OBJECTDEF] [-q] [-f FMT] [-b BACKING_FILE [-F BACKING_FMT]] [-u] [-o OPTIONS] FILENAME [SIZE]
 ERST
 
+DEF("createns", nsimgs_create,
+    "createns -S nvme_ctrl_serial_number -C nvme_ctrl_total_capacity [-N <NsId_max>] pathname")
+SRST
+.. option:: createns -S SERIAL_NUMBER -C TOTAL_CAPACITY [-N NSID_MAX] PATHNAME
+ERST
+
 DEF("dd", img_dd,
     "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [bs=block_size] [count=blocks] [skip=blocks] if=input of=output")
 SRST
diff --git a/qemu-img.c b/qemu-img.c
index ace3adf8ae..6d8072ade2 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -49,10 +49,12 @@
 #include "block/block_int.h"
 #include "block/blockjob.h"
 #include "block/qapi.h"
+#include "block/qdict.h"
 #include "crypto/init.h"
 #include "trace/control.h"
 #include "qemu/throttle.h"
 #include "block/throttle-groups.h"
+#include "hw/nvme/nvme-cfg.h"
 
 #define QEMU_IMG_VERSION "qemu-img version " QEMU_FULL_VERSION \
                           "\n" QEMU_COPYRIGHT "\n"
@@ -219,6 +221,14 @@ void help(void)
            "  '-F' second image format\n"
            "  '-s' run in Strict mode - fail on different image size or sector allocation\n"
            "\n"
+           "Parameters to createns subcommand:\n"
+           "  'pathname' points to the storage area for namespaces backend images and must exist,\n"
+           "    and must match the -device nvme 'auto-ns-path=...' of the qemu-system-xx command\n"
+           "  '-S' indicates NVMe serial number, must match the -device nvme 'serial=...' of the qemu-system-xx command\n"
+           "  '-C' indicates NVMe total capacity\n"
+           "  '-N' sets a limit on possible NVMe namespaces number associated with NVMe controller,\n"
+           "        the default maximal value is " NVME_STRINGIFY(NVME_MAX_NAMESPACES) " and cannot be exceeded\n"
+           "\n"
            "Parameters to dd subcommand:\n"
            "  'bs=BYTES' read and write up to BYTES bytes at a time "
            "(default: 512)\n"
@@ -603,6 +613,130 @@ fail:
     return 1;
 }
 
+static int nsimgs_create(int argc, char **argv)
+{
+    int c;
+    char *auto_ns_path = NULL;
+    char *serial = NULL;
+    char *nsidMax = NULL;
+    char *tnvmcap = NULL;
+    uint64_t tnvmcap64 = 0L;
+    unsigned int nsidMaxi = NVME_MAX_NAMESPACES;
+    char *filename = NULL;
+    uint32_t i;
+    Error *local_err = NULL;
+
+    for(;;) {
+        static const struct option long_options[] = {
+            {"help", no_argument, 0, 'h'},
+            {"serial", required_argument, 0, 'S'},
+            {"tnvmcap", required_argument, 0, 'C'},
+            {"nsidmax", required_argument, 0, 'N'},
+            {0, 0, 0, 0}
+        };
+        c = getopt_long(argc, argv, "S:C:N:",
+                        long_options, NULL);
+        if (c == -1) {
+            break;
+        }
+        switch(c) {
+        case ':':
+            missing_argument(argv[optind - 1]);
+            break;
+        case '?':
+            unrecognized_option(argv[optind - 1]);
+            break;
+        case 'h':
+            help();
+            break;
+        case 'S':
+            serial = optarg;
+            break;
+        case 'N':
+            nsidMax = optarg;
+            break;
+        case 'C':
+            tnvmcap = optarg;
+            break;
+        }
+    }
+
+    if (optind >= argc) {
+        error_exit("Expecting path name");
+    }
+
+    if (!serial || !tnvmcap) {
+        error_exit("Both -S and -C must be specified");
+    }
+
+    tnvmcap64 = cvtnum_full("tnvmcap", tnvmcap, 0, INT64_MAX);
+
+    if (nsidMax && (qemu_strtoui(nsidMax, NULL, 0, &nsidMaxi) < 0 ||
+                                 nsidMaxi > NVME_MAX_NAMESPACES)) {
+        error_exit("-N 'NsIdMax' must be numeric and cannot exceed %d",
+                   NVME_MAX_NAMESPACES);
+    }
+
+    auto_ns_path = (optind < argc) ? argv[optind] : NULL;
+
+    /* create backend images and config flles for namespaces */
+    for (i = 1; !local_err && i <= NVME_MAX_NAMESPACES; i++) {
+        filename = create_image_name(auto_ns_path, serial, i, &local_err);
+        if (local_err) {
+            break;
+        }
+
+        /* calling bdrv_img_create() in both cases if i <= nsidMaxi and othewise,
+         * it checks shared resize permission, if likely locked by qemu-system-xx
+         * it will abort */
+        bdrv_img_create(filename, "raw", NULL, NULL, NULL,
+                                    0, BDRV_O_RDWR | BDRV_O_RESIZE,
+                                    true, &local_err);
+        if (local_err) {
+            break;
+        }
+
+        if (i <= nsidMaxi) { /* backend image file was created */
+            if (ns_cfg_default_save(auto_ns_path, serial, i)) { /* create
+                                                                 * namespace
+                                                                 * config file */
+                break;
+            }
+        } else if (!access(filename, F_OK)) { /* reducing the number of files
+                                               * if i > nsidMaxi */
+            unlink(filename);
+            g_free(filename);
+            filename = create_cfg_name(auto_ns_path, serial, i, &local_err);
+            if (local_err) {
+                break;
+            }
+            unlink(filename);
+        }
+        g_free(filename);
+        filename = NULL;
+    }
+
+    if (local_err && filename) {
+        error_reportf_err(local_err, "Could not create ns-image [%s] ",
+                          filename);
+        g_free(filename);
+        goto fail;
+    } else if (c_cfg_default_save(auto_ns_path, serial,
+                                  tnvmcap64, tnvmcap64)) { /* create controller
+                                                            * config file */
+        error_reportf_err(local_err, "Could not create nvme-cfg ");
+        goto fail;
+    } else if (local_err) {
+            error_report_err(local_err);
+        goto fail;
+    }
+
+    return 0;
+
+fail:
+    return 1;
+}
+
 static void dump_json_image_check(ImageCheck *check, bool quiet)
 {
     GString *str;
-- 
2.37.3


