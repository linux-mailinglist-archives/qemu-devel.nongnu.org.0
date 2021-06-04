Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA839BC5F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:57:34 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCCT-0003ui-Is
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8R-0002M0-HP
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8O-0008Pd-Th
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:23 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 h5-20020a05600c3505b029019f0654f6f1so7677046wmq.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JEWHBCHxKVXeNs+cV9ChbBOU9uNopKc+RwL1IoJNYZE=;
 b=wtMqn6thCPNnLdYttCGfqmQqMOEg+ctSBuIECrpWX+oK1LZvqOXn8sUv0eNJFaXt/d
 ZQujLTQrJ9MwHgvc6688BQSlphHC6nL/xfC1CE78GOLOu+6P3jmTYiJOCtE5dsdXpnXu
 AZW193ADBcVFdKlvwt9SxsPa6DdDebwvuXALb5iCg5fBww2tCfvSyN2VgMENVbIF8b66
 GE+83yxVlxSDu2hewbTaHpZAGs00qbMGUIXIS/a44he4BG7vRbEuqq3MqszCbkEBzQBN
 lU/qF24r0UAgDvZkVUKByxu/QP7Z/eDU1YlNLnzkVdz07nBZE0KcQbSChkwrZQr3/T05
 U7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JEWHBCHxKVXeNs+cV9ChbBOU9uNopKc+RwL1IoJNYZE=;
 b=cnlaJcXeRUyMh9drf9V5jyOEKKPyJLx76/CJ2Ay+k5V3HkOfcMybYvd5wrUWnzZfs1
 8Sv2MCZ8xo8bhyZYO/uGaUOJNZOucnKR5PjyGxhfvbhOQomE8x4OQEu31NbgxUX5tEc5
 DM2lU7oGPbh89zLgDCkLefG1ok19XNtJWCp8/HsHYB+njD1ebXl/wSGVNKDQ6XdScw6b
 +Ua0r50NiIyDL1do92gaynclMQEovtsH/2i4SgnPGD/QoW5+5FQtGvvW/zSl9ug48rpY
 S1lF7RcUu5SLOdI32+mL3vKydrpRBGzW2JRTWftmGQJNBQI4aZXWpl7xC/MaKRLMgtFW
 3ovA==
X-Gm-Message-State: AOAM532BDd61KMFJ7kWOafHObK/Dbsf4w3jAj5egG/7vUd5bMu9uM8vT
 W3w02icICBTNKXTnKXkiQEak2g==
X-Google-Smtp-Source: ABdhPJwkgxI+WQ7cpos6cOO4lrQwqRWxP6qv6I3lso4hCIvy4fBoVLex/yO9XGF0vpkojQ8D6WGXmg==
X-Received: by 2002:a1c:5f86:: with SMTP id t128mr4403114wmb.165.1622821999429; 
 Fri, 04 Jun 2021 08:53:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m3sm7492783wrr.32.2021.06.04.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B86BB1FF90;
 Fri,  4 Jun 2021 16:53:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Date: Fri,  4 Jun 2021 16:51:37 +0100
Message-Id: <20210604155312.15902-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use the recently added generic qtest_has_accel() method to
check if KVM is available.

Suggested-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..7f4b252127 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -26,21 +26,6 @@
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
 
-static bool kvm_enabled(QTestState *qts)
-{
-    QDict *resp, *qdict;
-    bool enabled;
-
-    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
-    g_assert(qdict_haskey(resp, "return"));
-    qdict = qdict_get_qdict(resp, "return");
-    g_assert(qdict_haskey(qdict, "enabled"));
-    enabled = qdict_get_bool(qdict, "enabled");
-    qobject_unref(resp);
-
-    return enabled;
-}
-
 static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
 {
     return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
@@ -493,14 +478,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
     qts = qtest_init(MACHINE_KVM "-cpu max");
 
-    /*
-     * These tests target the 'host' CPU type, so KVM must be enabled.
-     */
-    if (!kvm_enabled(qts)) {
-        qtest_quit(qts);
-        return;
-    }
-
     /* Enabling and disabling kvm-no-adjvtime should always work. */
     assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
     assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
@@ -624,7 +601,7 @@ int main(int argc, char **argv)
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
     }
-- 
2.20.1


