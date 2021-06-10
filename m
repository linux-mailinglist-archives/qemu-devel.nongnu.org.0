Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EF3A24D4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:55:17 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEay-0006Lf-GJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESn-0008I6-8b
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESk-0005Y1-Ar
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dVHGUrDmml8HUud+bRTuXjOS6AbsjG7OqruqOvXxLA=;
 b=YuTmH01Z9JCLINqt4JGkuBSNw9o8grMeJExGYYxNTPIeAaeEbAK1EumA5aQt5IUhtMMchA
 eIiF97ayTRTWVduzB3A21RHoNQPd7HUsK4jOZ70ePx64EbJ1KMWvPVE9PvXQrtYf4C94xI
 YV3BVLVX3phhChEeoanLpB1QsFkP0PQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-h2NYlRoSM--DMY9fOPd09Q-1; Thu, 10 Jun 2021 02:46:43 -0400
X-MC-Unique: h2NYlRoSM--DMY9fOPd09Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so425450wrq.10
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dVHGUrDmml8HUud+bRTuXjOS6AbsjG7OqruqOvXxLA=;
 b=F+w9r1Hq5S6Xs3jZI1JqKZWodpIV6ToCytBRE33TQ3OMavgUNfmnyy3rIryBr+2mSG
 KoEbxTR38Xg/Ded0Y91/ErtNyWan2NF0PMKBXxbjVjVqHaS+cUwBNsGeHnMSnaQK08+y
 lob5JsbiZr3UjTsbqMiiGWc6ium1sRlLohanCCWyi/imTK5EJBqCS3D/I2UE3G5yUTHV
 tsOm4jXUzt+J/L5rFAne9jQT9lJYSbflu2usGsP/MQRFI0wAb3s2dtKXJTKww7rD86cC
 fO/j0wfdB1oANk98+vV4eB5mBOqP67BfJmOe4KuGeW6QvmNDk5eYQaZGyUD9tO9AmxjH
 F/tA==
X-Gm-Message-State: AOAM5303/+Biv3rv4bxp581NIC062e1l3Etb2Zv72vB6DL+tOyljYOJU
 ZCL7xc8sol3kMe1J/7aIZIY19NsgXWXNAPetCKt1b0Skb1e98RsEJ6nb39BA89EXla2oX53aCvz
 4Jh897fo5jAEHJgQwXFrRfvTCigb9rFzlWQlgxuD4qMddlXYCPz7hsnFRYAULGc03
X-Received: by 2002:a05:600c:5112:: with SMTP id
 o18mr3244271wms.15.1623307602263; 
 Wed, 09 Jun 2021 23:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3lYL97rKIpPn8OrukcXxgeN2hegkXzMDV7tnIlcGGlFmAze2J7KUSbNCYzgsmohTVtaA40A==
X-Received: by 2002:a05:600c:5112:: with SMTP id
 o18mr3244249wms.15.1623307602019; 
 Wed, 09 Jun 2021 23:46:42 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id u7sm2717164wrt.18.2021.06.09.23.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] target/i386/monitor: Move SEV specific commands to sev.c
Date: Thu, 10 Jun 2021 08:45:55 +0200
Message-Id: <20210610064556.1421620-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having the HMP/QMP commands defined in monitor.c makes the stubs
rather complicated when SEV is not built in. To simplify, move the
SEV functions to sev.c, and remove a layer of stubs.

Also make it clearer when SEV is not built in, so developers don't
try to enable it when it is not enablable:

 - before:

  (qemu) info sev
  SEV is not enabled

- after:

  (qemu) info sev
  SEV is not available in this QEMU

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/monitor.c         | 96 ----------------------------------
 target/i386/sev-sysemu-stub.c | 29 +++++++----
 target/i386/sev.c             | 97 +++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+), 106 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index c83cca80dc2..af3501095e5 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,11 +28,8 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
@@ -675,96 +672,3 @@ void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "This command is obsolete and will be "
                    "removed soon. Please use 'info pic' instead.\n");
 }
-
-SevInfo *qmp_query_sev(Error **errp)
-{
-    SevInfo *info;
-
-    info = sev_get_info();
-    if (!info) {
-        error_setg(errp, "SEV feature is not available");
-        return NULL;
-    }
-
-    return info;
-}
-
-void hmp_info_sev(Monitor *mon, const QDict *qdict)
-{
-    SevInfo *info = sev_get_info();
-
-    if (info && info->enabled) {
-        monitor_printf(mon, "handle: %d\n", info->handle);
-        monitor_printf(mon, "state: %s\n", SevState_str(info->state));
-        monitor_printf(mon, "build: %d\n", info->build_id);
-        monitor_printf(mon, "api version: %d.%d\n",
-                       info->api_major, info->api_minor);
-        monitor_printf(mon, "debug: %s\n",
-                       info->policy & SEV_POLICY_NODBG ? "off" : "on");
-        monitor_printf(mon, "key-sharing: %s\n",
-                       info->policy & SEV_POLICY_NOKS ? "off" : "on");
-    } else {
-        monitor_printf(mon, "SEV is not enabled\n");
-    }
-
-    qapi_free_SevInfo(info);
-}
-
-SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
-{
-    char *data;
-    SevLaunchMeasureInfo *info;
-
-    data = sev_get_launch_measurement();
-    if (!data) {
-        error_setg(errp, "Measurement is not available");
-        return NULL;
-    }
-
-    info = g_malloc0(sizeof(*info));
-    info->data = data;
-
-    return info;
-}
-
-SevCapability *qmp_query_sev_capabilities(Error **errp)
-{
-    return sev_get_capabilities(errp);
-}
-
-#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
-struct sev_secret_area {
-    uint32_t base;
-    uint32_t size;
-};
-
-void qmp_sev_inject_launch_secret(const char *packet_hdr,
-                                  const char *secret,
-                                  bool has_gpa, uint64_t gpa,
-                                  Error **errp)
-{
-    if (!sev_enabled()) {
-        error_setg(errp, QERR_UNSUPPORTED);
-        return;
-    }
-    if (!has_gpa) {
-        uint8_t *data;
-        struct sev_secret_area *area;
-
-        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
-            error_setg(errp, "SEV: no secret area found in OVMF,"
-                       " gpa must be specified.");
-            return;
-        }
-        area = (struct sev_secret_area *)data;
-        gpa = area->base;
-    }
-
-    sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
-}
-
-SevAttestationReport *
-qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
-{
-    return sev_get_attestation_report(mnonce, errp);
-}
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index d556b4f091f..7a35f0432b2 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -12,30 +12,35 @@
  */
 
 #include "qemu/osdep.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
 #include "sev_i386.h"
 
