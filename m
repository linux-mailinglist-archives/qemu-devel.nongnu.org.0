Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A65EB08D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:53:00 +0200 (CEST)
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octDv-0007SW-7n
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4S-00088y-Oz
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:09 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:33533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4Q-00025N-Pt
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:08 -0400
Received: by mail-oi1-x236.google.com with SMTP id j188so9206626oih.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9/rxGSHTzhkZV5IqQNzmsiPqBfv0Nw/sHT/u2uhyLNs=;
 b=cZSgZi4xqNHmGf8WzeX3Nc/8EVcQ9eqF145oTeQaQttMmqmB7Fzvq1ML030xQoLNgp
 QfwANPUd2HNzCyfi+TrdCuJ6Uu85TsY2zUT4LKhtE/X0cFuFIAr0gZ5TTGw4I1a0kCx8
 ylzwrluGnJ+sIqs4AkzHsW7CYF7Fh5UvL2me/Q9rSW2UoqBCb4SnaFzup2genemLPXa+
 8MPIMu+8FizNSGSO7vjeRy0KNX1DDdzJD4rtGyfQvhki4N7MofxOpCWvGksij/LEN5j3
 TIgWxX42dbKtGZlTg/2sdtFM6BvUuKWaBrdmN7IH2EtgLeMeJsTK+zZkkcgyxrS2to9I
 /p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9/rxGSHTzhkZV5IqQNzmsiPqBfv0Nw/sHT/u2uhyLNs=;
 b=tIY/MfUn19cXnxQj+VqofwG3PXLokgEob9oGFS3xHvjE95NDVLELqc5rThsHaTuFfR
 rzEM9Yn14zBbOKPdUwLkcW2a2v43GwwHdkIXo3+OoZGWMS84h/CT17LX6JDp3BGfDXX/
 r/1+En8BNwN5NSb9ibSArZ2wL4LFyYlhOyRLhXdAnciQxpyM+/vBqNV/Hd6C4s/71otb
 n1Ccl2xCsvMKfYsVm9yaJUs8ILMw9NZujrDLU5cYWg/Bz5CzGEDrI0ibPJV/pOt7fyCW
 bCjTUnTgIY5qCWgtGynURkGdF2Cg6PYe/61LZ58etR50IInm40IL1r/UG2zGIL684oIH
 ap3A==
X-Gm-Message-State: ACrzQf2k3VHfg7jLU4F2TZSxGlflKGuLqbkXVlU2Y+KjWEAq/Pq+heQ8
 X3Z89WFH8uMJlEBl9SbkM1BZL2nYKwQ=
X-Google-Smtp-Source: AMsMyM5CPdvUbIVP/ihSoZE/XiacRl5np+96WU1uqZBTZqud/RFoO/2pOXrtcCx6N72Rb8aKueTEHA==
X-Received: by 2002:a05:6808:20a4:b0:34f:de9c:a774 with SMTP id
 s36-20020a05680820a400b0034fde9ca774mr15077533oiw.213.1664213944521; 
 Mon, 26 Sep 2022 10:39:04 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 01/16] qmp/hmp, device_tree.c: introduce dumpdtb
Date: Mon, 26 Sep 2022 14:38:40 -0300
Message-Id: <20220926173855.1159396-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

To save the FDT blob we have the '-machine dumpdtb=<file>' property.
With this property set, the machine saves the FDT in <file> and exit.
The created file can then be converted to plain text dts format using
'dtc'.

There's nothing particularly sophisticated into saving the FDT that
can't be done with the machine at any state, as long as the machine has
a valid FDT to be saved.

The 'dumpdtb' command receives a 'filename' parameter and, if the FDT is
available via current_machine->fdt, save it in dtb format to 'filename'.
In short, this is a '-machine dumpdtb' that can be fired on demand via
QMP/HMP.

This command will always be executed in-band (i.e. holding BQL),
avoiding potential race conditions with machines that might change the
FDT during runtime (e.g. PowerPC 'pseries' machine).

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands.hx              | 15 +++++++++++++++
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               |  1 +
 qapi/machine.json            | 18 ++++++++++++++++++
 softmmu/device_tree.c        | 37 ++++++++++++++++++++++++++++++++++++
 5 files changed, 72 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8ab8000acd..12b6d4e2dc 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1800,3 +1800,18 @@ ERST
         .sub_table  = hmp_info_cmds,
         .flags      = "p",
     },
+
+#if defined(CONFIG_FDT)
+    {
+        .name       = "dumpdtb",
+        .args_type  = "filename:F",
+        .params     = "filename",
+        .help       = "dump the FDT in dtb format to 'filename'",
+        .cmd        = hmp_dumpdtb,
+    },
+
+SRST
+``dumpdtb`` *filename*
+  Dump the FDT in dtb format to *filename*.
+ERST
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
index 6436a8786b..205487e2b9 100644
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
index abb2f48808..b9228a5e46 100644
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
+# Save the FDT in dtb format.
+#
+# @filename: name of the dtb file to be created
+#
+# Since: 7.2
+#
+# Example:
+#   {"execute": "dumpdtb"}
+#    "arguments": { "filename": "fdt.dtb" } }
+#
+##
+{ 'command': 'dumpdtb',
+  'data': { 'filename': 'str' },
+  'if': 'CONFIG_FDT' }
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 6ca3fad285..ce74f3d48d 100644
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
 
@@ -643,3 +646,37 @@ out:
     g_free(propcells);
     return ret;
 }
+
+void qmp_dumpdtb(const char *filename, Error **errp)
+{
+    g_autoptr(GError) err = NULL;
+    uint32_t size;
+
+    if (!current_machine->fdt) {
+        error_setg(errp, "This machine doesn't have a FDT");
+        return;
+    }
+
+    size = fdt_totalsize(current_machine->fdt);
+
+    g_assert(size > 0);
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
+    if (hmp_handle_error(mon, local_err)) {
+        return;
+    }
+
+    info_report("dtb dumped to %s", filename);
+}
-- 
2.37.3


