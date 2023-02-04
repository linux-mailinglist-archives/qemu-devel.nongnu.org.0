Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A091668A8C4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 08:22:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOCrZ-0001Xa-7R; Sat, 04 Feb 2023 02:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pOCrW-0001X9-TP
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 02:21:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pOCrU-0001ql-UC
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 02:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675495283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ee8emtfr91Zfm2ogcsvYSTzi8TJ2OmBi0WQWT+EvEeU=;
 b=ACHBTvkMRJi379+NgY77Ix7SahK8ZJUuNFkc95Z34ga7VD3SxmsXXkLW0qptB1/JwR9zHz
 1pRXeXJmD6EWi44WLa5nzad45Q0P6F6a0Zev/5E9fzGJDpMJNe7zkbAn+/wnsXXod0+O5J
 MNgelZlBjD4vjA24HNDDuDcNY/at3YY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-1LajpGjAMdiwzXkAFbe32g-1; Sat, 04 Feb 2023 02:21:21 -0500
X-MC-Unique: 1LajpGjAMdiwzXkAFbe32g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 226201C05144;
 Sat,  4 Feb 2023 07:21:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1BF04010E36;
 Sat,  4 Feb 2023 07:21:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA73C21E6A20; Sat,  4 Feb 2023 08:21:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL v2 04/35] monitor: Drop unnecessary includes
Date: Sat,  4 Feb 2023 08:21:19 +0100
Message-Id: <20230204072119.3073872-2-armbru@redhat.com>
In-Reply-To: <20230204072119.3073872-1-armbru@redhat.com>
References: <20230204072119.3073872-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-2-armbru@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 monitor/hmp-cmds.c         |  4 ----
 monitor/hmp.c              |  2 --
 monitor/misc.c             | 14 ++------------
 monitor/qmp-cmds-control.c |  1 -
 monitor/qmp-cmds.c         |  8 --------
 5 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 1dba973092..de1a96d48c 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -18,17 +18,14 @@
 #include "net/net.h"
 #include "net/eth.h"
 #include "chardev/char.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/runstate.h"
 #include "qemu/config-file.h"
 #include "qemu/option.h"
-#include "qemu/timer.h"
 #include "qemu/sockets.h"
 #include "qemu/help_option.h"
 #include "monitor/monitor.h"
 #include "qapi/error.h"
 #include "qapi/clone-visitor.h"
-#include "qapi/opts-visitor.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
@@ -42,7 +39,6 @@
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-virtio.h"
-#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 43fd69f984..e5d914b1f5 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -27,7 +27,6 @@
 #include "hw/qdev-core.h"
 #include "monitor-internal.h"
 #include "monitor/hmp.h"
-#include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qnum.h"
 #include "qemu/config-file.h"
@@ -37,7 +36,6 @@
 #include "qemu/option.h"
 #include "qemu/units.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/runstate.h"
 #include "trace.h"
 
 static void monitor_command_cb(void *opaque, const char *cmdline,
diff --git a/monitor/misc.c b/monitor/misc.c
index 053af4045e..6fc8bfef13 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -25,27 +25,20 @@
 #include "qemu/osdep.h"
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
-#include "hw/pci/pci.h"
-#include "sysemu/watchdog.h"
 #include "exec/gdbstub.h"
 #include "net/net.h"
 #include "net/slirp.h"
 #include "ui/qemu-spice.h"
-#include "qemu/config-file.h"
 #include "qemu/ctype.h"
 #include "audio/audio.h"
 #include "disas/disas.h"
-#include "qemu/timer.h"
 #include "qemu/log.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "authz/list.h"
-#include "qapi/util.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/device_tree.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
-#include "qapi/qmp/qstring.h"
 #include "qom/object_interfaces.h"
 #include "trace/control.h"
 #include "monitor/hmp-target.h"
@@ -53,10 +46,8 @@
 #ifdef CONFIG_TRACE_SIMPLE
 #include "trace/simple.h"
 #endif
-#include "exec/memory.h"
-#include "exec/exec-all.h"
-#include "qemu/option.h"
-#include "qemu/thread.h"
+#include "exec/address-spaces.h"
+#include "exec/ioport.h"
 #include "block/qapi.h"
 #include "block/block-hmp-cmds.h"
 #include "qapi/qapi-commands-char.h"
@@ -69,7 +60,6 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
-#include "qapi/qmp-event.h"
 #include "qemu/cutils.h"
 
 #if defined(TARGET_S390X)
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index 6e581713a3..f21506efa5 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -30,7 +30,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-introspect.h"
-#include "qapi/qapi-emit-events.h"
 #include "qapi/qapi-introspect.h"
 #include "qapi/qapi-visit-introspect.h"
 #include "qapi/qobject-input-visitor.h"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index bf22a8c5a6..743849c0b5 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -14,29 +14,21 @@
  */
 
 #include "qemu/osdep.h"
-#include "block/blockjob.h"
-#include "qemu/cutils.h"
-#include "qemu/option.h"
 #include "monitor/monitor.h"
 #include "monitor/qmp-helpers.h"
 #include "sysemu/sysemu.h"
-#include "qemu/config-file.h"
-#include "qemu/uuid.h"
 #include "chardev/char.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
-#include "sysemu/blockdev.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-acpi.h"
-#include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/type-helpers.h"
-#include "exec/ramlist.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
-- 
2.39.0


