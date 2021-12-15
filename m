Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA09476418
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:01:23 +0100 (CET)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbOr-00080n-7V
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:01:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbL8-0001bG-02
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:57:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbL4-00059W-PO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639601842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vh+8wU32JL1bhYQ0/2idBT2LvjJjYrC1aRBROqGEF/k=;
 b=VUVkYL+T8KkMBL8jrBgdWDz7wM4oZ7v+RoNHLhpEcR6PFXURPOuBtSmJxsjQ+J+L1NmvKh
 tlKZtGcAjjsxxOLOVQBZ6oIhMoiiuHOncEUSF15in7PsGbFCPGyEy8Zytq52+f3810VmS9
 K5UYY5M/emDIzr5chuSuF1VhRvobEw4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-9F9a91kfMVWiZDi7QZw9Cw-1; Wed, 15 Dec 2021 15:57:21 -0500
X-MC-Unique: 9F9a91kfMVWiZDi7QZw9Cw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p13-20020a05600c1d8d00b0034565e7e5c6so1727021wms.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vh+8wU32JL1bhYQ0/2idBT2LvjJjYrC1aRBROqGEF/k=;
 b=HudERy+FtcXYcZqLvuX/+6QO6EqvGoTPQ3sVFPS1sYF3yI+d0JT2iWaXHaBSktI2je
 qSaXozn4TAgjOL8H95wfqvfU7zZOFLmDWJMFL/Flx8aDgYIg1DN7UXa7IUAycOsEvsPX
 Iwj43QvdEHxXK5f5tPXac9J6wNPaVJuLNLEDna0VIkzh2SpVeLoUjUYgwDLuqWC14P7v
 /HYhW+5FmEx8AZAawWEixpFVo9YWUFd0v7E1m4gAsEGHsmyoA7HRoC1XbWdQxwE521kK
 fK9aiAIDorQg0BE6OuUcsFVLosLnHkbISOVvOs5eLTXjc5MhfWCKCskehqX5pmqNNjtG
 LVBQ==
X-Gm-Message-State: AOAM531B1dAaQHeMnbovJBB5FffWyTH1fd/VZmFkp7Do2UsV8aCj/1tT
 lwIRNdTmjRKoauLsp8jZkwT+4S0XF0LESlIyTh3g9onSQrGMuml6gP1CKatqarQfa+Q9X5M3mj0
 vHTSu2o+hSGcELPfe37BzTM1Sd3qnyafOvsXjBgEPmiyoqbe4oSTfVtmFiKYLfSTE
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr6189526wrr.365.1639601840307; 
 Wed, 15 Dec 2021 12:57:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw37XfrzBqGdGBXoqqYvYaWeB/rahHydYtiV9JcQeFcjTE+l927ViNq/rh1VthRoVcRj5lIFQ==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr6189492wrr.365.1639601839998; 
 Wed, 15 Dec 2021 12:57:19 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l8sm6536185wmc.40.2021.12.15.12.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:57:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] tests/qtest/fuzz-sdcard-test: Add reproducer for
 OSS-Fuzz (Issue 29225)
