Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC2737225C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:19:48 +0200 (CEST)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfyl-0006g8-Lx
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqa-0005aJ-Q8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqY-0007Wx-4e
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmsGdAeXnbzcEUQtPxKNfenyqUfv4M7E039KtK+jd+o=;
 b=APHVwvOWNXnwZQEPkumPTUi+uXZlNkXNNjrCpdgtjJIS1Vig3qwRbrvlsjauZTeE1nc3kw
 X9N1OvriKHPGo4zHO9jV/v568tgS0Mw/AdUlvnqo8mthuww1PobWxqmKMPbY1qmuaM+U0B
 ghfhBWUILtuLBEaXUor2oBN74u8Hako=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-US6lSkCmNZ64tomjyphDCQ-1; Mon, 03 May 2021 17:11:16 -0400
X-MC-Unique: US6lSkCmNZ64tomjyphDCQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d9-20020a1cb4090000b02901494f55f719so526030wmf.9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lmsGdAeXnbzcEUQtPxKNfenyqUfv4M7E039KtK+jd+o=;
 b=gjDM1x84YXXcz50ioodt0cyF2MKl3n8MEOXyy5KLcgg8Ohs4kTaVIA4ribexdQsKhI
 yA6V9ZJ6x1hQGGLGBL6AT5HGORKYFgEpYipGPXzM6bFsHGpd/N/xu15dlQ0f8IpkExVD
 LZdltdJGO189ITq6Z9+VdVb//5fSTLY40sCnQUm3eIno4V6l16u+9ZiNHXL6boDnbD7s
 MQBbqtWD1LW7A9wS7QNoHyhsS1EysreBorJNX8tzOy8YZIpukhXahNzF6MpFcli1VoMO
 KoxMtE+mmVVl7rkGPYgCOO8hQUBE+EHSEIdq5T9Nlb2hpbgApHg6kjjyIgRx6+asxfpi
 L70Q==
X-Gm-Message-State: AOAM532QpEPAyERJLb19Yf1yxAJk6sMK6WFOOA82RPkSIDsCKYQ4fR8f
 SE7Z5VZhnxfOYcQSKZTmC2ExnfNf3pZqntdupR7g+dO4fOopfqeMZJb8l7C9kjFFL9jiCFJU/Jl
 HTrxZyqMmGk4xfkJOJQGxIeCFjVnICd1RiB5UcSdaBciK3x8Qd4+aEPL4W8n5BTsX
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr27173556wry.265.1620076273916; 
 Mon, 03 May 2021 14:11:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzCovPDjxNrmplILnOlRHQ5+ryzIomT1pj36iIqeQ5U3Fc2o577r73dCZ66u6cwAo0v9sy7w==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr27173524wry.265.1620076273664; 
 Mon, 03 May 2021 14:11:13 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id b12sm13765763wro.28.2021.05.03.14.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:11:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/12] qtest/bios-tables-test: Rename TCG specific tests
Date: Mon,  3 May 2021 23:10:18 +0200
Message-Id: <20210503211020.894589-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests require TCG, but don't have '_tcg' in their name,
while others do. Unify the test names by adding 'tcg' to the
TCG specific tests.

Reported-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ce498b3ff48..ad877baeb1b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc(void)
     free_test_data(&data);
 }
 
-static void test_acpi_microvm_pcie(void)
+static void test_acpi_microvm_pcie_tcg(void)
 {
     test_data data;
 
@@ -1475,7 +1475,7 @@ static void test_acpi_oem_fields_microvm(void)
     g_free(args);
 }
 
-static void test_acpi_oem_fields_virt(void)
+static void test_acpi_oem_fields_virt_tcg(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1555,14 +1555,14 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie);
+            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt_tcg);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.26.3


