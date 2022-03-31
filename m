Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EF24EE3F9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:24:19 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na3DG-0004yX-L3
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:24:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38N-0005hz-I3; Thu, 31 Mar 2022 18:19:15 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:48839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38L-00019K-8c; Thu, 31 Mar 2022 18:19:15 -0400
Received: from quad ([82.142.13.234]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N95mL-1o3fVK0YYp-016B6n; Fri, 01
 Apr 2022 00:19:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] target/sh4: Remove old README.sh4 file
Date: Fri,  1 Apr 2022 00:18:55 +0200
Message-Id: <20220331221857.433867-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331221857.433867-1-laurent@vivier.eu>
References: <20220331221857.433867-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:28BrySW/a6g9ZxU+Xwyj25roaKad103Tw8K5iL0hrJ48Idv5p5E
 b4VZCpZ4Ik0P6/MRmvKgXQVsY/VdY2KxLE1Iv4v2GvvNKXt6NqQ0MoVFAR2PNTWpRagcg+f
 3soEUNt5A63PDUm6/jHr23K/kB3u++7EgDqaiZhsn/ogh1RjX3+hp0RwWjf7/uVsp49mTGS
 rtHGcJ2TVUs6x599JWPGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7IuKVKdSxBo=:bTUll3iKGiQTK37UxoxidQ
 W0WvsfmJtWlYJkWVicuEUs8w8w6VEUQbaSD1B6B6xkQOg2LW35+SxX1P1Q/uvcKzqBr6vkdwg
 bEaeijJyQuZNblAzhf4cmPPJJmzA7afhakIHa3KGgH2UeRt0kfXGyQU9LjxAvRpoe1UqU+45E
 qn45Q1R9XkO6Pcjm1ePrACh/sYyo6g74M0XSgbsRJpnEx2m/h+sYmpyYp2GENw99IO4hXR8Lv
 tt3/vke6ThVH3B9Ix1L2UwQaw3A5zKEjGNhXIPHZsdehsFiLsozap9WfPQeaWY63XyjMGRiFo
 s5l216PdiRBCC9+kSlMM214J9Y+7puvhi9L58EWneGEVap1YtapIc719UQnY23xeDbH3gR+Ld
 0FsLxm6H5byb7vV72RD6BKFxxvqhibEmI9kGmMNHUy+AmgWKiU3ESt5U8TwBfwDHoLZHrCI8X
 hIA9fWtfinZSsfSXq855vQFWe1qb0y6ztVG0pHWF3R9AbwSvSrFEhqrTMWqseuUc8Z/OV4KBy
 onPPutvlDjkgnY90RcVgvOrBR6M33pmblqrnXXCwWyx4kARmdEa9Wyzz0sLA1fXj+M++BQrfY
 o8iPZ+22LwUq8e2r5dkD4FkBOu+bBnfBEfLTOrgbUJ0QQz+4YoT1SkqCdAQAc1DYxmL1Q3X21
 lVgxRKkErOGbCFMsvOKQmssRRGGt7fkCn1bn0i6DkcZrHD0KMjlsJgTeIV3p99q3yk3s=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This file didn't have any non-trivial update since it was initially
added in 2006, and looking at the content, it seems incredibly outdated,
saying e.g. "The sh4 target is not ready at all yet for integration in
qemu" or "A sh4 user-mode has also somewhat started but will be worked
on afterwards"... Sounds like nobody is interested in this README file
anymore, so let's simply remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20220329151955.472306-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/sh4/README.sh4 | 150 ------------------------------------------
 1 file changed, 150 deletions(-)
 delete mode 100644 target/sh4/README.sh4

