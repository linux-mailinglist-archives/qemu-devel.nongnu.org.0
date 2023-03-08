Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0A6AFC1F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM7-0003hc-J2; Tue, 07 Mar 2023 20:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLr-00035f-08
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLo-0001e7-Tc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LNPdCgNcGFicFdbhUZpb5Sxp+gVyCyM6+pEBdFgxZcU=;
 b=QHi8WQ/y6AxgjxWKGPhMFSm4j/0dmpa91iBnaIvZmMB3ya/x8Wb1EXRULvI9tpSYrosmA+
 7BHMcB1G1Kv5mKv0ZfhqYa8Z3AVtyEeQRZJrXp2wvoW8ijsg3ACqGqOPtPb5zZkADRMuWx
 SI4T/rghlSR2i/ECQO0xb2uKPfDyAKw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-rVHuTq8wMB2sm6mtLpT6xg-1; Tue, 07 Mar 2023 20:12:15 -0500
X-MC-Unique: rVHuTq8wMB2sm6mtLpT6xg-1
Received: by mail-ed1-f70.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so21289391eda.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNPdCgNcGFicFdbhUZpb5Sxp+gVyCyM6+pEBdFgxZcU=;
 b=g1VtvNw6PGm/g5DgNJE4x5hY2SG8VuT30P4eiVray9H7KShO29dIeJxsmrrm6nJA7M
 j3SN8Ysrr/jQhvuOOt9hLW1q3WIlS7ahUAfmhS3ARuR2r+9qRK/JZYp0KEziZSK4r2aD
 hlsuRQ0VyhLScNr/5aLu+yQXXV6RLBwlA244Pfpg/0Ula4WJCYJzy1y73QzOUKS5my0B
 O7Uz3XdwgxmK10VIoHpxA2rCHOW4Hx95+eEbe6Bg/GQTda7NN5p3ucQDd5su+cJ95/T8
 ot94b0XotSvY7TvjbZ13jZdq7AywfVWqLMnMI3HAqVF6kbqXh+N5XDuv+yn6P8cYoLm5
 tiLA==
X-Gm-Message-State: AO0yUKVnSMViCxPD7bxhdUKnuMPBPNXxt9X0BDDX7IptNDTn5we995Q1
 /njTvWt+2nfVsLBkRX1bdGEBY8ukULpqCgeFnDB0fnOgF1K/GsTVcQu7QIEbIelrG1PnhkNgb7a
 0XLQ54bz7CFH9d7LnkzbVcLq51RmR/6tTlzONb2GV/255TcJtFGnyrFIaxx9YbdXd44vb
X-Received: by 2002:a17:906:539a:b0:88d:f759:15ae with SMTP id
 g26-20020a170906539a00b0088df75915aemr16590449ejo.42.1678237933458; 
 Tue, 07 Mar 2023 17:12:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+fc4knA6K0C+PdESDjLyFIMKOlwNOTWsDO3PFM6Iee3VeFOcUkhjHk92FTRrmDZj9PzDHnhw==
X-Received: by 2002:a17:906:539a:b0:88d:f759:15ae with SMTP id
 g26-20020a170906539a00b0088df75915aemr16590435ejo.42.1678237933211; 
 Tue, 07 Mar 2023 17:12:13 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 21-20020a170906309500b008b1779ba3c1sm6744393ejv.115.2023.03.07.17.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:12 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 27/73] Revert "tests/qtest: Check for devices in
 bios-tables-test"
Message-ID: <7cb230788eb73aaadfa9336839bf5527bb4f0f4c.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

This reverts commit c471eb4f40445908c1be7bb11a37ac676a0edae7.

which broke acpi tables test and rebuild due to skipping some tests
even thought none of devices tests depend on weren't disabled.

As result it leads to some expected tables not being updated,
merge conflicts and tests failure.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-2-imammedo@redhat.com>
Acked-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 75 ++--------------------------------
 1 file changed, 4 insertions(+), 71 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d29a4e47af..d8c8cda58e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1008,12 +1008,6 @@ static void test_acpi_q35_multif_bridge(void)
         .machine = MACHINE_Q35,
         .variant = ".multi-bridge",
     };
