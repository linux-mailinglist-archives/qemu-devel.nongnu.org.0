Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C36063E2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:10:30 +0200 (CEST)
Received: from localhost ([::1]:48822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXBY-0000tg-7G
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:10:18 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXB6-0002bT-VL
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmO-0008BS-Fw
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:22 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmL-00072K-Rh
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:07 -0400
Received: by mail-pg1-x536.google.com with SMTP id bh13so19090322pgb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEk7FxdszojxPPvnT3ShmomJx+A87ZwEhsEjJZPdWVk=;
 b=E1aoPCPqbEsTqiPDorJoGZQjJSLWSQY5ZD5/3aPrPCA7vuuCxQl07p7QZ+UBAULOx2
 BzWyoD8hifghkiYFIqvFZIUZbLehnD+ByuAyCACy0EQXdOP37q76qX3jV8LtO9RhvXsh
 +YjQzPJWViXOHJAIQXG/2GXesbT4Uc5dBYK2s4MgLNtIa1dYioHIzH1J/NYzQaQ3PAnS
 0Gea9caiPAR+XrjSstvNHzk7/KfAWb2u1KT8B8+17YWp0c/F+LDIQfQdArMgEaUHLwZ+
 Ucqcp0TU+GbaD5vPiHWIGX0OfBr68L+gb2gebz8Rs1mxthb986nX6VuAePv/nAH0NTJf
 Z0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEk7FxdszojxPPvnT3ShmomJx+A87ZwEhsEjJZPdWVk=;
 b=pc4xIwOCwqM8XKqgOmUTp6l+gmB8MaTO8VU1o1bpVzkkBemZbgP+uwXuUMbg2wk9Ys
 KyBmi88KJaKFZleCAFfgLne+NjcVOkgMRapmuZvoW2vKiubhh+KeU0dIrKeZ6tN8i2Ve
 kkNVZA2VV0W4hMKYiMyNNJBucMsxQaRkyCibcuNYWLSqPe7XyzbsSPzNqh9nYzP4tWB7
 LFuerKUTtydiV1uDODDDoWxjIEyopJZJ725xGrFoFbRT3LwSzD6biY7OOXQeohIFdoVx
 Ph7EL7GcBWTk7KDlLSd7dcYOn8PaC7tjWu6Z0u+VxR0S9WFf2L4ixQblvp5zm+iKPVdX
 MxRw==
X-Gm-Message-State: ACrzQf2OUyo4Kpkn7Siaq1oYsJzE4i0RMHJGHIbhDD+SOLxULpRNLkY+
 pNfqwXVWV6NMXtx1EQf+/MB5yQ==
X-Google-Smtp-Source: AMsMyM7tMGTh2Be4Ri5LiwZIPVSOG5vC0r54pQIlO+5vn8aqwHrxkgL1S8e3sGlzOz4W10ezu1ckyw==
X-Received: by 2002:a63:3155:0:b0:45a:553a:3479 with SMTP id
 x82-20020a633155000000b0045a553a3479mr11560856pgx.408.1666269364242; 
 Thu, 20 Oct 2022 05:36:04 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.246.137])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a170903244b00b00176b3c9693esm12794174pls.299.2022.10.20.05.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:36:03 -0700 (PDT)
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
Subject: [PATCH v6 06/10] acpi/tests/avocado/bits: disable smilatency test
 since it does not pass everytime
Date: Thu, 20 Oct 2022 18:05:02 +0530
Message-Id: <20221020123506.26363-7-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020123506.26363-1-ani@anisinha.ca>
References: <20221020123506.26363-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x536.google.com
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


