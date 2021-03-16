Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A53B33DBBA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:59:01 +0100 (CET)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDy7-00064R-KX
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRT-00006T-6O
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRQ-0002tn-QC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8BJo/26emKOzTViZLjTILM8WZDfyElz+uQ2fAjq3CA=;
 b=aNe58WH3ufE+hAstI0cCY1kHDwSnmiwR8qc5RX0i00L3WUV0sawA0Jyrzj2CehrCZzXcJv
 9pnWhHz2e9IJDdcvb7WRE2G5Hhu/YDo6GFEyMtgitwxK9X5PL3Yp0Qnwf1ZEFkExHnJSWc
 zR9UZoBAbGCtM3UeiQtTIT6ED85FplQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-Qr5Fo695Mgag7VybIwbBww-1; Tue, 16 Mar 2021 13:25:10 -0400
X-MC-Unique: Qr5Fo695Mgag7VybIwbBww-1
Received: by mail-wr1-f70.google.com with SMTP id b6so1670141wrq.22
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8BJo/26emKOzTViZLjTILM8WZDfyElz+uQ2fAjq3CA=;
 b=OI4Lt7FcWyTxSbSEpRfaJezV9ZCeaHQuhfpksLNyUIXTGrIXXjFNg/KPhrMeyva/aL
 Fo+fKUSyG6pWU/uRqi2lc92Wdp1jEl28UZ63yKEx+7RBUPNeR9lsH2nXVfUpFVgEoB5x
 +sk5QKZ2hAU2HOXR29XvTLBoBD/GHouaK/7+aockpVqxbJIaBWGpU49qGB9KhLY66wZ9
 t5xu6yA8uknomAPBFPuTlC01Ts8Wy6VhQa4Z1vwK4dh/E/sUl1r9e7OgluiklJ/CpKyo
 wdBxCWGAU6MWKZMZe7SktG10bmd1WyFoQ7GSmz6Tu2PcByjYVS5UsckLq5owztkSlviK
 5isg==
X-Gm-Message-State: AOAM532JADikRP8TnJQG97DHI1vdahyvQxQkV5N4ZqAEIhkut90vOCis
 tSSL5CJMNQuchAywuky6+K/cnSi7pOl85Jz9wxDpw9lgvXKB6q9w05sn70e438W74+mdt6qUBRu
 aVGiaK6Nf+dfScZsw3muEVwcDpXLtmCsmVREMbD7YXfeh1ovTqzmMBG5O/MeLnRN3
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr143108wrt.28.1615915508179;
 Tue, 16 Mar 2021 10:25:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuYo1PDe2mgnPdR1bwIVAawoeLpKwnIx5y7maNdD8qLqoNSupsHDrn3YXGrn+TJFDc4hIGng==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr143074wrt.28.1615915507993;
 Tue, 16 Mar 2021 10:25:07 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p17sm34574wmq.47.2021.03.16.10.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:25:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] qtest/bios-tables-test: Make test build-independent
 from accelerator
Date: Tue, 16 Mar 2021 18:24:48 +0100
Message-Id: <20210316172449.3148634-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316172449.3148634-1-philmd@redhat.com>
References: <20210316172449.3148634-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: use global tcg_accel_available, call qtest_has_accel() once
---
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 47 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e020c83d2a5..52587aeb6b1 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -97,6 +97,7 @@ typedef struct {
     QTestState *qts;
 } test_data;
 
+static bool tcg_accel_available;
 static char disk[] = "tests/acpi-test-disk-XXXXXX";
 static const char *data_dir = "tests/data/acpi";
 #ifdef CONFIG_IASL
@@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_data *data)
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
+
     test_acpi_load_tables(data, use_uefi);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
@@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     int ret;
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
             return ret;
         }
         qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
-        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
-        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
-        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
                        test_acpi_piix4_no_root_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
                        test_acpi_piix4_no_bridge_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/off",
                        test_acpi_piix4_no_acpi_pci_hotplug);
-        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
-        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
-        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
-        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
-        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
-        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
-        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
-        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
-        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
-        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
-        qtest_add_func("acpi/piix4/smm-compat",
-                       test_acpi_piix4_tcg_smm_compat);
-        qtest_add_func("acpi/piix4/smm-compat-nosmm",
-                       test_acpi_piix4_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
-        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
-        qtest_add_func("acpi/q35/smm-compat",
-                       test_acpi_q35_tcg_smm_compat);
-        qtest_add_func("acpi/q35/smm-compat-nosmm",
-                       test_acpi_q35_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
-        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
-        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
-        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
-        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
-        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
-        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+        if (tcg_accel_available) {
+            qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
+            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
+            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
+            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
+            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
+            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
+            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
+            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
+            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
+            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
+            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
+            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
+            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
+            qtest_add_func("acpi/piix4/smm-compat",
+                           test_acpi_piix4_tcg_smm_compat);
+            qtest_add_func("acpi/piix4/smm-compat-nosmm",
+                           test_acpi_piix4_tcg_smm_compat_nosmm);
+            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
+            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
+            qtest_add_func("acpi/q35/smm-compat",
+                           test_acpi_q35_tcg_smm_compat);
+            qtest_add_func("acpi/q35/smm-compat-nosmm",
+                           test_acpi_q35_tcg_smm_compat_nosmm);
+            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
+            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
+            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
+            qtest_add_func("acpi/piix4/acpihmat",
+                           test_acpi_piix4_tcg_acpi_hmat);
+            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
+            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
+            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
+            qtest_add_func("acpi/microvm/ioapic2",
+                           test_acpi_microvm_ioapic2_tcg);
+            if (strcmp(arch, "x86_64") == 0) {
+                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            }
         }
     } else if (strcmp(arch, "aarch64") == 0) {
-        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+        if (tcg_accel_available) {
+            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+        }
         qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
     }
     ret = g_test_run();
-- 
2.26.2


