Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8DB55B84A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:41:53 +0200 (CEST)
Received: from localhost ([::1]:45226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jNY-0003l6-5Z
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCh-0005Jf-2N
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:40 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCe-0005zI-3L
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i64so8177881pfc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fh1ZoyGzwA4iqvZSNk0dn7iRIAjcMEjp8nc1fuCg7M4=;
 b=lu3X575LrTy/mZ4/GxTok9RbZ2FXgD6wFaZnbQavu5KwbNI5qj5jcRUgrias/kDtvD
 yP7WV93biVwN4jDnQHAPJbgSxYLTi8/Enib6jxnalEPlZniHT2YANxLv+Lw7lYFjfCa8
 39jfV661BbnOvBlhGWud2GL01n+zuP0WdLtgcBqoCbuOewaz1zHiHnE+57IRl62E2Nkm
 qpUVcJUYbWGVjJS3jugk2bVm0KfxxDbSOzJEKsySToXej4dWOeVvUMPzmX+GijnHAFDy
 8/unAl0Et4CO1iB/y+dCFMAxFGe/MD/dWe79kuQgacXOw3rNFQNvaTGhsLi+Zrmc6ZJ3
 yc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fh1ZoyGzwA4iqvZSNk0dn7iRIAjcMEjp8nc1fuCg7M4=;
 b=kW1jVfFjwVJbMxHGERsNVpyCmAXAcoS8tOAxnqKJpgrddsB8XvFvH+ALLcQ2DkCkfd
 cYnUK0JbmLr73CRuqmF/7/BneTgpgprIS7uJI0D1iydi3HrmXHw4a3DZy768xQGJ3eB1
 uQI56HRLizDlWgSjpqc6SbA81bnZOFHJcR214JNxkBH+f4juDfELN+8twT2s9/+2IccI
 3Wz04P3rlRfU2OhoXW/s5zb5aMJP8qoSvh6G/F0yy3IRk3j21sDy86HBNe1vsEsiIiPl
 fOQep4Nu4gSd/keD06T9Zpqpk2C0/pjHyKmLZxkzanFWA6ucSociw1d9C0Q3n3xGMUAQ
 LVrw==
X-Gm-Message-State: AJIora+ziGZspSfxU56v28yjsgeqrqYRhbvUpn/wtsDZmAaHli4xqkcp
 nlKoT+xPqWY7YjlSQdIuGpl5dsKSOAs3N6r1s+M=
X-Google-Smtp-Source: AGRyM1sWo55qYl2+JAZ+f/CIg/PoJ0eMCEE0okhrIfe+ay7CzCgkhgxB9mXO9wRrhrp5MsAqqWuMKw==
X-Received: by 2002:a63:371e:0:b0:40c:f411:6768 with SMTP id
 e30-20020a63371e000000b0040cf4116768mr11738470pga.471.1656315034300; 
 Mon, 27 Jun 2022 00:30:34 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:30:33 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 06/12] acpi/tests/bits: add smilatency test suite from bits in
 order to disable it
Date: Mon, 27 Jun 2022 12:58:50 +0530
Message-Id: <20220627072856.1529357-7-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
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

smilatency tests does not reliably pass every time it is run from QEMU. This
change adds the test file unchanged from bits so that the next change can
disable the test.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/acpi-bits/bits-tests/meson.build  |   2 +-
 .../qtest/acpi-bits/bits-tests/smilatency.py  | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/acpi-bits/bits-tests/smilatency.py

