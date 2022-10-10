Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F238C5F9AC3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:14:39 +0200 (CEST)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohnvr-0001W9-1P
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfR-0003uh-NJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfP-0005qR-BF
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:41 -0400
Received: by mail-pg1-x52b.google.com with SMTP id f193so9755372pgc.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XTUGRenuq7iFRoYAPaRY1jpCC1XbHGFNbh7ZWhZHmw=;
 b=pNO6uWZZPMuO/qOQs6YPvKVJcSsM/JZdTAnHzlU53nK2oXEaPkUE8bU6ResmUKJ/81
 ++znR3RPORNClgIF+jk6tJgf4cFiK4wP3vAyon9HA8IoRoKe+TKGc0ARVjZB1eaxI2/7
 cnA/gYx//UzPiGxC6sYVCuFiu5pN2yuvGoAap98FAC/SaTeDydujUz34u8zcQ3UVr58g
 mpXK1VU9mRk5Oy5JXRlrHnF5q4oEDj0gUdhGxYDwcLtYc3L9gFtVVdOoiKblOIcuLRdx
 uI0sHSsWG4DiKkSrHn6S5VevR9AigC2p7iCdvfTfDqkvMakG4K+MFoTW/i21mOJfxSld
 6U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5XTUGRenuq7iFRoYAPaRY1jpCC1XbHGFNbh7ZWhZHmw=;
 b=nXlSkiUHhYEtsMdO7kkdthzuGwk6LKVVQEra0Dg1IO8NK5afNfD4ewr1fVciYXJEIO
 CUltfotBIVABjIRBJk79AG2RpnqQOKiw11cm+ES83uHLU6T7+HJv0RutOFp155tHjHuz
 jbfo+/3lKEJKhRo1qcJ8NOZAzYsxXf0fz34kM5Tl5pm2Brp6AH8ZXBGTA4Bu8FgU5L6a
 bqFB404VS8lkqEPFPHA4UaZrzOamnIB6AwhOQWBx+r8GqdNpQaIljKNuvY9P3BAwbU60
 B9lWcOygGZHay9JjWTnNYZO++obucBCPwaJmdHFza4QA1INNgJLQo/WZCtxApkPLpvHa
 EnLA==
X-Gm-Message-State: ACrzQf1kxLJEXcdnr5Qb86SkJRlHBBBwzZLAqHqpTLNauUfD8qBzdfau
 PsdmyhQYKv7TYKdSgkNeQGE2Ez7aN3IghA==
X-Google-Smtp-Source: AMsMyM62WLx0LjG5LJAWTEInTFT4aN6HpJF43H1BllNxQPZ9IEq0idZ/iYOg2cP8vZGSNJ/lZ7iqEA==
X-Received: by 2002:a62:1a8d:0:b0:544:1309:19f3 with SMTP id
 a135-20020a621a8d000000b00544130919f3mr18550564pfa.37.1665388657797; 
 Mon, 10 Oct 2022 00:57:37 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.238])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a625e02000000b005624b4bd738sm6200379pfb.156.2022.10.10.00.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 00:57:37 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: mst@redhat.com, imammedo@redhat.com, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 06/10] acpi/tests/avocado/bits: disable smilatency test
 since it does not pass everytime
Date: Mon, 10 Oct 2022 13:26:15 +0530
Message-Id: <20221010075619.4147111-7-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010075619.4147111-2-ani@anisinha.ca>
References: <20221010075619.4147111-2-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52b.google.com
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
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/smilatency.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/acpi-bits/bits-tests/smilatency.py b/tests/avocado/acpi-bits/bits-tests/smilatency.py
index d616970b31..e907c55cc2 100644
--- a/tests/avocado/acpi-bits/bits-tests/smilatency.py
+++ b/tests/avocado/acpi-bits/bits-tests/smilatency.py
@@ -37,8 +37,9 @@
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