-
-    if (!qtest_has_device("pcie-root-port")) {
-        g_test_skip("Device pcie-root-port is not available");
-        goto out;
-    }
-
     test_vm_prepare("-S"
         " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
         " -device pcie-root-port,id=rp0,multifunction=on,"
@@ -1049,7 +1043,6 @@ static void test_acpi_q35_multif_bridge(void)
     /* check that reboot/reset doesn't change any ACPI tables  */
     qtest_qmp_send(data.qts, "{'execute':'system_reset' }");
     process_acpi_tables(&data);
-out:
     free_test_data(&data);
 }
 
@@ -1403,11 +1396,6 @@ static void test_acpi_tcg_dimm_pxm(const char *machine)
 {
     test_data data;
 
-    if (!qtest_has_device("nvdimm")) {
-        g_test_skip("Device nvdimm is not available");
-        return;
-    }
-
     memset(&data, 0, sizeof(data));
     data.machine = machine;
     data.variant = ".dimmpxm";
@@ -1456,11 +1444,6 @@ static void test_acpi_virt_tcg_memhp(void)
         .scan_len = 256ULL * 1024 * 1024,
     };
 
-    if (!qtest_has_device("nvdimm")) {
-        g_test_skip("Device nvdimm is not available");
-        goto out;
-    }
-
     data.variant = ".memhp";
     test_acpi_one(" -machine nvdimm=on"
                   " -cpu cortex-a57"
@@ -1474,7 +1457,7 @@ static void test_acpi_virt_tcg_memhp(void)
                   " -device pc-dimm,id=dimm0,memdev=ram2,node=0"
                   " -device nvdimm,id=dimm1,memdev=nvm0,node=1",
                   &data);
-out:
+
     free_test_data(&data);
 
 }
@@ -1492,11 +1475,6 @@ static void test_acpi_microvm_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off",
                   &data);
@@ -1507,11 +1485,6 @@ static void test_acpi_microvm_usb_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".usb";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,usb=on,rtc=off",
@@ -1523,11 +1496,6 @@ static void test_acpi_microvm_rtc_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".rtc";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=on",
@@ -1539,11 +1507,6 @@ static void test_acpi_microvm_pcie_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
     data.tcg_only = true; /* need constant host-phys-bits */
@@ -1556,11 +1519,6 @@ static void test_acpi_microvm_ioapic2_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".ioapic2";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=on,rtc=off",
@@ -1600,12 +1558,6 @@ static void test_acpi_virt_tcg_pxb(void)
         .ram_start = 0x40000000ULL,
         .scan_len = 128ULL * 1024 * 1024,
     };
-
-    if (!qtest_has_device("pcie-root-port")) {
-        g_test_skip("Device pcie-root-port is not available");
-        goto out;
-    }
-
     /*
      * While using -cdrom, the cdrom would auto plugged into pxb-pcie,
      * the reason is the bus of pxb-pcie is also root bus, it would lead
@@ -1624,7 +1576,7 @@ static void test_acpi_virt_tcg_pxb(void)
                   " -cpu cortex-a57"
                   " -device pxb-pcie,bus_nr=128",
                   &data);
-out:
+
     free_test_data(&data);
 }
 
@@ -1812,12 +1764,6 @@ static void test_acpi_microvm_acpi_erst(void)
     gchar *params;
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        g_free(tmp_path);
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
     data.tcg_only = true; /* need constant host-phys-bits */
@@ -1878,11 +1824,6 @@ static void test_acpi_q35_viot(void)
         .variant = ".viot",
     };
 
-    if (!qtest_has_device("virtio-iommu")) {
-        g_test_skip("Device virtio-iommu is not available");
-        goto out;
-    }
-
     /*
      * To keep things interesting, two buses bypass the IOMMU.
      * VIOT should only describes the other two buses.
@@ -1893,7 +1834,6 @@ static void test_acpi_q35_viot(void)
                   "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
                   "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
                   &data);
-out:
     free_test_data(&data);
 }
 
@@ -1954,10 +1894,8 @@ static void test_acpi_virt_viot(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    if (qtest_has_device("virtio-iommu")) {
-        test_acpi_one("-cpu cortex-a57 "
-                       "-device virtio-iommu-pci", &data);
-    }
+    test_acpi_one("-cpu cortex-a57 "
+                  "-device virtio-iommu-pci", &data);
     free_test_data(&data);
 }
 
@@ -2066,11 +2004,6 @@ static void test_acpi_microvm_oem_fields(void)
     test_data data;
     char *args;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
 
     args = test_acpi_create_args(&data,
-- 
MST


