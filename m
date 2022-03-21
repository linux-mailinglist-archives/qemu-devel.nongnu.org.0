Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440C4E2B52
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:56:57 +0100 (CET)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJSp-0006bu-Pa
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:56:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWJRf-0005Et-0W
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:55:46 -0400
Received: from [2a00:1450:4864:20::42a] (port=46767
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWJRd-0005ep-C8
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:55:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h4so3101443wrc.13
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IqBFwcmzlbQu2H2GtfAQNxERGf6aNf6IaD8GQBwol7M=;
 b=IWn+D8JleAPUSBRvhmeaOUBuwIAwjS/OG0mwkjCUrTR5jvvR7uunfFvEfQxRSZsl9B
 o6cm3U4sGmyDvfvMuOU9Fi09J5NeSTnNbp30UqBFe7uipiTV4Hhm5YumEu7Nuu6FmmnZ
 IBEA24izM9K2zOUQV5slXyWmlveuOPI/55PE3IMsB+kpGYbjVYkK9N+OEiX0ShdKzHjt
 9jdhd+AkCSf1uETo3IeCSsJxE1ZlC1YNGoZ3IaqKkPqN0KJtJc8XpMp0dvDq2JVCtlM8
 J2++5GVhIpVagGJv2KPf7E0FFRVEhXfQ6s1TvjOxM14I4NPD2O3GJGsmQPRG8K9b0Npc
 tzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IqBFwcmzlbQu2H2GtfAQNxERGf6aNf6IaD8GQBwol7M=;
 b=hzPS/xfDIAYyJ5/xVmtk5LdxIul0rH1C+6n6lRIInCQSSM3sRgLOz2Oy5uI7mlEDOz
 /mZfjTvIotVDeYvKP+56Dp8YUJ9SjtelnQJXprj8IzN3uqwgG7jw27YCVCLZs17hWB3j
 LJJ3KwlIm1GVOjClbRg12h07lEmCu5VrsLTeQt9sTQGqkEluAbJj/y54JDCHaSuRE7HQ
 OhA91ukDUTwNARMayZK0YZYjDs8A9haYx6os/oDO4qkqxLKwSag8FTnZzbI6WYxVEpVG
 SZWLZl0N4zJ2H5rUc4TrTAZ8uULcKVNL8hm5KkgUiygKHuY7c5/Jh6h5GuEvL64WxKX3
 CHqA==
X-Gm-Message-State: AOAM533ZmCm8Zv4J33d5DkZlnkDF62xWo283spSRccGILuTFfGq88a70
 /2uz0fSCkhAc/cLW5HMFDKrPwju/8xp1CQ==
X-Google-Smtp-Source: ABdhPJyzAzElGU7z4HJqG5PX4nEwxUzkWla2prptj+gha4nrEDLq3h5xjRu6H0txd56SiabRZtq6BA==
X-Received: by 2002:a5d:47cb:0:b0:203:fa18:3657 with SMTP id
 o11-20020a5d47cb000000b00203fa183657mr12115332wrc.490.1647874539089; 
 Mon, 21 Mar 2022 07:55:39 -0700 (PDT)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm2437530wmb.36.2022.03.21.07.55.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 21 Mar 2022 07:55:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0] qemu/main-loop: Disable block backend global state
 assertion on Darwin
Date: Mon, 21 Mar 2022 15:55:37 +0100
Message-Id: <20220321145537.98924-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
block-backend") QEMU crashes on Darwin hosts, example on macOS:

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
 include/qemu/main-loop.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 7a4d6a0920..c27968ce33 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -270,10 +270,14 @@ bool qemu_mutex_iothread_locked(void);
 bool qemu_in_main_thread(void);
 
 /* Mark and check that the function is part of the global state API. */
+#ifdef CONFIG_DARWIN
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


