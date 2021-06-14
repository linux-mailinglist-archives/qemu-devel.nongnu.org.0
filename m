Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F683A6FF8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:15:03 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssz8-0002Xi-OY
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuN-0001t0-86
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuL-0002zh-Fo
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hIM4nZ+edtMSEGqYdtBltxWEdrhiKauaGSD/ANl7HE=;
 b=gJhfkASrvedP/Vvw+LZZDhn/V2UkLAyMQ9R6ZZf4x/YV+d0DWedrqSULFq7vpHBS5ivjuh
 mUR3WVDaAk4lHrs35zdMxdCS4UdpVdeR0RjOGCv+x8l4GQ7tB8Y4Zw3MEIyDB5WPFCEygw
 53Jz/DUlWZgtrAgiKpc1mzKMm5YJnUA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-pFWUcieSO_evQkn3roirbA-1; Mon, 14 Jun 2021 16:10:01 -0400
X-MC-Unique: pFWUcieSO_evQkn3roirbA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so437008wmq.7
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hIM4nZ+edtMSEGqYdtBltxWEdrhiKauaGSD/ANl7HE=;
 b=sVlY7xtNSjP4adc+HzwfAHDTDMQFwwTpfcuUOcobqlUwA/2UXon/+Ul+J0n5lQYaa1
 lMT6QFtQ4fucGQGhceWQOFOJUgMd7PgesJA5cg35CEmKsPdYL7vMeq/j8qYyC/Xov0O1
 O5xGBr341NTpNp4RMb9jvEB773dRdyOdb2uaUs3ED6bkis8bc32D+j8nNC1hZPMSRw6j
 ddRnsjBtMDoEP5C3PqTWzJqmw2A3wo3WmVzz3bNiUn8DqGxyM109hGoFclTJtNmPqmmS
 5JT2+fHrEG0wl/BOe2zvc8527M84x5xhOTcJqCYDVA4hpjB/cIagGUc4UTD3rgU0ulvF
 TqqQ==
X-Gm-Message-State: AOAM533RvZkrWdiwrkx2oAKxHuDu1F05Of+F7dNPHJVbID4EHksjrpqM
 GVZHdABBLAniNU0scPOd134n5DWYy1ZMOwyuOKmBL7ExABUjDsczYKQRf5lbyi+IlubLWKwQscW
 /8XXI/yBr7X1R8no6Ym8BOAjvNXP9DTzwNpKDDmiujABvbZ+xMvDe36oU4WaUPvl4
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr908285wmi.9.1623701400340;
 Mon, 14 Jun 2021 13:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaznMWFe5kkp1meQldQFacYfdH9YXNqNYunC1G3Aov7zVvcIVEXU8ceZduYpB9ckQkbChHjg==
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr908261wmi.9.1623701400118;
 Mon, 14 Jun 2021 13:10:00 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l10sm16558905wrs.11.2021.06.14.13.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:09:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] sysemu: Make TPM structures inaccessible if CONFIG_TPM
 is not defined
Date: Mon, 14 Jun 2021 22:09:39 +0200
Message-Id: <20210614200940.2056770-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614200940.2056770-1-philmd@redhat.com>
References: <20210614200940.2056770-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614191335.1968807-5-stefanb@linux.ibm.com>
[PMD: Remove tpm_init() / tpm_cleanup() stubs]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/tpm.h         |  9 +++++++++
 include/sysemu/tpm_backend.h |  6 +++++-
 stubs/tpm.c                  | 10 ----------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 1a85564e479..68b2206463c 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -15,6 +15,8 @@
 #include "qapi/qapi-types-tpm.h"
 #include "qom/object.h"
 
+#ifdef CONFIG_TPM
+
 int tpm_config_parse(QemuOptsList *opts_list, const char *optarg);
 int tpm_init(void);
 void tpm_cleanup(void);
@@ -73,4 +75,11 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
     return TPM_IF_GET_CLASS(ti)->get_version(ti);
 }
 
+#else /* CONFIG_TPM */
+
+#define tpm_init()  (0)
+#define tpm_cleanup()
+
+#endif /* CONFIG_TPM */
+
 #endif /* QEMU_TPM_H */
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index 6f078f5f482..8fd3269c117 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -18,6 +18,8 @@
 #include "sysemu/tpm.h"
 #include "qapi/error.h"
 
+#ifdef CONFIG_TPM
+
 #define TYPE_TPM_BACKEND "tpm-backend"
 OBJECT_DECLARE_TYPE(TPMBackend, TPMBackendClass,
                     TPM_BACKEND)
@@ -209,4 +211,6 @@ TPMInfo *tpm_backend_query_tpm(TPMBackend *s);
 
 TPMBackend *qemu_find_tpm_be(const char *id);
 
-#endif
+#endif /* CONFIG_TPM */
+
+#endif /* TPM_BACKEND_H */
diff --git a/stubs/tpm.c b/stubs/tpm.c
index 22014595a06..e79bd2a6c2d 100644
--- a/stubs/tpm.c
+++ b/stubs/tpm.c
@@ -7,18 +7,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-tpm.h"
-#include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 
-int tpm_init(void)
-{
-    return 0;
-}
-
-void tpm_cleanup(void)
-{
-}
-
 TPMInfoList *qmp_query_tpm(Error **errp)
 {
     return NULL;
-- 
2.31.1


