Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8392F4AAEC3
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:06:14 +0100 (CET)
Received: from localhost ([::1]:38524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeQv-0007B6-9w
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:06:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0T-0001IV-2F
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0R-0003kR-3t
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMs3Bqr7ndxy424fwUSUxAviE1013bB9zLk/9skNKHQ=;
 b=APEYgOX9BhFWl5opYTy3zDbnJM5uT3eCEeBUCCLu/qMQhbWSN/hP/cZM2D2UZpl5a9OKWh
 dTFt6oFlMk9JW2m3HYYs/iWuFO1aL7QgWMG0pffSbJKewDrYPCJt6Bg9Bw/lnBCpmH4Hwn
 2S7bolD5KWBeBlxQ5ojYPXy16tDm3DM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-1ubf8qo5NlaKfX6cvkknxw-1; Sun, 06 Feb 2022 04:38:49 -0500
X-MC-Unique: 1ubf8qo5NlaKfX6cvkknxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso5869874wmh.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UMs3Bqr7ndxy424fwUSUxAviE1013bB9zLk/9skNKHQ=;
 b=HtaRAnMjMGF8ReAt2HAG4Tl2VeiXiIIZSS+GbTeeOkqAQXKEtCvjPi7dHMhky7bAco
 eYZxh+5m/5LWTb/bkT6Udc7AzDbVzkeYjYNrIU0wGsAMmWXoYuMWBKHuEC7L4cchwu9N
 OUn2zwnl+XRdYOaSeO3I4F04qd3re1008LosGHsTYhPwoZB5lOMPS8sUKZjj5k/S3PgA
 KZ0x64FGpIdaJQDZUf5CV518aggENubWvBOwP4vzch7KBFw/oSulhkbI1SvhvMkiCqts
 xoGdFSny+qlbTPZ7vxZNLHVjsY/B9wWJ6LP4M2/TH4+ebtAKjTqnekDRkno0uQchTqIu
 Mw9Q==
X-Gm-Message-State: AOAM531thEftLmm/l2we9lh4iaJcYrrLd2haknK0s1vDNPaj0if+gTi9
 PZZzgg3OhAuChsUTI8g03bmb19SZPxxS58uxbtvwpnJBLcPUrfWkvNOYw6Vk+KaRhQt7Nrdh8oS
 dKGVAKTP8hHCcHZPVCkBGSDSuxE3LcS4Z2o5BUB+wHrbmTTpsyRfw9zTdH3Fn
X-Received: by 2002:a05:600c:3b92:: with SMTP id
 n18mr6334772wms.86.1644140327722; 
 Sun, 06 Feb 2022 01:38:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVanRrCLhN+b06K6b0KpPNtHJphU7s1HRB6SjVHJx48QWsc8JcayM4833tR+Nnu8tv0PvOsA==
X-Received: by 2002:a05:600c:3b92:: with SMTP id
 n18mr6334751wms.86.1644140327458; 
 Sun, 06 Feb 2022 01:38:47 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id z3sm6684243wmp.42.2022.02.06.01.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:47 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/24] ACPI ERST: bios-tables-test testcase
Message-ID: <20220206093702.1282676-23-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

This change implements the test suite checks for the ERST table.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <1643402289-22216-10-git-send-email-eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 54 ++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ad536fd7b1..c4a2d1e166 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1447,6 +1447,57 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
+static void test_acpi_erst(const char *machine)
+{
+    gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
+    gchar *params;
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = machine;
+    data.variant = ".acpierst";
+    params = g_strdup_printf(
+        " -object memory-backend-file,id=erstnvram,"
+            "mem-path=%s,size=0x10000,share=on"
+        " -device acpi-erst,memdev=erstnvram", tmp_path);
+    test_acpi_one(params, &data);
+    free_test_data(&data);
+    g_free(params);
+    g_assert(g_rmdir(tmp_path) == 0);
+    g_free(tmp_path);
+}
+
+static void test_acpi_piix4_acpi_erst(void)
+{
+    test_acpi_erst(MACHINE_PC);
+}
+
+static void test_acpi_q35_acpi_erst(void)
+{
+    test_acpi_erst(MACHINE_Q35);
+}
+
+static void test_acpi_microvm_acpi_erst(void)
+{
+    gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
+    gchar *params;
+    test_data data;
+
+    test_acpi_microvm_prepare(&data);
+    data.variant = ".pcie";
+    data.tcg_only = true; /* need constant host-phys-bits */
+    params = g_strdup_printf(" -machine microvm,"
+        "acpi=on,ioapic2=off,rtc=off,pcie=on"
+        " -object memory-backend-file,id=erstnvram,"
+           "mem-path=%s,size=0x10000,share=on"
+        " -device acpi-erst,memdev=erstnvram", tmp_path);
+    test_acpi_one(params, &data);
+    g_free(params);
+    g_assert(g_rmdir(tmp_path) == 0);
+    g_free(tmp_path);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg(void)
 {
     test_data data = {
@@ -1672,6 +1723,8 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
+        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
@@ -1681,6 +1734,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
             if (strcmp(arch, "x86_64") == 0) {
                 qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+                qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_acpi_erst);
             }
         }
         if (has_kvm) {
-- 
MST


