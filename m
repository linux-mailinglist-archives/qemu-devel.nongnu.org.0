Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5A44706B6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:09:24 +0100 (CET)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjOd-0001mz-1p
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLV-0005su-CG
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:11 -0500
Received: from [2a00:1450:4864:20::534] (port=46028
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLS-0006UX-Oa
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:08 -0500
Received: by mail-ed1-x534.google.com with SMTP id y12so31183021eda.12
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VfJIAuyEAhLwuhBoYyQnuJQHssBC+STA/z+67u7l1ew=;
 b=vG1/pRcxwFgH8IKCp1EQY2wshzOxXgNabtdOVxRNHdsHvuCSOWtHAQ704k+JbXUmO6
 tmi6X9F1AdqAolibGQ52xfWFGO4eYxnEpKJY8RyMXkl5O9o5K62oOtWcntom//Bmjys5
 Mn6UOUBLPzvBgCljswxpXvafy92pJjZm47FPsrn0aH6EvHPY5LY/LIWGMBS87lPd4iUJ
 3OSQZ0izGM96574n6WDBPJvz57wSmzP4QVimAD7Cr8NF5txA6z7K2vESfzhqnmqEyCdW
 Fns4iN5DiB3twBXvuQK79p/z8XFIWEc4hlJFNtGvAsnTPicdHrUfZ3o/x+W+O+aZ6dpk
 YkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VfJIAuyEAhLwuhBoYyQnuJQHssBC+STA/z+67u7l1ew=;
 b=NU+bbEIzttMPueETg+2yi5VVvRSqVyZe+hgZtbEl4iyinDe4ZZbTJaSTN7GdTSzjC3
 lpEMB+wn185iHZNHLmnwj+r+K2r8lhODTXIhRH7Wl17HAc0Z/UbK8I3haF9SHrH/a4KU
 UanjX+IZppTqFY6Fkml60QcT0riIwVHqSYLY1vWkJwxMu1qjE37xiayKFZyue58sLh2G
 fjyBx5gQOU/ikUtWRE+fN+ZK7PdxZTYQbGUMm71gGSFU2QQ0VTiVGiV94e/E7iOeHnVm
 uRn0GHGJMTnGdjwJCqG9R/JF2kYP7Dz178yUEkYj+YC1oSL1r+nK53vr5sVhPAbf6DY7
 t67A==
X-Gm-Message-State: AOAM530PYN8J5oxfvGuMNIR9ZyGj2q2Rwz0iP+R9a+POGDaZHjUCrQ7B
 pHp3TXYHPei1kLjOvjgB06GXOA==
X-Google-Smtp-Source: ABdhPJyuXfM9M5ISzcyTYiQQwmcmZl6WSgxJbYSMzjRUmZs8VQWVBhE52rlnLaHdOX16PD5kynKq6w==
X-Received: by 2002:a17:907:94ce:: with SMTP id
 dn14mr25764618ejc.85.1639155961350; 
 Fri, 10 Dec 2021 09:06:01 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:06:00 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 6/8] tests/acpi: add test case for VIOT
Date: Fri, 10 Dec 2021 17:04:14 +0000
Message-Id: <20211210170415.583179-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two test cases for VIOT, one on the q35 machine and the other on
virt. To test complex topologies the q35 test has two PCIe buses that
bypass the IOMMU (and are therefore not described by VIOT), and two
buses that are translated by virtio-iommu.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 258874167e..58df53b15b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1465,6 +1465,42 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_viot(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".viot",
+    };
+
+    /*
+     * To keep things interesting, two buses bypass the IOMMU.
+     * VIOT should only describes the other two buses.
+     */
+    test_acpi_one("-machine default_bus_bypass_iommu=on "
+                  "-device virtio-iommu-pci "
+                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
+                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
+                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
+                  &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_virt_viot(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    test_acpi_one("-cpu cortex-a57 "
+                  "-device virtio-iommu-pci", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1639,6 +1675,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
+        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
@@ -1646,6 +1683,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
             qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
             qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+            qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
         }
     }
     ret = g_test_run();
-- 
2.34.1


