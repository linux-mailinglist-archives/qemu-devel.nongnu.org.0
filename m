Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7482039BD0E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:25:22 +0200 (CEST)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCdN-00058c-H4
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCIJ-0000G7-G8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHo-0005vq-P7
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so930629wmq.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnqsqRW/fHAwL8iPmUyBN5YIVqEFRjRPuxkbEMdWync=;
 b=lpGMZm1z7Q59Kou8ERYOuxJzhfCJ2ybQ8LuqQ83XyL89sjceMcIOq0bUKHr+t9Y8lI
 JpTjWl88OiHfUIg1h1J7xv0Z8hjeJ2Bzld2ebaOZeRVtGcUllUeeUkLSEceuA8xEv5y8
 bwOsoEbBHmAyL6y48+gLtmEOnTUBV4TCu0aj6SEzeWq6tg6D29AamOr6n9OIiX97eUYI
 +FoOxac3NGbiJm9WP/wwcv/GDMp8oc8G1UGQqRO+ZSVbW0tmJ9x3eKBLONHrjDGcaTdM
 Y2IGJbDd3RORrUWGD9pqfKDdum+LJR5gI4O2BLLE+S5OjsildKVP4ahyUNdQxmHE1OEf
 OV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnqsqRW/fHAwL8iPmUyBN5YIVqEFRjRPuxkbEMdWync=;
 b=GaN44UDc8F749cofwL4djFoGk9mBGqLbMGBWqeBpScbDB9JYMW17j8tCv2QIcpIWmb
 MW8lifomv5rHrKiXhhXa17DK3ddPff8rqfwUGS5EFWwcvF/hO68nLZ1MODMi8zaKHL2L
 pkhAiVlu589DRr97A8emj9o9WwoJCU0ZQLY9x1lPGgwps1jYscseBPKONlxvM6gXxgj2
 oxEmu6vScFC9Xp0+EPdJS53bWoWh5Jp8zNMprNx30yAVjxUCPcpUMInIbbf8wQhcroCq
 0fr8NZozwyjXz2TRsbW9QxLG6L5IF0Bte6f5nEERLVq5jWUsb27rUFYGcf4YFo9CVWQz
 n1kA==
X-Gm-Message-State: AOAM531dP5BevD5VsstGaotgsQD5U16tWZ+psoBJd9CnXQl8++AEAemR
 gEAqsHsZf5hs883Mqf2ED/FsPg==
X-Google-Smtp-Source: ABdhPJyR5nzlyugXf2Fb94Arj1xmAmhiPXh/YhDi6VmBuZ427SOIu5kLyk+DmstrEHzykdb75Y0+ag==
X-Received: by 2002:a7b:c852:: with SMTP id c18mr4315206wml.16.1622822581304; 
 Fri, 04 Jun 2021 09:03:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t12sm9136988wre.9.2021.06.04.09.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F3BB1FFD5;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 64/99] tests: do not run test-hmp on all machines for ARM
 KVM-only
Date: Fri,  4 Jun 2021 16:52:37 +0100
Message-Id: <20210604155312.15902-65-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
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
 tests/qtest/test-hmp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index 413eb95d2a..1d4b4f2f0e 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -157,8 +157,28 @@ int main(int argc, char **argv)
 
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
     /* as none machine has no memory by default, add a test case with memory */
     qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
 
-- 
2.20.1


