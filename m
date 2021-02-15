Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2893A31B9E0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:57:47 +0100 (CET)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdRi-0000BH-4T
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFx-00048G-Fw
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:37 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:42653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFr-0000gy-MM
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:37 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M593i-1lCjBV1oPs-001740; Mon, 15 Feb 2021 13:45:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] docs/user: Remove outdated 'Quick Start' section
Date: Mon, 15 Feb 2021 13:45:18 +0100
Message-Id: <20210215124519.720265-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6JmhkBcIZLNPBn5cQjoXcxgzYkCgWEsbXlKbj5wtk1wH130ruv5
 mhhYbg+vg5aSa5uzBdM+hPcA/TUiYN+lrpQPbZPNW/NEstmYhHN/4ZpZ5LaZ0XXn6WuV7xu
 LOEOgLjwS1ji9CrgL6KkcjyNDdirny7l+J8tbCKwQ1M1gLSg2FSMe+86HFgrNr2S/ju/U6B
 s/R22SKI5hOS0XK4tdzlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mvn1i4mtv0Q=:AePhWnZLnLpth0GIZiM6u5
 mYtLW9o4uX7VGT2l7slKv+cpVWqD5UEh2KRO/PY7VUQwb7+AofC9TyYWUCGv8aaHwc4Vnzkzm
 PCnFPwQU0+Pp60vKAbT01sB7I8uTE2IHEOW3jZmxt0pDGzA9xvBC7etKS89cwI94A1Sdcr0FD
 GlPKMJVNL7EKKnMhHnpqeMFFIUybRyIb0ZxF0MAfCtqQAQW3o9VFZzhdnwe9JdWMC3OwCbtHV
 wHq/T7X+QdN5xI22/uviPC3lvy8iLFDY+cmuLZhgiYRZLAMY5bSGvT6OEEn/nb2tVukH5s54z
 xY0gakNtF/8gxkVLrCiGGwAJV2zjeYJPdUEqIRhR5LtR+ETUw9vDyHcoeEX3wbW9A1yrSTDD+
 ev1qj4QtBfhLokJ8rQtWaQFJ9ruUOZpFy0eFWcvGHoSl5zpwDyplAZkLfMBms4jF6B0z9RiTG
 od60lp5YGw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The 'Quick Start' section of the userspace emulator documentation is
very old and outdated. In particular:
 - it suggests running x86-on-x86 emulation, which is the least
   interesting possible use case
 - it recommends that users download tarballs of guest binaries
   from the QEMU web page which we no longer provide there

There's nothing salvageable here; delete it all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201122000131.18487-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/user/main.rst | 61 ----------------------------------------------
 1 file changed, 61 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index 8dfe232a3af1..e08d4be63b71 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -45,67 +45,6 @@ emulator.
 Linux User space emulator
 -------------------------
 
-Quick Start
-~~~~~~~~~~~
-
-In order to launch a Linux process, QEMU needs the process executable
-itself and all the target (x86) dynamic libraries used by it.
-
--  On x86, you can just try to launch any process by using the native
-   libraries::
-
-      qemu-i386 -L / /bin/ls
-
-   ``-L /`` tells that the x86 dynamic linker must be searched with a
-   ``/`` prefix.
-
--  Since QEMU is also a linux process, you can launch QEMU with QEMU
-   (NOTE: you can only do that if you compiled QEMU from the sources)::
-
-      qemu-i386 -L / qemu-i386 -L / /bin/ls
-
--  On non x86 CPUs, you need first to download at least an x86 glibc
-   (``qemu-runtime-i386-XXX-.tar.gz`` on the QEMU web page). Ensure that
-   ``LD_LIBRARY_PATH`` is not set::
-
-      unset LD_LIBRARY_PATH
-
-   Then you can launch the precompiled ``ls`` x86 executable::
-
-      qemu-i386 tests/i386/ls
-
-   You can look at ``scripts/qemu-binfmt-conf.sh`` so that QEMU is
-   automatically launched by the Linux kernel when you try to launch x86
-   executables. It requires the ``binfmt_misc`` module in the Linux
-   kernel.
-
--  The x86 version of QEMU is also included. You can try weird things
-   such as::
-
-      qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
-                /usr/local/qemu-i386/bin/ls-i386
-
-Wine launch
-~~~~~~~~~~~
-
--  Ensure that you have a working QEMU with the x86 glibc distribution
-   (see previous section). In order to verify it, you must be able to
-   do::
-
-      qemu-i386 /usr/local/qemu-i386/bin/ls-i386
-
--  Download the binary x86 Wine install (``qemu-XXX-i386-wine.tar.gz``
-   on the QEMU web page).
-
--  Configure Wine on your account. Look at the provided script
-   ``/usr/local/qemu-i386/bin/wine-conf.sh``. Your previous
-   ``${HOME}/.wine`` directory is saved to ``${HOME}/.wine.org``.
-
--  Then you can try the example ``putty.exe``::
-
-      qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
-                /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
-
 Command line options
 ~~~~~~~~~~~~~~~~~~~~
 
-- 
2.29.2


