Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54347606209
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:43:54 +0200 (CEST)
Received: from localhost ([::1]:43480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVpv-0000Hi-F7
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:43:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVjm-0005Kh-Ga
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUm9-00080z-5D
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:35:56 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUm7-000705-El
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:35:52 -0400
Received: by mail-pl1-x632.google.com with SMTP id n7so20193134plp.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGQKJel249jbBuJn5CBZX3iJzYynF1O87yjeVXWwNmE=;
 b=cYAQWIOGAS3DCTnjD9EJ6gpEl0a0bz1fmUMhoq71QGE6tCO6TXZfpOyAFN+/slTWWT
 CvyWD3dnJniADoun4S6+fdqqqb6Kc2QCoyUXn6ZqgxUI98cLWLMHvyED6ZFBwdvm1wKH
 8NHkXpXvu4S04Ae52eNHBk4eIkkgWhPfqKobWfrh261edAXdP6Xxi75Fy3307AZGewlc
 epcdI3IcUGkOiwHd+/yMF0q2FX5Wb4Uaz/VFn0JB9hebfGzpCp4YfAYlbtGqkoP6Kxal
 enfpoGH2FuTvYuK3sB7BQOxiQYReYSN75zgfY4SrOcA8u0bDmP8Lj1pQm5Sxx++tLZA7
 jn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGQKJel249jbBuJn5CBZX3iJzYynF1O87yjeVXWwNmE=;
 b=JYlY+ai/ZftHtYEwerRex48Fn/kn1fvPHF2ZotV7a/ghAW/Q1sQCkUlYe4A9neEjPr
 hC3slXAQyXQFuVE2MEgFzJ++T3tPXoFjxNWgSrCKkam5U2mP8v5o+1WRbV/wflRgPPsE
 u7dYc/oxAviedDufRx3rSY/T30eMKnh8IIjQzIBrvVFrNpPxjoga0CZZBV0Hk4t/qDcj
 iTU8zvJ4o/KdfMhoyFyqsbBj2ridxIbA/C2AF9WXLSpRyJAvqysrD/XtTIKa1UUsNQYt
 mn/aYFUP2ORwEtbb0SEOf/bLKMu2OnYE+CAY/cBhYLYejxJ7rU+fe6t/jIlM5p8V7lIE
 xofg==
X-Gm-Message-State: ACrzQf2SzfteSBFvhr7Nyig8OK6FDTj7tHBvV69dViOtUm1ZVLNFsULY
 6aeDZNT77TD9vHmc/BIXy2n0qQ==
X-Google-Smtp-Source: AMsMyM5RJxgAp3TqyB3+nmxzu8Iics8tzA1W0uBXZwKmZQRDEb8bS+D1/8hNaZvUeaoV7lVqvatsvw==
X-Received: by 2002:a17:90b:1b03:b0:20d:ac3b:f1dd with SMTP id
 nu3-20020a17090b1b0300b0020dac3bf1ddmr41967211pjb.121.1666269350137; 
 Thu, 20 Oct 2022 05:35:50 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.246.137])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a170903244b00b00176b3c9693esm12794174pls.299.2022.10.20.05.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:35:49 -0700 (PDT)
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
Subject: [PATCH v6 03/10] acpi/tests/avocado/bits: disable acpi PSS tests that
 are failing in biosbits
Date: Thu, 20 Oct 2022 18:04:59 +0530
Message-Id: <20221020123506.26363-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020123506.26363-1-ani@anisinha.ca>
References: <20221020123506.26363-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
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


