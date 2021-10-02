Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57041FC2C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:19:21 +0200 (CEST)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWevA-00048L-HF
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXN-0002ID-Hh
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXL-0000za-Iq
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmeHSaAJmvIQWkoqQvBbbph1YlHUwqkxNB0lhULs12o=;
 b=f9d9n+474myHbdMtMa4nwz4md0QpUXCxUGHaOVPuetXc6otKxKt/bYHNlTXRJ8qqsTXPLk
 frvg51/TBkyn1j7BSEIOo882wBAZXObDAY8BpmUOyDdKp3k5QjpsNTKh633KyY5MYy7uRa
 My/uC0YdLsU0DYosPX1CvSrXPu44QG4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-2QSrX-FxNlqO4k0qYi0Wcw-1; Sat, 02 Oct 2021 08:54:42 -0400
X-MC-Unique: 2QSrX-FxNlqO4k0qYi0Wcw-1
Received: by mail-wm1-f72.google.com with SMTP id
 y142-20020a1c7d94000000b0030cdc76dedeso7349152wmc.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zmeHSaAJmvIQWkoqQvBbbph1YlHUwqkxNB0lhULs12o=;
 b=Aa2nvQPOIxStZOMbH+gLD/tQ9sZRMdbHlmpSt3PyMPED+Nbr2jsPw1nuD+GKk5a6HY
 Gh1Efm5TE/zzr1UJiQBs1VGw+UQyDys8A2QDRM8inY+gosEP1QWMah0iKMmBFawoB18I
 6fwK49PWlZuyIGcVVEsEjuYBbrvTSrWOncnB0Z5xPte30OZg7e77MCzdM3+dgK3qbZqX
 IJ9cPK62Jls3JRLhyPlbsMQdW/Hpu/3R3BDUttBkK5gkf0DSHvrKFuL8K9RBSndGoyN5
 0uzzJv5l3GzWhnb2BH4Bs/IKw/UpmpLIiRVpO8bnzZq3ISMuswkYczoLfbYlRAG9GYsN
 /Kdg==
X-Gm-Message-State: AOAM531FKFUnHOy89YRnVkWlDZ0qeQ+dcSZcgw7ywXopju+aVeUBfFmi
 +qW/sdHu0C21YXM8vIsnM8P5NSeZhVWEZLMKEqZyrH7gpln2nGBK3jO2gudS4H+BGF7nchxiESo
 pVUwr84POvxYjpWbX1o/V1h5c04lQ5Yqld6YT9PladqApVB1S7ZF46WWOkCuwwnWT
X-Received: by 2002:a1c:7302:: with SMTP id d2mr9391316wmb.92.1633179280687;
 Sat, 02 Oct 2021 05:54:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgPMBEpdCmd98sav+qHs899wgnlAFISSby1vK2IYSyDBW7M/2t9a3jNO0u1D6NgduWenHWdg==
X-Received: by 2002:a1c:7302:: with SMTP id d2mr9391291wmb.92.1633179280396;
 Sat, 02 Oct 2021 05:54:40 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 m29sm8762685wrb.89.2021.10.02.05.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/22] target/i386/sev: Move qmp_query_sev() &
 hmp_info_sev() to sev.c
Date: Sat,  2 Oct 2021 14:53:13 +0200
Message-Id: <20211002125317.3418648-19-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev() & hmp_info_sev()() from monitor.c to sev.c
and make sev_get_info() static. We don't need the stub anymore,
remove it. Add a stub for hmp_info_sev().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h        |  3 ---
 target/i386/monitor.c         | 38 +---------------------------------
 target/i386/sev-sysemu-stub.c | 10 ++++++++-
 target/i386/sev.c             | 39 +++++++++++++++++++++++++++++++++--
 4 files changed, 47 insertions(+), 43 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 1699376ad87..15a959d6174 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -15,7 +15,6 @@
 #define QEMU_SEV_I386_H
 
 #include "sysemu/sev.h"
-#include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
 #define SEV_POLICY_NOKS         0x2
@@ -24,8 +23,6 @@
 #define SEV_POLICY_DOMAIN       0x10
 #define SEV_POLICY_SEV          0x20
 
-extern SevInfo *sev_get_info(void);
-
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
                              uint64_t gpa, Error **errp);
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 0b38e970c73..890870b252d 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,11 +28,9 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qerror.h"
+//#include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
@@ -677,40 +675,6 @@ void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
                    "removed soon. Please use 'info pic' instead.\n");
 }
 
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
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 355391c16c4..1836b32e4fc 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -12,13 +12,16 @@
  */
 
 #include "qemu/osdep.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
 #include "sev_i386.h"
 
-SevInfo *sev_get_info(void)
+SevInfo *qmp_query_sev(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
@@ -60,3 +63,8 @@ SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
     error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
+
+void hmp_info_sev(Monitor *mon, const QDict *qdict)
+{
+    monitor_printf(mon, "SEV is not available in this QEMU\n");
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 8e9cce62196..7caaa117ff7 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -27,10 +27,12 @@
 #include "sev_i386.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
+#include "sysemu/sev.h"
 #include "trace.h"
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
@@ -375,8 +377,7 @@ sev_get_reduced_phys_bits(void)
     return sev_guest ? sev_guest->reduced_phys_bits : 0;
 }
 
-SevInfo *
-sev_get_info(void)
+static SevInfo *sev_get_info(void)
 {
     SevInfo *info;
 
@@ -395,6 +396,40 @@ sev_get_info(void)
     return info;
 }
 
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
 static int
 sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
                  size_t *cert_chain_len, Error **errp)
-- 
2.31.1


