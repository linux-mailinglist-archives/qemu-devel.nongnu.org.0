Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114EA4EA328
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:46:23 +0200 (CEST)
Received: from localhost ([::1]:35892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYy7y-0000SX-3A
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:46:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2a-0002Zq-Hh
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:40:49 -0400
Received: from [2607:f8b0:4864:20::62c] (port=45990
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2Y-0007sZ-Iq
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:40:48 -0400
Received: by mail-pl1-x62c.google.com with SMTP id i11so4703343plg.12
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYlZM0nq3diwciC2cY9naycPEtvBEHpCnKrFUOpZVMM=;
 b=BcQyM8XNptyR7rEDeqEzbxAXEBRC3jETs9DATm9UfiTkw421bEz5y/aJ33vGh8pLg2
 DrSpufoqQo6fMZisTBswASGwmuvkaYLCk8TYX0Z93o5tyuN6vRqw1cxgaR6Zl8Js0oZJ
 zf76aMwuva+WkheWP2uHVEwgdC0azeNaue/6LzGJWFaYCEL+dGn33IjKvd04G5SgPUZ5
 +KXdO1vSIsjaxrWIhHNZpy2EbX5XuzjbV6VIHdIK0Q+Ltihq+jtt5kgGErQgCJxYP4h4
 UllT6elV3wllcwTeAlQ9OkEQlFfGavV24gN+VYbccjEp2ckM6l1cKjA9NkJZkbyA7uQ/
 ZCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYlZM0nq3diwciC2cY9naycPEtvBEHpCnKrFUOpZVMM=;
 b=iRBs9Tc4H7MRTv7tTzilBczkZPNXXWC4OZfjyQzFzWFX6wUW42Iv1SpbTIZFIF4exC
 0SlVXePyspLQahiNo6BSPWTlHYoTtBt9rfHPDwrCK0kIBKNkdLcOn9JzCuwIPLWtlCfs
 5raMp31YlBmWcAAAD5w3zDaErF3GxREJYBxQMnl9u8dMULAO/+jmZW9fGknfRiL4kE9K
 K6amGplzEChPAdamNmDsy+59jZyrbHsFhF6691zZqqvGPB44bK0gzeruczV5EMvAaFjf
 XuIrhAXCENjOf8RcSkGGPuCvhuNJ2AskKLeUsxWsWC2glGNZTBRYQNtzc/5b5YbolkNr
 /CeA==
X-Gm-Message-State: AOAM5323rNXI9UeV0f1eDOZaubH84HM3SS8p8QOAR9KWqTcbCAomJ9xh
 qVaeQmk5I/iTutRk3T9qlXOwfdmX/Nz+KQ==
X-Google-Smtp-Source: ABdhPJwMMGcuEvicDfdbeHNuZ4uXD5heIKEGi2Asf87ZUiQD3kfptW1o4oaTt/W8ty14Zo+n8bnwtg==
X-Received: by 2002:a17:903:41d1:b0:154:76c2:f7bc with SMTP id
 u17-20020a17090341d100b0015476c2f7bcmr27810462ple.109.1648507244991; 
 Mon, 28 Mar 2022 15:40:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a633c46000000b003817d623f72sm13989623pgn.24.2022.03.28.15.40.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Mar 2022 15:40:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] qemu/main-loop: Disable block backend global state
 assertion on Cocoa
Date: Tue, 29 Mar 2022 00:40:10 +0200
Message-Id: <20220328224012.32737-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
References: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
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

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220325183707.85733-1-philippe.mathieu.daude@gmail.com>
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


