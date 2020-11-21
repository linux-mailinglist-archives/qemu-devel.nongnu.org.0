Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44E2BC247
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 22:36:01 +0100 (CET)
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgaY4-0003o0-9Y
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 16:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgaXI-0003Fa-NK
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 16:35:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgaXG-0001iF-VY
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 16:35:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c198so12411522wmd.0
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=30WBmceDJTwPjxsqmGWIVvM+TI3KmymUlL0VgNa9GhE=;
 b=GSNdHgksvPN0FGKgAKUWrHw694OjI3izwPC99y1Jx1TuqVkDcJvNj9OPYNh8VXjArl
 s/x9N8DuK0QeOO6UnD6aZGijKDpbJr+dew+fh7RZGHNgryqdluVOtKC5GsNG5s/CpasA
 6+Wd/01TIVEGS2FvibLBN8SD7uz7qjt2DDTg5SfGBO+5Bn/ERXSy1X1h0/pXkf3iCvY/
 2QuSDT7ByUzVvPIFCkZSSO2blzl5BoTI/iNsMWlSzpIEkr1x2/TJYEHGbqi7VLlRdoPe
 ieMvXfoVegk3NE92JnkMXJW5Gjd2bI/9yPNZ0cpwjHnNUEvbVkLAAfvzgf4KEEt5HxdJ
 R3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=30WBmceDJTwPjxsqmGWIVvM+TI3KmymUlL0VgNa9GhE=;
 b=UsI+zKO7+NhRfXnX69nX4CuW2mQC8pmoZJH1CO7Odfy3M5XKIC9GbFsWNiLskBX08c
 /cDq72yEmAc/ea5OumGLU6sHTcEFUZn0pLG7aGRfn+8fO5Q9/UD7MgVC/5z0JnUvAB74
 4nQonuUgqaohc9Hvq6uumPBjAqJUiaLh1U7ycKsRB/G/g4OXHQJC03kr1kMSb4ooLV0J
 2Ix1uVucw3Atx2SpJAgFXzKgKiaYt1/p/9gTkpoTSR1VeuBuiZhR8xdo9gQ+g1pWmB0p
 4invQLTYruYw9szcSl9CCG2l1K0SW2ohogbkF6ptsoWXHpGUSD+VTlhdFhzcNNEqMHA1
 6BXA==
X-Gm-Message-State: AOAM530vD9nrbZva3mjMKS/O2XUSD7Nafxg4lGmA8UFiBI3tXW7cCpfz
 +YQU1Pf4bGOYpSBkl+sz2+TEx+NjkDzozg==
X-Google-Smtp-Source: ABdhPJwodMoB89BNH+U6xjqIXSP5WwJTD6p/Zotep09dSHRY0MkvJkz8Sy+JrLmXaC5fHng+J6RPzQ==
X-Received: by 2002:a7b:cf09:: with SMTP id l9mr6251415wmg.54.1605994508373;
 Sat, 21 Nov 2020 13:35:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n128sm8814122wmb.46.2020.11.21.13.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 13:35:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] qemu-options.hx: Fix minor issues in icount documentation
Date: Sat, 21 Nov 2020 21:35:06 +0000
Message-Id: <20201121213506.15599-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation for the icount documentation has some minor issues:
 * in a couple of places it says "sleep=on|off" when in the context of the
   sentence it means specifically "sleep=on"
 * the synopsis line for the documentation has drifted out of sync
   with the synopsis line in the DEF() macro (used for "-help" output)
 * the synopsis line in the DEF() macro is missing a "][" between
   the sleep= part and the rr= part
 * the synopsis line doesn't indicate that rrsnapshot is an optional
   part of the rr=mode,rrfile=filename subgrouping
 * we don't document that sleep=on can't be used with shift=auto
   or align=on
 * the rr option description had some minor grammar and formatting
   errors and was a bit terse
 * in commit f1f4b57e88ff in 2015 the documentation of the sleep=
   suboption got added between the two paragraphs defining general
   behaviour of the icount option. This meant that the second
   paragraph talking about the behaviour of "this option" reads as
   if it's talking about sleep=on, when it's really describing -icount
   as a whole. The paragraph is better moved back up to above the
   sleep= section.
 * the summary text displayed in "-help" output didn't mention
   the record-and-replay part