diff --git a/tests/qtest/acpi-bits/bits-tests/meson.build b/tests/qtest/acpi-bits/bits-tests/meson.build
index 3056731a53..06bca75d99 100644
--- a/tests/qtest/acpi-bits/bits-tests/meson.build
+++ b/tests/qtest/acpi-bits/bits-tests/meson.build
@@ -1,4 +1,4 @@
-test_files = ['smbios.py', 'testacpi.py', 'testcpuid.py']
+test_files = ['smbios.py', 'smilatency.py', 'testacpi.py', 'testcpuid.py']
 
 copytestfiles = custom_target('copy test files',
   input : test_files,
diff --git a/tests/qtest/acpi-bits/bits-tests/smilatency.py b/tests/qtest/acpi-bits/bits-tests/smilatency.py
new file mode 100644
index 0000000000..fb1b7228e3
--- /dev/null
+++ b/tests/qtest/acpi-bits/bits-tests/smilatency.py
@@ -0,0 +1,102 @@
+# Copyright (c) 2015, Intel Corporation
+# All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions are met:
+#
+#     * Redistributions of source code must retain the above copyright notice,
+#       this list of conditions and the following disclaimer.
+#     * Redistributions in binary form must reproduce the above copyright notice,
+#       this list of conditions and the following disclaimer in the documentation
+#       and/or other materials provided with the distribution.
+#     * Neither the name of Intel Corporation nor the names of its contributors
+#       may be used to endorse or promote products derived from this software
+#       without specific prior written permission.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
+# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
+# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+"""SMI latency test."""
+
+import bits
+from collections import namedtuple
+import testsuite
+import time
+import usb
+
+def register_tests():
+    testsuite.add_test("SMI latency test", smi_latency);
+    testsuite.add_test("SMI latency test with USB disabled via BIOS handoff", test_with_usb_disabled, runall=False);
+
+def smi_latency():
+    MSR_SMI_COUNT = 0x34
+
+    print "Warning: touching the keyboard can affect the results of this test."
+
+    tsc_per_sec = bits.tsc_per_sec()
+    tsc_per_usec = tsc_per_sec / (1000 * 1000)
+    bins = [long(tsc_per_usec * 10**i) for i in range(9)]
+    bin_descs = [
+        "0     < t <=   1us",
+        "1us   < t <=  10us",
+        "10us  < t <= 100us",
+        "100us < t <=   1ms",
+        "1ms   < t <=  10ms",
+        "10ms  < t <= 100ms",
+        "100ms < t <=   1s ",
+        "1s    < t <=  10s ",
+        "10s   < t <= 100s ",
+        "100s  < t         ",
+    ]
+
+    print "Starting test. Wait here, I will be back in 15 seconds."
+    (max_latency, smi_count_delta, bins) = bits.smi_latency(long(15 * tsc_per_sec), bins)
+    BinType = namedtuple('BinType', ("max", "total", "count", "times"))
+    bins = [BinType(*b) for b in bins]
+
+    testsuite.test("SMI latency < 150us to minimize risk of OS timeouts", max_latency / tsc_per_usec <= 150)
+    if not testsuite.show_detail():
+        return
+
+    for bin, desc in zip(bins, bin_descs):
+        if bin.count == 0:
+            continue
+        testsuite.print_detail("{}; average = {}; count = {}".format(desc, bits.format_tsc(bin.total/bin.count), bin.count))
+        deltas = (bits.format_tsc(t2 - t1) for t1,t2 in zip(bin.times, bin.times[1:]))
+        testsuite.print_detail(" Times between first few observations: {}".format(" ".join("{:>6}".format(delta) for delta in deltas)))
+
+    if smi_count_delta is not None:
+        testsuite.print_detail("{} SMI detected using MSR_SMI_COUNT (MSR {:#x})".format(smi_count_delta, MSR_SMI_COUNT))
+
+    testsuite.print_detail("Summary of impact: observed maximum latency = {}".format(bits.format_tsc(max_latency)))
+
+def test_with_usb_disabled():
+    if usb.handoff_to_os():
+        smi_latency()
+
+def average_io_smi(port, value, count):
+    def f():
+        tsc_start = bits.rdtsc()
+        bits.outb(port, value)
+        return bits.rdtsc() - tsc_start
+    counts = [f() for i in range(count)]
+    return sum(counts)/len(counts)
+
+def time_io_smi(port=0xb2, value=0, count=1000):
+    count_for_estimate = 10
+    start = time.time()
+    average_io_smi(port, value, count_for_estimate)
+    avg10 = time.time() - start
+    estimate = avg10 * count/count_for_estimate
+    if estimate > 1:
+        print "Running test, estimated time: {}s".format(int(estimate))
+    average = average_io_smi(port, value, count)
+    print "Average of {} SMIs (via outb, port={:#x}, value={:#x}): {}".format(count, port, value, bits.format_tsc(average))
-- 
2.25.1


