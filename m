Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC7322E9F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:20:54 +0100 (CET)
Received: from localhost ([::1]:37548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaQf-0005ds-Qb
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaDz-0000ea-HO
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:07:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaDx-0005LF-Uk
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xRuiajQC1YfeOqX65tuV4EMF3YnUxlH639qCU97W3A8=;
 b=IreHDSTzm4O9KS1It/NAqMGOsOdRDRX6EhUTWjDmECVZdP5FDMjfCEUeHoHMriOyzaHIUA
 PnxT6cTeow9L3IHYkTuhWwiCvtjqVyNjkma1s4mgW9+f/owYmloZ3IHt60EXGKliKda2zT
 0KM7yLuWWfB5wAhsxESBBvi3tJS4LUE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-y53C4rzPP5iP47WsPI2ayQ-1; Tue, 23 Feb 2021 11:04:24 -0500
X-MC-Unique: y53C4rzPP5iP47WsPI2ayQ-1
Received: by mail-wm1-f70.google.com with SMTP id f18so823227wmq.3
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xRuiajQC1YfeOqX65tuV4EMF3YnUxlH639qCU97W3A8=;
 b=EzWRYREcN1dWOcQ8RsOYTH/f4Y3SJXZpAiQMWw3limMirSDtxrgCFalV0bU2rBXn8q
 S/RwKOiOgLcjcDL/ViI7QAhyjgiwNOZpRnIZj3w6gsj2i0xwTcdiLN9hVDm/9VIGdX8n
 aZyqbxFxyDVfxiEINH54p2GILskbqgJkmVpq+gwhH8bAjF84E1/FQ0xg8SdQQuVAoqxC
 koGh0AMdsA0TM7loTTqY55jLbVM7PZbreTDbl2XtEtM0RB4lRYfdJysT5BAEzoOrQfUX
 i7m2Yin1r94Jbq7wrCdRrMH+u9y6RiBmEwcyprR+JKavn+me8fgaRalaclBsHs1ZivWK
 zEsg==
X-Gm-Message-State: AOAM5334BE0lvyxxFH51rHbLYo0zEZAbWKZF5jvFtYiYA1hSpWWSIBP7
 rEWCNpmC2CKgBrRb5KWc8D7bFQlhaMhxMSlHwGFAjf+gj8aa1h+xrQbxjMWvWOFJzmJR9wnURlo
 JfH5bkg5kzAnK39DJqsoG/7EP0G3MMHX3Qk5tahmnbZoTfj6afQJcowef5QfF
X-Received: by 2002:a1c:cc08:: with SMTP id h8mr26084208wmb.188.1614096263077; 
 Tue, 23 Feb 2021 08:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZFqy+/pwquY7vxo7HiPD9m9n6ccnmIt+etrT4th+Ffe1Wt494X60w1Cl9li9vUmBlmrIaiw==
X-Received: by 2002:a1c:cc08:: with SMTP id h8mr26084191wmb.188.1614096262925; 
 Tue, 23 Feb 2021 08:04:22 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id o15sm3088057wmh.39.2021.02.23.08.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:04:22 -0800 (PST)
Date: Tue, 23 Feb 2021 11:04:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/17] acpi: add test case for -no-hpet
Message-ID: <20210223160144.1507082-17-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <5ef9a81e49793afb42ffd19bbf1f44e269c65e93.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 93d037c29d..e020c83d2a 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1006,6 +1006,17 @@ static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
     free_test_data(&data);
 }
 
+static void test_acpi_piix4_tcg_nohpet(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".nohpet";
+    test_acpi_one("-no-hpet", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_numamem(void)
 {
     test_data data;
@@ -1051,6 +1062,17 @@ static void test_acpi_q35_tcg_smm_compat_nosmm(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_nohpet(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".nohpet";
+    test_acpi_one("-no-hpet", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1516,11 +1538,13 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_tcg_smm_compat);
         qtest_add_func("acpi/piix4/smm-compat-nosmm",
                        test_acpi_piix4_tcg_smm_compat_nosmm);
+        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
         qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
         qtest_add_func("acpi/q35/smm-compat",
                        test_acpi_q35_tcg_smm_compat);
         qtest_add_func("acpi/q35/smm-compat-nosmm",
                        test_acpi_q35_tcg_smm_compat_nosmm);
+        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-- 
MST


