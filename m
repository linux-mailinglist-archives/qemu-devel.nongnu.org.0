Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BAB31957C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:02:21 +0100 (CET)
Received: from localhost ([::1]:44344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAK2W-00088H-5t
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lAJrx-0006bz-6U
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:51:25 -0500
Received: from rev.ng ([5.9.113.41]:54213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lAJrr-000141-GB
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cyvwZ1yCJRH3D9CP4N0e0Sv6bstSiGHSp3XNboNFQEs=; b=jPP08QYwFFdwuoqBITts6bh800
 TrxYJzXOa9keSCVzDIvCpcCgrYO481OIMnawwxGKybIeE2piqdE2Ygru/6gsSZHOdZz+PwuFgbZFN
 tccFLAnRBpVNYgvzFNV+CYsa9JUtt/vQiuBQtgv/L2gfp74VwA1VnOx4xa0FWp+ZMqc0=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Subject: [RFC PATCH 10/10] target/hexagon: import additional tests
Date: Thu, 11 Feb 2021 22:50:51 +0100
Message-Id: <20210211215051.2102435-11-ale.qemu@rev.ng>
In-Reply-To: <20210211215051.2102435-1-ale.qemu@rev.ng>
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Niccolò Izzo <nizzo@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
---
 tests/tcg/hexagon/Makefile.target  | 35 ++++++++++++++++-
 tests/tcg/hexagon/crt.S            | 28 +++++++++++++
 tests/tcg/hexagon/first.S          | 24 ++++++------
 tests/tcg/hexagon/test_abs.S       | 20 ++++++++++
 tests/tcg/hexagon/test_add.S       | 20 ++++++++++
 tests/tcg/hexagon/test_andp.S      | 23 +++++++++++
 tests/tcg/hexagon/test_bitcnt.S    | 42 ++++++++++++++++++++
 tests/tcg/hexagon/test_bitsplit.S  | 25 ++++++++++++
 tests/tcg/hexagon/test_call.S      | 63 ++++++++++++++++++++++++++++++
 tests/tcg/hexagon/test_clobber.S   | 35 +++++++++++++++++
 tests/tcg/hexagon/test_cmp.S       | 34 ++++++++++++++++
 tests/tcg/hexagon/test_cmpy.S      | 31 +++++++++++++++
 tests/tcg/hexagon/test_djump.S     | 24 ++++++++++++
 tests/tcg/hexagon/test_dotnew.S    | 39 ++++++++++++++++++
 tests/tcg/hexagon/test_dstore.S    | 29 ++++++++++++++
 tests/tcg/hexagon/test_ext.S       | 18 +++++++++
 tests/tcg/hexagon/test_fibonacci.S | 33 ++++++++++++++++
 tests/tcg/hexagon/test_hello.S     | 21 ++++++++++
 tests/tcg/hexagon/test_hl.S        | 19 +++++++++
 tests/tcg/hexagon/test_hwloops.S   | 25 ++++++++++++
 tests/tcg/hexagon/test_jmp.S       | 25 ++++++++++++
 tests/tcg/hexagon/test_lsr.S       | 39 ++++++++++++++++++
 tests/tcg/hexagon/test_mpyi.S      | 20 ++++++++++
 tests/tcg/hexagon/test_packet.S    | 26 ++++++++++++
 tests/tcg/hexagon/test_reorder.S   | 31 +++++++++++++++
 tests/tcg/hexagon/test_round.S     | 31 +++++++++++++++
 tests/tcg/hexagon/test_vavgw.S     | 33 ++++++++++++++++
 tests/tcg/hexagon/test_vcmpb.S     | 32 +++++++++++++++
 tests/tcg/hexagon/test_vcmpw.S     | 29 ++++++++++++++
 tests/tcg/hexagon/test_vcmpy.S     | 50 ++++++++++++++++++++++++
 tests/tcg/hexagon/test_vlsrw.S     | 23 +++++++++++
 tests/tcg/hexagon/test_vmaxh.S     | 37 ++++++++++++++++++
 tests/tcg/hexagon/test_vminh.S     | 37 ++++++++++++++++++
 tests/tcg/hexagon/test_vpmpyh.S    | 30 ++++++++++++++
 tests/tcg/hexagon/test_vspliceb.S  | 33 ++++++++++++++++
 35 files changed, 1051 insertions(+), 13 deletions(-)
 create mode 100644 tests/tcg/hexagon/crt.S
 create mode 100644 tests/tcg/hexagon/test_abs.S
 create mode 100644 tests/tcg/hexagon/test_add.S
 create mode 100644 tests/tcg/hexagon/test_andp.S
 create mode 100644 tests/tcg/hexagon/test_bitcnt.S
 create mode 100644 tests/tcg/hexagon/test_bitsplit.S
 create mode 100644 tests/tcg/hexagon/test_call.S
 create mode 100644 tests/tcg/hexagon/test_clobber.S
 create mode 100644 tests/tcg/hexagon/test_cmp.S
 create mode 100644 tests/tcg/hexagon/test_cmpy.S
 create mode 100644 tests/tcg/hexagon/test_djump.S
 create mode 100644 tests/tcg/hexagon/test_dotnew.S
 create mode 100644 tests/tcg/hexagon/test_dstore.S
 create mode 100644 tests/tcg/hexagon/test_ext.S
 create mode 100644 tests/tcg/hexagon/test_fibonacci.S
 create mode 100644 tests/tcg/hexagon/test_hello.S
 create mode 100644 tests/tcg/hexagon/test_hl.S
 create mode 100644 tests/tcg/hexagon/test_hwloops.S
 create mode 100644 tests/tcg/hexagon/test_jmp.S
 create mode 100644 tests/tcg/hexagon/test_lsr.S
 create mode 100644 tests/tcg/hexagon/test_mpyi.S
 create mode 100644 tests/tcg/hexagon/test_packet.S
 create mode 100644 tests/tcg/hexagon/test_reorder.S
 create mode 100644 tests/tcg/hexagon/test_round.S
 create mode 100644 tests/tcg/hexagon/test_vavgw.S
 create mode 100644 tests/tcg/hexagon/test_vcmpb.S
 create mode 100644 tests/tcg/hexagon/test_vcmpw.S
 create mode 100644 tests/tcg/hexagon/test_vcmpy.S
 create mode 100644 tests/tcg/hexagon/test_vlsrw.S
 create mode 100644 tests/tcg/hexagon/test_vmaxh.S
 create mode 100644 tests/tcg/hexagon/test_vminh.S
 create mode 100644 tests/tcg/hexagon/test_vpmpyh.S
 create mode 100644 tests/tcg/hexagon/test_vspliceb.S

diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 616af697fe..f4a774cda1 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -32,7 +32,7 @@ CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
 HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
 VPATH += $(HEX_SRC)
 
-first: $(HEX_SRC)/first.S
+%: $(HEX_SRC)/%.S $(HEX_SRC)/crt.S
 	$(CC) -static -mv67 -nostdlib $^ -o $@
 
 HEX_TESTS = first
@@ -43,4 +43,37 @@ HEX_TESTS += mem_noshuf
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 
+HEX_TESTS += test_abs
+HEX_TESTS += test_add
+HEX_TESTS += test_andp
+HEX_TESTS += test_bitcnt
+HEX_TESTS += test_bitsplit
+HEX_TESTS += test_call
+HEX_TESTS += test_clobber
+HEX_TESTS += test_cmp
+HEX_TESTS += test_cmpy
+HEX_TESTS += test_djump
+HEX_TESTS += test_dotnew
+HEX_TESTS += test_dstore
+HEX_TESTS += test_ext
+HEX_TESTS += test_fibonacci
+HEX_TESTS += test_hello
+HEX_TESTS += test_hl
+HEX_TESTS += test_hwloops
+HEX_TESTS += test_jmp
+HEX_TESTS += test_lsr
+HEX_TESTS += test_mpyi
+HEX_TESTS += test_packet
+HEX_TESTS += test_reorder
+HEX_TESTS += test_round
+HEX_TESTS += test_vavgw
+HEX_TESTS += test_vcmpb
+HEX_TESTS += test_vcmpw
+HEX_TESTS += test_vcmpy
+HEX_TESTS += test_vlsrw
+HEX_TESTS += test_vmaxh
+HEX_TESTS += test_vminh
+HEX_TESTS += test_vpmpyh
+HEX_TESTS += test_vspliceb
+
 TESTS += $(HEX_TESTS)
diff --git a/tests/tcg/hexagon/crt.S b/tests/tcg/hexagon/crt.S
new file mode 100644
index 0000000000..2c10577470
--- /dev/null
+++ b/tests/tcg/hexagon/crt.S
@@ -0,0 +1,28 @@
+#define SYS_exit_group           94
+
+    .text
+    .globl init
+init:
+    {
+        allocframe(r29,#0):raw
+    }
+    {
+        r0=#256
+    }
+    {
+        dealloc_return
+    }
+
+    .space 240
+
+    .globl pass
+pass:
+    r0 = #0
+    r6 = #SYS_exit_group
+    trap0(#1)
+
+    .globl fail
+fail:
+    r0 = #1
+    r6 = #SYS_exit_group
+    trap0(#1)
diff --git a/tests/tcg/hexagon/first.S b/tests/tcg/hexagon/first.S
index e9f2d963ec..7f96b4332e 100644
--- a/tests/tcg/hexagon/first.S
+++ b/tests/tcg/hexagon/first.S
@@ -21,24 +21,24 @@
 
 #define FD_STDOUT                1
 
-	.type	str,@object
-	.section	.rodata
+    .type	str,@object
+    .section	.rodata
 str:
-	.string	"Hello!\n"
-	.size	str, 8
+    .string	"Hello!\n"
+    .size	str, 8
 
 .text
 .global _start
 _start:
-	r6 = #SYS_write
-	r0 = #FD_STDOUT
-	r1 = ##str
-	r2 = #7
-	trap0(#1)
+    r6 = #SYS_write
+    r0 = #FD_STDOUT
+    r1 = ##str
+    r2 = #7
+    trap0(#1)
 
-	r0 = #0
-	r6 = #SYS_exit_group
-	trap0(#1)
+    r0 = #0
+    r6 = #SYS_exit_group
+    trap0(#1)
 
 .section ".note.ABI-tag", "a"
 .align 4
diff --git a/tests/tcg/hexagon/test_abs.S b/tests/tcg/hexagon/test_abs.S
new file mode 100644
index 0000000000..880b2886b5
--- /dev/null
+++ b/tests/tcg/hexagon/test_abs.S
@@ -0,0 +1,20 @@
+/* Purpose: test example, verify the soundness of the abs operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r1=#-2
+        r2=#2
+    }
+    {
+        r3=abs(r1)
+    }
+    {
+        p0 = cmp.eq(r3, r2); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_add.S b/tests/tcg/hexagon/test_add.S
new file mode 100644
index 0000000000..ce2ed295a0
--- /dev/null
+++ b/tests/tcg/hexagon/test_add.S
@@ -0,0 +1,20 @@
+/* Purpose: test example, verify the soundness of the add operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r1=#0
+        r2=#0
+    }
+    {
+        r3=add(r2,r3)
+    }
+    {
+        p0 = cmp.eq(r3, #0); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_andp.S b/tests/tcg/hexagon/test_andp.S
new file mode 100644
index 0000000000..3c4aa8b2ae
--- /dev/null
+++ b/tests/tcg/hexagon/test_andp.S
@@ -0,0 +1,23 @@
+/* Purpose: test a multiple predicate AND combination */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r1+=sub(r2,r3)
+        call init
+    }
+    {
+        r0=#0
+        r1=#1
+    }
+    {
+        p0=cmp.gt(r0,r1)
+        p0=cmp.gt(r0,r1)
+        p0=cmp.gt(r1,r0)
+    }
+    {
+        if (!p0) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_bitcnt.S b/tests/tcg/hexagon/test_bitcnt.S
new file mode 100644
index 0000000000..df77fe61e2
--- /dev/null
+++ b/tests/tcg/hexagon/test_bitcnt.S
@@ -0,0 +1,42 @@
+/* Purpose: test example, verify the soundness of the cl[01] operations
+ *
+ * the number 0x000001aa has 23 leading zeroes
+ * they become 55 when considered as 64 bit register
+ * and it has 1 trailing zero
+ */
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#426
+        r1=#0
+    }
+    {
+        r2=cl0(r0)
+    }
+    {
+        p0 = cmp.eq(r2, #23); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        r2=cl0(r1:0)
+    }
+    {
+        p0 = cmp.eq(r2, #55); if (p0.new) jump:t test3
+        jump fail
+    }
+
+test3:
+    {
+        r2=ct0(r0)
+    }
+    {
+        p0 = cmp.eq(r2, #1); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_bitsplit.S b/tests/tcg/hexagon/test_bitsplit.S
new file mode 100644
index 0000000000..787cce72e4
--- /dev/null
+++ b/tests/tcg/hexagon/test_bitsplit.S
@@ -0,0 +1,25 @@
+/* Purpose: test example, verify the soundness of the bitsplit operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r1=#187
+    }
+    {
+        r3:2=bitsplit(r1, #3)
+    }
+    {
+        p0 = cmp.eq(r2, #3); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        p0 = cmp.eq(r3, #23); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_call.S b/tests/tcg/hexagon/test_call.S
new file mode 100644
index 0000000000..53a2450522
--- /dev/null
+++ b/tests/tcg/hexagon/test_call.S
@@ -0,0 +1,63 @@
+/* Purpose: test function calls and duplex instructions.
+ * The string "Hello there, I'm a test string!" with the first letter replaced
+ * with a capital L should be printed out.
+ */
+
+    .text
+    .globl    test
+test:
+    {
+        jumpr r31
+        memb(r0+#0)=#76
+    }
+.Lfunc_end0:
+.Ltmp0:
+    .size    test, .Ltmp0-test
+
+    .globl    _start
+_start:
+    {
+        call init
+    }
+    {
+        call test
+        r0=##dummy_buffer
+        allocframe(#0)
+    }
+    {
+        call write
+    }
+    {
+        jump pass
+    }
+    {
+        r31:30=deallocframe(r30):raw
+    }
+.Lfunc_end1:
+.Ltmp1:
+    .size    _start, .Ltmp1-_start
+write:
+    {
+        r2=##dummy_buffer
+    }
+    { r0=r2; }
+    {
+        r2=#256
+    }
+    { r1=r2; }
+    { trap0(#7); }
+    {
+        jumpr r31
+    }
+.Lfunc_end2:
+.Ltmp2:
+    .size    write, .Ltmp2-write
+
+    .type    dummy_buffer,@object
+    .data
+    .globl    dummy_buffer
+    .p2align    3
+dummy_buffer:
+    .string    "Hello there, I'm a test string!\n"
+    .space 223
+    .size    dummy_buffer, 256
diff --git a/tests/tcg/hexagon/test_clobber.S b/tests/tcg/hexagon/test_clobber.S
new file mode 100644
index 0000000000..198817ebd5
--- /dev/null
+++ b/tests/tcg/hexagon/test_clobber.S
@@ -0,0 +1,35 @@
+/* Purpose: demonstrate the succesful operation of the register save mechanism,
+ * in which the caller saves the registers that will be clobbered, and restores
+ * them after the call.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r16=#47
+        r17=#155
+    }
+    {
+        memd(r29+#-16)=r17:16; allocframe(#8)
+    }
+    {
+        r16=#255
+        r17=#42
+    }
+    {
+        r17:16=memd(r29+#0); deallocframe
+    }
+    {
+        r3=add(r16,r17)
+    }
+    {
+        p0 = cmp.eq(r3, #202); if (p0.new) jump:t pass
+    }
+    {
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_cmp.S b/tests/tcg/hexagon/test_cmp.S
new file mode 100644
index 0000000000..31ee9565fe
--- /dev/null
+++ b/tests/tcg/hexagon/test_cmp.S
@@ -0,0 +1,34 @@
+/* Purpose: test a signed and unsigned comparison */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        jump signed
+    }
+
+    .globl signed
+signed:
+    {
+        r0=#-2
+        r1=#0
+    }
+    {
+        p0 = cmp.lt(r0, r1); if (p0.new) jump:t unsigned
+        jump fail
+    }
+
+    .globl unsigned
+unsigned:
+    {
+        r0=#-2
+        r1=#0
+    }
+    {
+        p0 = cmp.gtu(r0, r1); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_cmpy.S b/tests/tcg/hexagon/test_cmpy.S
new file mode 100644
index 0000000000..0b3dfb95de
--- /dev/null
+++ b/tests/tcg/hexagon/test_cmpy.S
@@ -0,0 +1,31 @@
+/* Purpose: test example, verify the soundness of the cmpy operation
+ *
+ *  3j+5 * 2j+4 = 22j+14
+ *
+ * the complex multiply between 0x00030005 and 0x00020004 is 0x000000160000000e
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#196613
+        r1=#131076
+    }
+    {
+        r3:2=cmpy(r0, r1):sat
+    }
+    {
+        p0 = cmp.eq(r2, #14); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        p0 = cmp.eq(r3, #22); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_djump.S b/tests/tcg/hexagon/test_djump.S
new file mode 100644
index 0000000000..dbad7eb0a1
--- /dev/null
+++ b/tests/tcg/hexagon/test_djump.S
@@ -0,0 +1,24 @@
+/* Purpose: show dual jumps actually work. This program features a packet where
+ * two jumps should (in theory) be performed if !P0. However, we correctly
+ * handle the situation by performing only the first one and ignoring the second
+ * one. This can be verified by checking that the CPU dump contains 0xDEADBEEF
+ * in R2.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r1 = #255;
+    }
+    {
+        p0 = r1;
+    }
+    {
+        if (p0) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_dotnew.S b/tests/tcg/hexagon/test_dotnew.S
new file mode 100644
index 0000000000..3897c6bc96
--- /dev/null
+++ b/tests/tcg/hexagon/test_dotnew.S
@@ -0,0 +1,39 @@
+/* Purpose: test the .new operator while performing memory stores.
+ * In the final CPU dump R0 should contain 3, R1 should contain 2 and R2 should
+ * contain 1.
+ */
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#1
+        memw(sp+#0)=r0.new
+    }
+    {
+        r1=#2
+        memw(sp+#4)=r1.new
+    }
+    {
+        r2=#3
+        memw(sp+#8)=r2.new
+    }
+    {
+        r0=memw(sp+#8)
+    }
+    {
+        r1=memw(sp+#4)
+    }
+    {
+        r2=memw(sp+#0)
+    }
+    {
+        r3=mpyi(r1,r2)
+    }
+    {
+        p0 = cmp.eq(r3, #2); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_dstore.S b/tests/tcg/hexagon/test_dstore.S
new file mode 100644
index 0000000000..62c4301eb1
--- /dev/null
+++ b/tests/tcg/hexagon/test_dstore.S
@@ -0,0 +1,29 @@
+/* Purpose: test dual stores correctness.
+ * In this example the values 1 and 2 are both written on the top of the stack
+ * in a single packet.
+ * The value is then read back in R3, which should contain only the latest value
+ * written (2).
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#1
+        r1=#2
+    }
+    {
+        memw(sp+#0)=r0
+        memw(sp+#0)=r1
+    }
+    {
+        r3=memw(sp+#0)
+    }
+    {
+        p0 = cmp.eq(r3, #2); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_ext.S b/tests/tcg/hexagon/test_ext.S
new file mode 100644
index 0000000000..0f6e21593a
--- /dev/null
+++ b/tests/tcg/hexagon/test_ext.S
@@ -0,0 +1,18 @@
+/* Purpose: test immediate extender instructions.
+ * In the CPU dump R0 should contain 0xDEADBEEF.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r2=##-559038737
+    }
+    {
+        p0 = cmp.eq(r2, ##-559038737); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_fibonacci.S b/tests/tcg/hexagon/test_fibonacci.S
new file mode 100644
index 0000000000..41cb1517cb
--- /dev/null
+++ b/tests/tcg/hexagon/test_fibonacci.S
@@ -0,0 +1,33 @@
+/* Purpose: computes the Fibonacci series up to a constant number. */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r2=#100
+    }
+    {
+        p0=cmp.gt(r2,#0); if (!p0.new) jump:nt .LBB0_3
+    }
+    {
+        r3=#0
+        r4=#1
+    }
+.LBB0_2:
+    {
+        r5=r4
+    }
+    {
+        p0=cmp.gt(r2,r5); if (p0.new) jump:nt .LBB0_2
+        r4=add(r3,r4)
+        r3=r5
+    }
+.LBB0_3:
+    {
+        p0 = cmp.eq(r3, #144); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_hello.S b/tests/tcg/hexagon/test_hello.S
new file mode 100644
index 0000000000..89c7da677f
--- /dev/null
+++ b/tests/tcg/hexagon/test_hello.S
@@ -0,0 +1,21 @@
+/* Purpose: simple hello world program. */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    { r0=#4; }
+    {
+        r1=##.L.str
+    }
+    { trap0(#0); }
+    {
+        jump pass
+    }
+
+.L.str:
+    .string    "Hello world!\n"
+    .size    .L.str, 14
diff --git a/tests/tcg/hexagon/test_hl.S b/tests/tcg/hexagon/test_hl.S
new file mode 100644
index 0000000000..217b3143e2
--- /dev/null
+++ b/tests/tcg/hexagon/test_hl.S
@@ -0,0 +1,19 @@
+/* Purpose: test example, verify the soundness of the high/low assignment */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0.H=#42
+    }
+    {
+        r0.L=#69
+    }
+    {
+        p0 = cmp.eq(r0, #2752581); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_hwloops.S b/tests/tcg/hexagon/test_hwloops.S
new file mode 100644
index 0000000000..8337083d8e
--- /dev/null
+++ b/tests/tcg/hexagon/test_hwloops.S
@@ -0,0 +1,25 @@
+/* Purpose: simple C Program to test hardware loops.
+ * It should print numbersfrom 0 to 9.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        loop0(.LBB0_1,#10)
+        r2=#0
+    }
+.Ltmp0:
+.LBB0_1:
+    {
+        r2=add(r2,#1)
+        nop
+    }:endloop0
+    {
+        p0 = cmp.eq(r2, #10); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_jmp.S b/tests/tcg/hexagon/test_jmp.S
new file mode 100644
index 0000000000..cd87bac89b
--- /dev/null
+++ b/tests/tcg/hexagon/test_jmp.S
@@ -0,0 +1,25 @@
+/* Purpose: test example, verify the soundness of the add operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r1=#0
+        r2=#0
+    }
+    {
+        r3=add(r2,r3)
+    }
+    {
+        p0 = cmp.eq(r3, #0)
+    }
+    {
+        if (p0) jump:t pass
+    }
+    {
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_lsr.S b/tests/tcg/hexagon/test_lsr.S
new file mode 100644
index 0000000000..202eb4aec7
--- /dev/null
+++ b/tests/tcg/hexagon/test_lsr.S
@@ -0,0 +1,39 @@
+/* Purpose: test the soundness of the lsr operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#-56984
+        r1=#2147483647
+    }
+    {
+        r2=#0x19
+    }
+    {
+        r0&=lsr(r1, r2)
+    }
+    {
+        p0 = cmp.eq(r0, #0x28); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        r0=#0x0000000a
+        r1=#0x00000000
+    }
+    {
+        r2=#-1
+    }
+    {
+        r1:0=lsl(r1:0, r2)
+    }
+    {
+        p0 = cmp.eq(r0, #0x5); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_mpyi.S b/tests/tcg/hexagon/test_mpyi.S
new file mode 100644
index 0000000000..b8e0d50b68
--- /dev/null
+++ b/tests/tcg/hexagon/test_mpyi.S
@@ -0,0 +1,20 @@
+/* Purpose: test a simple multiplication operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r1=#4
+        r2=#6
+    }
+    {
+        r3=mpyi(r1,r2)
+    }
+    {
+        p0 = cmp.eq(r3, #24); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_packet.S b/tests/tcg/hexagon/test_packet.S
new file mode 100644
index 0000000000..d26e284be9
--- /dev/null
+++ b/tests/tcg/hexagon/test_packet.S
@@ -0,0 +1,26 @@
+/* Purpose: test that writes of a register in a packet are performed only after
+ * that packet has finished its execution.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r2=#4
+        r3=#6
+    }
+    {
+        memw(sp+#0)=r2
+    }
+    {
+        r3=memw(sp+#0)
+        r0=add(r2,r3)
+    }
+    {
+        p0 = cmp.eq(r0, #10); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_reorder.S b/tests/tcg/hexagon/test_reorder.S
new file mode 100644
index 0000000000..508d5302f9
--- /dev/null
+++ b/tests/tcg/hexagon/test_reorder.S
@@ -0,0 +1,31 @@
+/* Purpose: demonstrate handling of .new uses appearing before the associated
+ * definition.
+ * Here we perform a jump that skips the code resetting R2 from 0xDEADBEEF to 0,
+ * only if P0.new is true, but P0 is assigned to 1 (R4) in the next instruction
+ * in the packet.
+ * A successful run of the program will show R2 retaining the 0xDEADBEEF value
+ * in the CPU dump.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    { r2=#-559038737 }
+    { r4=#1 }
+    {
+        if (p0.new) jump:nt skip
+        p0=r4;
+    }
+
+fallthrough:
+    { r2=#0 }
+
+skip:
+    {
+        p0 = cmp.eq(r2, #-559038737); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_round.S b/tests/tcg/hexagon/test_round.S
new file mode 100644
index 0000000000..2becd62c4c
--- /dev/null
+++ b/tests/tcg/hexagon/test_round.S
@@ -0,0 +1,31 @@
+/* Purpose: test example, verify the soundness of the cround operation
+ * 106 = 0b1101010 with the comma at third digit is 12.5 which is crounded to 12
+ * but rounded to 13
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r1=#200
+    }
+    {
+        r2=round(r1, #4)
+    }
+    {
+        p0 = cmp.eq(r2, #13); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        r2=cround(r1, #4)
+    }
+    {
+        p0 = cmp.eq(r2, #12); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vavgw.S b/tests/tcg/hexagon/test_vavgw.S
new file mode 100644
index 0000000000..8f67238900
--- /dev/null
+++ b/tests/tcg/hexagon/test_vavgw.S
@@ -0,0 +1,33 @@
+/* Purpose: test example, verify the soundness of the vavgw operation
+ *
+ * 0x00030001 averaged with 0x00010003 results 0x00020002
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#3
+        r1=#1
+    }
+    {
+        r2=#1
+        r3=#3
+    }
+    {
+        r1:0=vavgw(r1:0, r3:2):crnd
+    }
+    {
+        p0 = cmp.eq(r0, #2); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        p0 = cmp.eq(r1, #2); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vcmpb.S b/tests/tcg/hexagon/test_vcmpb.S
new file mode 100644
index 0000000000..3c6700a63a
--- /dev/null
+++ b/tests/tcg/hexagon/test_vcmpb.S
@@ -0,0 +1,32 @@
+/* Purpose: test example, verify the soundness of the vector compare bytes
+ * operation
+ *
+ * Vector word comparison between 0x1234567887654321 and 0x1234567800000000
+ * should result in 0x11110000
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#305419896
+        r1=#-2023406815
+    }
+    {
+        r2=#305419896
+        r3=#0
+    }
+    {
+        p2=vcmpb.eq(r1:0, r3:2)
+    }
+    {
+        r4=p2
+    }
+    {
+        p0 = cmp.eq(r4, #15); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vcmpw.S b/tests/tcg/hexagon/test_vcmpw.S
new file mode 100644
index 0000000000..112f08c92f
--- /dev/null
+++ b/tests/tcg/hexagon/test_vcmpw.S
@@ -0,0 +1,29 @@
+/* Purpose: test example, verify the soundness of the vector compare words
+ * operation
+ *
+ * Vector word comparison between 0x1234567887654321 and 0x1234567800000000
+ * should result in 0x11110000
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#305419896
+        r1=#-2023406815
+    }
+    {
+        r2=#305419896
+        r3=#0
+    }
+    {
+        p2=vcmpw.eq(r1:0, r3:2)
+    }
+    {
+        if (p2) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vcmpy.S b/tests/tcg/hexagon/test_vcmpy.S
new file mode 100644
index 0000000000..df379f9186
--- /dev/null
+++ b/tests/tcg/hexagon/test_vcmpy.S
@@ -0,0 +1,50 @@
+/* Purpose: test example, verify the soundness of the vcmpy operation
+ * this operation is a complex multiply and accumulate on vectors of two values
+ *
+ *     (3j+5 * 2j+4) + (4j+6 * 5j+2) = 22j+14
+ *
+ * the complex multiply between  0x00030005 and 0x00020004 is 0x000000160000000e
+ * the complex multiply between  0x00040006 and 0x00050002 is 0x000000160000000e
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#196613
+        r1=#131076
+    }
+    {
+        r2=#262150
+        r3=#327682
+    }
+    {
+        r5:4=vcmpyr(r1:0, r3:2):sat
+        r7:6=vcmpyi(r1:0, r3:2):sat
+    }
+    {
+        p0 = cmp.eq(r4, #18); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        p0 = cmp.eq(r5, #-2); if (p0.new) jump:t test3
+        jump fail
+    }
+
+test3:
+    {
+        p0 = cmp.eq(r6, #38); if (p0.new) jump:t test4
+        jump fail
+    }
+
+test4:
+    {
+        p0 = cmp.eq(r7, #24); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vlsrw.S b/tests/tcg/hexagon/test_vlsrw.S
new file mode 100644
index 0000000000..962ec99543
--- /dev/null
+++ b/tests/tcg/hexagon/test_vlsrw.S
@@ -0,0 +1,23 @@
+/* Purpose: test the soundness of the vlsrw operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#0x00000001
+        r1=#0x00000001
+    }
+    {
+        r1:0=vlsrw(r1:0, #1)
+    }
+    {
+        r0 = add(r0, r1)
+    }
+    {
+        p0 = cmp.eq(r0, #0); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vmaxh.S b/tests/tcg/hexagon/test_vmaxh.S
new file mode 100644
index 0000000000..1fce935e35
--- /dev/null
+++ b/tests/tcg/hexagon/test_vmaxh.S
@@ -0,0 +1,37 @@
+/* Purpose: test example, verify the soundness of the vrmaxh operation
+ *
+ * the maximum between  0x0002000300010005 and 0x0003000200020007 is
+ * 0x0003000300020007.
+ *
+ *                      r1=0x00010003 r0=0x00010005 r3=0x00030002 r2=0x00020007
+ *     result:          r1=0x00030003 r0=0x00020007
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#65541
+        r1=#65539
+    }
+    {
+        r2=#131079
+        r3=#196610
+    }
+    {
+        r1:0=vmaxh(r1:0, r3:2)
+    }
+    {
+        p0 = cmp.eq(r0, #131079); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        p0 = cmp.eq(r1, #196611); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vminh.S b/tests/tcg/hexagon/test_vminh.S
new file mode 100644
index 0000000000..6c6d18c673
--- /dev/null
+++ b/tests/tcg/hexagon/test_vminh.S
@@ -0,0 +1,37 @@
+/* Purpose: test example, verify the soundness of the vrmaxh operation
+ *
+ * the minimum between  0x0002000300010005 and 0x0003000200020007 is
+ * 0x0003000300020007
+ *
+ *                      r1=0x00010003 r0=0x00010005 r3=0x00030002 r2=0x00020007
+ *     result:          r1=0x00010002 r0=0x00010005
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#65541
+        r1=#65539
+    }
+    {
+        r2=#131079
+        r3=#196610
+    }
+    {
+        r1:0=vminh(r1:0, r3:2)
+    }
+    {
+        p0 = cmp.eq(r0, #65541); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        p0 = cmp.eq(r1, #65538); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vpmpyh.S b/tests/tcg/hexagon/test_vpmpyh.S
new file mode 100644
index 0000000000..942d691da4
--- /dev/null
+++ b/tests/tcg/hexagon/test_vpmpyh.S
@@ -0,0 +1,30 @@
+/* Purpose: test example, verify the soundness of the vpmpyh operator
+ *
+ * 0x01020304 vector polynomial multiplied with 0x04030201 results
+ * 0x000400060b060b04
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#16909060
+        r1=#67305985
+    }
+    {
+        r1:0=vpmpyh(r0, r1)
+    }
+    {
+        p0 = cmp.eq(r0, #184945412); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        p0 = cmp.eq(r1, #262150); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vspliceb.S b/tests/tcg/hexagon/test_vspliceb.S
new file mode 100644
index 0000000000..bae2a9c163
--- /dev/null
+++ b/tests/tcg/hexagon/test_vspliceb.S
@@ -0,0 +1,33 @@
+/* Purpose: test example, verify the soundness of the vspliceb operation
+ * the operation is a binary splice of two 64bit operators
+ *
+ *  vspliceb(0xffffffffffffffff,0x0000000000000000,5) = 0x000000000000001f
+ */
+    .text
+    .globl _start
+
+_start:
+    {
+        call init
+    }
+    {
+        r0=#-1
+        r1=#-1
+    }
+    {
+        r2=#0
+        r3=#0
+    }
+    {
+        r5:4=vspliceb(r1:0, r3:2, #5)
+    }
+    {
+        p0 = cmp.eq(r4, #-1); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        p0 = cmp.eq(r5, #255); if (p0.new) jump:t pass
+        jump fail
+    }
-- 
2.30.0


