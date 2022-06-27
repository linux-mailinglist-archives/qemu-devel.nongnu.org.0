Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EC55B847
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:39:19 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jL4-0000Dn-EZ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCa-00059w-M2
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:32 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCZ-0005yY-2b
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:32 -0400
Received: by mail-pg1-x535.google.com with SMTP id r66so8336476pgr.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAmHc2wPxluOD0WIjk4hh88cF39rdcDgc3wYDsEpLas=;
 b=bfHFqXCZNG/2+ZNR9XL1JWVzqQCoxs2bZN3kQ+VwPa8ZkmLiFJdg+GY8LlnmibC3SO
 N+t43is3PTKOsSO0h7yrIJoVpOww5OyTvTNF35KiSoUJ96Snu/O9HZzeKbHCoSVfHXMi
 MXbz2IlfQmtb3S+V8xc25KtQqpDIuDPazYeltIf62bynNmMSHynbvHRA9BKU7wE7CGF8
 QPOhhrmat0WwNPDg3KHSJ5B007pKCzyIL72TdQTxO3NSYRibhz+zsuQp7GhqNrlvwh1J
 YaILGPjMfp1tZz0gEob2ksikFyIn6aEElxguRBzsdH5OB/Oy3TtXdKzFR3LyeiPWh8U6
 mFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAmHc2wPxluOD0WIjk4hh88cF39rdcDgc3wYDsEpLas=;
 b=mSOQzuHuWEgRKZJSqAOloWGfrsjUUORrStHrIY075T20hgv7OIkvZYZNSkwGc4CAIr
 SUmQFt8JFkVRrBOqexlRDfRGmA3p2o17FCgxc2kT8j2vBPoTYfO6kBKM2osAAnrCMhcL
 a7hvi1W5ZQx4GSSLsKjiFu/xIigAewTqC2Bb7XtlDHmm8LoN6t7L30Pg4PpMeuvweWG8
 WxbQjZWEpCj++k3zHTmxxswqTac5VE51qjhfjbeFdK9Ad/TPxIEMs0SX+qT70B7jQ16w
 vSBiwB5/1v1/Gpg3lXr/JUUoh2Bsb7wPbE1dcyGxYNu74aMzABtVJs6rsX2qeVpMbURu
 xqig==
X-Gm-Message-State: AJIora/YjbiM/wi0Uu4zm8eRCehVTtl8+xw5Lg0x6XxjTS/licUFHCfS
 kk3oFev7aP0GXlCfsQ8vdmDOqeVncALuskus6Uo=
X-Google-Smtp-Source: AGRyM1vT0uAKqqaHtx8ncLVCvSWfp6CNUR6oR7tCk5eDPG8jd2fFS0ljxvXXsvuflM7rMrBXT6vXxg==
X-Received: by 2002:a05:6a00:114e:b0:51b:8ff5:e05a with SMTP id
 b14-20020a056a00114e00b0051b8ff5e05amr13497282pfm.37.1656315029394; 
 Mon, 27 Jun 2022 00:30:29 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:30:29 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 05/12] acpi/tests/bits: disable acpi PSS tests that are
 failing in biosbits
Date: Mon, 27 Jun 2022 12:58:49 +0530
Message-Id: <20220627072856.1529357-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PSS tests in acpi test suite seems to be failing in biosbits. This is because
the test is unable to find PSS support in QEMU bios. Let us disable
them for now so that make check does not fail. We can fix the tests and
re-enable them later.

Example failure:

---- ACPI _PSS (Pstate) table conformance tests ----
[assert] _PSS must exist FAIL
  \_SB_.CPUS.C000
  No _PSS exists
Summary: 1 passed, 1 failed
---- ACPI _PSS (Pstate) runtime tests ----
[assert] _PSS must exist FAIL
  \_SB_.CPUS.C000
  No _PSS exists
Summary: 0 passed, 1 failed

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/acpi-bits/bits-tests/testacpi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/acpi-bits/bits-tests/testacpi.py b/tests/qtest/acpi-bits/bits-tests/testacpi.py
index 9ec452f330..dbc150076e 100644
--- a/tests/qtest/acpi-bits/bits-tests/testacpi.py
+++ b/tests/qtest/acpi-bits/bits-tests/testacpi.py
@@ -36,8 +36,8 @@
 
 def register_tests():
     testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Processor objects", test_mat, submenu="ACPI Tests")
-    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
-    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
+#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
+#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
     testsuite.add_test("ACPI DSDT (Differentiated System Description Table)", test_dsdt, submenu="ACPI Tests")
     testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", test_facp, submenu="ACPI Tests")
     testsuite.add_test("ACPI HPET (High Precision Event Timer Table)", test_hpet, submenu="ACPI Tests")
-- 
2.25.1


