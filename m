Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B34E7A43
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 19:38:33 +0100 (CET)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXopU-00044w-0c
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 14:38:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nXooD-0003OM-OB
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:37:13 -0400
Received: from [2a00:1450:4864:20::434] (port=43774
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nXooC-0004tc-04
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:37:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id a1so11988194wrh.10
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tEYgL40T/x7kdwY4gJR3FCxQe1fbvY3IMliaqBix/wY=;
 b=o7ijrHzQDzB6YXbxMfL3hDagOLKDa3WIR/c8sQBcbYwZ0Tmy9mE90pz6i1NNxDxtBj
 7DMAWWiwDnGvYyktPTiZQf+cRsJ23DgXV3mSUSFAifP7x3E4WLtHnTOc/5LMvamkzU+g
 iNX/QM9u5muqnLuTMcGfqQ+MDDTW6UjxUIFfjObDYFX+GWu/Husohfii/9Rv6KKDppCi
 gayhnEYDYJkAULgRF5EFrmi3u2OQoi3DL6GTMEVd+p2JhgjQIVQo1SXOajvDZPu3bK2Y
 Rg2IzkquQ+WDIBSwJCIEn+iZml8KYuSfY+7bsAdEOnNhpVVHF66DOVOcjgRwx5xIHHud
 ouRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tEYgL40T/x7kdwY4gJR3FCxQe1fbvY3IMliaqBix/wY=;
 b=7isK0XNiajWbBWjMpixVRmzV/zNa97A3s6cWhSfKjO3Ki45GMTd+5vMl6sF8pfJk45
 PluV+q5cnAp99+D22a+IIZlZoZHwqMxaLfG92suBCjuTtrCqfFhlaGFN91UWIOQvgqmn
 KcGJWklOMRP6qSMkq21GR9HgLuWzP/6mtsvbx8gbOvYREpMl2BigCqXiiHWp6W4JY0T8
 fNuQWwtDQSptR9PC2d3gAeLQzrxca0OEBHDvJOpe9l4x5kvlRRQtanwAOxUpjlK2hV95
 DrKhrZ6SFz6z9Clz51QQy7j7ip9C/7TO1QBd+wRijjQKfA9/2TUQUXJKOEY43owIxfaB
 7boQ==
X-Gm-Message-State: AOAM533J5kWufJ5b4BlILKp3mKca7JmMpMsLyYjpOd+MZ/e8HMjAuVzD
 gRsIaCKOc6niD0GIUIC3zuqYzjOtK20=
X-Google-Smtp-Source: ABdhPJx6m7eaWC8zdJY02cLUxK4yBBbXv9HF22BY5eM9abPPPYwQQ6OpzpYeLeklRRBIhdRm8iRiUw==
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr9920040wrc.513.1648233430361; 
 Fri, 25 Mar 2022 11:37:10 -0700 (PDT)
Received: from localhost.localdomain (120.net-94.228.4.isbl.embou.net.
 [94.228.4.120]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b0038cda9f92fasm3899739wms.0.2022.03.25.11.37.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Mar 2022 11:37:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v3] qemu/main-loop: Disable block backend global state
 assertion on Cocoa
Date: Fri, 25 Mar 2022 19:37:07 +0100
Message-Id: <20220325183707.85733-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
v3: Reword (Akihiko)
---
 include/qemu/main-loop.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 7a4d6a0920..89bd9edefb 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -270,10 +270,23 @@ bool qemu_mutex_iothread_locked(void);
 bool qemu_in_main_thread(void);
 
 /* Mark and check that the function is part of the global state API. */
+#ifdef CONFIG_COCOA
+/*
+ * When using the Cocoa UI, addRemovableDevicesMenuItems() is called from
+ * a thread different from the QEMU main thread and can not take the BQL,
+ * triggering this assertions in the block layer (commit 0439c5a462).
+ * As the Cocoa fix is not trivial, disable this assertion for the v7.0.0
+ * release (when using Cocoa); we will restore it immediately after the
+ * release.
+ * This issue is tracked as https://gitlab.com/qemu-project/qemu/-/issues/926
+ */
+#define GLOBAL_STATE_CODE()
+#else
 #define GLOBAL_STATE_CODE()                                         \
     do {                                                            \
         assert(qemu_in_main_thread());                              \
     } while (0)
+#endif /* CONFIG_COCOA */
 
 /* Mark and check that the function is part of the I/O API. */
 #define IO_CODE()                                                   \
-- 
2.35.1


