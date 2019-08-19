Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0D892339
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:15:03 +0200 (CEST)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgYw-0007eE-9F
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTc-0001t2-On
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTa-0002aQ-Re
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:32 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:57770 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTa-0002ZW-JM
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:30 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id DBB4D1A203D;
 Mon, 19 Aug 2019 14:08:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 776AB1A208C;
 Mon, 19 Aug 2019 14:08:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:07:55 +0200
Message-Id: <1566216496-17375-17-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 16/37] target/mips: Style improvements in
 mips_mipssim.c
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
Cc: arikalo@wavecomp.com, philmd@redhat.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fixes mostly errors and warnings reported by 'checkpatch.pl -f'.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 hw/mips/mips_mipssim.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 824abda..b3155e17 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -3,7 +3,7 @@
  *
  * Emulates a very simple machine model similar to the one used by the
  * proprietary MIPS emulator.
- * 
+ *
  * Copyright (c) 2007 Thiemo Seufer
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
@@ -75,8 +75,9 @@ static int64_t load_kernel(void)
                            (uint64_t *)&kernel_high, big_endian,
                            EM_MIPS, 1, 0);
     if (kernel_size >= 0) {
-        if ((entry & ~0x7fffffffULL) == 0x80000000)
+        if ((entry & ~0x7fffffffULL) == 0x80000000) {
             entry = (int32_t)entry;
+        }
     } else {
         error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
@@ -88,9 +89,10 @@ static int64_t load_kernel(void)
     initrd_size = 0;
     initrd_offset = 0;
     if (loaderparams.initrd_filename) {
-        initrd_size = get_image_size (loaderparams.initrd_filename);
+        initrd_size = get_image_size(loaderparams.initrd_filename);
         if (initrd_size > 0) {
-            initrd_offset = (kernel_high + ~INITRD_PAGE_MASK) & INITRD_PAGE_MASK;
+            initrd_offset = (kernel_high + ~INITRD_PAGE_MASK) &
+                            INITRD_PAGE_MASK;
             if (initrd_offset + initrd_size > loaderparams.ram_size) {
                 error_report("memory too small for initial ram disk '%s'",
                              loaderparams.initrd_filename);
@@ -174,8 +176,9 @@ mips_mipssim_init(MachineState *machine)
     /* Map the BIOS / boot exception handler. */
     memory_region_add_subregion(address_space_mem, 0x1fc00000LL, bios);
     /* Load a BIOS / boot exception handler image. */
-    if (bios_name == NULL)
+    if (bios_name == NULL) {
         bios_name = BIOS_FILENAME;
+    }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (filename) {
         bios_size = load_image_targphys(filename, 0x1fc00000LL, BIOS_SIZE);
@@ -211,8 +214,10 @@ mips_mipssim_init(MachineState *machine)
                              get_system_io(), 0, 0x00010000);
     memory_region_add_subregion(get_system_memory(), 0x1fd00000, isa);
 
-    /* A single 16450 sits at offset 0x3f8. It is attached to
-       MIPS CPU INT2, which is interrupt 4. */
+    /*
+     * A single 16450 sits at offset 0x3f8. It is attached to
+     * MIPS CPU INT2, which is interrupt 4.
+     */
     if (serial_hd(0))
         serial_init(0x3f8, env->irq[4], 115200, serial_hd(0),
                     get_system_io());
-- 
2.7.4


