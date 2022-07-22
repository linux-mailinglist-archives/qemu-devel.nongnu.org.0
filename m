Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FE957E7ED
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:08:03 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEywM-0006JO-EJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyox-0002tS-U0
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:23 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyow-0005D4-9B
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:23 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so7547434fac.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UvK2EXKYd/bzx1pqiGuSOb3EJViIu85WwNJvp0REWk=;
 b=cQdEDDMsz2zg8RSUSXWvSIx32k4ChjPblmDl+w0UthjSMKp7j40VohhyHeibgfmYUl
 HArzG5KJ1OH++ss6ef53qvHCgycgYnH71MjdGc+1u7i/mZXsw/zX+mbb3DxKcLFfRaj9
 eeK1KqqQJHQ3jkRPE4VkBknN8WL65g5b6V5ztHZgfyRzo2BBgFrTuW2qIgSAHtbcC/GP
 GTLDn6fSO03MCsUr6Erda8PxZf7tiAh9N12/GgtIO9XgXInCeLwiLOBZwx5BPMVVvpCU
 m7Ajca8YX1clXwMnDrno4WgLYKc9vb5jNuhEgnXDCCPzeeDcIWUq9ksNGCE67G6YhhSa
 yVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UvK2EXKYd/bzx1pqiGuSOb3EJViIu85WwNJvp0REWk=;
 b=mer/TUaM0M9YYcboWKJBKddY1nVv6FuhG55sbKLLemCFcIuMIrXQZSdI+n0751PFXr
 yeOkz+Hg0P1BGzWHV8xWub+Ql+dtrqpZuv1sQjeIHdFVQo0om5NZeTxJZi9AGZMjRoZa
 l0nmrtm3+z1/Oulz4k+Mc5BavB9Srs3YAwTMV8htFGuCCpB1kq53DGR2rkWleRrQqLYb
 o/TVHu2EGo4mSM//SLEZ42XzCfrZ874VyNrJvIDc7J1En9Jrhn1KOPKnTV/cN2IVR1DG
 viPpBtJrJViqsnpS7WvpGQo2cJOkYP9qJcsLaXpbS/w/LNkgcgrUeVvZiNLgJnPFvypz
 O3Bw==
X-Gm-Message-State: AJIora+5ZQAArheEpMWsGAaksTrzML/oRxN3FJkFCN4yetRJaDJjuRnn
 Nfpqr2Sf/S05kWkNdSujVUZAyTdzGnE=
X-Google-Smtp-Source: AGRyM1u1oY6aDIG1D6KC7RQrzmkqijRyPXBREvFrbk5fAYNmKHVsXz3zrRPI6TUbWxSKOxMxQGqdfA==
X-Received: by 2002:a05:6870:8183:b0:10c:d04a:53e8 with SMTP id
 k3-20020a056870818300b0010cd04a53e8mr8404277oae.14.1658520020962; 
 Fri, 22 Jul 2022 13:00:20 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH for-7.2 04/10] hmp, device_tree.c: introduce fdt-save
Date: Fri, 22 Jul 2022 17:00:01 -0300
Message-Id: <20220722200007.1602174-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
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

To save the FDT blob we have the '-machine dumpdtb=<file>' property. With this
property set, the machine saves the FDT in <file> and exit. The created
file can then be converted to plain text dts format using 'dtc'.

There's nothing particularly sophisticated into saving the FDT that
can't be done with the machine at any state, as long as the machine has
a valid FDT to be saved.

The 'fdt-save' command receives a 'filename' paramenter and, if a valid
FDT is available, it'll save it in a file 'filename'. In short, this is
a '-machine dumpdtb' that can be fired on demand via HMP.

A valid FDT consists of a FDT that was created using libfdt being
retrieved via 'current_machine->fdt' in device_tree.c. This condition is
met by most FDT users in QEMU.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands.hx              | 13 +++++++++++++
 include/sysemu/device_tree.h |  2 ++
 monitor/misc.c               | 13 +++++++++++++
 softmmu/device_tree.c        | 18 ++++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index c9d465735a..3c134cf652 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1768,3 +1768,16 @@ ERST
                       "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
         .cmd        = hmp_calc_dirty_rate,
     },
+
+    {
+        .name       = "fdt-save",
+        .args_type  = "filename:s",
+        .params     = "[filename] file to save the FDT",
+        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
+        .cmd        = hmp_fdt_save,
+    },
+
+SRST
+``fdt-save`` *filename*
+  Save the FDT in the 'filename' file to be decoded using dtc
+ERST
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index ef060a9759..1397adb21c 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -123,6 +123,8 @@ int qemu_fdt_nop_node(void *fdt, const char *node_path);
 int qemu_fdt_add_subnode(void *fdt, const char *name);
 int qemu_fdt_add_path(void *fdt, const char *path);
 
+void fdt_save(const char *filename, Error **errp);
+
 #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
     do {                                                                      \
         uint32_t qdt_tmp[] = { __VA_ARGS__ };                                 \
diff --git a/monitor/misc.c b/monitor/misc.c
index 3d2312ba8d..145285cec0 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -78,6 +78,7 @@
 #include "qapi/qmp-event.h"
 #include "sysemu/cpus.h"
 #include "qemu/cutils.h"
+#include "sysemu/device_tree.h"
 
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
@@ -936,6 +937,18 @@ static void hmp_boot_set(Monitor *mon, const QDict *qdict)
     }
 }
 
+static void hmp_fdt_save(Monitor *mon, const QDict *qdict)
+{
+    const char *path = qdict_get_str(qdict, "filename");
+    Error *local_err = NULL;
+
+    fdt_save(path, &local_err);
+
+    if (local_err) {
+        error_report_err(local_err);
+    }
+}
+
 static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 {
     bool flatview = qdict_get_try_bool(qdict, "flatview", false);
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 6ca3fad285..eeab6a5ef0 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -643,3 +643,21 @@ out:
     g_free(propcells);
     return ret;
 }
+
+void fdt_save(const char *filename, Error **errp)
+{
+    int size;
+
+    if (!current_machine->fdt) {
+        error_setg(errp, "Unable to find the machine FDT");
+        return;
+    }
+
+    size = fdt_totalsize(current_machine->fdt);
+
+    if (g_file_set_contents(filename, current_machine->fdt, size, NULL)) {
+        return;
+    }
+
+    error_setg(errp, "Error when saving machine FDT to file %s", filename);
+}
-- 
2.36.1


