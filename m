Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A7F2D9B9E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:00:38 +0100 (CET)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqH7-0001Ih-FD
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:00:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEN-0007qv-4q; Mon, 14 Dec 2020 10:57:48 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:33011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEJ-0001PG-V1; Mon, 14 Dec 2020 10:57:46 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MYNS0-1kbD5412tW-00VMqL; Mon, 14 Dec 2020 16:57:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/19] qemu-options.hx: Fix minor issues in icount documentation
Date: Mon, 14 Dec 2020 16:57:16 +0100
Message-Id: <20201214155733.207430-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p/tHvfoeP1YHaAepxycYGHCI5A2loL+jaiXRn5NyVdmTbPD5Cox
 BlhzuYkTjvnXpdxsd2XYOp1NJjhRjylIVbIM8fGiAMfZmubhMLr4XNvqmOK3Jx0eaCmE4iq
 Z4863uGqhJIX6WqdBjUMn95heeq3DATaDWOLcPZDEbqdmzQZwPC3fg2Oj13zavB1I3p38Up
 oP4rXZPei+71fSLw1d9Qw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k6kugBOBskA=:D99hRrClOnKv3MnjhPzOhB
 kvAp76+FyYmT135dx2A48ObZUG9Qd3iB4jmkjLzqKa8We4waicij11Y8dyN5kKs2nUh7YYfyH
 klGKVtbrtAEPuqBfMisupfInhaEvzYmORojCs8rOgMlRI9nAc/Hhv5OyZWd5TTWA5BamdGyZi
 o2n/aUrcZmFeDtX3KsjkbO0KffdFPwLYTbQlPWWY6Fk6hf515IXppbj5lH2lW85rAlnJYAsL2
 wndN4Jnccu/gDBUzwiJpmyfTc+O+qTJ4wKqZiGvSQdYU/YjmfJvzXoiNqxs4SQqk+fHOagPlB
 yt+xV0Vp6x3XTHPAJSl0D1FZyClKBXkVWN0szCOXiaCG/x4fidfQNP45KI2SqmBltSwX884cR
 H/Fm4bYUdNey40uGR4wHG309YsmcoxWi+klayqTnl0rV4rH2dOwR4i8bVU59RmWgbg6aZOep9
 aKAsHt4Dhw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201121213506.15599-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index e60ad42976d0..ae8872d1d664 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3958,30 +3958,34 @@ SRST
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
@@ -3991,15 +3995,17 @@ SRST
     ``shift`` is ``auto``. Note: The sync algorithm will work for those
     shift values for which the guest clock runs ahead of the host clock.
     Typically this happens when the shift value is high (how high
-    depends on the host machine).
-
-    When ``rr`` option is specified deterministic record/replay is
-    enabled. Replay log is written into filename file in record mode and
-    read from this file in replay mode.
-
-    Option rrsnapshot is used to create new vm snapshot named snapshot
-    at the start of execution recording. In replay mode this option is
-    used to load the initial VM state.
+    depends on the host machine). The default if icount is enabled
+    is ``align=off``.
+
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
2.29.2


