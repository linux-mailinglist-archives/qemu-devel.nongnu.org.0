Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C3F39BC90
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:07:09 +0200 (CEST)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCLk-0005eo-HE
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8U-0002Xd-Tk
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:34481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8P-0008QC-Fe
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4495442wmc.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67nZUzxSZk/gVJPBhG39pqDikF99Pp1OEKbjWVU7ILs=;
 b=m3KM02stufm+OUqybEoRGCzWNyZvvNEe6dwY6eFwewV0WulgmwmgiwjcSiyILfgiI5
 GK4vPvD2aMrXn0bbWhgitB2yCpeCFQU2PVP0wC/y21vxeV0k/1BVJG8bjh/84ooWmUJU
 CSLCMZnWlpDOEUysvdArApkjInVlqzC5DHk4GnElnHYdlmNEeLjp17InzU2VS3HEBywV
 +vxVQ3RjV67Q4YLLfNxjfWoi0jwPdM3OZY8JqqB8+9ftFJlQrSPjJ9tjqGZBxgNIz1pi
 GOWZr65ReY3bZLzGB/yzXL6D7OdfnqYX4jUJ61//KvKHU6Ohs3AQ4Ti2EidVUVyE/y6Z
 C2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67nZUzxSZk/gVJPBhG39pqDikF99Pp1OEKbjWVU7ILs=;
 b=E72mWJUzLUGFTy3yQP/VxkBixEbPQ2+cdj5W7n2KCyXwWWxxC3xLX2TAK4CSMHvppb
 m8w7x/ZsR11YP8NycIlhGe+yqZBpOHCAkcx3aEV5dpcsxnrxSYkPOEyXb63MNROoo2qV
 EJ7ZvY5pSXvpSRlb78/VP6KFJ0g7PG+x5J2BenA8oJ9T+qzwVIQmIen6R9UFHP/qodw0
 wQfcMHISfu3fEGUdTzgl/FAE1VKHguS4RpNEIPe+2jrQq4bF/MoYXeEaY0vKFEZvPEWe
 6EwuJrIFbGWYRF0ZOpwcyY2sJdf6Gx0OixCtd8KGFwRo7ez6SgvHNu/9s0wYEQ0mMsPM
 1U7A==
X-Gm-Message-State: AOAM530HjyMym/QmCpgE/0ELu9wQ191wI8KDByZSlWix6/BU6zpSaSbC
 +qFJ75hkbAxi6t25hfGdy6DBZQ==
X-Google-Smtp-Source: ABdhPJzQ+O++4W4taow2egRD3zdcU5N2ZKTUQGyvJeEecw5ufZw/zEjDyV88VFEv4UJ8cUtBKyAVlQ==
X-Received: by 2002:a05:600c:3658:: with SMTP id
 y24mr4406058wmq.122.1622822000148; 
 Fri, 04 Jun 2021 08:53:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r2sm7160694wrv.39.2021.06.04.08.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDF2F1FF91;
 Fri,  4 Jun 2021 16:53:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 05/99] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Date: Fri,  4 Jun 2021 16:51:38 +0100
Message-Id: <20210604155312.15902-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The sve_tests_sve_off_kvm() test is KVM specific.
Only run it if KVM is available.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-6-philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 7f4b252127..66300c3bc2 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -604,6 +604,8 @@ int main(int argc, char **argv)
     if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off_kvm);
     }
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
@@ -611,8 +613,6 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off);
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off_kvm);
     }
 
     return g_test_run();
-- 
2.20.1


