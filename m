Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3C52AC7A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:08:52 +0200 (CEST)
Received: from localhost ([::1]:58536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3Up-0005rX-Mm
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KT-0003L8-ST
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KS-0002OW-9f
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0GJ3paWmOxh0zFlEMGOBT9/lp4fd+SAOS6t/iOeyyU=;
 b=YH6wiBqiKglXrNR4LhERnQeJiXxNJOzQ+bVKOCyPMDTuCmGOHsCliFYh+wzyZuqvb+WaRf
 sEQeFwrGhuduoHPBB1CqeIAIoYYsdZ/YEqOh89S+TxUPUe3zh+wfV0BD6vOU0ZfWl9mhtl
 GQnFBufBzEbTdU3WCzvmqXOb3od5gh0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-0X4yCRhwNDCAfflsXfWDng-1; Tue, 17 May 2022 15:57:57 -0400
X-MC-Unique: 0X4yCRhwNDCAfflsXfWDng-1
Received: by mail-io1-f70.google.com with SMTP id
 m205-20020a6b3fd6000000b006586ca958d2so13064541ioa.22
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E0GJ3paWmOxh0zFlEMGOBT9/lp4fd+SAOS6t/iOeyyU=;
 b=T2zuSckpQp7kp6WleSL7BnSP8y/KM+OzbhNhoCrzA3hokGVkZIL9zmnVew4V3Ampfx
 zef8K13y62Cbcw9dfvWLKkbWiRkcnvN1yOvy0+rzVQ//cgnHkWr4opcHTb5dCQTfyzVh
 3P6qxmtm1YXQjVRd9gKYjDYUrmYsvqrBcVoEisgMzX4H095/rzdyOSyxHQYgMNcmn8r6
 aDWa2wAdd1pt0TMdXm4ZBdVIk65oGNj2BHMbSwxuRirSwdSnOpt17eF0TQi49erdGGYp
 V3K0WSZpIOtykMw2FM714g3TPuPb7vADLlK4AT7GyRSh3N2qZ5znTw6x1FqzJjlN86Ow
 HoQA==
X-Gm-Message-State: AOAM533YmBrcbnZCPjyj3X/lNgnKxpoh5GJDUF5Vz3f/oe3t9pUnbOok
 Mbv3diFrFwSKSgcpFNMRZ3vgq8ijYlLK8WTam1RzYNZZCDL1vSftx0TghuXoM9Md0YZDLEH1KzW
 sCcKgUIUaxSdbWhtxz859Eep7x9qeg8xeJC3veoWXPheB5ANt6OoP4ToYgPEakbHp
X-Received: by 2002:a6b:2a88:0:b0:65a:4e0e:7f35 with SMTP id
 q130-20020a6b2a88000000b0065a4e0e7f35mr10482672ioq.216.1652817476754; 
 Tue, 17 May 2022 12:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylrZQZzxeLyIDrjnBgaXq6PTEzD14krNcv/BdylFCs/ZPPJC8Hiz7ooZJK/geri93HWI9ccQ==
X-Received: by 2002:a6b:2a88:0:b0:65a:4e0e:7f35 with SMTP id
 q130-20020a6b2a88000000b0065a4e0e7f35mr10482656ioq.216.1652817476499; 
 Tue, 17 May 2022 12:57:56 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:55 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 13/13] tests: Add postcopy preempt tests
Date: Tue, 17 May 2022 15:57:30 -0400
Message-Id: <20220517195730.32312-14-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517195730.32312-1-peterx@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Four tests are added for preempt mode:

  - Postcopy plain
  - Postcopy recovery
  - Postcopy tls
  - Postcopy tls+recovery

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ba7e4a2ed2..26264c7872 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -477,6 +477,7 @@ typedef struct {
      */
     bool hide_stderr;
     bool use_shmem;
+    bool postcopy_preempt;
     /* only launch the target process */
     bool only_target;
     /* Use dirty ring if true; dirty logging otherwise */
@@ -992,6 +993,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
 
+    if (args->postcopy_preempt) {
+        migrate_set_capability(from, "postcopy-preempt", true);
+        migrate_set_capability(to, "postcopy-preempt", true);
+    }
+
     /* We want to pick a speed slow enough that the test completes
      * quickly, but that it doesn't complete precopy even on a slow
      * machine, so also set the downtime.
@@ -1058,6 +1064,25 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
+static void test_postcopy_preempt(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_preempt_tls_psk(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+        .postcopy_tls = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
 static void test_postcopy_recovery_common(MigrateStart *args)
 {
     QTestState *from, *to;
@@ -1134,6 +1159,24 @@ static void test_postcopy_recovery_tls_psk(void)
     test_postcopy_recovery_common(&args);
 }
 
+static void test_postcopy_preempt_recovery(void)
+{
+    MigrateStart args = { .postcopy_preempt = true };
+
+    test_postcopy_recovery_common(&args);
+}
+
+/* This contains preempt+recovery+tls test altogether */
+static void test_postcopy_preempt_all(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+        .postcopy_tls = true,
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
 static void test_baddest(void)
 {
     MigrateStart args = {
@@ -2190,6 +2233,17 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/recovery/tls/psk",
                    test_postcopy_recovery_tls_psk);
 #endif /* CONFIG_GNUTLS */
+
+    qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
+    qtest_add_func("/migration/postcopy/preempt/recovery/plain",
+                   test_postcopy_preempt_recovery);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/postcopy/preempt/tls/psk",
+                   test_postcopy_preempt_tls_psk);
+    qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
+                   test_postcopy_preempt_all);
+#endif /* CONFIG_GNUTLS */
+
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.32.0


