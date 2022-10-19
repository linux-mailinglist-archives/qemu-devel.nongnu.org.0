Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D679B60386F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 05:08:25 +0200 (CEST)
Received: from localhost ([::1]:47258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okzRP-0007lX-Ph
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 23:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIY-0002IY-NT
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:14 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIK-0003Sq-7W
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:14 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bh13so15033076pgb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 19:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmWzXLUEgkSQk0CtRC65Qy9q7k6vgCayAbWoRpw6RB8=;
 b=S/BMlH1u/iQD5xLgLgZHBLrbAwKPH3AqEQixDAB3DNPmhlrrpUotgoCVEQ/ezKkklb
 Cjc8FGILoonJCRPGZTEOq5qhIzps/CdKhu3kXnHx/gxV00VdPtynWQPkgI6kaZwbaUql
 88nLe8KORPibgCmrKZLJkAacXJg2E2spkooEsokTGzbFDwtMXR60qU1bou/PLO2iJUvp
 QtRqwtTynX/aFAYj32PqmBZIx4oF6ZqJm3pwg1jGQfCIevkutwHzsISLBBq8YDPHO0ON
 /fRrH19bPvUB7grufSxxcqQPJLZEA+xhmfBvrXChuiTvpjYBPzxf+PL48jF5N2o78Te4
 SvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmWzXLUEgkSQk0CtRC65Qy9q7k6vgCayAbWoRpw6RB8=;
 b=Y6LFPznnIiNTQW9cbKf+7Zx90Tu4x0LMEkJhZbfrv2tOWYi4dt1sr77DsenVBaRc4A
 4LX3yk++SDJse58dMHrYS9gmBE6MrKsKlKs/R+hsDikLyAD1/8sACpWq2KYlpMHBZuuU
 A/CHIp0hMcgU3IuwEyP3dTnCG+iL1IMJaBM6Y/Qkn/lEkVIRcCtt0e8zTMRbU6kSuDcu
 yu75+WPqWYkSA4gL4wSx+C/Wrhwjza8acJAz006XEFz7/Gt3pwLI5r7CUigxfxlM+bmY
 kHJoAXMYPGVJ69Egbisjhc/qK6PQhbLZMNmnliV8agiugBNfj26D2eNeoCncsugQQpgA
 0/ow==
X-Gm-Message-State: ACrzQf0OA58mv+y0e+GZVN95O+Qk8YMm4c+z8X+7uDQWpe9Y5NrhQjCd
 +hBGwMQyf9JhsWNUez9JAXlMJA==
X-Google-Smtp-Source: AMsMyM7G4zEwnTKIZTrI8Ra5aF4GXT5ynWaCLYQ6W8ySAaP5/rItbXzm1Bi187nOKkU30HBTvXqDKQ==
X-Received: by 2002:a63:85c8:0:b0:460:8e46:41c7 with SMTP id
 u191-20020a6385c8000000b004608e4641c7mr5296261pgd.285.1666148338089; 
 Tue, 18 Oct 2022 19:58:58 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 203-20020a6214d4000000b005626fcc32b0sm10320593pfu.175.2022.10.18.19.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 19:58:57 -0700 (PDT)
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
Subject: [PATCH v5 04/10] acpi/tests/avocado/bits: add smilatency test suite
 from bits in order to disable it
Date: Wed, 19 Oct 2022 08:28:22 +0530
Message-Id: <20221019025828.683113-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019025828.683113-1-ani@anisinha.ca>
References: <20221019025828.683113-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


