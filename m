Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C1C687060
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:12:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKNt-00077b-Uy; Wed, 01 Feb 2023 16:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNKNr-00076q-At
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:11:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNKNn-0003MA-LN
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKR76Zr2g1akCZyDSLQtn29eOmcOA4X4KkcFgLEjRlc=;
 b=YeUuyRtRH/b0CTu+Jk15OoMKemiptxl258ClfIf+rEH1mayYogK8qMHOZZIeWwiYuUtEpN
 CYoN5VDCcVJICWPGeu/qVmVc8ft02vlDllkdRfPhWGAqp3lASGevauZZlucnM4CLbUdmD1
 PwoSC7yPD1r+VKwwxvNvBqE77TLlkFs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-8jvXvBFYPSCzDaET8Ts8FA-1; Wed, 01 Feb 2023 16:11:06 -0500
X-MC-Unique: 8jvXvBFYPSCzDaET8Ts8FA-1
Received: by mail-qt1-f197.google.com with SMTP id
 l3-20020a05622a174300b003b9b6101f65so2575052qtk.11
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 13:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SKR76Zr2g1akCZyDSLQtn29eOmcOA4X4KkcFgLEjRlc=;
 b=VoWl+4+FQTEK4iithRiWL9JZpcoaWo+egokkB9Ra7mT1x9FwuOQtSnsNDd+idI6Rlk
 mp7XMUr3uF6iH0swnLNvpnsF1sfcBYjkSX0oAF78iq8k4qatNqkzJrjpxNQrCcFKRsOx
 2r1pIxEvOdYUovgzuFs+fOHk9R7zdsjxsgkP9NBirfjf423Uo+5DQC802c9R4cQPF/ol
 MKw/fVZhpNY7JGKNpkwPeTO5vAUGi+Vk6+9FGySZxxd2ni5jtTcPFPbYjh/DYdnkQkw7
 7lkVxPdmfQD0Zi8Q+fKGnQ9mQkbJZggu8GtVl/1zwrj4VEh9ZMPPv/dVeXJG/EW1K2KS
 V1Cg==
X-Gm-Message-State: AO0yUKWxMe9esnwohzyTE7czDxYvrHBP18uX9QRQP40jj5M0tnq6ebB3
 +u4xS7fsCXIlW6Ok+UeSTH02Xo9Qk+nIC8d4RJl/gRRX6CzCIJ+LZScGfT+P99EH8DrFHUNw4RJ
 nYH6Ohzc0UsiIkgyP1zcVjxyCLEghDHXOYmmE+CW2A+ByjiZmNuDrjhfW8Iii3PJx
X-Received: by 2002:a05:622a:41c3:b0:3b8:36f8:830e with SMTP id
 ce3-20020a05622a41c300b003b836f8830emr5229872qtb.6.1675285864869; 
 Wed, 01 Feb 2023 13:11:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8Fl9mXjpYFhB8uiN6VCqoEgFDProc9/ZO6ZAVlP7IjuRi2/+B77l6Y/bvBg55mN/uqZbLW+A==
X-Received: by 2002:a05:622a:41c3:b0:3b8:36f8:830e with SMTP id
 ce3-20020a05622a41c300b003b836f8830emr5229837qtb.6.1675285864484; 
 Wed, 01 Feb 2023 13:11:04 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 ea17-20020a05620a489100b007204305dee4sm6331403qkb.19.2023.02.01.13.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 13:11:02 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peterx@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 2/3] util/userfaultfd: Add uffd_open()
Date: Wed,  1 Feb 2023 16:10:54 -0500
Message-Id: <20230201211055.649442-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230201211055.649442-1-peterx@redhat.com>
References: <20230201211055.649442-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Add a helper to create the uffd handle.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/userfaultfd.h   |  8 ++++++++
 migration/postcopy-ram.c     | 11 +++++------
 tests/qtest/migration-test.c |  3 ++-
 util/userfaultfd.c           | 13 +++++++++++--
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
index 6b74f92792..2101115f70 100644
--- a/include/qemu/userfaultfd.h
+++ b/include/qemu/userfaultfd.h
@@ -17,6 +17,14 @@
 #include "exec/hwaddr.h"
 #include <linux/userfaultfd.h>
 
