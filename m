Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834E139BE56
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:17:25 +0200 (CEST)
Received: from localhost ([::1]:37994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDRk-0000b4-Ir
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNJ-000860-Fh
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:43792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNH-00023E-Fr
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso6011193wmj.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVwtDg6NmbYUbWbKcWKwD4v1KnbubfIiGX4wXK52zzM=;
 b=OLH7eO1BVxQh5ug2adTu2a83X1SkMbpcY1UBwmeZ1id1G8thQFyPecmAOGW+PujpY9
 UY6BDvhqOYbxj8sjZ0WpvNvJ5sC1/b8L0TEe8PdX4Oa+gyTFnvftb/YSlOx01C0bfR5y
 gBr7U5PidbWbwR3359Fy2SOMdw+WHNTo14koav2SLGiSd4Ow7cASXq13rmVjvMkwsTI/
 9SRdrg+rK/yvjXyP06u24oYW/4DhqsVCBoifC4JBctypNLOUZxYJwSh8N43ZjTxL4AE4
 7DbWU5gg4Ixa7jV6vjaMBQXGnXvWxCM0C5PctPIYFQVm8KgFblPB7tv0tg/zrmnsefr2
 LqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVwtDg6NmbYUbWbKcWKwD4v1KnbubfIiGX4wXK52zzM=;
 b=k7YFZMNjkZjfTnSPX7DzvyRngpuQFpNiIUGNY+VD7wp+pOgMWAIL2d2YPsjW+Dxnvc
 0QtSDPJJvx3SfQo4OG9L50NhIMGw4Y6ONk/Tzp1U9RJJuXZE7xoOj1unWHR8ZX8nKGvU
 W2LfQkBFkhpGk4ZEFQ4P0zT1ZHsWrqaBNdibad0zw95yqpx5q2H5gupR3Prl92WwgVHa
 CBaWkqmFz31sLDFEg3uTHyQ2XenI2xF+MI8V9p0qIThQHwuN04kQq9lQRD0MCNcDywoN
 DI56VjmgmIL8WE91k7Ua6Sg/h90xSSRF2gg80bCbSEotgo6itRMPPhJKOGZOfJ8tFIQT
 5bgg==
X-Gm-Message-State: AOAM533jf8r7zBUjN2ySrGpSDKD3XTNfDMbQLYGOjq2QdK9OldUJoQYq
 z+4Q/7vwp+LRYthfBuhZmbgu6Q==
X-Google-Smtp-Source: ABdhPJzqmFc5Sye3awnzV+RZLn3bmLsb4kOEj0HE/lNSpyDqm+m8JYKlPFdLlVAoFyTooJ83MVfiqQ==
X-Received: by 2002:a1c:6004:: with SMTP id u4mr4668413wmb.110.1622826763890; 
 Fri, 04 Jun 2021 10:12:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r4sm2614512wrt.26.2021.06.04.10.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A55A01FFD6;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 65/99] tests: device-introspect-test: cope with ARM
 TCG-only devices
Date: Fri,  4 Jun 2021 16:52:38 +0100
Message-Id: <20210604155312.15902-66-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Skip the test_device_intro_concrete for now for ARM KVM-only build,
as on ARM we currently build devices for ARM that are not
compatible with a KVM-only build.

We can remove this workaround when we fix this in KConfig etc,
and we only list and build machines that are compatible with KVM
for KVM-only builds.

Alternative implementation provided by Alex.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/device-introspect-test.c | 32 +++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index bbec166dbc..cb8bf6e37d 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -305,6 +305,24 @@ static void test_abstract_interfaces(void)
     qtest_quit(qts);
 }
 
+/*
+ * XXX currently we build also boards for ARM that are incompatible with KVM.
+ * We therefore need to check this explicitly, and only test virt for kvm-only
+ * arm builds.
+ * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
+ * are built for the kvm-only build, we could remove this.
+ */
+static bool skip_machine_tests(void)
+{
+#ifndef CONFIG_TCG
+    const char *arch = qtest_get_arch();
+    if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
+        return true;
+    }
+#endif /* !CONFIG_TCG */
+    return false;
+}
+
 static void add_machine_test_case(const char *mname)
 {
     char *path, *args;
@@ -329,11 +347,15 @@ int main(int argc, char **argv)
     qtest_add_func("device/introspect/none", test_device_intro_none);
     qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
     qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
-    if (g_test_quick()) {
-        qtest_add_data_func("device/introspect/concrete/defaults/none",
-                            g_strdup(common_args), test_device_intro_concrete);
-    } else {
-        qtest_cb_for_every_machine(add_machine_test_case, true);
+
+    if (!skip_machine_tests()) {
+        if (g_test_quick()) {
+            qtest_add_data_func("device/introspect/concrete/defaults/none",
+                                g_strdup(common_args),
+                                test_device_intro_concrete);
+        } else {
+            qtest_cb_for_every_machine(add_machine_test_case, true);
+        }
     }
 
     return g_test_run();
-- 
2.20.1


