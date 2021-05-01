Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AC37093C
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:43:47 +0200 (CEST)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyKw-0003w4-I5
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEi-0004oo-1D
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEg-0008T3-Cn
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
 b=Kes9IhcAMri53EjkEFfkJQwONdUrJnm6FUaQ7RrFrhjhh2v1l14jqQTZFcWtkIjCslvA93
 GDZypI/Li29kAEM+WuIwOBf0kf2K2CI4y1OLRlKzTNfyd//iAVcZ44Jdbuo+nDLIPAoEpQ
 JpBCUbukm/gb/kW/GpstByi9mLu3bvc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-qg0VmrcOOweOMU3WAiPiZA-1; Sat, 01 May 2021 18:37:16 -0400
X-MC-Unique: qg0VmrcOOweOMU3WAiPiZA-1
Received: by mail-wr1-f69.google.com with SMTP id
 4-20020adf80040000b029010cab735fdeso1284076wrk.14
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
 b=ildg51m3iCFmmFJUGNbeiZve5DSvxVElxROsGZ2UE1sw35nZxvQ3/7k4qYkNpDOC1p
 SzZhjiCngdkQVjOPYOLu4MXvUKEtgszyISVjTXt0ENmlDvmp4xJkZSg2tUNe49dCOofT
 CkYa20R/7aDxKQMl0MkXFXTcyIjXibBRgpwD8LEbq1a7EIVL9dhc/NqNlT0xIufw43Tx
 43rbqgNpQDDg0Xo84XakezCg/fIVc6I70i31uVTTSRkXr7MrY7Hq3bY7OECC655Kxgg3
 ZhQoFkbJaNjyE3mmDc6kh+pMM6OC9TvK1pdcNoT1RCllLDokIpbbjDqe6xO0BCVezMii
 AeLQ==
X-Gm-Message-State: AOAM533S2A8vKqjNOkXoQ2BGpTliRhGv7wtPJwI6mEcqXe3+21dNT8O0
 cFPjYGSuzG02kuMgMsF3jtbu8/5Ff6iBgVbvpYoqM9X9MU/J0DXwYP3Eelo3Nto5iFT+eLsUfCa
 05NGN1uLwNL/pHav9u2WEZHEQStaoctQWc9nTLu7KGyHJG19LnOmBwJhzWQHaYv5v
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr16218269wri.349.1619908635214; 
 Sat, 01 May 2021 15:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhEm3Q0zbT6QHH8bk2hsUBj23M3IfMikdiIAJcFHZOA2rqBIb2YrHrBiXxu+a+w/pdk3rR/Q==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr16218244wri.349.1619908635070; 
 Sat, 01 May 2021 15:37:15 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id g10sm15134871wmq.25.2021.05.01.15.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:37:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/10] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
Date: Sun,  2 May 2021 00:36:35 +0200
Message-Id: <20210501223638.510712-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, only run these tests if TCG
is built into the QEMU binary.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index b1d406542f7..0d9145dd168 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -20,7 +20,7 @@
  */
 #define SVE_MAX_VQ 16
 
-#define MACHINE     "-machine virt,gic-version=max -accel tcg "
+#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
@@ -337,7 +337,7 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
 
@@ -372,7 +372,7 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve=off");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
 
     /* SVE is off, so the map should be empty. */
     assert_sve_vls(qts, "max", 0, NULL);
@@ -428,7 +428,7 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max");
+    qts = qtest_init(MACHINE_TCG "-cpu max");
 
     /* Test common query-cpu-model-expansion input validation */
     assert_type_full(qts);
@@ -593,8 +593,10 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_data_func("/arm/query-cpu-model-expansion",
-                        NULL, test_query_cpu_model_expansion);
+    if (qtest_has_accel("tcg")) {
+        qtest_add_data_func("/arm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion);
+    }
 
     /*
      * For now we only run KVM specific tests with AArch64 QEMU in
@@ -608,7 +610,7 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_off_kvm);
     }
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("tcg")) {
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
-- 
2.26.3


