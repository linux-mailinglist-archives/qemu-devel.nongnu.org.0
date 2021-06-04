Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227F739BEFE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:41:02 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDob-0003OT-7k
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNR-0000C7-2p
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNO-00026v-8d
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l2so10038506wrw.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2NTbq9Py2mVkZ2OrcWx1tG3NJj+ueFdRocasaLiPrE=;
 b=K6Ipp5UbFGTiZ7yJ0xV0HroliU+7IgUEBKIVe9AxjeCP+A/5S7bLlSk3dic9g3/NHw
 Ros0hQNEjdNBVKIQEsoiTXb6qE5L2IOt6yw0nedPoudxYQmbF7pCNl9zLTCCh32jJSiQ
 JZzMwjkZRY6AMGaiQoJKdgPUKpqziwfaLx7ICKuVwbf0p6ikA7JBmQKluzhxE4nc2jTN
 ZpGjjO6HM8DmAng9D3rQEBwCFXaVa5ofnGfsnOBHQrFONgBX6a2v5pd/q7gE9G6O6DV9
 ir52Yz0/pLd2EhnkMwjXaAW0Yll2zqOEQlZAnuxZLq3FvzCOG7d1eU8ENSkWZfcxphhf
 YTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2NTbq9Py2mVkZ2OrcWx1tG3NJj+ueFdRocasaLiPrE=;
 b=CuCEYwHt2xSkYrr8F0BvyzWFtb5wx2xIQFqww4XRUFV4fnUjTcr/n8DpiE37Fa/PsQ
 fK8tE/CwyiyPb8ZpaCjk1JzdXRaueX82QeKE7rG4s7Nyely94ZlqSRYgmuA8v7f/Jtra
 tmo9WCGZdJI6M/JfUATBi0XIIpZkR0ngfkMpzcAfWklYZJeUq4vzdTir9GlP8RiPxqd+
 Sud4tQ79zJjO5oY/V055kd4sD0QB8+3K/xPB4+dNYkriLoBuh4Je7Xczf2axl3+cUPIJ
 Wur9zzndnOpJXfWvGig6Xp7hHnEEcyM35lcWuQct48UdZ6r43ViGI7Orxpp2ciEcwgkw
 I0Qg==
X-Gm-Message-State: AOAM533gS/HKHR3dvnTUdzmfTgX4a1RE1PYM4baJ8gSFn+f0cLbGgoy5
 ziyJH94IwNhz+eNYonyTiY8fAg==
X-Google-Smtp-Source: ABdhPJwPL829SA5abXI/tMRr3J/KLRiieXqWC2Hr2beErYmFIXgVCimpH2A5fuqIU6HGsYbj6kwgdg==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr4807739wro.375.1622826772968; 
 Fri, 04 Jun 2021 10:12:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s7sm22532wmh.38.2021.06.04.10.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79E9F1FFD4;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 63/99] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
Date: Fri,  4 Jun 2021 16:52:36 +0100
Message-Id: <20210604155312.15902-64-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

test is TCG-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/bios-tables-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 762d154b34..f8fe4b8efe 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1484,6 +1484,13 @@ static void test_acpi_oem_fields_virt_tcg(void)
     };
     char *args;
 
+#ifndef CONFIG_TCG
+    if (data.tcg_only) {
+        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
+        return;
+    }
+#endif /* CONFIG_TCG */
+
     args = test_acpi_create_args(&data,
                                  "-cpu cortex-a57 "OEM_TEST_ARGS, true);
     data.qts = qtest_init(args);
-- 
2.20.1


