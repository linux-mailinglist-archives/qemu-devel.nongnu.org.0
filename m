Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C9B661FBA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 09:13:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEnGS-0000Si-9U; Mon, 09 Jan 2023 03:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEnGR-0000SX-1W
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEnGO-000568-JQ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673251931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ya+cMYVzdJ59Dwqkd3nDTVFIZ6v+KDYo7sCX8w9FUdY=;
 b=L4W2y74k1LpFab8WRdZTIRVdo7HTwoxoFlX6UbXre7JHFNvekmAu2z1+712BZ2gcroYsrg
 tECvxLXzeOcesLHnTKJ5nB8h5ANBqL/pkbCWqOFCTTQ/aRMDBkbrTLBmeaIp9bfHc4mQnh
 BtnzaMA6G0vSXoLIzXyh80DZR54wAHU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-nTmrwFE6MFyvd4sJxjmCsw-1; Mon, 09 Jan 2023 03:12:09 -0500
X-MC-Unique: nTmrwFE6MFyvd4sJxjmCsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE60B1C0898D;
 Mon,  9 Jan 2023 08:12:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 691BF53AA;
 Mon,  9 Jan 2023 08:12:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] tests/qtest/bios-tables-test: Replace -no-hpet with hpet=off
 machine parameter
Date: Mon,  9 Jan 2023 09:12:05 +0100
Message-Id: <20230109081205.116369-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

We are going to deprecate (and finally remove later) the -no-hpet command
line option. Prepare the bios-tables-test by using the replacement hpet=off
machine parameter instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 395d441212..19b5b5a38b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -78,6 +78,7 @@
 typedef struct {
     bool tcg_only;
     const char *machine;
+    const char *machine_param;
     const char *variant;
     const char *uefi_fl1;
     const char *uefi_fl2;
@@ -776,26 +777,29 @@ static char *test_acpi_create_args(test_data *data, const char *params,
          * when arm/virt boad starts to support it.
          */
         if (data->cd) {
-            args = g_strdup_printf("-machine %s %s -accel tcg "
+            args = g_strdup_printf("-machine %s%s %s -accel tcg "
                 "-nodefaults -nographic "
                 "-drive if=pflash,format=raw,file=%s,readonly=on "
                 "-drive if=pflash,format=raw,file=%s,snapshot=on -cdrom %s %s",
-                data->machine, data->tcg_only ? "" : "-accel kvm",
+                data->machine, data->machine_param ?: "",
+                data->tcg_only ? "" : "-accel kvm",
                 data->uefi_fl1, data->uefi_fl2, data->cd, params ? params : "");
         } else {
-            args = g_strdup_printf("-machine %s %s -accel tcg "
+            args = g_strdup_printf("-machine %s%s %s -accel tcg "
                 "-nodefaults -nographic "
                 "-drive if=pflash,format=raw,file=%s,readonly=on "
                 "-drive if=pflash,format=raw,file=%s,snapshot=on %s",
-                data->machine, data->tcg_only ? "" : "-accel kvm",
+                data->machine, data->machine_param ?: "",
+                data->tcg_only ? "" : "-accel kvm",
                 data->uefi_fl1, data->uefi_fl2, params ? params : "");
         }
     } else {
-        args = g_strdup_printf("-machine %s %s -accel tcg "
+        args = g_strdup_printf("-machine %s%s %s -accel tcg "
             "-net none %s "
             "-drive id=hd0,if=none,file=%s,format=raw "
             "-device %s,drive=hd0 ",
-             data->machine, data->tcg_only ? "" : "-accel kvm",
+             data->machine, data->machine_param ?: "",
+             data->tcg_only ? "" : "-accel kvm",
              params ? params : "", disk,
              data->blkdev ?: "ide-hd");
     }
@@ -1141,8 +1145,9 @@ static void test_acpi_piix4_tcg_nohpet(void)
 
     memset(&data, 0, sizeof(data));
     data.machine = MACHINE_PC;
+    data.machine_param = ",hpet=off";
     data.variant = ".nohpet";
-    test_acpi_one("-no-hpet", &data);
+    test_acpi_one(NULL, &data);
     free_test_data(&data);
 }
 
@@ -1210,8 +1215,9 @@ static void test_acpi_q35_tcg_nohpet(void)
 
     memset(&data, 0, sizeof(data));
     data.machine = MACHINE_Q35;
+    data.machine_param = ",hpet=off";
     data.variant = ".nohpet";
-    test_acpi_one("-no-hpet", &data);
+    test_acpi_one(NULL, &data);
     free_test_data(&data);
 }
 
-- 
2.31.1


