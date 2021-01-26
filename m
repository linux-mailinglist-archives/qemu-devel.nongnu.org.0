Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49528303B84
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:24:16 +0100 (CET)
Received: from localhost ([::1]:58260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MSF-0001MP-AH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MNK-00058J-UW
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:19:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MNI-0000em-GL
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TryUrxB8yMv4YKiWEC/ozcL3ABykhv7UZKQxcAY+VnE=;
 b=H8NKzo1sv3F5v1Y96Is4Pnjx4EDwG1O1rErdfzcejvG7xsE5La1hWbaqV8H2cvP+orkX7i
 kOPH9HRwMc3EFgoP06QJu9Cs9ZbAY4dqtf94C9XQNbVdVPdcuBxIMTGtWf9tR+7eUZx3UG
 8cEZbhXiPVbh/cYRle5urwG93+2tETs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-V2H7CBefOn6wQZX364euWQ-1; Tue, 26 Jan 2021 06:19:04 -0500
X-MC-Unique: V2H7CBefOn6wQZX364euWQ-1
Received: by mail-ed1-f70.google.com with SMTP id q12so4396232edr.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TryUrxB8yMv4YKiWEC/ozcL3ABykhv7UZKQxcAY+VnE=;
 b=X+ROq2N+R62i9bopGw2h6+kiLL3Zpm6Dj2e65O3f3kbnd8AKp8rol8noDOKx9qcj5l
 vkY4Y+BgBB/b4y/srouNQSwNjF611pF3v6lGRx/BdMcRc2o1EBUnWlYED68wwb4pm1uF
 PoBS0PiQy5JNDKQAys4D+1PCNIseTBodUUSpo7gOYY6XSTG6Y38W5kVXOgXLrAWRne4v
 CDuz32GnPd+Zjjgb4vLRUizePopB1bSS40IjC5m9by9To53crZaolPmR5e+qAYurk4Dn
 mxMGh7ANBrkfjNIJZ7gu2xHw6fYA75RuulsLhhj5oQm0fezVFzUik5CnP50oS/Qej+Kj
 mzFg==
X-Gm-Message-State: AOAM533JyZC5Flqwm9KmgBwqrMt2p0navtvk3EgC/X2MGK+u4KvXljBV
 M4ULPYHQvUG/qv0WEgfoNF5MCQEjnNFSQJ8K33PPmza0Dh+eWxIpcNuk80oJmUsnSfi64RJZ/cH
 koaOP4p214vKVH4eLHhrXSDw/H7Ra9kSIBjvygHCoA2JuimuubrMfLcE6zeLnIwj7
X-Received: by 2002:a05:6402:d1:: with SMTP id
 i17mr4140884edu.85.1611659942274; 
 Tue, 26 Jan 2021 03:19:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzxER0PEZRhHm3c58N+WXC/txy45yYHBW5x872xLny42FfycGNlrnmsO78JgvCnQD5Fm2TLA==
X-Received: by 2002:a05:6402:d1:: with SMTP id
 i17mr4140851edu.85.1611659941935; 
 Tue, 26 Jan 2021 03:19:01 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f22sm9641366eje.34.2021.01.26.03.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:19:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Date: Tue, 26 Jan 2021 12:18:47 +0100
Message-Id: <20210126111847.3142636-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126111847.3142636-1-philmd@redhat.com>
References: <20210126111847.3142636-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU fuzzer reported a buffer overflow in _eth_get_rss_ex_dst_addr()
reproducible as:

  $ cat << EOF | ./qemu-system-i386 -M pc-q35-5.0 \
    -accel qtest -monitor none \
    -serial none -nographic -qtest stdio
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe1020000
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  write 0x25 0x1 0x86
  write 0x26 0x1 0xdd
  write 0x4f 0x1 0x2b
  write 0xe1020030 0x4 0x190002e1
  write 0xe102003a 0x2 0x0807
  write 0xe1020048 0x4 0x12077cdd
  write 0xe1020400 0x4 0xba077cdd
  write 0xe1020420 0x4 0x190002e1
  write 0xe1020428 0x4 0x3509d807
  write 0xe1020438 0x1 0xe2
  EOF
  =================================================================
  ==2859770==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffdef904902 at pc 0x561ceefa78de bp 0x7ffdef904820 sp 0x7ffdef904818
  READ of size 1 at 0x7ffdef904902 thread T0
      #0 0x561ceefa78dd in _eth_get_rss_ex_dst_addr net/eth.c:410:17
      #1 0x561ceefa41fb in eth_parse_ipv6_hdr net/eth.c:532:17
      #2 0x561cef7de639 in net_tx_pkt_parse_headers hw/net/net_tx_pkt.c:228:14
      #3 0x561cef7dbef4 in net_tx_pkt_parse hw/net/net_tx_pkt.c:273:9
      #4 0x561ceec29f22 in e1000e_process_tx_desc hw/net/e1000e_core.c:730:29
      #5 0x561ceec28eac in e1000e_start_xmit hw/net/e1000e_core.c:927:9
      #6 0x561ceec1baab in e1000e_set_tdt hw/net/e1000e_core.c:2444:9
      #7 0x561ceebf300e in e1000e_core_write hw/net/e1000e_core.c:3256:9
      #8 0x561cef3cd4cd in e1000e_mmio_write hw/net/e1000e.c:110:5

  Address 0x7ffdef904902 is located in stack of thread T0 at offset 34 in frame
      #0 0x561ceefa320f in eth_parse_ipv6_hdr net/eth.c:486

    This frame has 1 object(s):
      [32, 34) 'ext_hdr' (line 487) <== Memory access at offset 34 overflows this variable
  HINT: this may be a false positive if your program uses some custom stack unwind mechanism, swapcontext or vfork
        (longjmp and C++ exceptions *are* supported)
  SUMMARY: AddressSanitizer: stack-buffer-overflow net/eth.c:410:17 in _eth_get_rss_ex_dst_addr
  Shadow bytes around the buggy address:
    0x10003df188d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df188e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df188f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df18900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df18910: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
  =>0x10003df18920:[02]f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df18930: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df18940: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df18950: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df18960: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x10003df18970: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Partially addressable: 01 02 03 04 05 06 07
    Stack left redzone:      f1
    Stack right redzone:     f3
  ==2859770==ABORTING

Similarly GCC 11 reports:

  net/eth.c: In function 'eth_parse_ipv6_hdr':
  net/eth.c:410:15: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
    410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
        |          ~~~~~^~~~~~~
  net/eth.c:485:24: note: while referencing 'ext_hdr'
    485 |     struct ip6_ext_hdr ext_hdr;
        |                        ^~~~~~~
  net/eth.c:410:38: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
    410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
        |                                 ~~~~~^~~~~~~~~
  net/eth.c:485:24: note: while referencing 'ext_hdr'
    485 |     struct ip6_ext_hdr ext_hdr;
        |                        ^~~~~~~

In eth_parse_ipv6_hdr() we called iov_to_buf() to fill the 2 bytes of
the 'ext_hdr' buffer, then _eth_get_rss_ex_dst_addr() tries to access
beside the 2 filled bytes.

Fix by reworking the function, filling the full rt_hdr buffer on the
stack calling iov_to_buf() again.

Add the corresponding qtest case with the fuzzer reproducer.

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e functionality")
Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c                      | 25 +++++++---------
 tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                    |  1 +
 tests/qtest/meson.build        |  1 +
 4 files changed, 66 insertions(+), 14 deletions(-)
 create mode 100644 tests/qtest/fuzz-e1000e-test.c

diff --git a/net/eth.c b/net/eth.c
index 7d4dd48c1ff..ae4db37888e 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -401,26 +401,23 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
 
 static bool
 _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
-                        size_t rthdr_offset,
+                        size_t ext_hdr_offset,
                         struct ip6_ext_hdr *ext_hdr,
                         struct in6_address *dst_addr)
 {
-    struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
+    struct ip6_ext_hdr_routing rt_hdr;
+    size_t input_size = iov_size(pkt, pkt_frags);
+    size_t bytes_read;
 
-    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
+    if (input_size < ext_hdr_offset + sizeof(rt_hdr)) {
+        return false;
+    }
 
-        size_t input_size = iov_size(pkt, pkt_frags);
-        size_t bytes_read;
+    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset,
+                            &rt_hdr, sizeof(rt_hdr));
 
