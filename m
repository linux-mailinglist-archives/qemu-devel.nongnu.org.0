Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804A39BEEC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:36:36 +0200 (CEST)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDkJ-0002e2-91
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNJ-00085O-9j
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDND-000221-DN
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f2so9990706wri.11
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/tJR1h7wyxWfcVFJmfREs1+Cr3yNNSSbrFc5jF6cQA=;
 b=F17fSk9tH+3glWMuB2pYiu12CQG/zDLd2tnt+EnAyX0IeSqzDIoPv5mfOure8ZXVyR
 Qp10cis8SUg8o9kwLqvxVS3SCMQFHUr0jktZeV6PkaVY0Y1eyIo5IUaiCHbnZhav08oS
 qlWW2DjOA6O70OXL/PV4fPVS6M9pzdTBwVcmQ+cRuM40JHH9jqeaxJAbmQUJPn+7ubrK
 VRkSRdf2fAdSmBsCDp7b5qX39ZCZcTAuHGzeH+yywdAJAXpIOZ1nFcdZSLYVRpYqO5Mr
 DlgDZk72YXd236CeJ18iePRpmkpOSVL7VeUQdlDGtZBE8dEqBFvuiaU779ZW4bJ07vzo
 G2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o/tJR1h7wyxWfcVFJmfREs1+Cr3yNNSSbrFc5jF6cQA=;
 b=Uxg7vX5/ZClQv+RK2NQZl+d4B6EJT/rd44ANFkoaFlbziEGfhBlbg+xVohg30+Ieav
 FFMkV8gEU6TlVFLlZsAC/yGMOoubzDNsqd1UvI6PcUo14fwy4v7ytfYOULk0Y0SD4sUG
 CGo1IsV7BT+1Vr0ONppHdyi2IlDgV/okniw9IU0PmGiOVngfQecLAl10geeJFBAJx2aS
 m1bhbsy437MsYYul65ahWddOHd8PESPlfrzAkFUjTf8hTo6JNwXGGmi7Pt+Bvh3L6Nkw
 kIbjWxa1uQD4dxgiD8j2dWM6SxDiFkFIHsmhWf6d/h3CBN4TrmFQCou4TRKHlpVsQmNg
 urkw==
X-Gm-Message-State: AOAM532NPpJCr5bH6QbbcXZjKNDFxfDWlK16+5L7yg8H6zJA8m+raohX
 e/Ov5cmBw6/Byq0lDmeTQVDb4JYBynE5xQ==
X-Google-Smtp-Source: ABdhPJyDeD1zN6fJc3JKD9SywbNY00He/tlkwmdX/RiIdS3Cnttnnc/MxMJr1qWoLx7+p58lF0hb0w==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr4970797wrm.141.1622826761870; 
 Fri, 04 Jun 2021 10:12:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 92sm7893175wrp.88.2021.06.04.10.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB9381FFD7;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 66/99] tests: do not run qom-test on all machines for ARM
 KVM-only
Date: Fri,  4 Jun 2021 16:52:39 +0100
Message-Id: <20210604155312.15902-67-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

on ARM we currently list and build all machines, even when
building KVM-only, without TCG.

Until we fix this (and we only list and build machines that are
compatible with KVM), only test specifically using the "virt"
machine in this case.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/qom-test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index eb34af843b..b0a6d10148 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -90,7 +90,27 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
+    /*
+     * XXX currently we build also boards for ARM that are incompatible with KVM.
+     * We therefore need to check this explicitly, and only test virt for kvm-only
+     * arm builds.
+     * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
+     * are built for the kvm-only build, we could remove this.
+     */
+#ifndef CONFIG_TCG
+    {
+        const char *arch = qtest_get_arch();
+
+        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
+            add_machine_test_case("virt");
+            goto add_machine_test_done;
+        }
+    }
+#endif /* !CONFIG_TCG */
+
     qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
+    goto add_machine_test_done;
 
+ add_machine_test_done:
     return g_test_run();
 }
-- 
2.20.1