Date: Wed, 15 Dec 2021 21:56:56 +0100
Message-Id: <20211215205656.488940-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215205656.488940-1-philmd@redhat.com>
References: <20211215205656.488940-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include the qtest reproducer provided by Alexander Bulekov
in https://gitlab.com/qemu-project/qemu/-/issues/451. Without
the previous commit, we get:

  $ make check-qtest-i386
  ...
  Running test qtest-i386/fuzz-sdcard-test
  ==447470==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61500002a080 at pc 0x564c71766d48 bp 0x7ffc126c62b0 sp 0x7ffc126c62a8
  READ of size 1 at 0x61500002a080 thread T0
      #0 0x564c71766d47 in sdhci_read_dataport hw/sd/sdhci.c:474:18
      #1 0x564c7175f139 in sdhci_read hw/sd/sdhci.c:1022:19
      #2 0x564c721b937b in memory_region_read_accessor softmmu/memory.c:440:11
      #3 0x564c72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
      #4 0x564c7216f47c in memory_region_dispatch_read1 softmmu/memory.c:1424:16
      #5 0x564c7216ebb9 in memory_region_dispatch_read softmmu/memory.c:1452:9
      #6 0x564c7212db5d in flatview_read_continue softmmu/physmem.c:2879:23
      #7 0x564c7212f958 in flatview_read softmmu/physmem.c:2921:12
      #8 0x564c7212f418 in address_space_read_full softmmu/physmem.c:2934:18
      #9 0x564c721305a9 in address_space_rw softmmu/physmem.c:2962:16
      #10 0x564c7175a392 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
      #11 0x564c7175a0ea in dma_memory_rw include/sysemu/dma.h:132:12
      #12 0x564c71759684 in dma_memory_read include/sysemu/dma.h:152:12
      #13 0x564c7175518c in sdhci_do_adma hw/sd/sdhci.c:823:27
      #14 0x564c7174bf69 in sdhci_data_transfer hw/sd/sdhci.c:935:13
      #15 0x564c7176aaa7 in sdhci_send_command hw/sd/sdhci.c:376:9
      #16 0x564c717629ee in sdhci_write hw/sd/sdhci.c:1212:9
      #17 0x564c72172513 in memory_region_write_accessor softmmu/memory.c:492:5
      #18 0x564c72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
      #19 0x564c72170766 in memory_region_dispatch_write softmmu/memory.c:1504:16
      #20 0x564c721419ee in flatview_write_continue softmmu/physmem.c:2812:23
      #21 0x564c721301eb in flatview_write softmmu/physmem.c:2854:12
      #22 0x564c7212fca8 in address_space_write softmmu/physmem.c:2950:18
      #23 0x564c721d9a53 in qtest_process_command softmmu/qtest.c:727:9

  0x61500002a080 is located 0 bytes to the right of 512-byte region [0x615000029e80,0x61500002a080)
  allocated by thread T0 here:
      #0 0x564c708e1737 in __interceptor_calloc (qemu-system-i386+0x1e6a737)
      #1 0x7ff05567b5e0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x5a5e0)
      #2 0x564c71774adb in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5

  SUMMARY: AddressSanitizer: heap-buffer-overflow hw/sd/sdhci.c:474:18 in sdhci_read_dataport
  Shadow bytes around the buggy address:
    0x0c2a7fffd3c0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c2a7fffd3d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7fffd3e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7fffd3f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7fffd400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  =>0x0c2a7fffd410:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c2a7fffd420: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7fffd430: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7fffd440: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7fffd450: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7fffd460: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Heap left redzone:       fa
    Freed heap region:       fd
  ==447470==ABORTING
  Broken pipe
  ERROR qtest-i386/fuzz-sdcard-test - too few tests run (expected 3, got 2)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz-sdcard-test.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
index ae14305344a..6dfe26e983c 100644
--- a/tests/qtest/fuzz-sdcard-test.c
+++ b/tests/qtest/fuzz-sdcard-test.c
@@ -87,6 +87,81 @@ static void oss_fuzz_36217(void)
     qtest_quit(s);
 }
 