-        if (input_size < rthdr_offset + sizeof(*ext_hdr)) {
-            return false;
-        }
-
-        bytes_read = iov_to_buf(pkt, pkt_frags,
-                                rthdr_offset + sizeof(*ext_hdr),
-                                dst_addr, sizeof(*dst_addr));
-
-        return bytes_read == sizeof(*dst_addr);
+    if ((rt_hdr.rtype == 2) && (rt_hdr.segleft == 1)) {
+        return bytes_read == sizeof(*ext_hdr) + sizeof(*dst_addr);
     }
 
     return false;
diff --git a/tests/qtest/fuzz-e1000e-test.c b/tests/qtest/fuzz-e1000e-test.c
new file mode 100644
index 00000000000..66229e60964
--- /dev/null
+++ b/tests/qtest/fuzz-e1000e-test.c
@@ -0,0 +1,53 @@
+/*
+ * QTest testcase for e1000e device generated by fuzzer
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+
+/*
+ * https://bugs.launchpad.net/qemu/+bug/1879531
+ */
+static void test_lp1879531_eth_get_rss_ex_dst_addr(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-nographic -monitor none -serial none -M pc-q35-5.0");
+
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xe1020000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_writeb(s, 0x25, 0x86);
+    qtest_writeb(s, 0x26, 0xdd);
+    qtest_writeb(s, 0x4f, 0x2b);
+
+    qtest_writel(s, 0xe1020030, 0x190002e1);
+    qtest_writew(s, 0xe102003a, 0x0807);
+    qtest_writel(s, 0xe1020048, 0x12077cdd);
+    qtest_writel(s, 0xe1020400, 0xba077cdd);
+    qtest_writel(s, 0xe1020420, 0x190002e1);
+    qtest_writel(s, 0xe1020428, 0x3509d807);
+    qtest_writeb(s, 0xe1020438, 0xe2);
+    qtest_writeb(s, 0x4f, 0x2b);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("fuzz/test_lp1879531_eth_get_rss_ex_dst_addr",
+                       test_lp1879531_eth_get_rss_ex_dst_addr);
+    }
+
+    return g_test_run();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 48c0ec41e93..e275c81fd49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1968,6 +1968,7 @@ e1000e
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
 F: hw/net/e1000e*
+F: tests/qtest/fuzz-e1000e-test.c
 
 eepro100
 M: Stefan Weil <sw@weilnetz.de>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f2090296597..e19e2913547 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -7,6 +7,7 @@
 qtests_generic = \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
   (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   [
   'cdrom-test',
   'device-introspect-test',
-- 
2.26.2