-SevInfo *sev_get_info(void)
+SevInfo *qmp_query_sev(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
-char *sev_get_launch_measurement(void)
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
-SevCapability *sev_get_capabilities(Error **errp)
+SevCapability *qmp_query_sev_capabilities(Error **errp)
 {
-    error_setg(errp, "SEV is not available in this QEMU");
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
-int sev_inject_launch_secret(const char *hdr, const char *secret,
-                             uint64_t gpa, Error **errp)
+void qmp_sev_inject_launch_secret(const char *packet_header, const char *secret,
+                                  bool has_gpa, uint64_t gpa, Error **errp)
 {
-    return 1;
+    error_setg(errp, QERR_UNSUPPORTED);
 }
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
@@ -52,9 +57,13 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
     g_assert_not_reached();
 }
 
-SevAttestationReport *sev_get_attestation_report(const char *mnonce,
-                                                 Error **errp)
+SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
 {
-    error_setg(errp, "SEV is not available in this QEMU");
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
+
+void hmp_info_sev(Monitor *mon, const QDict *qdict)
+{
+    monitor_printf(mon, "SEV is not available in this QEMU\n");
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 791804954e9..b4d7c41d3fb 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -27,10 +27,14 @@
 #include "sev_i386.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
+#include "sysemu/sev.h"
 #include "trace.h"
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
+#include "monitor/hmp.h"
+#include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/i386/pc.h"
 
@@ -1070,3 +1074,96 @@ sev_register_types(void)
 }
 
 type_init(sev_register_types);
+
+SevInfo *qmp_query_sev(Error **errp)
+{
+    SevInfo *info;
+
+    info = sev_get_info();
+    if (!info) {
+        error_setg(errp, "SEV feature is not available");
+        return NULL;
+    }
+
+    return info;
+}
+
+void hmp_info_sev(Monitor *mon, const QDict *qdict)
+{
+    SevInfo *info = sev_get_info();
+
+    if (info && info->enabled) {
+        monitor_printf(mon, "handle: %d\n", info->handle);
+        monitor_printf(mon, "state: %s\n", SevState_str(info->state));
+        monitor_printf(mon, "build: %d\n", info->build_id);
+        monitor_printf(mon, "api version: %d.%d\n",
+                       info->api_major, info->api_minor);
+        monitor_printf(mon, "debug: %s\n",
+                       info->policy & SEV_POLICY_NODBG ? "off" : "on");
+        monitor_printf(mon, "key-sharing: %s\n",
+                       info->policy & SEV_POLICY_NOKS ? "off" : "on");
+    } else {
+        monitor_printf(mon, "SEV is not enabled\n");
+    }
+
+    qapi_free_SevInfo(info);
+}
+
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
+{
+    char *data;
+    SevLaunchMeasureInfo *info;
+
+    data = sev_get_launch_measurement();
+    if (!data) {
+        error_setg(errp, "Measurement is not available");
+        return NULL;
+    }
+
+    info = g_malloc0(sizeof(*info));
+    info->data = data;
+
+    return info;
+}
+
+SevCapability *qmp_query_sev_capabilities(Error **errp)
+{
+    return sev_get_capabilities(errp);
+}
+
+#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
+struct sev_secret_area {
+    uint32_t base;
+    uint32_t size;
+};
+
+void qmp_sev_inject_launch_secret(const char *packet_hdr,
+                                  const char *secret,
+                                  bool has_gpa, uint64_t gpa,
+                                  Error **errp)
+{
+    if (!sev_enabled()) {
+        error_setg(errp, QERR_UNSUPPORTED);
+        return;
+    }
+    if (!has_gpa) {
+        uint8_t *data;
+        struct sev_secret_area *area;
+
+        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
+            error_setg(errp, "SEV: no secret area found in OVMF,"
+                       " gpa must be specified.");
+            return;
+        }
+        area = (struct sev_secret_area *)data;
+        gpa = area->base;
+    }
+
+    sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
+}
+
+SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
+                                                       Error **errp)
+{
+    return sev_get_attestation_report(mnonce, errp);
+}
-- 
2.31.1


