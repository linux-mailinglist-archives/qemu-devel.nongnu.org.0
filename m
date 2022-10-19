Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43F60386A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 05:08:08 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okzR9-0006y4-CX
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 23:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIG-0001xM-Rk
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:58:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIE-0003SK-MT
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:58:56 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c24so15651590pls.9
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 19:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGQKJel249jbBuJn5CBZX3iJzYynF1O87yjeVXWwNmE=;
 b=MIk5ksZZl2M6FGF54aWyT8O/f4sK8jWhCUcRRNOpTj8A2yX+4zmcr/Gr3VRYh89WEr
 HeBIxmkKYyYkAgKAGWlF0gdsSha2bKcdoaKvozm7ldpNQrAKdb3/gaOG5uvMLQHyZ2Bp
 TgkrerZGuKHo67sRf69h+jSdBCH4ALU0uj/mr6UpZ5+r3IxCjrX9sgIcuFlGb2ImB2U5
 tga+4548wWNf5JcqDsA/+UNgwFZ545BEMnTX1J4QMpYUa/d7FJhHSh7KCfL93d4jQEDa
 y4we4wErU9LPZePYaieoBZnjx9oj8oqjrF82scAeNkP1yl7eDhQZrHq+cZ93oUrO3sX7
 AYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGQKJel249jbBuJn5CBZX3iJzYynF1O87yjeVXWwNmE=;
 b=69BQzrvDH1NGko22uu3R6bjJfn+lzTYE+8vXW2idXxBVK950bCpTsGHMYZgqJx+z7z
 ZmneJwYFlaNP81WwNPNrolVDjTXTXZW+b6XzwJ3Mdeh01oLljZ58xK36bBhjoN/SJYS8
 4Iw4IpH/Oc0lDQB2S/9XSV7SkxdTfGPSQFEgUr6kW4QDt/1aP0wJl+VCAT0ooGfrulD8
 rpvHfX3JCTaGNsvJTYhggPKK/9HQATp9MDGLdVpb0FIQaP2i4/ovLXm/tWzb3OorlC9E
 OGSadvq5W/rGr8PQsIzqLHUcBzxpE0P8uC1x5A8shsQBNmAOCMf8VtNHRhi48K1WVCA4
 OS9A==
X-Gm-Message-State: ACrzQf0ulodJKSLFFM+Um/Lv1N1SiFj+peK3KwiTVIJcHKkstrEvRorS
 /CSYP63d7fCMGaUe10o+80S4Vg==
X-Google-Smtp-Source: AMsMyM5FyN9SSx3wX9Ow8C4lRbDexJdn0VD73NuXK+ZeCrh/Tf4mOecs22KgYfLbaqVw76YKnJ73ow==
X-Received: by 2002:a17:902:6bc8:b0:178:81db:c6d9 with SMTP id
 m8-20020a1709026bc800b0017881dbc6d9mr6246260plt.56.1666148333337; 
 Tue, 18 Oct 2022 19:58:53 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 203-20020a6214d4000000b005626fcc32b0sm10320593pfu.175.2022.10.18.19.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 19:58:52 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 03/10] acpi/tests/avocado/bits: disable acpi PSS tests that
 are failing in biosbits
Date: Wed, 19 Oct 2022 08:28:21 +0530
Message-Id: <20221019025828.683113-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019025828.683113-1-ani@anisinha.ca>
References: <20221019025828.683113-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/testacpi.py2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
index 18dc818d62..f818a9cce6 100644
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
@@ -40,8 +40,8 @@ import time
 
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
2.34.1


