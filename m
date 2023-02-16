Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67183699AF3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnY-0000qi-9K; Thu, 16 Feb 2023 12:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnV-0000g3-E6
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:53 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnT-0007tg-Jt
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so2503920wrz.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VvgfuLUSNrvN4aahIRpGRRD0M1CGU3JQCC4h/XD559w=;
 b=J8c8hg6zPetXqDX4OJxCBhKZ2iv3496Z++5N4FwMcjJNhky0u2TJxc2ky+o3kzPjdk
 u/zCcPPg5csN/p1H2ICt13lW2OMXfIKyBTd2nLYDMn1BNVt5dvkjrjR3QGhmiuBXfl+N
 /kltfzn0AFW9VDr1VXDbm9CbiqywTFZ+J4zBh7/M41SS7a9oFVcZQzXDDJjAViZGwS7d
 S3oDtduHTkL3ERMcUhoT6cKZEILi3cG8lUpIVbgmgJtZJTH0vP6oztMAiBjjNIgslXMz
 Dnily5B+oO3m4QHADUKQBhvjui6BHCVFJ/uiHF+2u889NElPHbRDMQgO9amkBiYeIdXW
 ZuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VvgfuLUSNrvN4aahIRpGRRD0M1CGU3JQCC4h/XD559w=;
 b=05m68hd4jLWiSg1DPIPHPoQ0SfhGss7BHYXwApVzBqZ97SG1l2nMZt3gh41GrLmh+M
 rnkzFxaKc31gxqph/Pe1SoG4QDtl3euhK74zb/J/tFoYyOz/ZZhUyuh5XXqqKRn+bzsd
 nG1ZumnzPfSvhDCeP4c89sXXyP6rHqfZGC6TRtnKZLDeX6dVAOMsyqcC6USj93PFrh8w
 gZI/RjwTbc7fnJpT+GjrHBkzB68pEFwZQr4VYuMBOJ9TTQofjIWtr99xdDe5TnoX3WoC
 /uCwzT7ayoe1wOKQokaIDxAyKzQnyJNFlxKefXsJPAS07Sl1fChopijPN03y4txIstDm
 b5zg==
X-Gm-Message-State: AO0yUKXbB0gem6D8bTMAChL0ugK0TIRpksoxTwlD5vHJOLDltavqeLap
 hF3tRUxhcy2lcQduHrJuAO/MaOLm3wBcUbXU
X-Google-Smtp-Source: AK7set+VdVlQCIVsURITowe5v682rN8/f24uuddpoSTCqAdgjy/jW8aeaW+NKfYgi8ot1Z2ElsJNug==
X-Received: by 2002:a5d:5012:0:b0:2c5:5878:e5a6 with SMTP id
 e18-20020a5d5012000000b002c55878e5a6mr5322041wrt.61.1676567510861; 
 Thu, 16 Feb 2023 09:11:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] tests/qtest: arm-cpu-features: Match tests to required
 accelerators
Date: Thu, 16 Feb 2023 17:11:22 +0000
Message-Id: <20230216171123.2518285-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Fabiano Rosas <farosas@suse.de>

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/arm-cpu-features.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8691802950c..1cb08138ad1 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
@@ -607,31 +607,39 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_data_func("/arm/query-cpu-model-expansion",
-                        NULL, test_query_cpu_model_expansion);
+    if (qtest_has_accel("tcg")) {
+        qtest_add_data_func("/arm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion);
+    }
+
+    if (!g_str_equal(qtest_get_arch(), "aarch64")) {
+        goto out;
+    }
 
     /*
      * For now we only run KVM specific tests with AArch64 QEMU in
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
+    if (qtest_has_accel("kvm")) {
         /*
          * This tests target the 'host' CPU type, so register it only if
          * KVM is available.
          */
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
-    }
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
-        qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
-                            NULL, sve_tests_sve_max_vq_8);
-        qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off);
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off_kvm);
     }
 
+    if (qtest_has_accel("tcg")) {
+        qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
+                            NULL, sve_tests_sve_max_vq_8);
+        qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off);
+    }
+
+out:
     return g_test_run();
 }
-- 
2.34.1


