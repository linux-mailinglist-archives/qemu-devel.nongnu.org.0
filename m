Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED0D60386B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 05:08:09 +0200 (CEST)
Received: from localhost ([::1]:55716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okzRA-000742-8N
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 23:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIU-0002Bk-TO
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:11 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIS-0003TL-TM
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id m6so15990924pfb.0
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 19:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEk7FxdszojxPPvnT3ShmomJx+A87ZwEhsEjJZPdWVk=;
 b=hagD6OkMp7Zx/5WxN4+3PEItkL5/IAIMUR8AGJ+u/VL1PajC7EW9gKuilmAkLmmhgV
 bkCYbp9Ac7MRYEglKoC1srjG7reXFH3ywyB6U8zsduhj5f8yiw77TZRxPseAG9Ev/Pid
 w7HpsIceQmzrCUHHinXicgvmzFq2K084W+00+Zuii+WM5YZkuxCnxgAnAJDeBUsyHc4h
 1Qnq1ReK+Vlcvw1u0j4C23KzU72hlX7md8Nz5kLa5BpRb25LTzemZ7wp0uT1iKyynHGs
 o2bSype3v22+Vwk5RM4Upie9UgJ4lOeXkxodcG7CqTCzu1qdY16Y0EEuSAJW7ptawKzP
 fj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEk7FxdszojxPPvnT3ShmomJx+A87ZwEhsEjJZPdWVk=;
 b=fsaPuL0DVkwSXC+W4J3uu3S9+yMJvNbBUSOM4ZWJTgJ1MxWC5vqv1a25I0qnd6PoME
 P6xM3CUVy2AZDFWgop9r/lKcd5CcGjeuSsa8i03yJhynm5wiWkD+XsFwUcKhIzl0qo9d
 yEC97AclhnVQ7dBUjWPi7DOIWnjVm3Z6Mf4ernwzPvm9Y5xrFvVSoAfRXaiKmelVeRA4
 pxEiMlAUkWFXaq6dhV1m3viRTMHvE0NE5Yl8j0Eq2Ak26Fj/wLeCZ69q4kocao/NrUt6
 1KM1ISaprBHYWKKPAfcTQQzQHTqt40PA7zqXg10rO0/jNPsYSntgyBwfF01FL/VTNowD
 faVw==
X-Gm-Message-State: ACrzQf2zxYvtNVFtbSkgQ/NfVRw7+DdbMk23bT33l2j50PZE+t9apRxP
 33rKcrRdDBTc28VYPj6Bi0B9pQ==
X-Google-Smtp-Source: AMsMyM5PNslKedv4jNLp3r7jXeGerwmAQwI4imKVprS0+P2rbNRXDsZPfiO+wsuKgTZSqXSMinaRyw==
X-Received: by 2002:a63:87c7:0:b0:46b:3cf1:e163 with SMTP id
 i190-20020a6387c7000000b0046b3cf1e163mr5456581pge.112.1666148347489; 
 Tue, 18 Oct 2022 19:59:07 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 203-20020a6214d4000000b005626fcc32b0sm10320593pfu.175.2022.10.18.19.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 19:59:07 -0700 (PDT)
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
Subject: [PATCH v5 06/10] acpi/tests/avocado/bits: disable smilatency test
 since it does not pass everytime
Date: Wed, 19 Oct 2022 08:28:24 +0530
Message-Id: <20221019025828.683113-7-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019025828.683113-1-ani@anisinha.ca>
References: <20221019025828.683113-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x436.google.com
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

smilatency test is latency sensitive and does not pass deterministically when
run in QEMU environment under biosbits. Disable the test suite for now.

Example failure:

==== SMI latency test ====
Warning: touching the keyboard can affect the results of this test.
Starting test. Wait here, I will be back in 15 seconds.
[assert] SMI latency < 150us to minimize risk of OS timeouts FAIL
  1us   < t <=  10us; average = 1372ns; count = 10912449
   Times between first few observations:  176us 1646ns 1441ns 1450ns 1462ns
  10us  < t <= 100us; average = 16us; count = 1187
   Times between first few observations:   15ms 3148us 5856us   49ms   33ms
  100us < t <=   1ms; average = 259us; count = 8
   Times between first few observations:  111ms 2227ms 1779ms  999ms  219ms
  0 SMI detected using MSR_SMI_COUNT (MSR 0x34)
  Summary of impact: observed maximum latency = 298us
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
 tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/acpi-bits/bits-tests/smilatency.py2 b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
index d616970b31..e907c55cc2 100644
--- a/tests/avocado/acpi-bits/bits-tests/smilatency.py2
+++ b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
@@ -37,8 +37,9 @@ import time
 import usb
 
 def register_tests():
-    testsuite.add_test("SMI latency test", smi_latency);
-    testsuite.add_test("SMI latency test with USB disabled via BIOS handoff", test_with_usb_disabled, runall=False);
+    pass
+    # testsuite.add_test("SMI latency test", smi_latency);
+    # testsuite.add_test("SMI latency test with USB disabled via BIOS handoff", test_with_usb_disabled, runall=False);
 
 def smi_latency():
     MSR_SMI_COUNT = 0x34
-- 
2.34.1


