Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF955B851
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:45:15 +0200 (CEST)
Received: from localhost ([::1]:51082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jQo-0007lw-Dx
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCj-0005Lf-J0
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:42 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCh-0005yY-MX
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:41 -0400
Received: by mail-pg1-x535.google.com with SMTP id r66so8336476pgr.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7yaooi/YX0N1Ovq8r6H8DlJjBpFlIStDURKxX0nntKs=;
 b=FEjgd0+bMAo5JEYusqi9u9bkfUx8jDL03q4hSpLrLnAwRU7KFwYUBvX60wfRt/4JaH
 kSPOt57C5INgUsXUnQkQUGFUMCm+nXW5EHctVjQ6rnBfW4uK6yzbcfqW0mFeba8I3bRE
 7ZPNaKlpEXm49XGZzGPgbDKhTyLI/UyGhyMr2Fohm+6xzR7wKHu8Ka+cTXSSRITNyEPy
 xDH4w6n4lkCc50PlNeAeTmZ4qsL7c93xrfZ3umZDDGlfAzhvVeYnsE/xA/Vz4KYMYNxD
 j8uSXD1Xv0+0oRIMRtQp+1TK9ELv6syOMX8Jaof66MJ0OhQymUPD9gYnpeSJq7d3PX7D
 ZbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7yaooi/YX0N1Ovq8r6H8DlJjBpFlIStDURKxX0nntKs=;
 b=TOkH5R58LfB4ZyVufcVnEQmqNBfXAVmbmKQZhLJ1Qe1EKt1fiV8KZp6qnzzqo9thtD
 R9zyAMBQ3SAPdC8D7OvVt2nI/HnXF/KB71oU4jO9oUJaMJ44pB0pURg+5q0lBEineICk
 esfoVne/9bHdvEjGGcAs7+fMvclP5qE4GtmX4vdj2MPqKancNAEJpkae8QoAfoevAuCa
 amoGcuyXdRRk51Dnuv+O0n1FfU5JzFaG0FNAiOZ6fXzGQ15n0fhp361qYSpqrxHlZr53
 y5BS42fiEE62O8dG8bpiWuN7m2HNJJyqwaut05aI9XuEiwQReU+qFZL67OJnX5IfYvvd
 rVyg==
X-Gm-Message-State: AJIora+oPSQCaWDTAfGPC0YnoWS5XLcBdpKDtr/1h8FfIQ13F6dquUba
 FZO5aQ/FJaE9tcG17wUlw2szI52lSDfFqWgoHqg=
X-Google-Smtp-Source: AGRyM1vgPO5xrzfq3AgcoS+CYyohXG4vF4/wsb8J3nabhkO613ZCKf4B+9Cz73w1CbWv9OB7WIgZDA==
X-Received: by 2002:a63:4407:0:b0:40d:f0c7:8277 with SMTP id
 r7-20020a634407000000b0040df0c78277mr4291360pga.163.1656315038630; 
 Mon, 27 Jun 2022 00:30:38 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:30:38 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 07/12] acpi/tests/bits: disable smilatency test since it does
 not pass everytime
Date: Mon, 27 Jun 2022 12:58:51 +0530
Message-Id: <20220627072856.1529357-8-ani@anisinha.ca>
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

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/acpi-bits/bits-tests/smilatency.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/acpi-bits/bits-tests/smilatency.py b/tests/qtest/acpi-bits/bits-tests/smilatency.py
index fb1b7228e3..53b5f820a5 100644
--- a/tests/qtest/acpi-bits/bits-tests/smilatency.py
+++ b/tests/qtest/acpi-bits/bits-tests/smilatency.py
@@ -33,8 +33,9 @@
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
2.25.1


