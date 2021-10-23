Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C14384BB
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:38:51 +0200 (CEST)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLus-0006k8-PW
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLny-0005HB-C3; Sat, 23 Oct 2021 14:31:43 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnv-0006d8-Ug; Sat, 23 Oct 2021 14:31:42 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MWAf4-1mCGFb4BpK-00XZJq; Sat, 23
 Oct 2021 20:31:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] disas/nios2: Fix style in print_insn_nios2()
Date: Sat, 23 Oct 2021 20:31:14 +0200
Message-Id: <20211023183123.813116-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J2imc0LOif9UCAQ+mHsql75U60CbN8h+9UQl51APvZ1v6491qtc
 IRNML1HKxtcM/JA5erO+CibWZXITubto78V4LQyKWAZ/vPicPer9yEdeAINaN2huA1WxhUL
 543X2t39XPbYzNFstXzN/ddTfJBDn87HLZbSs9ICRLbtLSSjgwooqnz29cfg6V6Fa9FAxD8
 yqkjGMIs2L0rkuXVR9EGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CKLP98HpyR8=:1+SbtK2Ft5C1Xvom8IoISY
 7s7Jq3EsrL/AtyH3S/V0QV+w+J2av1E2l3t1EqUiHx7B2BQrJ5xAPbVJxBt5yO4eiQIYNdwdk
 AGgZhnNY6HrcenogRDCjN2rZCo28EsWJicPdOpJjyvcgwIgsDkgELsKL/VOlTFVrImqyGLfc7
 KArhAzvPtJUhzWkIsqvzJatlDuwCdE0ICpafewv34bYD70nGcKsMDPaP5zbHs4Soa4heV0Gwy
 RcvLXrW8OHwYzbW7I5BvKFx0lxSciQ3mRIznYUe+e/jM1SJf5MXJ98+bpp83MiBU9u1hHGohF
 JxqyYbJKaGvCULioZkBqYoLHXQhqoQiCdOIdPsQs2cjnafs0oRdpJwNdd68N/Z63gBdzq/Zoo
 gPhqX9TGbU/0DNR3M0HQAbx/IZNS6jgbYEP/GBYiFtPcrTyRrqGk5GJ1poCnaUpje5qZxe1M9
 jGhqu3dKatec+g+E0tcvFFOFZP5CchfvYtxQ8wS9oxvX/U2ZxXgQeHwR063eceZ17OH5u7h7B
 2yTxVYMYE3FlVZGvchyAIOoYpdHjJ4ZArWmpmsvHU5ORze5d+IviSKwrxBFaT3FOhzGsAm8jw
 mRn+imyLhjYoPNsZ3Xk7yKRA4q/TnJvAK4D6AeYjE3emxUlAvHwsEAzWSDYtwZI5vwk9vitcZ
 5r8kgEcrEx3Df52kENabrd0CQ+EW5NvxKmRk4vgDMfQmZiOAgtv1M8rTS90PwkRaqnHA=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to modify this function, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210807110939.95853-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 disas/nios2.c | 55 +++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/disas/nios2.c b/disas/nios2.c
index c3e82140c798..d124902ae3e1 100644
--- a/disas/nios2.c
+++ b/disas/nios2.c
@@ -3482,38 +3482,37 @@ static int
 print_insn_nios2 (bfd_vma address, disassemble_info *info,
 		  enum bfd_endian endianness)
 {
-  bfd_byte buffer[INSNLEN];
-  int status;
-
-  status = (*info->read_memory_func) (address, buffer, INSNLEN, info);
-  if (status == 0)
-    {
-      unsigned long insn;
-      if (endianness == BFD_ENDIAN_BIG)
-	insn = (unsigned long) bfd_getb32 (buffer);
-      else
-	insn = (unsigned long) bfd_getl32 (buffer);
-      return nios2_disassemble (address, insn, info);
+    bfd_byte buffer[INSNLEN];
+    int status;
+
+    status = (*info->read_memory_func)(address, buffer, INSNLEN, info);
+    if (status == 0) {
+        unsigned long insn;
+        if (endianness == BFD_ENDIAN_BIG) {
+            insn = (unsigned long) bfd_getb32(buffer);
+        } else {
+            insn = (unsigned long) bfd_getl32(buffer);
+        }
+        return nios2_disassemble(address, insn, info);
     }
 
-  /* We might have a 16-bit R2 instruction at the end of memory.  Try that.  */
-  if (info->mach == bfd_mach_nios2r2)
-    {
-      status = (*info->read_memory_func) (address, buffer, 2, info);
-      if (status == 0)
-	{
-	  unsigned long insn;
-	  if (endianness == BFD_ENDIAN_BIG)
-	    insn = (unsigned long) bfd_getb16 (buffer);
-	  else
-	    insn = (unsigned long) bfd_getl16 (buffer);
-	  return nios2_disassemble (address, insn, info);
-	}
+    /* We might have a 16-bit R2 instruction at the end of memory. Try that. */
+    if (info->mach == bfd_mach_nios2r2) {
+        status = (*info->read_memory_func)(address, buffer, 2, info);
+        if (status == 0) {
+            unsigned long insn;
+            if (endianness == BFD_ENDIAN_BIG) {
+                insn = (unsigned long) bfd_getb16(buffer);
+            } else {
+                insn = (unsigned long) bfd_getl16(buffer);
+            }
+            return nios2_disassemble(address, insn, info);
+        }
     }
 
-  /* If we got here, we couldn't read anything.  */
-  (*info->memory_error_func) (status, address, info);
-  return -1;
+    /* If we got here, we couldn't read anything.  */
+    (*info->memory_error_func)(status, address, info);
+    return -1;
 }
 
 /* These two functions are the main entry points, accessed from
-- 
2.31.1


