Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263664EB021
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:22:19 +0200 (CEST)
Received: from localhost ([::1]:44028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDfl-0002iy-PF
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:22:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZDdf-0001gk-B9
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZDdc-0007A9-DH
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648567203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=INrE5xLTyOMrrkEcGmzOTcgS3LoRt8ogcokSS7RXdFM=;
 b=E+UsgbvbiQYU67c/AG0LrfDuCqJRk5UOVG0yi42D3Y1PkFo5tXqy83IQVAkYH0aRhU4Noy
 Nhi2BJoBIJIgDyh/lQ3L1S5d0EOtLZqR9kuXLEiwsLz2Pbw8jUkWqkwCCIxABeugMbr/JG
 YREML29ZanwNR1g5OkbqGUWbE+M/UaY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-Zis201WfMESD3-MIYrYBgw-1; Tue, 29 Mar 2022 11:19:57 -0400
X-MC-Unique: Zis201WfMESD3-MIYrYBgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78BD5899EE5;
 Tue, 29 Mar 2022 15:19:57 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 930AEC19149;
 Tue, 29 Mar 2022 15:19:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/sh4: Remove old README.sh4 file
Date: Tue, 29 Mar 2022 17:19:55 +0200
Message-Id: <20220329151955.472306-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file didn't have any non-trivial update since it was initially
added in 2006, and looking at the content, it seems incredibly outdated,
saying e.g. "The sh4 target is not ready at all yet for integration in
qemu" or "A sh4 user-mode has also somewhat started but will be worked
on afterwards"... Sounds like nobody is interested in this README file
anymore, so let's simply remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/sh4/README.sh4 | 150 ------------------------------------------
 1 file changed, 150 deletions(-)
 delete mode 100644 target/sh4/README.sh4

diff --git a/target/sh4/README.sh4 b/target/sh4/README.sh4
deleted file mode 100644
index a192ca7540..0000000000
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
2.27.0


