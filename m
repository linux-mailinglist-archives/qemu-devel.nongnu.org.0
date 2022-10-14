Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A535FF323
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 19:51:00 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojOpm-0008Hu-7o
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 13:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObu-000304-EI
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:38 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObs-000852-0o
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so5367367pjb.2
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEk7FxdszojxPPvnT3ShmomJx+A87ZwEhsEjJZPdWVk=;
 b=TRg4xdfZbiBn+OOpNw1hYPezMWiQqQHRt5L/g8B0YEsUKWJP3DBZjBWdsSTps+TouG
 46vjHqaqdcf/RB9IfWlLwadKzu7xfRSVZTOiaPQ1676Bcf/JptPzvZLWqEG80RyLc2lF
 rFK5ntX4UUP4QjC81nZAR0Pc9Tpd8rhRQ5ykksersR3e5ePnM7mGnNqrGf9eY2ECt64b
 S6UNnYAJxAKNwdFDKlfgewuTCTpBkOi2bCAZLtdvQQoseJSFJBTo8q9LCmZySVy90E2x
 DqdV5W6nOilzoq5OfhMjPklSP8yzrDRNEWpDCcChgZm5Rw0EGl/r+CpabwDlPnpf8p+p
 deOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEk7FxdszojxPPvnT3ShmomJx+A87ZwEhsEjJZPdWVk=;
 b=1SWoKYh3c6sRfqxkdC8GBQ7tqmq7sN3PRa+sQPnj2EtQ7IWBWDR1uItv4/IoJ+8p1v
 xFeLxalzUBs/LWLn6CGOAlhSjzTs5+fXyRXzDDjVqBH2XRPfrD3TYY1dv1wzuR8ewOX2
 DhzlKD7jbvpx7pDM3jMOCD4Lwqgy3+OK+afnnDBx+66KjFC93t44dzxhxUSQi0QXlE8V
 iK7vZxbBzVsKSiJqczlG0tkgfm+ZGtBjE3j39io6jPo0njifnmnZDF0ZKngjSFBNiGJJ
 BtV5uj9wAPdQW1y8n294pHPllOK3vOJiie4W94U73zBNQ1f3s395ULbScpb+/jh3VDYN
 HKVQ==
X-Gm-Message-State: ACrzQf1v8ZfHZsf/tKoOoaG//G+g2titWdKRU6nD7KiOo27MUJGD4MrY
 FiCrv22I5VRyVyoI2+2eJqrOgg==
X-Google-Smtp-Source: AMsMyM6KEpNUE58pijgTdFryrKQaPToug06GEyd2wHU+n388csWWNkUVPq/HKZ4fvOz0/aprHh4Nyg==
X-Received: by 2002:a17:903:2cb:b0:171:4f0d:beb6 with SMTP id
 s11-20020a17090302cb00b001714f0dbeb6mr6056362plk.53.1665768992996; 
 Fri, 14 Oct 2022 10:36:32 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.243.197])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a1709027fcd00b0016d8d277c02sm2030042plb.25.2022.10.14.10.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:36:32 -0700 (PDT)
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
Subject: [PATCH v4 06/10] acpi/tests/avocado/bits: disable smilatency test
 since it does not pass everytime
Date: Fri, 14 Oct 2022 23:05:04 +0530
Message-Id: <20221014173508.222823-7-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014173508.222823-1-ani@anisinha.ca>
References: <20221014173508.222823-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102f.google.com
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


