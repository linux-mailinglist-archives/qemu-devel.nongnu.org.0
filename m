Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D663E5AC13B
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:49:10 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ8f-0002HO-Uw
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYvD-0007HI-2o; Sat, 03 Sep 2022 15:35:15 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:42898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYv6-0005Ml-DT; Sat, 03 Sep 2022 15:35:12 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11f34610d4aso12841529fac.9; 
 Sat, 03 Sep 2022 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qjmaukKWaG1JJ3p0YVd+GmaIlJfsP8CQbJQ5n47KQDc=;
 b=TvfH48fqJAWuHvW7fIJIqaIazHCfgI31MtiR801s99ycf9Y0LOQm7vTV4QjbghwOIL
 KzWqHrYj2znIVwcVcyQRh6pGLn1dPNaR315WfT1vo38WWZPsg10Rrr/qNIJfsuRdPlpC
 jAdXs09B8zUfNp3MUmcSwi8rJX3VwPZznc4L2Wv0zbavDqH33waYgUMZZAOH4SpaBHiZ
 19KPn1OEdUsreLb0uH1ptDsyz0mWyxJBq+htx4TrsDENz3jN1EeYSqX1IxwhjkgumYCq
 SbygZeqJMS3dVLFOnNQ6q2HxUocWWzOBS8BiCn8+ZP5gG9o9aKCjZW3ZIHy9JPJuSwb2
 oE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qjmaukKWaG1JJ3p0YVd+GmaIlJfsP8CQbJQ5n47KQDc=;
 b=1qHWaLnBMctpXlWgi0hTVPzEh1UVn6QPr/QnZWMfgiBWFs2QoHxnaw5GT5tZUuRIsC
 dj8yUgYCY9QN2wYIf5NPP0HkNc1YmIKLzrgu18lEEDefSczFepjsbxXD8gdR3Qf/XhFX
 GbKZeLeY3LzsNdq1XVL9A2j+EDOEEu0+O8LV76Yy1jVQSlzc/6Un8CwOI2VRlVRlwSUd
 Yw1l2PTb/DULmcWsJb0usG/dEE4pJ3XFIuBpmubMaeKp51Ouxwmomq/Skxs7CdYmJlh9
 H/d8lxe0SiqOqFgUlrkUzFPvlJDOGvS1EOTEjAz5pp7uQBnigbU9D6LiIMtUr96l5Mn3
 RMLg==
X-Gm-Message-State: ACgBeo3bm8LFRIY3KMIi9X5+KiM5KvO8EHNkFsiEOqdVGFLLtiYN7HfE
 MY5dbmyUbBwgoKyYvZJJjGBX8gT330VQBA==
X-Google-Smtp-Source: AA6agR7C0V6agI1J0JB6dNHv8EnFgxIaiOJ0kfzG9IPv3qlLSuWZ/PyrKdXGvsEce/woC22uQcMedQ==
X-Received: by 2002:a05:6870:c386:b0:102:fcb:86cd with SMTP id
 g6-20020a056870c38600b001020fcb86cdmr5252651oao.296.1662233707291; 
 Sat, 03 Sep 2022 12:35:07 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:35:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
Date: Sat,  3 Sep 2022 16:34:20 -0300
Message-Id: <20220903193420.115986-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

To save the FDT blob we have the '-machine dumpdtb=<file>' property.
With this property set, the machine saves the FDT in <file> and exit.
The created file can then be converted to plain text dts format using
'dtc'.

There's nothing particularly sophisticated into saving the FDT that
can't be done with the machine at any state, as long as the machine has
a valid FDT to be saved.

The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
FDT is available, it'll save it in a file 'filename'. In short, this is
a '-machine dumpdtb' that can be fired on demand via QMP/HMP.

A valid FDT consists of a FDT that was created using libfdt being
retrieved via 'current_machine->fdt' in device_tree.c. This condition is
met by most FDT users in QEMU.

This command will always be executed in-band (i.e. holding BQL),
avoiding potential race conditions with machines that might change the
FDT during runtime (e.g. PowerPC 'pseries' machine).

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands.hx              | 15 +++++++++++++++
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               |  1 +
 qapi/machine.json            | 18 ++++++++++++++++++
 softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 182e639d14..9a3e57504f 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1800,3 +1800,18 @@ ERST
                       "\n\t\t\t\t\t limit on a specified virtual cpu",
         .cmd        = hmp_cancel_vcpu_dirty_limit,
     },
+
+#if defined(CONFIG_FDT)
+SRST
+``dumpdtb`` *filename*
+  Save the FDT in the 'filename' file to be decoded using dtc.
+  Requires 'libfdt' support.
+ERST
+    {
+        .name       = "dumpdtb",
+        .args_type  = "filename:F",
+        .params     = "filename",
+        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
+        .cmd        = hmp_dumpdtb,
+    },
+#endif
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index ef060a9759..e7c5441f56 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
     } while (0)
 
 void qemu_fdt_dumpdtb(void *fdt, int size);
+void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
 
 /**
  * qemu_fdt_setprop_sized_cells_from_array:
diff --git a/monitor/misc.c b/monitor/misc.c
index 3d2312ba8d..e7dd63030b 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -49,6 +49,7 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/tpm.h"
+#include "sysemu/device_tree.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qstring.h"
diff --git a/qapi/machine.json b/qapi/machine.json
index 6afd1936b0..f968a5d343 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1664,3 +1664,21 @@
      '*size': 'size',
      '*max-size': 'size',
      '*slots': 'uint64' } }
+
+##
+# @dumpdtb:
+#
+# Save the FDT in dtb format. Requires 'libfdt' support.
+#
+# @filename: name of the FDT file to be created
+#
+# Since: 7.2
+#
+# Example:
+#   {"execute": "dumpdtb"}
+#    "arguments": { "filename": "/tmp/fdt.dtb" } }
+#
+##
+{ 'command': 'dumpdtb',
+  'data': { 'filename': 'str' },
+  'if': 'CONFIG_FDT' }
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 6ca3fad285..cdd41b6de6 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -26,6 +26,9 @@
 #include "hw/loader.h"
 #include "hw/boards.h"
 #include "qemu/config-file.h"
+#include "qapi/qapi-commands-machine.h"
+#include "qapi/qmp/qdict.h"
+#include "monitor/hmp.h"
 
 #include <libfdt.h>
 
@@ -643,3 +646,31 @@ out:
     g_free(propcells);
     return ret;
 }
+
+void qmp_dumpdtb(const char *filename, Error **errp)
+{
+    g_autoptr(GError) err = NULL;
+    int size;
+
+    if (!current_machine->fdt) {
+        error_setg(errp, "Unable to find the machine FDT");
+        return;
+    }
+
+    size = fdt_totalsize(current_machine->fdt);
+
+    if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
+        error_setg(errp, "Error saving FDT to file %s: %s",
+                   filename, err->message);
+    }
+}
+
+void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
+{
+    const char *filename = qdict_get_str(qdict, "filename");
+    Error *local_err = NULL;
+
+    qmp_dumpdtb(filename, &local_err);
+
+    hmp_handle_error(mon, local_err);
+}
-- 
2.37.2


