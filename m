Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89522D4905
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:30:56 +0100 (CET)
Received: from localhost ([::1]:36862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Ep-0004fD-ML
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sm-00024I-5z
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3si-0007yV-Pg
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WHE7KFDKGldERbfBu/1KjueHDoBVCOeK90uoPSHzyjk=;
 b=G3UFrpvHCWjFBNFzcUsZwT8Z+KOe0qn1VJshtYfS/sGsSjgZKaziYR29BeCmF23+WVJoRx
 ifMP5eEQTGtVTMHCeqVhRtuxI8mVPrGb7Q39AdWFC+cTzp6jcpwvG7y6aFdgKm/RbQCzI5
 Zn6OPGcazzuf9pyyFQVQKhhseSVXW+s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-J8jI-OjIMYWYEcbMFOffNQ-1; Wed, 09 Dec 2020 13:07:57 -0500
X-MC-Unique: J8jI-OjIMYWYEcbMFOffNQ-1
Received: by mail-wm1-f71.google.com with SMTP id f12so869882wmf.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WHE7KFDKGldERbfBu/1KjueHDoBVCOeK90uoPSHzyjk=;
 b=s96wfNr+RiMAuGvSgHBAi3MFiYp8cI/psOo4xl0BDDxGtYU89tTL+aUIfB4U3GzL+l
 W2gFm/jjWMEj5/jIhbrGkVFsAdcZqsXalqmRcof/Rm3ayU6CUp2TarE7EHp7i5T7U3Ro
 9Fn6y6yWZiYDCsTPYhY6E/4eEU5q6N4ObAYwGkWPiVjBxCEnelO1b52CqUxfXdC/58PF
 XpjbcPMW5CqvvyJvnafLHIy6o7konDTmR7yEZkOPJ6BK5kaigCZe83WJ6EScTfQL3SbC
 1G0Wa/wJWFfXuO7xCLhlrYHCjkd+YIlZx4Qjx3zhrER0lMAIRCVgDiizKOJ2Sw3SsXde
 /1cw==
X-Gm-Message-State: AOAM530mbiP3gMaS1H0HOVYzsiSwc6gftIp6MpvPVwjobLr5wXy0FZOt
 eZhtGdp44U3J1WBMlMaThxqh52QwHwoIetYecalSGFAo1ZcIftbdihEMbOux5etqdCzQmY/YcpH
 gER1vTf2f8w042uQHBQpKEdlnJXfi9LdGHlK+2dX9IQuu/2a7w3O1zc3bXmd0
X-Received: by 2002:a1c:770d:: with SMTP id t13mr4188310wmi.153.1607537275342; 
 Wed, 09 Dec 2020 10:07:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/7sDzCs8mh04mdDPmJOE6dvg5pzGFWqoUhPfX2JJBYJvh9qdhK1IjHp3crbQLvjVOAbW7Kw==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr4188283wmi.153.1607537275104; 
 Wed, 09 Dec 2020 10:07:55 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id t10sm5070718wrp.39.2020.12.09.10.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:54 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/65] unit-test: Add testcase for pxb
Message-ID: <20201209180546.721296-16-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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


