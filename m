Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47D433512
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:51:01 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcne0-0008R5-Kg
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnD1-0004Gs-J3
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.153.124]:42195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnCz-0003yL-UF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+l55gFO3MSoGNl8FmX8HypllSa9dmHDnz4W6+bwhZI4=;
 b=bv1LpsCuZKxoSrCCxcf94Z3dQpZArCrXJYS4Ku7/T9pOV7NovsKtQW7WgK0A9tbsxZR3t5
 FeGe7rVBkqOxCHpoyxOgh3050+daCWDpdr391kKkkKL9PMH9xMk5FvSaxql+tHto33AM0O
 YhfJAMyLp6CoaslEXd0JRAOsVgLZVGc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-mrXGjczBNeepLJTLXm3bEA-1; Tue, 19 Oct 2021 07:20:27 -0400
X-MC-Unique: mrXGjczBNeepLJTLXm3bEA-1
Received: by mail-ed1-f69.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so17313429edi.19
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+l55gFO3MSoGNl8FmX8HypllSa9dmHDnz4W6+bwhZI4=;
 b=hnY5eqZFhWoH5K/rtclHdt3PXh409W4qtJZ077AfEbxph02jlLgrgL7/HJqBESBN8X
 S0EcqETxUzFEfbhT/7D7u6cBdjzVlCtIR6X3gicNu3J3WdgoQsUnjQwfupwVCvlDdJDb
 o3U3JPnw4RmSBrTsZPoneLEbBAwPDmYoQ92lK3HV09KjFLW5zL4b9nRuhuU4qXhb9h1K
 JTyGM1D6WW1vJFYUIVnor5nGhd1XT0IW76QSine2CzvQSFHMY03sAurvwdCtmlO8li69
 54ixlFgIEsGZwzzWWAUdb0gzl2iDZwtKjl1V7p5TRbCVDUCrtMtFSaY3bwwPcO3Zghxx
 oSkw==
X-Gm-Message-State: AOAM533gjSdagbfQpOiSsu1jTNiXmY8pRrgD2bUOUgTADLl0ErRGxSkI
 gBi7CSKZxtdimt0J4szK/Zb+gtc75xF4yblEQ8whdTf5HhaZ6rleNtmA7MGz4nzMXsDEJ5PpBck
 iJ6MQgyCcUTou5cN+td5PXD6EhgF/SZm20OxE99ccpmLgugh6dh/bPEMgFTYw
X-Received: by 2002:a17:906:b311:: with SMTP id
 n17mr35830315ejz.571.1634642425537; 
 Tue, 19 Oct 2021 04:20:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW0LM7j6SIwVsT58GmKvqGEeqvb7tU0DjdJPkcVrwkxeZOsEKdtgLzizxFETXtmWYuIpQR/Q==
X-Received: by 2002:a17:906:b311:: with SMTP id
 n17mr35830289ejz.571.1634642425285; 
 Tue, 19 Oct 2021 04:20:25 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id g8sm12594724edb.60.2021.10.19.04.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:24 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/29] tests: bios-tables-test: use qtest_has_accel() API to
 register TCG only tests
Message-ID: <20211019111923.679826-16-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.153.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

 .. only if TCG is available

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-16-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 873eb9c037..6e21a650d2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -722,13 +722,6 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
-
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
     test_acpi_load_tables(data, use_uefi);
@@ -1544,6 +1537,7 @@ int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
     const bool has_kvm = qtest_has_accel("kvm");
+    const bool has_tcg = qtest_has_accel("tcg");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1590,7 +1584,6 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/smm-compat-nosmm",
                        test_acpi_q35_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
@@ -1600,19 +1593,24 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+        if (has_tcg) {
+            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
+            if (strcmp(arch, "x86_64") == 0) {
+                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            }
         }
         if (has_kvm) {
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
-        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        if (has_tcg) {
+            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+            qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        }
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
MST