+/**
+ * uffd_open(): Open an userfaultfd handle for current context.
+ *
+ * @flags: The flags we want to pass in when creating the handle.
+ *
+ * Returns: the uffd handle if >=0, or <0 if error happens.
+ */
+int uffd_open(int flags);
 int uffd_query_features(uint64_t *features);
 int uffd_create_fd(uint64_t features, bool non_blocking);
 void uffd_close_fd(int uffd_fd);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..0c55df0e52 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -37,6 +37,7 @@
 #include "qemu-file.h"
 #include "yank_functions.h"
 #include "tls.h"
+#include "qemu/userfaultfd.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -226,11 +227,9 @@ static bool receive_ufd_features(uint64_t *features)
     int ufd;
     bool ret = true;
 
-    /* if we are here __NR_userfaultfd should exists */
-    ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    ufd = uffd_open(O_CLOEXEC);
     if (ufd == -1) {
-        error_report("%s: syscall __NR_userfaultfd failed: %s", __func__,
-                     strerror(errno));
+        error_report("%s: uffd_open() failed: %s", __func__, strerror(errno));
         return false;
     }
 
@@ -375,7 +374,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
         goto out;
     }
 
-    ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    ufd = uffd_open(O_CLOEXEC);
     if (ufd == -1) {
         error_report("%s: userfaultfd not available: %s", __func__,
                      strerror(errno));
@@ -1160,7 +1159,7 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     /* Open the fd for the kernel to give us userfaults */
-    mis->userfault_fd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+    mis->userfault_fd = uffd_open(O_CLOEXEC | O_NONBLOCK);
     if (mis->userfault_fd == -1) {
         error_report("%s: Failed to open userfault fd: %s", __func__,
                      strerror(errno));
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1dd32c9506..7a5d1922dd 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -62,13 +62,14 @@ static bool uffd_feature_thread_id;
 #include <sys/eventfd.h>
 #include <sys/ioctl.h>
 #include <linux/userfaultfd.h>
+#include "qemu/userfaultfd.h"
 
 static bool ufd_version_check(void)
 {
     struct uffdio_api api_struct;
     uint64_t ioctl_mask;
 
-    int ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    int ufd = uffd_open(O_CLOEXEC);
 
     if (ufd == -1) {
         g_test_message("Skipping test: userfaultfd not available");
diff --git a/util/userfaultfd.c b/util/userfaultfd.c
index f1cd6af2b1..9845a2ec81 100644
--- a/util/userfaultfd.c
+++ b/util/userfaultfd.c
@@ -19,6 +19,15 @@
 #include <sys/syscall.h>
 #include <sys/ioctl.h>
 
+int uffd_open(int flags)
+{
+#if defined(__linux__) && defined(__NR_userfaultfd)
+    return syscall(__NR_userfaultfd, flags);
+#else
+    return -EINVAL;
+#endif
+}
+
 /**
  * uffd_query_features: query UFFD features
  *
@@ -32,7 +41,7 @@ int uffd_query_features(uint64_t *features)
     struct uffdio_api api_struct = { 0 };
     int ret = -1;
 
-    uffd_fd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    uffd_fd = uffd_open(O_CLOEXEC);
     if (uffd_fd < 0) {
         trace_uffd_query_features_nosys(errno);
         return -1;
@@ -69,7 +78,7 @@ int uffd_create_fd(uint64_t features, bool non_blocking)
     uint64_t ioctl_mask = BIT(_UFFDIO_REGISTER) | BIT(_UFFDIO_UNREGISTER);
 
     flags = O_CLOEXEC | (non_blocking ? O_NONBLOCK : 0);
-    uffd_fd = syscall(__NR_userfaultfd, flags);
+    uffd_fd = uffd_open(flags);
     if (uffd_fd < 0) {
         trace_uffd_create_fd_nosys(errno);
         return -1;
-- 
2.37.3


