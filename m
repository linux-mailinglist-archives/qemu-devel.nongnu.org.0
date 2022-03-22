Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9044E3A00
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 08:59:33 +0100 (CET)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZQS-0005Kl-E7
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 03:59:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWZLC-0002eJ-5e
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:54:06 -0400
Received: from [2a00:1450:4864:20::42d] (port=36559
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWZLA-0004YQ-I2
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:54:05 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u3so586630wrg.3
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+6dRl75zq0lCLtLoIDkzXDRCUtv6AhTasggzkMpjwrM=;
 b=BQ5Tq8G6zJ3oBKSzuFIIWs/Qeh2tuz8wVIfStbiabZwCQzxpabCNSUGDckEkByZFoh
 vBWPse7PwO3drfeY9pxyl+ezvYIMeQjBWQ8fuzBde+Wk32sgpV1rJBCplYEov05X7XSA
 hOk1+1pH4LBzPq8RWWIjsRI4VsA3cvLHs/01PL8epuNhOBL8ciaLDC7jCn5efzc+1XbY
 jkqxJsKSfMPtyBXxewYL+zXEqi4KFlQFOFDhYsgShPVBnEUEJF/v7Op78OXhS70REI2A
 qoFBjtnGFw9EC9tzXN4Sv8LJKo4i7V+aoozlT3aYRzwcBXH+AJfRC+rihXGL5pmLQSY3
 6k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+6dRl75zq0lCLtLoIDkzXDRCUtv6AhTasggzkMpjwrM=;
 b=5y2C6bqLdNpEIIYsWW4nZSa8Za4bKanWiMbGt2LvXxubJBOrHIsUIdNbdVa6bdGvzE
 darwxY99r7/ng0Pb3v3FZ65SYW3/u0X2swypoJv1WSvQsXQ99tuqBQKbr046ZGwKX2mw
 8znA69CytX73voFrX/Hzg0mIYHH3R1nSoZMEvfFpn7aqpjcfNjxS3R7qSA8JWHhQI8yO
 G4oyv9aRGnEhC40tQ/xMOQGwh1Y1Q3cO0pruj7T7Z1IZ8JVhjCopieTIXTUbkdQ5KCmX
 eOdWR4czZ+7WcwTS0HJNb8eIf8/A8Vzcu/BhwHswGseXNrYQf3St4WuGa7Rh2ydtSf+k
 zviA==
X-Gm-Message-State: AOAM532ERsmIF6EEwQIK6WljFte04fCC0oLEP7rGoeVdT56UbliM9op0
 GotWFHcILiXSl1ID3iE9drIO8/DMRTk=
X-Google-Smtp-Source: ABdhPJxD5FcgNVhSxVXtw7f60JQ7xY/Qtiwy7V3/k634EIOXyEzBkSQac7931mfpshHs8bWzpGCIxA==
X-Received: by 2002:adf:b64c:0:b0:1e3:16d0:3504 with SMTP id
 i12-20020adfb64c000000b001e316d03504mr21131854wre.333.1647935642081; 
 Tue, 22 Mar 2022 00:54:02 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfbd8d000000b002040daf5dffsm8439076wrh.18.2022.03.22.00.54.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Mar 2022 00:54:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v2] qemu/main-loop: Disable block backend global state
 assertion on Cocoa
Date: Tue, 22 Mar 2022 08:54:00 +0100
Message-Id: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since commit 0439c5a462 ("block/block-backend.c: assertions for
block-backend") QEMU crashes when using Cocoa on Darwin hosts.

Example on macOS:

  $ qemu-system-i386
  Assertion failed: (qemu_in_main_thread()), function blk_all_next, file block-backend.c, line 552.
  Abort trap: 6

Looking with lldb:

  Assertion failed: (qemu_in_main_thread()), function blk_all_next, file block-backend.c, line 552.
  Process 76914 stopped
  * thread #1, queue = 'com.apple.main-thread', stop reason = hit program assert
     frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
  at block-backend.c:552:5 [opt]
      549    */
      550   BlockBackend *blk_all_next(BlockBackend *blk)
      551   {
  --> 552       GLOBAL_STATE_CODE();
      553       return blk ? QTAILQ_NEXT(blk, link)
      554                  : QTAILQ_FIRST(&block_backends);
      555   }
  Target 1: (qemu-system-i386) stopped.

  (lldb) bt
  * thread #1, queue = 'com.apple.main-thread', stop reason = hit program assert
     frame #0: 0x00000001908c99b8 libsystem_kernel.dylib`__pthread_kill + 8
     frame #1: 0x00000001908fceb0 libsystem_pthread.dylib`pthread_kill + 288
     frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
     frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
   * frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 at block-backend.c:552:5 [opt]
     frame #5: 0x00000001003c00b4 qemu-system-i386`blk_all_next(blk=<unavailable>) at block-backend.c:552:5 [opt]
     frame #6: 0x00000001003d8f04 qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at qapi.c:591:16 [opt]
     frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined] addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
     frame #8: 0x000000010003ab04 qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at cocoa.m:1980:5 [opt]
     frame #9: 0x00000001012690f4 dyld`start + 520

As we are in passed release 7.0 hard freeze, disable the block
backend assertion which, while being valuable during development,
is not helpful to users. We'll restore this assertion immediately
once 7.0 is released and work on a fix.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Supersedes: <20220321145537.98924-1-philippe.mathieu.daude@gmail.com>
---
 include/qemu/main-loop.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 7a4d6a0920..48061f736b 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -270,10 +270,22 @@ bool qemu_mutex_iothread_locked(void);
 bool qemu_in_main_thread(void);
 
 /* Mark and check that the function is part of the global state API. */
+#ifdef CONFIG_COCOA
+/*
+ * When using Cocoa ui, addRemovableDevicesMenuItems() calls qmp_query_block()
+ * while expecting the main thread to still hold the BQL, triggering this
+ * assertions in the block layer (commit 0439c5a462). As the Cocoa fix is not
+ * trivial, disable this assertion for the v7.0.0 release when using Cocoa; it
+ * will be restored immediately after the release. This issue is tracked as
+ * https://gitlab.com/qemu-project/qemu/-/issues/926
+ */
+#define GLOBAL_STATE_CODE()
+#else
 #define GLOBAL_STATE_CODE()                                         \
     do {                                                            \
         assert(qemu_in_main_thread());                              \
     } while (0)
+#endif /* CONFIG_DARWIN */
 
 /* Mark and check that the function is part of the I/O API. */
 #define IO_CODE()                                                   \
-- 
2.35.1


