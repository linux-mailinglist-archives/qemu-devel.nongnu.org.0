Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC54A39BCCB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:13:53 +0200 (CEST)
Received: from localhost ([::1]:46772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCSG-0002SS-NE
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8b-0002uS-4G
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8Y-00005q-NJ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:32 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a20so9852847wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4sdlJss3fc5mJwXHCh2ySSBFoRnKokoMtehS+ckwhM=;
 b=QTkPKJc14r1NA8Dkr7oI7muo1JR5+lKUzKCMV3FSzcnGm6bOxfrLlgcR+1EVYXfxdb
 IsM61dWNcNeerTgF6tIgk3I/1vl8AEJHkoTqaVIOVcvaR1D9VqLnb2A9Ex6Ttt/I+ITC
 Gp6NImQJVwKPRCguWTnsEMpkPWkMmolpHruLc2k+A7MSxLLoK547HTBjszHi4yFEMCwR
 NdXvV1Czo3jvLjkCE50t6ip6kMsU42tNifRWkxa5OwsftoZ/YEToc0qTu5DPife7iYrE
 r1aPyWJSmAe1gVn1ZDAaoeG9PBqBPqcT/gbXHMSzCUoy5KVaKi5FN8UzUImlmlRtZVQF
 pfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4sdlJss3fc5mJwXHCh2ySSBFoRnKokoMtehS+ckwhM=;
 b=tgFJj4VNhUWjRhn0jXs+ucfbWL+p5OvNVQp2Xcn2vk171YZ05/tI6nRBgOQlG5850E
 MrJF0CMe6roOQZrktI5AWtDYQpUPwDCYPDDdUj/gAiTI1xDkNAaX/Hvc+8f0MhDf7H3p
 mGQCm8U+2Km/TA2YatIHcZJgrdd35MbSC8HEGGVq0vSqTjMiMWkOjeGbvfp2pFhgq47p
 Ca3QbZdTfW5yDJK7bLUdwi/sE6o5mGa1qU5eQt5xQEtXRVYhORAzaXYGlghLOwie8jRG
 cOVr1Z+in0mXSSfsIJf1Y52EGwuay/xHIOt2wAfDDh9xl2uwadruv/OZKoFB5mKV7dKL
 jZjw==
X-Gm-Message-State: AOAM532exfJZ5hJXa0gGUf086J0X2s+6+aJJ5RQBCr+zkUhNZXpZ5qoA
 A5/hIYIYEts895unzRsaNpXI7w==
X-Google-Smtp-Source: ABdhPJzUT78bZHXyFi3wI1MmDI0ZvyoeOzcCvYDdb/ivew4dBjQpWgF2bXZ18j5F5eaNd6dpcWHpyw==
X-Received: by 2002:adf:a108:: with SMTP id o8mr4732699wro.290.1622822009072; 
 Fri, 04 Jun 2021 08:53:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s62sm9212366wms.13.2021.06.04.08.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E8C71FF9A;
 Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 11/99] qtest/bios-tables-test: Make test build-independent
 from accelerator
Date: Fri,  4 Jun 2021 16:51:44 +0100
Message-Id: <20210604155312.15902-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Now that we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-12-philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ad877baeb1..762d154b34 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -97,6 +97,7 @@ typedef struct {
     QTestState *qts;
 } test_data;
 
+static bool tcg_accel_available;
 static char disk[] = "tests/acpi-test-disk-XXXXXX";
 static const char *data_dir = "tests/data/acpi";
 #ifdef CONFIG_IASL
@@ -718,12 +719,7 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
+    assert(!data->tcg_only || tcg_accel_available);
 
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
@@ -1506,6 +1502,8 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
@@ -1554,10 +1552,10 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
+        if (strcmp(arch, "x86_64") == 0 && tcg_accel_available) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
-    } else if (strcmp(arch, "aarch64") == 0) {
+    } else if (strcmp(arch, "aarch64") == 0 && tcg_accel_available) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-- 
2.20.1


