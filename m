Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F82DE120
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:35:22 +0100 (CET)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD6X-00019s-1C
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvu-00030H-P7
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:22 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:48389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvq-00074I-4D
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:22 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Md6V3-1kHh7u48dH-00aD2t; Fri, 18 Dec 2020 11:24:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/14] docs/user: Display linux-user binaries nicely
Date: Fri, 18 Dec 2020 11:24:01 +0100
Message-Id: <20201218102407.597566-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aZjga+gCPf6lwOsHveYCJzg6ouMofbZGvYmocBMW1p/8ROvyRGP
 oxBjQK9tq92zVhmD0Kr/qZX7251LMHwY+72uBK4tUr8AwmHDcPiaN1aAxpY4ShgQR9PQxgQ
 PPEWYN6q2G9fdDBeOf4L+34xHqUBTnLCZQXgTbi79r2cV4Mz52TNP0jatuZiCX4v8IK+/yg
 9rGhon9MGLr18MhN1+Xmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+AjcLFspfiM=:DkDCO7SrF+hiPzFMWwSVrJ
 wAREbzQEYFRdtnpNTSIeFqtbNcu0EZWFHFfQTsu1FFiPoEXVgliGlvgkE31vBYai6DwgAZTmc
 GPv7RmaXSGQBA9MQNrABfT7FBN9e8puE7+MppWGEjIBxw8Cj5ikqvK+khoN6Z4XsC65jMr60i
 c+XlKwgiavmJQHt8TeQYh8rFeKPJSIVvYYdggjmflLNQKt1X1dT725ttWtJgQPQJNJkDnph0V
 eLK0CMjewxW8zC1lM23BY3eWX72T54dliGy9OkTHvptbgijyHW3fxTeMre5AL9rainTNtIpit
 ZPyHLwrFWoLXkNflRijDh02ijHD+tCT3j7E2EbgR050n/NaN8gS9VbyNIkbejHQl2130N+CVu
 nkIsEMXmv8fKNxzu3oRgTuIjLSGcvc7669HOiESIOivOXJx551woAekXwH3AHvTcEc+2UFNV+
 Sfd1BFbBGA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

linux-user binaries are displayed altogether. Use the '*'
character to force displaying them as bullet list (one list
per architecture).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201119160838.1981709-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/user/main.rst | 99 ++++++++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 43 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index bd99b0fdbe9b..8dfe232a3af1 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -170,68 +170,81 @@ QEMU_STRACE
 Other binaries
 ~~~~~~~~~~~~~~
 
-user mode (Alpha)
-``qemu-alpha`` TODO.
+-  user mode (Alpha)
 
-user mode (Arm)
-``qemu-armeb`` TODO.
+   * ``qemu-alpha`` TODO.
 
-user mode (Arm)
-``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
-binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
-configurations), and arm-uclinux bFLT format binaries.
+-  user mode (Arm)
 
-user mode (ColdFire)
-user mode (M68K)
-``qemu-m68k`` is capable of running semihosted binaries using the BDM
-(m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
-coldfire uClinux bFLT format binaries.
+   * ``qemu-armeb`` TODO.
 
-The binary format is detected automatically.
+   * ``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
+     binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
+     configurations), and arm-uclinux bFLT format binaries.
 
-user mode (Cris)
-``qemu-cris`` TODO.
+-  user mode (ColdFire)
 
-user mode (i386)
-``qemu-i386`` TODO. ``qemu-x86_64`` TODO.
+-  user mode (M68K)
 
-user mode (Microblaze)
-``qemu-microblaze`` TODO.
+   * ``qemu-m68k`` is capable of running semihosted binaries using the BDM
+     (m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
+     coldfire uClinux bFLT format binaries.
 
-user mode (MIPS)
-``qemu-mips`` executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
+   The binary format is detected automatically.
 
-``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32
-ABI).
+-  user mode (Cris)
 
-``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
+   * ``qemu-cris`` TODO.
 
-``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
-ABI).
+-  user mode (i386)
 
-``qemu-mipsn32`` executes 32-bit big endian MIPS binaries (MIPS N32
-ABI).
+   * ``qemu-i386`` TODO.
+   * ``qemu-x86_64`` TODO.
 
-``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
-ABI).
+-  user mode (Microblaze)
 
-user mode (NiosII)
-``qemu-nios2`` TODO.
+   * ``qemu-microblaze`` TODO.
 
-user mode (PowerPC)
-``qemu-ppc64abi32`` TODO. ``qemu-ppc64`` TODO. ``qemu-ppc`` TODO.
+-  user mode (MIPS)
 
-user mode (SH4)
-``qemu-sh4eb`` TODO. ``qemu-sh4`` TODO.
+   * ``qemu-mips`` executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
 
-user mode (SPARC)
-``qemu-sparc`` can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
+   * ``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32 ABI).
 
-``qemu-sparc32plus`` can execute Sparc32 and SPARC32PLUS binaries
-(Sparc64 CPU, 32 bit ABI).
+   * ``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
 
-``qemu-sparc64`` can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
-SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
+   * ``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
+     ABI).
+
+   * ``qemu-mipsn32`` executes 32-bit big endian MIPS binaries (MIPS N32 ABI).
+
+   * ``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
+     ABI).
+
+-  user mode (NiosII)
+
+   * ``qemu-nios2`` TODO.
+
+-  user mode (PowerPC)
+
+   * ``qemu-ppc64abi32`` TODO.
+   * ``qemu-ppc64`` TODO.
+   * ``qemu-ppc`` TODO.
+
+-  user mode (SH4)
+
+   * ``qemu-sh4eb`` TODO.
+   * ``qemu-sh4`` TODO.
+
+-  user mode (SPARC)
+
+   * ``qemu-sparc`` can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
+
+   * ``qemu-sparc32plus`` can execute Sparc32 and SPARC32PLUS binaries
+     (Sparc64 CPU, 32 bit ABI).
+
+   * ``qemu-sparc64`` can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
+     SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
 
 BSD User space emulator
 -----------------------
-- 
2.29.2


