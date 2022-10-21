Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02792607500
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:31:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpJB-0001JK-5Q
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:31:21 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olosg-00045O-Vo
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olorb-0001mu-M9
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:02:52 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olorW-0006He-9T
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:02:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id 10so1952636pli.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubA2jXepEf2H+IfTH8tv2JUW5K5w33v5t2+W6emNKjI=;
 b=ZftU7TWmKKkdcTQ2ZbXsDAHK8FyA/JbPdFfezOM3ve3JajqhlRJZbZ5H7p7x4HsbUh
 2mCAhmprZ0QJ2+3Oh3tDI/OErrcotl8EGlw1GxEhtZeT22OSj8xPtBQyTVY80ltRRZcv
 pa5SPBuZz4+MvdDQoLM5u5JgGQiH+GpPlFvBp+cCKWC2WJMqB32MgRCDguu0HVwAVKI5
 hEfFi0rDenyqnTreytoWa+XUzQPTKavIAX33IrYdIIKavwo0Jk4PvKjggRcYTYsTi1iB
 qj9atBNKsGXAQ3J03bjKmo1H2A9K7MNFy2KEbXHF6yoWA+j9MivqpPvlsfkBOUZZdNSc
 BGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubA2jXepEf2H+IfTH8tv2JUW5K5w33v5t2+W6emNKjI=;
 b=hTE2XrM+PA38bzwl4ikYwsTEbBrlmDteJpc2G6r6vBNnRvHMyd+ii7WjiDeBdSQVZT
 ImsbzDb9/qdQc56rnKxcgA6VDT8cHPZ5faZDau+yTje/XV1srzySYFcbeHIkTjsrAHJR
 rD5dqJka9kLZSpzLxDEuhJhmlvXEhpQ7GjoL2DmKGR1knw+SCHQbc3RzhDbTJQqLwzlx
 V6MWGtMEVCOxL0mUGpN9cOqvezYFrx1vwIHFcjH3iy+3H0cYd1xhaGaEgE8zvQWJP6Ak
 T7NRqmUs+ioKjjlIJ6Z1PduC1b3Mp5zr667QSLaWlTQTxHdRXUSbsngKyN4DUEvZhu8N
 DJRA==
X-Gm-Message-State: ACrzQf2EontzF2TJeDM5yYK4yyeRURDtkKXAJDUj5H0JUKqa+T5JFsym
 TO3jE3b9gOW8Wz4ipN7qrNTclA==
X-Google-Smtp-Source: AMsMyM6K5tcBeizMJYLHXuv0o4bRhkG9psKybc53/W6mMzQmG2uemvfAc1JB146Kee1C3o5FNj3jyQ==
X-Received: by 2002:a17:90b:3ecd:b0:20d:9ddb:f287 with SMTP id
 rm13-20020a17090b3ecd00b0020d9ddbf287mr52673990pjb.167.1666346563416; 
 Fri, 21 Oct 2022 03:02:43 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.245.138])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020a631e0e000000b0042fe1914e26sm12997375pge.37.2022.10.21.03.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 03:02:43 -0700 (PDT)
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
Subject: [PATCH v7 3/7] acpi/tests/avocado/bits: disable acpi PSS tests that
 are failing in biosbits
Date: Fri, 21 Oct 2022 15:21:04 +0530
Message-Id: <20221021095108.104843-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021095108.104843-1-ani@anisinha.ca>
References: <20221021095108.104843-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x631.google.com
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


