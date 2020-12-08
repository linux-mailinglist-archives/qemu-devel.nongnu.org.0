Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207BF2D32CB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:49:49 +0100 (CET)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmizc-0000m3-4M
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmiku-0005FP-2h
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikq-0004sT-1t
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WHE7KFDKGldERbfBu/1KjueHDoBVCOeK90uoPSHzyjk=;
 b=W+7ICiOIHEAOLNCvXl7LHklAMHrI/hibwe0SrDhJQR7cpfmmfLdsvv/CWILKCmckRyn0F+
 Ow1uiN2AH5hqiW4mh8IC5G+EKGADX/uump06iGeOKND104BRudCGTgchT2/Csn6vF1nzMg
 xSBYl/dUjwhRpSAsPwdS8YrTDn89aGA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-mKsQoEdFMIWM7laxXAv33Q-1; Tue, 08 Dec 2020 14:34:29 -0500
X-MC-Unique: mKsQoEdFMIWM7laxXAv33Q-1
Received: by mail-wm1-f69.google.com with SMTP id k23so1285085wmj.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WHE7KFDKGldERbfBu/1KjueHDoBVCOeK90uoPSHzyjk=;
 b=d9RsmMHiG53XUxvB5f+PR9RlwQ4QQDh9Z/6UaCZtRDsGxNA72M6WaFj/yY7NRdQWTc
 JsDflo+IAF8Vb1itJ15t+DHQRaetdEP/LRsYIJYmvc+MOTUgin7qdgQ3iRVL8e4kUMr1
 eOdNH1q9+Iv694M0zcto94sTbrbhO/6LARabWVsTVUBxjh8ygwf2UYN7ifZQsmktJ2Om
 PR+J7plskrm/8QZpyHSqZq/DGe/DG9bXF0sjtf0z6HSCC0LB+6zU+BBaK/V1iDfupELv
 cE8BAkO4VglnyXU2YxEpZHUv/sA4nKl1/eR5vBbochF9yhNYz97L4dWCi0JXGtyBRVcR
 uRCA==
X-Gm-Message-State: AOAM530li/IZMZskm6AAqVPoxnPqUk2ARCthc2yoJ/sIHmpUXRUtGFDx
 +CDBQ/fGGroz34pz1mZPkMbu4gdXKDb1H0iCcfD9lF/0Qo3Vq4vZ2K9C3X7wZeTDov9F+lOGuLw
 g5oDp/1D9QqBNMzk2MH+B+C/IlZy9zlBuZah+J4xD51iLkA+9/+tosXSkuwBu
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr25168124wrx.112.1607456067696; 
 Tue, 08 Dec 2020 11:34:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTbu3pSILCSGpCSm8hXCrXkmDpxrYIp/i+3MUtEJuN8Fg5tJ+TUzUWmcIahX+PZ4DnU69cbQ==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr25168099wrx.112.1607456067433; 
 Tue, 08 Dec 2020 11:34:27 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id e16sm11656976wra.94.2020.12.08.11.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:26 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/66] unit-test: Add testcase for pxb
Message-ID: <20201208193307.646726-16-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yubo Miao <miaoyubo@huawei.com>,
 Jiahui Cen <cenjiahui@huawei.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yubo Miao <miaoyubo@huawei.com>

Add testcase for pxb to make sure the ACPI table is correct for guest.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20201119014841.7298-9-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f23a5335a8..64a9a772ee 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -671,12 +671,21 @@ static void test_acpi_one(const char *params, test_data *data)
          * TODO: convert '-drive if=pflash' to new syntax (see e33763be7cd3)
          * when arm/virt boad starts to support it.
          */
-        args = g_strdup_printf("-machine %s %s -accel tcg -nodefaults -nographic "
-            "-drive if=pflash,format=raw,file=%s,readonly "
-            "-drive if=pflash,format=raw,file=%s,snapshot=on -cdrom %s %s",
-            data->machine, data->tcg_only ? "" : "-accel kvm",
-            data->uefi_fl1, data->uefi_fl2, data->cd, params ? params : "");
-
+        if (data->cd) {
+            args = g_strdup_printf("-machine %s %s -accel tcg "
+                "-nodefaults -nographic "
+                "-drive if=pflash,format=raw,file=%s,readonly "
+                "-drive if=pflash,format=raw,file=%s,snapshot=on -cdrom %s %s",
+                data->machine, data->tcg_only ? "" : "-accel kvm",
+                data->uefi_fl1, data->uefi_fl2, data->cd, params ? params : "");
+        } else {
+            args = g_strdup_printf("-machine %s %s -accel tcg "
+                "-nodefaults -nographic "
+                "-drive if=pflash,format=raw,file=%s,readonly "
+                "-drive if=pflash,format=raw,file=%s,snapshot=on %s",
+                data->machine, data->tcg_only ? "" : "-accel kvm",
+                data->uefi_fl1, data->uefi_fl2, params ? params : "");
+        }
     } else {
         args = g_strdup_printf("-machine %s %s -accel tcg "
             "-net none -display none %s "
@@ -1176,6 +1185,40 @@ static void test_acpi_virt_tcg_numamem(void)
 
 }
 
+#ifdef CONFIG_PXB
+static void test_acpi_virt_tcg_pxb(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+    /*
+     * While using -cdrom, the cdrom would auto plugged into pxb-pcie,
+     * the reason is the bus of pxb-pcie is also root bus, it would lead
+     * to the error only PCI/PCIE bridge could plug onto pxb.
+     * Therefore,thr cdrom is defined and plugged onto the scsi controller
+     * to solve the conflicts.
+     */
+    data.variant = ".pxb";
+    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
+                  " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
+                  " -drive file="
+                  "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
+                  "if=none,media=cdrom,id=drive-scsi0-0-0-1,readonly=on"
+                  " -device scsi-cd,bus=scsi0.0,scsi-id=0,"
+                  "drive=drive-scsi0-0-0-1,id=scsi0-0-0-1,bootindex=1"
+                  " -cpu cortex-a57"
+                  " -device pxb-pcie,bus_nr=128",
+                  &data);
+
+    free_test_data(&data);
+}
+#endif
+
 static void test_acpi_tcg_acpi_hmat(const char *machine)
 {
     test_data data;
@@ -1287,6 +1330,9 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+#ifdef CONFIG_PXB
+        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+#endif
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
MST