diff --git a/target/sh4/README.sh4 b/target/sh4/README.sh4
deleted file mode 100644
index a192ca7540cc..000000000000
--- a/target/sh4/README.sh4
+++ /dev/null
@@ -1,150 +0,0 @@
-qemu target:   sh4
-author:        Samuel Tardieu <sam@rfc1149.net>
-last modified: Tue Dec  6 07:22:44 CET 2005
-
-The sh4 target is not ready at all yet for integration in qemu. This
-file describes the current state of implementation.
-
-Most places requiring attention and/or modification can be detected by
-looking for "XXXXX" or "abort()".
-
-The sh4 core is located in target/sh4/*, while the 7750 peripheral
-features (IO ports for example) are located in hw/sh7750.[ch]. The
-main board description is in hw/shix.c, and the NAND flash in
-hw/tc58128.[ch].
-
-All the shortcomings indicated here will eventually be resolved. This
-is a work in progress. Features are added in a semi-random order: if a
-point is blocking to progress on booting the Linux kernel for the shix
-board, it is addressed first; if feedback is necessary and no progress
-can be made on blocking points until it is received, a random feature
-is worked on.
-
-Goals
------
-
-The primary model being worked on is the soft MMU target to be able to
-emulate the Shix 2.0 board by Alexis Polti, described at
-https://web.archive.org/web/20070917001736/http://perso.enst.fr/~polti/realisations/shix20/
-
-Ultimately, qemu will be coupled with a system C or a verilog
-simulator to simulate the whole board functionalities.
-
-A sh4 user-mode has also somewhat started but will be worked on
-afterwards. The goal is to automate tests for GNAT (GNU Ada) compiler
-that I ported recently to the sh4-linux target.
-
-Registers
----------
-
-16 general purpose registers are available at any time. The first 8
-registers are banked and the non-directly visible ones can be accessed
-by privileged instructions. In qemu, we define 24 general purpose
-registers and the code generation use either [0-7]+[8-15] or
-[16-23]+[8-15] depending on the MD and RB flags in the sr
-configuration register.
-
-Instructions
-------------
-
-Most sh4 instructions have been implemented. The missing ones at this
-time are:
-  - FPU related instructions
-  - LDTLB to load a new MMU entry
-  - SLEEP to put the processor in sleep mode
-
-Most instructions could be optimized a lot. This will be worked on
-after the current model is fully functional unless debugging
-convenience requires that it is done early.
-
-Many instructions did not have a chance to be tested yet. The plan is
-to implement unit and regression testing of those in the future.
-
-MMU
----
-
-The MMU is implemented in the sh4 core. MMU management has not been
-tested at all yet. In the sh7750, it can be manipulated through memory
-mapped registers and this part has not yet been implemented.
-
-Exceptions
-----------
-
-Exceptions are implemented as described in the sh4 reference manual
-but have not been tested yet. They do not use qemu EXCP_ features
-yet.
-
-IRQ
----
-
-IRQ are not implemented yet.
-
-Peripheral features
--------------------
-
-  + Serial ports
-
-Configuration and use of the first serial port (SCI) without
-interrupts is supported. Input has not yet been tested.
-
-Configuration of the second serial port (SCIF) is supported. FIFO
-handling infrastructure has been started but is not completed yet.
-
-  + GPIO ports
-
-GPIO ports have been implemented. A registration function allows
-external modules to register interest in some port changes (see
-hw/tc58128.[ch] for an example) and will be called back. Interrupt
-generation is not yet supported but some infrastructure is in place
-for this purpose. Note that in the current model a peripheral module
-cannot directly simulate a H->L->H input port transition and have an
-interrupt generated on the low level.
-
-  + TC58128 NAND flash
-
-TC58128 NAND flash is partially implemented through GPIO ports. It
-supports reading from flash.
-
-GDB
----
-
-GDB remote target support has been implemented and lightly tested.
-
-Files
------
-
-File names are hardcoded at this time. The bootloader must be stored in
-shix_bios.bin in the current directory. The initial Linux image must
-be stored in shix_linux_nand.bin in the current directory in NAND
-format. Test files can be obtained from
-http://perso.enst.fr/~polti/robot/ as well as the various datasheets I
-use.
-
-qemu disk parameter on the command line is unused. You can supply any
-existing image and it will be ignored. As the goal is to simulate an
-embedded target, it is not clear how this parameter will be handled in
-the future.
-
-To build an ELF kernel image from the NAND image, 16 bytes have to be
-stripped off the end of every 528 bytes, keeping only 512 of them. The
-following Python code snippet does it:
-
-#! /usr/bin/python
-
-def denand (infd, outfd):
-    while True:
-        d = infd.read (528)
-        if not d: return
-        outfd.write (d[:512])
-
-if __name__ == '__main__':
-    import sys
-    denand (open (sys.argv[1], 'rb'),
-            open (sys.argv[2], 'wb'))
-
-Style isssues
--------------
-
-There is currently a mix between my style (space before opening
-parenthesis) and qemu style. This will be resolved before final
-integration is proposed.
-- 
2.35.1


