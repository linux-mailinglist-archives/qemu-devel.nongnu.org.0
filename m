Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C994AA5BA
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:28:18 +0100 (CET)
Received: from localhost ([::1]:40470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAoE-0002bt-24
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7V-000497-QQ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7U-0003Rl-2w
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMs3Bqr7ndxy424fwUSUxAviE1013bB9zLk/9skNKHQ=;
 b=earPUV9QyjRTgfUqrD5aUsa99IclqD/j7xjy1jxBJakmwkH+JO9CQIbjSeWfBG1oYWfah8
 93/GuAXbESOb4MdZm1Dh6iVGN3jLx99v9hw42nkG/E8hthK6U56nRt0Vaq6DDeuTxfuVFk
 DYQ3B1jvssb0O2b9kQI5OkmxMvAa7po=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-xJ2vnJTvOt23-yZW8O-KwQ-1; Fri, 04 Feb 2022 20:44:05 -0500
X-MC-Unique: xJ2vnJTvOt23-yZW8O-KwQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 203-20020a1c02d4000000b0037b9ff5678cso1140045wmc.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UMs3Bqr7ndxy424fwUSUxAviE1013bB9zLk/9skNKHQ=;
 b=3mHfgAbRJ7q9Xu5kpEOgjoXpGvQi1DXn9er/F0da7TV1ShbeHYip/rphnupGVZh6DJ
 bY0f6m+ZyKnnmzrvvfxd/Cdxtc6bdTzOPwP83+a/Hfm7UVjeBm7tsUcCoFQElaUwqU9+
 LdBv2D32Js/o0bqFDmgoG7XxYWKqBwek4rOY/AVmF8c9kPDEK/L3BtxPDGDZ2RXnDGzE
 ocI+ynIdC5WWVT7I31I9fBN/L75t8V7O0NrNof/x1IG5fv7lYn+lXWcCcYQoGN8YJ3Ih
 tNLcP/6Sh0QhK7HiZyARP4HMsMixehZkii/osMiAPtFGz6fLyCQtGMtH2n9p3q8UfEwn
 uRaw==
X-Gm-Message-State: AOAM531nRkJJJcB8+dm1atg13x/Go9/0TjxNd47fmkA4J8RSsUlNY1+B
 YJ1ueJzz5LqwHV49KKLhkgwJqHNEEGf7Tqh7BIQyAR4UD7i7kfEmO/dMk0kOTFfLICFV9Avs9JQ
 peUjHEWRQHNHmJ7JN8CO0V7pntRUHx8XijBrdELW1dAGuNzsOQ7SgQfygdXCR
X-Received: by 2002:a05:600c:3d8a:: with SMTP id
 bi10mr1186240wmb.62.1644025444207; 
 Fri, 04 Feb 2022 17:44:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzM5wjMJUYE3dQs/jVjS2Pf5/FxnitYerLxg/+8OYNh6MaRFgKL5BowA+BRWwSm3VnBEKG0zQ==
X-Received: by 2002:a05:600c:3d8a:: with SMTP id
 bi10mr1186220wmb.62.1644025443980; 
 Fri, 04 Feb 2022 17:44:03 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id k6sm1705107wms.14.2022.02.04.17.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:44:03 -0800 (PST)
Date: Fri, 4 Feb 2022 20:44:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/32] ACPI ERST: bios-tables-test testcase
Message-ID: <20220205014149.1189026-31-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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