+/*
+ * https://gitlab.com/qemu-project/qemu/-/issues/451
+ * Used to trigger a heap buffer overflow.
+ */
+static void oss_fuzz_36391(void)
+{
+    QTestState *s;
+
+    s = qtest_init(" -display none -m 4G -nodefaults -nographic"
+                   " -device sdhci-pci,sd-spec-version=3"
+                   " -device sd-card,drive=drv"
+                   " -drive if=none,index=0,file=null-co://,format=raw,id=drv");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xe0000000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_bufwrite(s, 0xe0000005, "\x73", 0x1);
+    qtest_bufwrite(s, 0xe0000028, "\x55", 0x1);
+    qtest_bufwrite(s, 0xe000002c, "\x55", 0x1);
+    qtest_bufwrite(s, 0x0, "\x65", 0x1);
+    qtest_bufwrite(s, 0x7, "\x69", 0x1);
+    qtest_bufwrite(s, 0x8, "\x65", 0x1);
+    qtest_bufwrite(s, 0xf, "\x69", 0x1);
+    qtest_bufwrite(s, 0x10, "\x65", 0x1);
+    qtest_bufwrite(s, 0x17, "\x69", 0x1);
+    qtest_bufwrite(s, 0x18, "\x65", 0x1);
+    qtest_bufwrite(s, 0x1f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x20, "\x65", 0x1);
+    qtest_bufwrite(s, 0x27, "\x69", 0x1);
+    qtest_bufwrite(s, 0x28, "\x65", 0x1);
+    qtest_bufwrite(s, 0x2f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x30, "\x65", 0x1);
+    qtest_bufwrite(s, 0x37, "\x69", 0x1);
+    qtest_bufwrite(s, 0x38, "\x65", 0x1);
+    qtest_bufwrite(s, 0x3f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x40, "\x65", 0x1);
+    qtest_bufwrite(s, 0x47, "\x69", 0x1);
+    qtest_bufwrite(s, 0x48, "\x65", 0x1);
+    qtest_bufwrite(s, 0xe000000c, "\x55", 0x1);
+    qtest_bufwrite(s, 0xe000000e, "\x2c", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x5b", 0x1);
+    qtest_bufwrite(s, 0xe0000010, "\x06\x46", 0x2);
+    qtest_bufwrite(s, 0x50, "\x65", 0x1);
+    qtest_bufwrite(s, 0x57, "\x69", 0x1);
+    qtest_bufwrite(s, 0x58, "\x65", 0x1);
+    qtest_bufwrite(s, 0x5f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x60, "\x65", 0x1);
+    qtest_bufwrite(s, 0x67, "\x69", 0x1);
+    qtest_bufwrite(s, 0x68, "\x65", 0x1);
+    qtest_bufwrite(s, 0x6f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x70, "\x65", 0x1);
+    qtest_bufwrite(s, 0x77, "\x69", 0x1);
+    qtest_bufwrite(s, 0x78, "\x65", 0x1);
+    qtest_bufwrite(s, 0x7f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x80, "\x65", 0x1);
+    qtest_bufwrite(s, 0x87, "\x69", 0x1);
+    qtest_bufwrite(s, 0x88, "\x65", 0x1);
+    qtest_bufwrite(s, 0x8f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x90, "\x65", 0x1);
+    qtest_bufwrite(s, 0x97, "\x69", 0x1);
+    qtest_bufwrite(s, 0x98, "\x65", 0x1);
+    qtest_bufwrite(s, 0xe0000026, "\x5a\x06", 0x2);
+    qtest_bufwrite(s, 0xe0000028, "\x46\xc0\xc9\xc9", 0x4);
+    qtest_bufwrite(s, 0xe0000028, "\x55", 0x1);
+    qtest_bufwrite(s, 0xe000002a, "\x5a", 0x1);
+    qtest_bufwrite(s, 0xa0, "\x65", 0x1);
+    qtest_bufwrite(s, 0xa5, "\xff", 0x1);
+    qtest_bufwrite(s, 0xa6, "\xff", 0x1);
+    qtest_bufwrite(s, 0xa7, "\xdf", 0x1);
+    qtest_bufwrite(s, 0xe000000c, "\x27", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x55", 0x1);
+
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -96,6 +171,7 @@ int main(int argc, char **argv)
    if (strcmp(arch, "i386") == 0) {
         qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
         qtest_add_func("fuzz/sdcard/oss_fuzz_36217", oss_fuzz_36217);
+        qtest_add_func("fuzz/sdcard/oss_fuzz_36391", oss_fuzz_36391);
    }
 
    return g_test_run();
-- 
2.33.1


