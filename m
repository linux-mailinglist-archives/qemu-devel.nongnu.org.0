Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C552B42580A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:35:13 +0200 (CEST)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWMS-0008QG-Qm
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6i-00066m-NO
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6e-0005ef-M1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXfwRbpC9Lbx4LzGOmEzDg8Z5na4+1mXZEo+IH6+b1c=;
 b=cOnzVX7EHjvcwKz7SN0sKzPNjOA/x5IP1HcZfhhmwholb0oveomU0RSh2FSUdoW4B1EPvH
 3iBGk/g5xOm2AGPdqTioLQWmuJ/Sg0oKoheNXBCDW5DCPMr9uFRgXy1AqUyazOFJxNmAtw
 udzRjiVuYGYQQk0Y84V27GGmrIaDF5U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-jpmToWxRPxKhEws2D9Ps8g-1; Thu, 07 Oct 2021 12:18:51 -0400
X-MC-Unique: jpmToWxRPxKhEws2D9Ps8g-1
Received: by mail-wr1-f69.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so5117349wrt.23
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zXfwRbpC9Lbx4LzGOmEzDg8Z5na4+1mXZEo+IH6+b1c=;
 b=SMt9W0jN/Nv0zxWgdngZeHGKFwBCROo5hHbHkdUUDX8gLQT4L3X1XffBYwYz8XiMkv
 SVKRirUEz2j0GzG9kpZNJTtMftdsbxqnAqVf6lh6/H5okiKm4L4BV/SNCgWUROmqTwe9
 NxSCB/nLfliSCIKhKX5EoFamFg0Sjp6IcZPc8AiGhm86fe6PEQM6xZnXl2VR6/qnyngp
 S8+5YMXvkYXxkYNgewzdaKfu/hpuYMQuya8fvXWbyo55z590XEVpfz02I7g6FfPeJXxz
 PPaWGJWHf0tDPyNCpa2xgYsAwmOYHpH4JIe0jHJzH0KSGiUWmQ6kIbjF7eGrfdJv1G34
 sNlw==
X-Gm-Message-State: AOAM5337ntQkHINVoYb+TaGhV43F57E3rA24uj5Czv7yIrhnGlC5HAB6
 E0INTleS0lkksm7AigRxQm5aFNmL1eAXVQxDYRcoBhZZvRM7XPAXE7NY04b1rPQ9XBbO1kPwgec
 t3v1tkSvXj9uGR4FbJUP1TqKvZ45JCU65oXxUYqpiI3oCxkENhSU8sZzsVi/F/sT5
X-Received: by 2002:a05:6000:15c9:: with SMTP id
 y9mr4937138wry.361.1633623529631; 
 Thu, 07 Oct 2021 09:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVZkZLJExUdIkU8eUXntS+EbMqWJ8pnYgvB7GErpwpgWp6MdaxC3o/caLpYVSADf5LX9m6nw==
X-Received: by 2002:a05:6000:15c9:: with SMTP id
 y9mr4937095wry.361.1633623529405; 
 Thu, 07 Oct 2021 09:18:49 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w1sm60022wre.79.2021.10.07.09.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/23] target/i386/sev: Move qmp_query_sev_launch_measure()
 to sev.c
Date: Thu,  7 Oct 2021 18:17:13 +0200
Message-Id: <20211007161716.453984-21-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev_launch_measure() from monitor.c to sev.c
and make sev_get_launch_measurement() static. We don't need the
stub anymore, remove it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.h             |  1 -
 target/i386/monitor.c         | 17 -----------------
 target/i386/sev-sysemu-stub.c |  3 ++-
 target/i386/sev.c             | 20 ++++++++++++++++++--
 4 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/target/i386/sev.h b/target/i386/sev.h
index b70b7b56cb8..dda350779f9 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -50,7 +50,6 @@ bool sev_es_enabled(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
-extern char *sev_get_launch_measurement(void);
 extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 4c017b59b3a..bd24d0d4737 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -710,23 +710,6 @@ void hmp_info_sev(Monitor *mon, const QDict *qdict)
     qapi_free_SevInfo(info);
 }
 
-SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
-{
-    char *data;
-    SevLaunchMeasureInfo *info;
-
-    data = sev_get_launch_measurement();
-    if (!data) {
-        error_setg(errp, "SEV launch measurement is not available");
-        return NULL;
-    }
-
-    info = g_malloc0(sizeof(*info));
-    info->data = data;
-
-    return info;
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 3e8cab4c144..8d97d7c7e14 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -22,8 +22,9 @@ SevInfo *sev_get_info(void)
     return NULL;
 }
 
-char *sev_get_launch_measurement(void)
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 {
+    error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 56e9e03accd..ec874b3df82 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -742,8 +742,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     trace_kvm_sev_launch_measurement(sev->measurement);
 }
 
-char *
-sev_get_launch_measurement(void)
+static char *sev_get_launch_measurement(void)
 {
     if (sev_guest &&
         sev_guest->state >= SEV_STATE_LAUNCH_SECRET) {
@@ -753,6 +752,23 @@ sev_get_launch_measurement(void)
     return NULL;
 }
 
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
+{
+    char *data;
+    SevLaunchMeasureInfo *info;
+
+    data = sev_get_launch_measurement();
+    if (!data) {
+        error_setg(errp, "SEV launch measurement is not available");
+        return NULL;
+    }
+
+    info = g_malloc0(sizeof(*info));
+    info->data = data;
+
+    return info;
+}
+
 static Notifier sev_machine_done_notify = {
     .notify = sev_launch_get_measure,
 };
-- 
2.31.1


