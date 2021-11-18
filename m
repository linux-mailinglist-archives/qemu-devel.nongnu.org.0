Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E1B455B15
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:59:19 +0100 (CET)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mng4U-00041A-Gh
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:59:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mng36-0001rt-3v
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:57:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mng33-0002NI-NF
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:57:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637236669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXqu6cI8Td7cyUbAVYGjEIQ094Z6gc+ZX3XJfUB2WR4=;
 b=fQQiscwfJw3AZHkEuq1HnF6XbAvjpZdHyw8e02g2Px1OJDPpbo1NkQ+MKeroK6bZ5PIqU9
 w5MQdYkmNeyrE52ZxhjlpcYdWM4excMLYGMoOp9bn/4RR0+/teqBG3xOLW/FflAbVn2BIk
 b5rGWIGpB+fiU/6uk+y2KK0ck/ldErs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-_ZDtSy4yMwyF3q7cGIPnSw-1; Thu, 18 Nov 2021 06:57:48 -0500
X-MC-Unique: _ZDtSy4yMwyF3q7cGIPnSw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so3004157wmr.3
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 03:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KXqu6cI8Td7cyUbAVYGjEIQ094Z6gc+ZX3XJfUB2WR4=;
 b=AU7wwSDlbHQWM8t/99nZ+6/Vt2fm3aWXpJ0frPWgHuadNrB4Hzxsd3+ihcSDArJrL+
 0SfjQAVlUZK5XTU2ucKzJPSJ/ZTO2cbZVnsdYgM2aSyYYdbk0x98Eh/rQDao2Afq3zoz
 my5w8NPZCbJcmlaE4zf5MfChJXu5/ZIK3KpgpnN8yE+mraNt9IM+ZW6OanlCS/Mpfe2A
 z28XPgT/+pKFS8SJ/ReUbjIOeGrQM4dRAedF4FjrKZWD2qL/ls5hJbrxcf8UlkmB9Geg
 cWLs7Np9f0HzSr8/wpH+47ksOf8nsWD3dlu2RuQ6blPMbelowm8lifQshirIqqI2tWTC
 tnWQ==
X-Gm-Message-State: AOAM530Klga+/I98EdunuQUAyrbzg30F6OhZ5q0Vjo6291ya0ZNAWpkE
 AYKARPNTrzdcA63oX7F2tTZ11ZESW5BBAO5f2G/6fw+qHHC3l3iGfJGdCsjZoVc6P3WqWlekZHK
 F0FCGBC1OB+X6E6mKVB2H+G2Hvy2bU3Unx7zRklCGCHxRPHTgQFn4c5Mw9JmkaodG
X-Received: by 2002:a05:600c:2052:: with SMTP id
 p18mr9605123wmg.3.1637236664853; 
 Thu, 18 Nov 2021 03:57:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZEzmTMZG8+3e2xwjnrgJhhk9IWOOoQ90eGXVipQfu5+RT6mb1PZrqtpztaF1lqJ+WXakY3A==
X-Received: by 2002:a05:600c:2052:: with SMTP id
 p18mr9605064wmg.3.1637236664465; 
 Thu, 18 Nov 2021 03:57:44 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 y12sm2937767wrn.73.2021.11.18.03.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 03:57:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 2/2] tests/qtest/fdc-test: Add a regression test for
 CVE-2021-3507
Date: Thu, 18 Nov 2021 12:57:33 +0100
Message-Id: <20211118115733.4038610-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118115733.4038610-1-philmd@redhat.com>
References: <20211118115733.4038610-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the reproducer from https://gitlab.com/qemu-project/qemu/-/issues/339

Without the previous commit, when running 'make check-qtest-i386'
with QEMU configured with '--enable-sanitizers' we get:

  ==4028352==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb4198bc0
  READ of size 786432 at 0x619000062a00 thread T0
      #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
      #1 0x5626d1c023cc in flatview_write_continue softmmu/physmem.c:2787:13
      #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
      #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:18
      #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
      #5 0x5626d1bf14c8 in cpu_physical_memory_rw softmmu/physmem.c:2933:5
      #6 0x5626d0bd5649 in cpu_physical_memory_write include/exec/cpu-common.h:82:5
      #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
      #8 0x5626d09f825d in fdctrl_transfer_handler hw/block/fdc.c:1616:13
      #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:13
      #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
      #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
      #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17

  0x619000062a00 is located 0 bytes to the right of 512-byte region [0x619000062800,0x619000062a00)
  allocated by thread T0 here:
      #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
      #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
      #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
      #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:20
      #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
      #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13

  SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1e65919) in __asan_memcpy
  Shadow bytes around the buggy address:
    0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  =>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Heap left redzone:       fa
    Freed heap region:       fd
  ==4028352==ABORTING

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 26b69f7c5cd..f164d972d10 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -546,6 +546,25 @@ static void fuzz_registers(void)
     }
 }
 
+static void test_cve_2021_3507(void)
+{
+    QTestState *s;
+
+    s = qtest_initf("-nographic -m 32M -nodefaults "
+                    "-drive file=%s,format=raw,if=floppy", test_image);
+    qtest_outl(s, 0x9, 0x0a0206);
+    qtest_outw(s, 0x3f4, 0x1600);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0200);
+    qtest_outw(s, 0x3f4, 0x0200);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     int fd;
@@ -576,6 +595,7 @@ int main(int argc, char **argv)
     qtest_add_func("/fdc/read_no_dma_18", test_read_no_dma_18);
     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
+    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
 
     ret = g_test_run();
 
-- 
2.31.1


