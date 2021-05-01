Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980B37093B
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:43:27 +0200 (CEST)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyKc-0003MG-H6
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEn-00052t-CD
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEl-0008Vu-He
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QexIH/VTNKxOuVblouGzmBuPgjBWLL7wx7SLN7JtrI=;
 b=ENeYPdc6rba3mL2XulpWCMnx4Sv9AjHeBNZZE3hNeUjlgqGNUYHNoI4dfro68t4G/grBnt
 0jUh6jujOXZA6ChiJ+nu5npyZ2AIdV9ayxmwovwkBScp4TIfFlhQWoAA3orPdfAf88w4vU
 2Bj7bEP6AMzVN6LzcK62be11f9rqSrU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-xvV2BEoOOfeHPxfc42sdSg-1; Sat, 01 May 2021 18:37:21 -0400
X-MC-Unique: xvV2BEoOOfeHPxfc42sdSg-1
Received: by mail-wr1-f72.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so1266631wrs.19
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/QexIH/VTNKxOuVblouGzmBuPgjBWLL7wx7SLN7JtrI=;
 b=pHpTWTa6OH/E4AaCfobQctwVLXFGGDWQ+67+rfu1GBwZAFvYC6BKrJfvi8q8jsPKmo
 IZzplf4DIIM7jPKpuGTLgRbc1DKDsvO7ME/W2+r4D6lNd6LXIRQBfYirEAXjZ0VAfpul
 +8Xah0Z1CsQs5bVmTqU3IZppvya6RWkXXYD5H38j5ZUYL8vA5V95EzrdBMdWkzAIMuI7
 BzLd7XEJqqKv34UZEy6x6u54jG29grJslXuiAX1KOo4s7hmOdGYoDVIev2ITckabqfN9
 jY7kljnDo9OveRL61JQUz0+TBIOq/s38YCZQB7R7x4gS5wxnJmUVxPSYDUbo5gGaXDfM
 H05A==
X-Gm-Message-State: AOAM531HsNY606Zy1Pqop+IFpETHH8HqP2eAnkf4wlXPtJurdjXGcUdU
 9GKcTR1U0p+lzbrraX6doDCm6RGVfkLePgO4MNN0gj0jgm4llR4BaUK2FvnVjoKBkC2q3PaCG8r
 DvKlusytkgvz+oTm1M3Z0yFNAwbpPVFDGD/9VG2EB0eVvOY46Z642MZLVEOrNmOr8
X-Received: by 2002:a7b:c382:: with SMTP id s2mr9239121wmj.75.1619908640294;
 Sat, 01 May 2021 15:37:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfH+8IfuCWS4C80siMbM4CRyn1o7/pTPOyHVuWmCT4uwbcWqFgSop1wAWwfA2cuLdKdEB3wQ==
X-Received: by 2002:a7b:c382:: with SMTP id s2mr9239092wmj.75.1619908640083;
 Sat, 01 May 2021 15:37:20 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id t17sm6524586wmq.12.2021.05.01.15.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:37:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/10] qtest/bios-tables-test: Make test build-independent
 from accelerator
Date: Sun,  2 May 2021 00:36:36 +0200
Message-Id: <20210501223638.510712-9-philmd@redhat.com>
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 47 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 156d4174aa3..a4c7bddf6f3 100644
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
2.26.3


