Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515074348F9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:31:58 +0200 (CEST)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8t3-00011m-Ch
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hT-0003yl-Q0
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hR-00036s-TL
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/OOFXRgq8TSDvZxZeGhYdPtX8D2UWjeyH5vg2OkC7lM=;
 b=dPoGTY3CX2fztONgpESaw2B14OZ5LJ/zDiHOqkng/I9pbfIiDu0rmgjljsVEecYFPyjS1t
 c6wHRj5jkpZwskpyWoA80YNbgTcSPyepOhBrCmtRIp4vlJRWyS7BHArOyQrbqLH+L9a2fo
 Z41egscX/rOKtJ8GoPiJkU37foVR3ec=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-9TNictlzPhOIKGnODFHsog-1; Wed, 20 Oct 2021 06:19:55 -0400
X-MC-Unique: 9TNictlzPhOIKGnODFHsog-1
Received: by mail-ed1-f69.google.com with SMTP id
 e14-20020a056402088e00b003db6ebb9526so20453231edy.22
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/OOFXRgq8TSDvZxZeGhYdPtX8D2UWjeyH5vg2OkC7lM=;
 b=BSHfI2y3YrwUlGkt125t5qVBSgB7sFAN5u4z/57JXImYw4R9oMkFqZzsL0nkS9c1Br
 4e497N4Kix8C41QHsQYs7KhH8yfv3FEBLFmOwGkzgY9I95i/bOgdtrLkAzrsgkxkl3Y5
 vvh3lITsO8nxqaZJ60erFJFCZ0wfAtCQLU1QTAck9w/XX6DKEbNBbhYASYO72bdmKj03
 jK9gopHc/F7ETkgK94HeiWFi9uUCJJHDgHW45cPOEqqQ8c2eqTUDnh3TUFIz/7Kia91/
 WnDGQUM7YYRCxkBWGUSfZQhRqPgjTefjtGqgUK4QLqx/19xwdbUfl42XgmKf+QY+w1bA
 Px5Q==
X-Gm-Message-State: AOAM533Mcy7harr8PNjtdurNs2Esp7rLc2fd2sGIyKIyQGmsAd8Dhz4E
 7dG7sdR60CUszlNo/1r1KkPHYcWYCRYzbKwK8AkYAnouq6DtCKSMjtsAsxqt1+3ZTkBi1aRw1Vt
 hn9KMunx+hkq9Ucc3PaUfaJgEEfBFbwhKS7Lv0ZkVOjSTN5GWkKKvWY2PQq/z
X-Received: by 2002:a17:906:2c57:: with SMTP id
 f23mr44000076ejh.474.1634725193872; 
 Wed, 20 Oct 2021 03:19:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+B62galMurEt709Mcn6JuGM5EUKW8ZQvyPWGkarctPqwyKylsKMjLg6K/yLQbQla7JyRc8g==
X-Received: by 2002:a17:906:2c57:: with SMTP id
 f23mr44000026ejh.474.1634725193458; 
 Wed, 20 Oct 2021 03:19:53 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id z4sm822737ejw.46.2021.10.20.03.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:53 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/44] tests: migration-test: use qtest_has_accel() API
Message-ID: <20211020101844.988480-15-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210902113551.461632-15-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/migration-test.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index cc5e83d98a..7b42f6fd90 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1420,6 +1420,7 @@ static bool kvm_dirty_ring_supported(void)
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
+    const bool has_kvm = qtest_has_accel("kvm");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1434,8 +1435,7 @@ int main(int argc, char **argv)
      * some reason)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
-        (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+        (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1444,16 +1444,9 @@ int main(int argc, char **argv)
      * Similar to ppc64, s390x seems to be touchy with TCG, so disable it
      * there until the problems are resolved
      */
-    if (g_str_equal(qtest_get_arch(), "s390x")) {
-#if defined(HOST_S390X)
-        if (access("/dev/kvm", R_OK | W_OK)) {
-            g_test_message("Skipping test: kvm not available");
-            return g_test_run();
-        }
-#else
-        g_test_message("Skipping test: Need s390x host to work properly");
+    if (g_str_equal(qtest_get_arch(), "s390x") && !has_kvm) {
+        g_test_message("Skipping test: s390x host with KVM is required");
         return g_test_run();
-#endif
     }
 
     tmpfs = mkdtemp(template);
-- 
MST


