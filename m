Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F4058403A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:44:11 +0200 (CEST)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3o9-00029F-EH
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH3fj-0002Il-IE
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH3fh-0003j1-Ur
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14UIYfB2/OMbLxm+bBhZLUWmXdhqp/2ElI7ee4AQpyY=;
 b=FmrEot67G96J2HHLFKhkBIK5Y9rZXFVmlZMeDLuYVj0fxxVmTFhvJYBby71VvZRymE7wgT
 dMcMwFj6a793ySv3Q5aXeE1DRBz+tQSE3Bg/GS3XpaZtAHNegm1jDEd1RcEDf2wd0jsMVw
 pFJlEqu9O8XLJUOWqBJc08mwWCvsNhU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-6jJF2AHVMlGr-yPT8SMIoA-1; Thu, 28 Jul 2022 09:35:23 -0400
X-MC-Unique: 6jJF2AHVMlGr-yPT8SMIoA-1
Received: by mail-qt1-f200.google.com with SMTP id
 u2-20020ac80502000000b002f94701339eso1024519qtg.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=14UIYfB2/OMbLxm+bBhZLUWmXdhqp/2ElI7ee4AQpyY=;
 b=QfQsLV84MoyvwN8N8/udXOzJV8XA+sIpPyj+QH9xGL0AxJ3QRzlmEABwpQB7Qw+JZK
 o+lRIomZmTvyRXkiESftpMTm2neIwYu1esGL3qz1afSAyKLD6WI4VX8AhVnauNjtml9I
 efxvwRaHy7nuZCX9gm3cHBFL+D1L4YYef6ygGtbEqDgrd07hoc9g7KampeTgx2G9bYeu
 9ouoG8cnFRv+U7azoUUz+W+PqeC/10kFDq2IXB+zpGdgtN+DxNivjEJgz0zGTxxcAAEc
 VWUlApu1bw+w7FMLfxQn8/bXAUxPhoeC8HwQzw2JXaEQlnW1eVCX210XZnv7jv06x9zX
 rpSA==
X-Gm-Message-State: AJIora+T0i6XmniBYoowKg35OLgFgPR9goJGkiuqAFlghTJDN2Rdk7H4
 XQxXvIwHwtKFtzykHnnZnuFAbzWLtfrriZW/Ox+iA2yxq7qtXYnh9umfGr/Axfss7hC8+LeJTqB
 m21mQJiB8Tin78O/wgRpeaoTnOYQCiofNvjv5LOcTrxF+I0ZDND6tq+tkYKwFN0cV
X-Received: by 2002:a05:622a:155:b0:31e:e331:71cc with SMTP id
 v21-20020a05622a015500b0031ee33171ccmr22667703qtw.254.1659015322073; 
 Thu, 28 Jul 2022 06:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhQwELOGNSFAIkBe7mIypXUVjcILKXOeyFgTbitvTHfme0PyWoUcO4dsy2OCsPG2WYbKZDkQ==
X-Received: by 2002:a05:622a:155:b0:31e:e331:71cc with SMTP id
 v21-20020a05622a015500b0031ee33171ccmr22667672qtw.254.1659015321749; 
 Thu, 28 Jul 2022 06:35:21 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05620a448a00b006b618e006ffsm553876qkp.2.2022.07.28.06.35.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Jul 2022 06:35:21 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 2/2] migration-test: Allow test to run without uffd
Date: Thu, 28 Jul 2022 09:35:16 -0400
Message-Id: <20220728133516.92061-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220728133516.92061-1-peterx@redhat.com>
References: <20220728133516.92061-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We used to stop running all tests if uffd is not detected.  However
logically that's only needed for postcopy not the rest of tests.

Keep running the rest when still possible.

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 48 +++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index c1e002087d..10ab7a708c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2424,14 +2424,11 @@ int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
+    const bool has_uffd = ufd_version_check();
     int ret;
 
     g_test_init(&argc, &argv, NULL);
 
-    if (!ufd_version_check()) {
-        return g_test_run();
-    }
-
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
@@ -2460,13 +2457,15 @@ int main(int argc, char **argv)
 
     module_call_init(MODULE_INIT_QOM);
 
-    qtest_add_func("/migration/postcopy/unix", test_postcopy);
-    qtest_add_func("/migration/postcopy/plain", test_postcopy);
-    qtest_add_func("/migration/postcopy/recovery/plain",
-                   test_postcopy_recovery);
-    qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
-    qtest_add_func("/migration/postcopy/preempt/recovery/plain",
-                    test_postcopy_preempt_recovery);
+    if (has_uffd) {
+        qtest_add_func("/migration/postcopy/unix", test_postcopy);
+        qtest_add_func("/migration/postcopy/plain", test_postcopy);
+        qtest_add_func("/migration/postcopy/recovery/plain",
+                       test_postcopy_recovery);
+        qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
+        qtest_add_func("/migration/postcopy/preempt/recovery/plain",
+                       test_postcopy_preempt_recovery);
+    }
 
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
@@ -2474,18 +2473,21 @@ int main(int argc, char **argv)
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
-    /*
-     * NOTE: psk test is enough for postcopy, as other types of TLS
-     * channels are tested under precopy.  Here what we want to test is the
-     * general postcopy path that has TLS channel enabled.
-     */
-    qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
-    qtest_add_func("/migration/postcopy/recovery/tls/psk",
-                   test_postcopy_recovery_tls_psk);
-    qtest_add_func("/migration/postcopy/preempt/tls/psk",
-                   test_postcopy_preempt_tls_psk);
-    qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
-                   test_postcopy_preempt_all);
+
+    if (has_uffd) {
+        /*
+         * NOTE: psk test is enough for postcopy, as other types of TLS
+         * channels are tested under precopy.  Here what we want to test is the
+         * general postcopy path that has TLS channel enabled.
+         */
+        qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
+        qtest_add_func("/migration/postcopy/recovery/tls/psk",
+                       test_postcopy_recovery_tls_psk);
+        qtest_add_func("/migration/postcopy/preempt/tls/psk",
+                       test_postcopy_preempt_tls_psk);
+        qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
+                       test_postcopy_preempt_all);
+    }
 #ifdef CONFIG_TASN1
     qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
                    test_precopy_unix_tls_x509_default_host);
-- 
2.32.0


