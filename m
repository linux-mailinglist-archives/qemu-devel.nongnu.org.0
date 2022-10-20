Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9AF606382
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:48:19 +0200 (CEST)
Received: from localhost ([::1]:59602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWpw-0000iZ-OV
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:47:56 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWkm-0001Xx-04
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmE-00086i-6A
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmC-00070b-Bt
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:35:57 -0400
Received: by mail-pj1-x1032.google.com with SMTP id pb15so2732902pjb.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmWzXLUEgkSQk0CtRC65Qy9q7k6vgCayAbWoRpw6RB8=;
 b=g5MmEysLQUZ9LEmQdMjE7GKuOWhEWWc5NLSXlxFG9ezj0VnC/t+SCokRvZCnxlSgYA
 qswgew/mMZSk8cXlj+aKB6FBK4mHybektV9TxFJDUsdNp8+X/2trFqMDpZNeKKHIBd4g
 z0qxoZaBj46dT5IBNRX3qHGjMAFzcztgmGD3sZkvD4izwRCi+wtq8h6D6llDvDcwRGjH
 Nlfy4niFptm4ZI/ppwYG2IUZSQQzrPkoLBebOc3P1x4GYgvVZSWSq7PXBAmPQ6D9Ag3u
 2KWMAnsA1pCH/9KEJgg4DdIIp/4zoeiaAcEKpAjUZFsvEKZOgsyJ3vPtj2QbdEGdwpOB
 CHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmWzXLUEgkSQk0CtRC65Qy9q7k6vgCayAbWoRpw6RB8=;
 b=RnMG+7YoI5dvBnTaF58yuiLhjkAHS7MS9ww57roKNHGW5ARhoBtAv824VSseFJK+pu
 59Xsx4+pG3dM0uleRPwOPeBGFiuLRlXRkKIsBWuHdSHNG+Vg7G/GXK+4aaeD4LKVHTcj
 xKYI6HsD0FvvO4EW9mkMVABkfjNY6yDl0Ke3+KpiErVcBX+IFjhRWHhAeq9tIzoVLEql
 BfTEnsd8OhTXu+spnTBZX07iANLwO6aC7JM9n5xp2eQDJUbwcFKMufbHnbQ00pAY0qaS
 OFyeca8UtUlGeQsBbiDheCRwej5LXrZJvCPoJ+uoQI0JrHT9IvJn6tsjwnfd5qObIXjz
 5U2g==
X-Gm-Message-State: ACrzQf3CTzhCtSzlgetLhqdYBFVMWvqWbBfLoPBcIKICeDuwy/g8e7Pc
 iH9nZQ2FWMUlF06MkmR97ifRcw==
X-Google-Smtp-Source: AMsMyM46QGpVW5W/3jkOE2sLJKqviSGGGDPJvxL8lPqSFe1s1FXs744rhskqW8dBwSbqGpiOyu095A==
X-Received: by 2002:a17:90b:2812:b0:205:cdc9:2ccf with SMTP id
 qb18-20020a17090b281200b00205cdc92ccfmr15432266pjb.97.1666269354783; 
 Thu, 20 Oct 2022 05:35:54 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.246.137])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a170903244b00b00176b3c9693esm12794174pls.299.2022.10.20.05.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:35:54 -0700 (PDT)
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
Subject: [PATCH v6 04/10] acpi/tests/avocado/bits: add smilatency test suite
 from bits in order to disable it
Date: Thu, 20 Oct 2022 18:05:00 +0530
Message-Id: <20221020123506.26363-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020123506.26363-1-ani@anisinha.ca>
References: <20221020123506.26363-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
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

smilatency tests does not reliably pass every time it is run from QEMU. This
change adds the test file unchanged from bits so that the next change can
disable the test.

The test has an extension .py2 just like other tests so that they are excluded
from loading by avocado framework.

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
 .../acpi-bits/bits-tests/smilatency.py2       | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py2

diff --git a/tests/avocado/acpi-bits/bits-tests/smilatency.py2 b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
new file mode 100644
index 0000000000..fb1b7228e3
--- /dev/null
+++ b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
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
2.34.1


