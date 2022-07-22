Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560857E34F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 16:59:41 +0200 (CEST)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEu7v-0002g2-PZ
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 10:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oEu5Q-0000KN-Nc
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oEu5P-0007cq-1Y
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658501822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDDlN3mM9HgDb+Z3x6nSHM5nxk54wtzlY3gz8F8WEMw=;
 b=GCmMpGHK/EC55A7jmOmlAlyKICzzETMH10RODfSqCJmbRECO881fkXgccuT331FpAnHQ/q
 8WASVJLhXUMj9xp2Sh31LUrjeU6aM+28lXlarQOynfNiDFxWjs+tJYdifOLJy5UurU7jG/
 l6EzHyoj+nblPPvN0RXCfAeMyAmKr8I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-6ENYXo81N3SijJ6xcocwug-1; Fri, 22 Jul 2022 10:57:01 -0400
X-MC-Unique: 6ENYXo81N3SijJ6xcocwug-1
Received: by mail-qt1-f199.google.com with SMTP id
 cj19-20020a05622a259300b0031f01f3933cso2972701qtb.18
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 07:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDDlN3mM9HgDb+Z3x6nSHM5nxk54wtzlY3gz8F8WEMw=;
 b=7T8rrvb/HLUEMk9MQ2VEiHzlP/180qsfc3Fzk2ZeJui9kP6A/vAK8GHkZlWsGHOdBb
 ZYd85wtu9QFYj3F+N5DEH36tUQ2rfG0+lt2sHOR6DAiDRALOI2zhpzwqQRvNW9mEhsRK
 ZqSd8mGPujjzL5e1FXUa0qc+mP3LURqab4idwGrVPjf37jB98jg1i7LSpmp7EaRVT2Kc
 1RWjqpcdqpu/4r6S6m+LYkR2liFG0/tjsGNDNIo68t76opUcIPn5ZzM75oYuzgQNmHyF
 TDx+Wkovia6avquEoiMkgtBJcrEAlXLPv+alyChXpuncwFqNHc/zNGvwBLHxpPQpFC+6
 1N4g==
X-Gm-Message-State: AJIora9KTE9d/ZIsbnzZTpa9Sxr0zGWxwoa8ET8dH7RIkSWqD2dHaHaa
 XJiC2t4tGywROxI1ZJeztU/tPeqKdAtkcXhRJfxlMMbgop9b1IXo4oZjxqSXy3nuhPANQpWb5zI
 Vwuz4umWxPiQDzqnGAEN4xmoCL3wDblKScLEMNx+leXNF8EiuPo2UlT3Y4pi/gIIZ
X-Received: by 2002:a05:620a:3709:b0:6b5:adeb:5ef0 with SMTP id
 de9-20020a05620a370900b006b5adeb5ef0mr196089qkb.307.1658501820696; 
 Fri, 22 Jul 2022 07:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umuczP8AH/dCCbA7tcf18WRupss9Yp337bfNs/pIot3tsR6ms1qA9qvvRAgPBOtZwVtXPxlg==
X-Received: by 2002:a05:620a:3709:b0:6b5:adeb:5ef0 with SMTP id
 de9-20020a05620a370900b006b5adeb5ef0mr196066qkb.307.1658501820388; 
 Fri, 22 Jul 2022 07:57:00 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a37e307000000b006b5e6dac3b0sm3291429qki.128.2022.07.22.07.56.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 22 Jul 2022 07:56:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 2/2] migration-test: Allow test to run without uffd
Date: Fri, 22 Jul 2022 10:56:54 -0400
Message-Id: <20220722145654.81103-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220722145654.81103-1-peterx@redhat.com>
References: <20220722145654.81103-1-peterx@redhat.com>
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 48 +++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index dd50aa600c..8826ee4be4 100644
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