Fix these errors.

Fixes: https://bugs.launchpad.net/qemu/+bug/1774412
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qemu-options.hx | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 2c83390504d..41cb42e7a5d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3956,30 +3956,34 @@ SRST
 ERST
 
 DEF("icount", HAS_ARG, QEMU_OPTION_icount, \
-    "-icount [shift=N|auto][,align=on|off][,sleep=on|off,rr=record|replay,rrfile=<filename>,rrsnapshot=<snapshot>]\n" \
+    "-icount [shift=N|auto][,align=on|off][,sleep=on|off][,rr=record|replay,rrfile=<filename>[,rrsnapshot=<snapshot>]]\n" \
     "                enable virtual instruction counter with 2^N clock ticks per\n" \
     "                instruction, enable aligning the host and virtual clocks\n" \
-    "                or disable real time cpu sleeping\n", QEMU_ARCH_ALL)
+    "                or disable real time cpu sleeping, and optionally enable\n" \
+    "                record-and-replay mode\n", QEMU_ARCH_ALL)
 SRST
-``-icount [shift=N|auto][,rr=record|replay,rrfile=filename,rrsnapshot=snapshot]``
+``-icount [shift=N|auto][,align=on|off][,sleep=on|off][,rr=record|replay,rrfile=filename[,rrsnapshot=snapshot]]``
     Enable virtual instruction counter. The virtual cpu will execute one
     instruction every 2^N ns of virtual time. If ``auto`` is specified
     then the virtual cpu speed will be automatically adjusted to keep
     virtual time within a few seconds of real time.
 
-    When the virtual cpu is sleeping, the virtual time will advance at
-    default speed unless ``sleep=on|off`` is specified. With
-    ``sleep=on|off``, the virtual time will jump to the next timer
-    deadline instantly whenever the virtual cpu goes to sleep mode and
-    will not advance if no timer is enabled. This behavior give
-    deterministic execution times from the guest point of view.
-
     Note that while this option can give deterministic behavior, it does
     not provide cycle accurate emulation. Modern CPUs contain
     superscalar out of order cores with complex cache hierarchies. The
     number of instructions executed often has little or no correlation
     with actual performance.
 
+    When the virtual cpu is sleeping, the virtual time will advance at
+    default speed unless ``sleep=on`` is specified. With
+    ``sleep=on``, the virtual time will jump to the next timer
+    deadline instantly whenever the virtual cpu goes to sleep mode and
+    will not advance if no timer is enabled. This behavior gives
+    deterministic execution times from the guest point of view.
+    The default if icount is enabled is ``sleep=off``.
+    ``sleep=on`` cannot be used together with either ``shift=auto``
+    or ``align=on``.
+
     ``align=on`` will activate the delay algorithm which will try to
     synchronise the host clock and the virtual clock. The goal is to
     have a guest running at the real frequency imposed by the shift
@@ -3989,15 +3993,17 @@ SRST
     ``shift`` is ``auto``. Note: The sync algorithm will work for those
     shift values for which the guest clock runs ahead of the host clock.
     Typically this happens when the shift value is high (how high
-    depends on the host machine).
+    depends on the host machine). The default if icount is enabled
+    is ``align=off``.
 
-    When ``rr`` option is specified deterministic record/replay is
-    enabled. Replay log is written into filename file in record mode and
-    read from this file in replay mode.
-
-    Option rrsnapshot is used to create new vm snapshot named snapshot
-    at the start of execution recording. In replay mode this option is
-    used to load the initial VM state.
+    When the ``rr`` option is specified deterministic record/replay is
+    enabled. The ``rrfile=`` option must also be provided to
+    specify the path to the replay log. In record mode data is written
+    to this file, and in replay mode it is read back.
+    If the ``rrsnapshot`` option is given then it specifies a VM snapshot
+    name. In record mode, a new VM snapshot with the given name is created
+    at the start of execution recording. In replay mode this option
+    specifies the snapshot name used to load the initial VM state.
 ERST
 
 DEF("watchdog", HAS_ARG, QEMU_OPTION_watchdog, \
-- 
2.20.1


