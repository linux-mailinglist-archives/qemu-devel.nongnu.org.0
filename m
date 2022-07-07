Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57B56AB34
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:10 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9WnJ-0003DK-I9
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wf3-0005zP-U7
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wf2-0001nY-Aj
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9aabLAjl6WYInBM+zYfa0kWHALX+j9XmYOkOfNv/fw=;
 b=Xy2TL38CbpP2aDvIIe7HDF7W7U94mJPb8N1zIHsvG9PQ7K0/oWb0NNtkJhVgi8BZIxDXyy
 k4M0JWkgL+58Cbwi8BikS1Pok9Zg33UTNjSP83+pl5ElbRbrv2VoAjRtUENz6/aeJXidg0
 04c2m8IF785RtYdBugn6x3+LOEVQ9Oc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-NXmhpmQbPsGUy5VoGrpsYw-1; Thu, 07 Jul 2022 14:55:34 -0400
X-MC-Unique: NXmhpmQbPsGUy5VoGrpsYw-1
Received: by mail-qk1-f198.google.com with SMTP id
 az11-20020a05620a170b00b006b55d790273so942216qkb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C9aabLAjl6WYInBM+zYfa0kWHALX+j9XmYOkOfNv/fw=;
 b=h/BHdQ+WJvo3ZpH+bDlhV59AoPAfqmUJtkEj7mfBy33CljDJpGCgJSazrN1xH6mpFU
 qJG/qfyrElhkE8O28NAb4WD82p+k5jaHxgivN1Qwz2Qs95E9dnan4ZpZAVF2YMUiWp7N
 XkjyILdTBUdvGZJrSt4C76U8wZiMVTyA+/mwlrvaLT14JgtTYSYcLa6dBQfnB8pHZUIA
 zamk6J6EbW95d8IjT/Ra94HUfPv7movbKANrcyjAMhouhCO9lXPoFEYG7qXmTBdaazxd
 620x+KKXrgn/73klfYbCT2sfkvrwN004uELTphMg/W3vpMK3Q9WVXk5XyRD30oWcZRvK
 KQoA==
X-Gm-Message-State: AJIora/V3Sd9ZSaZcA2bO6JS6neaZ1ilWA/2xsBNsPPnk7hOtlXQCTdl
 lJauG8IIhinnFbpugY2EVYxgKDs3BvXyttxCNzY2c5Sjmqr0yWQGhnqs3dXX3X2ufgOFCesejwf
 hkJkLpJM5P3QasV7v5u5v6cH7pj0wa4whefVqg0Iu6dEUF6aqddAqnAh4XLqGjehG
X-Received: by 2002:ac8:5b4d:0:b0:31d:3c73:58ed with SMTP id
 n13-20020ac85b4d000000b0031d3c7358edmr27432739qtw.304.1657220132407; 
 Thu, 07 Jul 2022 11:55:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQph3Eh4Lcwi+gDEEvUzOU2UXVodE57ZEUPId1ZyfMGzdViTySyNCSrRN1k+RLZ6TuBGfSjA==
X-Received: by 2002:ac8:5b4d:0:b0:31d:3c73:58ed with SMTP id
 n13-20020ac85b4d000000b0031d3c7358edmr27432715qtw.304.1657220132121; 
 Thu, 07 Jul 2022 11:55:32 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 z198-20020a3765cf000000b006a736c8ea80sm32909325qkb.48.2022.07.07.11.55.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:55:31 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 14/14] tests: Add postcopy preempt tests
Date: Thu,  7 Jul 2022 14:55:30 -0400
Message-Id: <20220707185530.27801-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
References: <20220707185342.26794-1-peterx@redhat.com>
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

Four tests are added for preempt mode:

  - Postcopy plain
  - Postcopy recovery
  - Postcopy tls
  - Postcopy tls+recovery

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 81ef9741cd..81780189a8 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -569,6 +569,7 @@ typedef struct {
 
     /* Postcopy specific fields */
     void *postcopy_data;
+    bool postcopy_preempt;
 } MigrateCommon;
 
 static int test_migrate_start(QTestState **from, QTestState **to,
@@ -1074,6 +1075,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
 
+    if (args->postcopy_preempt) {
+        migrate_set_capability(from, "postcopy-preempt", true);
+        migrate_set_capability(to, "postcopy-preempt", true);
+    }
+
     migrate_ensure_non_converge(from);
 
     /* Wait for the first serial output from the source */
@@ -1137,6 +1143,26 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
+static void test_postcopy_preempt(void)
+{
+    MigrateCommon args = {
+        .postcopy_preempt = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_preempt_tls_psk(void)
+{
+    MigrateCommon args = {
+        .postcopy_preempt = true,
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_common(&args);
+}
+
 static void test_postcopy_recovery_common(MigrateCommon *args)
 {
     QTestState *from, *to;
@@ -1216,6 +1242,27 @@ static void test_postcopy_recovery_tls_psk(void)
     test_postcopy_recovery_common(&args);
 }
 
+static void test_postcopy_preempt_recovery(void)
+{
+    MigrateCommon args = {
+        .postcopy_preempt = true,
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
+/* This contains preempt+recovery+tls test altogether */
+static void test_postcopy_preempt_all(void)
+{
+    MigrateCommon args = {
+        .postcopy_preempt = true,
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
 static void test_baddest(void)
 {
     MigrateStart args = {
@@ -2183,6 +2230,15 @@ int main(int argc, char **argv)
 #ifdef CONFIG_GNUTLS
         qtest_add_func("/migration/postcopy/recovery/tls/psk",
                        test_postcopy_recovery_tls_psk);
+#endif /* CONFIG_GNUTLS */
+        qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
+        qtest_add_func("/migration/postcopy/preempt/recovery/plain",
+                       test_postcopy_preempt_recovery);
+#ifdef CONFIG_GNUTLS
+        qtest_add_func("/migration/postcopy/preempt/tls/psk",
+                       test_postcopy_preempt_tls_psk);
+        qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
+                       test_postcopy_preempt_all);
 #endif /* CONFIG_GNUTLS */
     }
     qtest_add_func("/migration/bad_dest", test_baddest);
-- 
2.32.0


