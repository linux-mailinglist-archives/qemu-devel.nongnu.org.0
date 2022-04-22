Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED450BF56
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:12:48 +0200 (CEST)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxlv-0006LW-VO
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxI6-0008Mk-QP
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:42:01 -0400
Received: from rev.ng ([5.9.113.41]:40229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxI2-0006Ac-6Z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qd8fdHk176o+ZUL2vlhWhYWQQs6wVrKCAka0pZJDkes=; b=g4+ziy9ZwDFXlbpQHIpwoTapEa
 F4HLIt1CPsqWES0toWEBeTswimAji+ZTyf/DvZAfG/LcF/kkifn0R2hfAzmJkxhfp2j+F6Q5mqmlR
 ohA7sgX0FgQnei2G7JblD18/4knw6hMNM/uP7ZBFW2w05asfXEpbP3wXPz0qzv6UhPak=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v9 12/12] target/hexagon: import additional tests
Date: Fri, 22 Apr 2022 19:40:59 +0200
Message-Id: <20220422174059.4304-13-anjo@rev.ng>
In-Reply-To: <20220422174059.4304-1-anjo@rev.ng>
References: <20220422174059.4304-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

From: Niccolò Izzo <nizzo@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Niccolò Izzo <nizzo@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 tests/tcg/hexagon/Makefile.target  | 28 ++++++++++++-
 tests/tcg/hexagon/crt.S            | 14 +++++++
 tests/tcg/hexagon/test_abs.S       | 17 ++++++++
 tests/tcg/hexagon/test_bitcnt.S    | 40 +++++++++++++++++++
 tests/tcg/hexagon/test_bitsplit.S  | 22 ++++++++++
 tests/tcg/hexagon/test_call.S      | 64 ++++++++++++++++++++++++++++++
 tests/tcg/hexagon/test_clobber.S   | 29 ++++++++++++++
 tests/tcg/hexagon/test_cmp.S       | 31 +++++++++++++++
 tests/tcg/hexagon/test_dotnew.S    | 38 ++++++++++++++++++
 tests/tcg/hexagon/test_ext.S       | 13 ++++++
 tests/tcg/hexagon/test_fibonacci.S | 30 ++++++++++++++
 tests/tcg/hexagon/test_hl.S        | 16 ++++++++
 tests/tcg/hexagon/test_hwloops.S   | 19 +++++++++
 tests/tcg/hexagon/test_jmp.S       | 22 ++++++++++
 tests/tcg/hexagon/test_lsr.S       | 36 +++++++++++++++++
 tests/tcg/hexagon/test_mpyi.S      | 17 ++++++++
 tests/tcg/hexagon/test_packet.S    | 29 ++++++++++++++
 tests/tcg/hexagon/test_reorder.S   | 33 +++++++++++++++
 tests/tcg/hexagon/test_round.S     | 29 ++++++++++++++
 tests/tcg/hexagon/test_vavgw.S     | 31 +++++++++++++++
 tests/tcg/hexagon/test_vcmpb.S     | 30 ++++++++++++++
 tests/tcg/hexagon/test_vcmpw.S     | 30 ++++++++++++++
 tests/tcg/hexagon/test_vlsrw.S     | 20 ++++++++++
 tests/tcg/hexagon/test_vmaxh.S     | 35 ++++++++++++++++
 tests/tcg/hexagon/test_vminh.S     | 35 ++++++++++++++++
 tests/tcg/hexagon/test_vpmpyh.S    | 28 +++++++++++++
 tests/tcg/hexagon/test_vspliceb.S  | 31 +++++++++++++++
 27 files changed, 766 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/hexagon/crt.S
 create mode 100644 tests/tcg/hexagon/test_abs.S
 create mode 100644 tests/tcg/hexagon/test_bitcnt.S
 create mode 100644 tests/tcg/hexagon/test_bitsplit.S
 create mode 100644 tests/tcg/hexagon/test_call.S
 create mode 100644 tests/tcg/hexagon/test_clobber.S
 create mode 100644 tests/tcg/hexagon/test_cmp.S
 create mode 100644 tests/tcg/hexagon/test_dotnew.S
 create mode 100644 tests/tcg/hexagon/test_ext.S
 create mode 100644 tests/tcg/hexagon/test_fibonacci.S
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
 create mode 100644 tests/tcg/hexagon/test_vlsrw.S
 create mode 100644 tests/tcg/hexagon/test_vmaxh.S
 create mode 100644 tests/tcg/hexagon/test_vminh.S
 create mode 100644 tests/tcg/hexagon/test_vpmpyh.S
 create mode 100644 tests/tcg/hexagon/test_vspliceb.S

diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 23b9870534..44ffa1337d 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -24,7 +24,7 @@ CFLAGS += -fno-unroll-loops
 HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
 VPATH += $(HEX_SRC)
 
-first: $(HEX_SRC)/first.S
+%: $(HEX_SRC)/%.S $(HEX_SRC)/crt.S
 	$(CC) -static -mv67 -nostdlib $^ -o $@
 
 HEX_TESTS = first
@@ -43,6 +43,32 @@ HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 HEX_TESTS += overflow
 
+HEX_TESTS += test_abs
+HEX_TESTS += test_bitcnt
+HEX_TESTS += test_bitsplit
+HEX_TESTS += test_call
+HEX_TESTS += test_clobber
+HEX_TESTS += test_cmp
+HEX_TESTS += test_dotnew
+HEX_TESTS += test_ext
+HEX_TESTS += test_fibonacci
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
+HEX_TESTS += test_vlsrw
+HEX_TESTS += test_vmaxh
+HEX_TESTS += test_vminh
+HEX_TESTS += test_vpmpyh
+HEX_TESTS += test_vspliceb
+
 TESTS += $(HEX_TESTS)
 
 # This test has to be compiled for the -mv67t target
diff --git a/tests/tcg/hexagon/crt.S b/tests/tcg/hexagon/crt.S
new file mode 100644
index 0000000000..f9e6bc80f7
--- /dev/null
+++ b/tests/tcg/hexagon/crt.S
@@ -0,0 +1,14 @@
+#define SYS_exit_group 94
+
+    .text
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
diff --git a/tests/tcg/hexagon/test_abs.S b/tests/tcg/hexagon/test_abs.S
new file mode 100644
index 0000000000..d68aea6f64
--- /dev/null
+++ b/tests/tcg/hexagon/test_abs.S
@@ -0,0 +1,17 @@
+/* Purpose: test example, verify the soundness of the abs operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r1 = #-2
+        r2 = #2
+    }
+    {
+        r3 = abs(r1)
+    }
+    {
+        p0 = cmp.eq(r3, r2); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_bitcnt.S b/tests/tcg/hexagon/test_bitcnt.S
new file mode 100644
index 0000000000..624460488e
--- /dev/null
+++ b/tests/tcg/hexagon/test_bitcnt.S
@@ -0,0 +1,40 @@
+/*
+ * Purpose: test example, verify the soundness of the cl[01] operations.
+ *
+ * The number 0x000001aa has 23 leading zeroes
+ * they become 55 when considered as 64 bit register
+ * and it has 1 trailing zero.
+ */
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #426
+        r1 = #0
+    }
+    {
+        r2 = cl0(r0)
+    }
+    {
+        p0 = cmp.eq(r2, #23); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        r2 = cl0(r1:0)
+    }
+    {
+        p0 = cmp.eq(r2, #55); if (p0.new) jump:t test3
+        jump fail
+    }
+
+test3:
+    {
+        r2 = ct0(r0)
+    }
+    {
+        p0 = cmp.eq(r2, #1); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_bitsplit.S b/tests/tcg/hexagon/test_bitsplit.S
new file mode 100644
index 0000000000..275658e613
--- /dev/null
+++ b/tests/tcg/hexagon/test_bitsplit.S
@@ -0,0 +1,22 @@
+/* Purpose: test example, verify the soundness of the bitsplit operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r1 = #187
+    }
+    {
+        r3:2 = bitsplit(r1, #3)
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
index 0000000000..338cd04e40
--- /dev/null
+++ b/tests/tcg/hexagon/test_call.S
@@ -0,0 +1,64 @@
+/*
+ * Purpose: test function calls and duplex instructions.
+ * The string "Hello there, I'm a test string!" with the first letter replaced
+ * with a capital L should be printed out.
+ */
+
+#define SYS_write 64
+#define FD_STDOUT 1
+
+    .text
+    .globl    test
+test:
+    {
+        jumpr r31
+        memb(r0+#0) = #76
+    }
+.Lfunc_end0:
+.Ltmp0:
+    .size    test, .Ltmp0-test
+
+    .globl    _start
+_start:
+    {
+        r0 = ##dummy_buffer
+        allocframe(#0)
+        call test
+    }
+    {
+        call write
+    }
+    {
+        deallocframe
+        jump pass
+    }
+.Lfunc_end1:
+.Ltmp1:
+    .size    _start, .Ltmp1-_start
+
+write:
+    {
+        r6 = #SYS_write
+        r0 = #FD_STDOUT
+        r1 = ##dummy_buffer
+        r2 = #33
+    }
+    {
+        trap0(#1)
+    }
+    {
+        jumpr r31
+    }
+
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
index 0000000000..a7aeb2b60c
--- /dev/null
+++ b/tests/tcg/hexagon/test_clobber.S
@@ -0,0 +1,29 @@
+/*
+ * Purpose: demonstrate the succesful operation of the register save mechanism,
+ * in which the caller saves the registers that will be clobbered, and restores
+ * them after the call.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    allocframe(#8)
+    {
+        r16 = #47
+        r17 = #155
+    }
+    memd(sp+#0) = r17:16
+    {
+        r16 = #255
+        r17 = #42
+    }
+    {
+        deallocframe
+        r17:16 = memd(sp+#0)
+    }
+    {
+        p0 = cmp.eq(r16, #47)
+        p0 = cmp.eq(r17, #155); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_cmp.S b/tests/tcg/hexagon/test_cmp.S
new file mode 100644
index 0000000000..1db87d3db5
--- /dev/null
+++ b/tests/tcg/hexagon/test_cmp.S
@@ -0,0 +1,31 @@
+/* Purpose: test a signed and unsigned comparison */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        jump signed
+    }
+
+    .globl signed
+signed:
+    {
+        r0 = #-2
+        r1 = #0
+    }
+    {
+        p0 = cmp.lt(r0, r1); if (p0.new) jump:t unsigned
+        jump fail
+    }
+
+    .globl unsigned
+unsigned:
+    {
+        r0 = #-2
+        r1 = #0
+    }
+    {
+        p0 = cmp.gtu(r0, r1); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_dotnew.S b/tests/tcg/hexagon/test_dotnew.S
new file mode 100644
index 0000000000..b18b6a72e2
--- /dev/null
+++ b/tests/tcg/hexagon/test_dotnew.S
@@ -0,0 +1,38 @@
+/* Purpose: test the .new operator while performing memory stores. */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        allocframe(#16)
+    }
+    {
+        r0 = #1
+        memw(sp+#0) = r0.new
+    }
+    {
+        r1 = #2
+        memw(sp+#4) = r1.new
+    }
+    {
+        r2 = #3
+        memw(sp+#8) = r2.new
+    }
+    {
+        r0 = memw(sp+#8)
+    }
+    {
+        r1 = memw(sp+#4)
+    }
+    {
+        r2 = memw(sp+#0)
+    }
+    {
+        r3 = mpyi(r1, r2)
+    }
+    {
+        deallocframe
+        p0 = cmp.eq(r3, #2); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_ext.S b/tests/tcg/hexagon/test_ext.S
new file mode 100644
index 0000000000..03e7bce2a7
--- /dev/null
+++ b/tests/tcg/hexagon/test_ext.S
@@ -0,0 +1,13 @@
+/* Purpose: test immediate extender instructions. */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r2 = ##-559038737
+    }
+    {
+        p0 = cmp.eq(r2, ##-559038737); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_fibonacci.S b/tests/tcg/hexagon/test_fibonacci.S
new file mode 100644
index 0000000000..4ef2c3896e
--- /dev/null
+++ b/tests/tcg/hexagon/test_fibonacci.S
@@ -0,0 +1,30 @@
+/* Purpose: computes the Fibonacci series up to a constant number. */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r2 = #100
+    }
+    {
+        p0 = cmp.gt(r2, #0); if (!p0.new) jump:nt .LBB0_3
+    }
+    {
+        r3 = #0
+        r4 = #1
+    }
+.LBB0_2:
+    {
+        r5 = r4
+    }
+    {
+        p0 = cmp.gt(r2, r5); if (p0.new) jump:nt .LBB0_2
+        r4 = add(r3, r4)
+        r3 = r5
+    }
+.LBB0_3:
+    {
+        p0 = cmp.eq(r3, #144); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_hl.S b/tests/tcg/hexagon/test_hl.S
new file mode 100644
index 0000000000..93ace46aeb
--- /dev/null
+++ b/tests/tcg/hexagon/test_hl.S
@@ -0,0 +1,16 @@
+/* Purpose: test example, verify the soundness of the high/low assignment */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0.H = #42
+    }
+    {
+        r0.L = #69
+    }
+    {
+        p0 = cmp.eq(r0, #2752581); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_hwloops.S b/tests/tcg/hexagon/test_hwloops.S
new file mode 100644
index 0000000000..42785e6f25
--- /dev/null
+++ b/tests/tcg/hexagon/test_hwloops.S
@@ -0,0 +1,19 @@
+/* Purpose: simple C Program to test hardware loops. */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        loop0(.LBB0_1, #10)
+        r2 = #0
+    }
+.LBB0_1:
+    {
+        r2 = add(r2, #1)
+        nop
+    }:endloop0
+    {
+        p0 = cmp.eq(r2, #10); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_jmp.S b/tests/tcg/hexagon/test_jmp.S
new file mode 100644
index 0000000000..5be25c52b2
--- /dev/null
+++ b/tests/tcg/hexagon/test_jmp.S
@@ -0,0 +1,22 @@
+/* Purpose: test example, verify the soundness of the jump operation */
+
+#define SYS_exit_group 94
+
+    .text
+    .globl _start
+
+_start:
+    {
+        jump pass
+    }
+    /*
+     * Inlined fail label in crt.S so we can fail without
+     * having a functioning jump
+     */
+    {
+        r0 = #1
+        r6 = #SYS_exit_group
+    }
+    {
+        trap0(#1)
+    }
diff --git a/tests/tcg/hexagon/test_lsr.S b/tests/tcg/hexagon/test_lsr.S
new file mode 100644
index 0000000000..b30aa64673
--- /dev/null
+++ b/tests/tcg/hexagon/test_lsr.S
@@ -0,0 +1,36 @@
+/* Purpose: test the soundness of the lsr operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #-56984
+        r1 = #2147483647
+    }
+    {
+        r2 = #0x19
+    }
+    {
+        r0 &= lsr(r1, r2)
+    }
+    {
+        p0  =  cmp.eq(r0, #0x28); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        r0 = #0x0000000a
+        r1 = #0x00000000
+    }
+    {
+        r2 = #-1
+    }
+    {
+        r1:0 = lsl(r1:0, r2)
+    }
+    {
+        p0  =  cmp.eq(r0, #0x5); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_mpyi.S b/tests/tcg/hexagon/test_mpyi.S
new file mode 100644
index 0000000000..953b46e57e
--- /dev/null
+++ b/tests/tcg/hexagon/test_mpyi.S
@@ -0,0 +1,17 @@
+/* Purpose: test a simple multiplication operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r1 = #4
+        r2 = #6
+    }
+    {
+        r3 = mpyi(r1, r2)
+    }
+    {
+        p0 = cmp.eq(r3, #24); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_packet.S b/tests/tcg/hexagon/test_packet.S
new file mode 100644
index 0000000000..9ec9d8d6fb
--- /dev/null
+++ b/tests/tcg/hexagon/test_packet.S
@@ -0,0 +1,29 @@
+/*
+ * Purpose: test that writes of a register in a packet are performed only after
+ * that packet has finished its execution.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        allocframe(#8)
+    }
+    {
+        r2 = #4
+        r3 = #6
+    }
+    {
+        memw(sp+#0) = r2
+    }
+    {
+        r3 = memw(sp+#0)
+        r0 = add(r2, r3)
+    }
+    {
+        deallocframe
+        p0 = cmp.eq(r3, #4)
+        p0 = cmp.eq(r0, #10); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_reorder.S b/tests/tcg/hexagon/test_reorder.S
new file mode 100644
index 0000000000..5ee0539836
--- /dev/null
+++ b/tests/tcg/hexagon/test_reorder.S
@@ -0,0 +1,33 @@
+/*
+ * Purpose: demonstrate handling of .new uses appearing before the associated
+ * definition.
+ * Here we perform a jump that skips the code resetting R2 from 0xDEADBEEF to 0,
+ * only if P0.new is true, but P0 is assigned to 1 (R4) in the next instruction
+ * in the packet.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r2 = #-559038737
+    }
+    {
+        r4 = #1
+    }
+    {
+        if (p0.new) jump:nt skip
+        p0 = r4;
+    }
+
+fallthrough:
+    {
+        r2 = #0
+    }
+
+skip:
+    {
+        p0 = cmp.eq(r2, #-559038737); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_round.S b/tests/tcg/hexagon/test_round.S
new file mode 100644
index 0000000000..3c83812fe8
--- /dev/null
+++ b/tests/tcg/hexagon/test_round.S
@@ -0,0 +1,29 @@
+/*
+ * Purpose: test example, verify the soundness of the cround operation
+ * 106 = 0b1101010 with the comma at third digit is 12.5 which is crounded to 12
+ * but rounded to 13.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r1 = #200
+    }
+    {
+        r2 = round(r1, #4)
+    }
+    {
+        p0 = cmp.eq(r2, #13); if (p0.new) jump:t test2
+        jump fail
+    }
+
+test2:
+    {
+        r2 = cround(r1, #4)
+    }
+    {
+        p0 = cmp.eq(r2, #12); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vavgw.S b/tests/tcg/hexagon/test_vavgw.S
new file mode 100644
index 0000000000..53c9df706a
--- /dev/null
+++ b/tests/tcg/hexagon/test_vavgw.S
@@ -0,0 +1,31 @@
+/*
+ * Purpose: test example, verify the soundness of the vavgw operation.
+ *
+ * 0x00030001 averaged with 0x00010003 results 0x00020002.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #3
+        r1 = #1
+    }
+    {
+        r2 = #1
+        r3 = #3
+    }
+    {
+        r1:0 = vavgw(r1:0, r3:2):crnd
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
index 0000000000..66d253eb48
--- /dev/null
+++ b/tests/tcg/hexagon/test_vcmpb.S
@@ -0,0 +1,30 @@
+/*
+ * Purpose: test example, verify the soundness of the vector compare bytes
+ * operation.
+ *
+ * Vector byte comparison between 0x1234567887654321 and 0x1234567800000000
+ * should result in 0b11110000 in binary, or 0xf0 in hex.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #0x87654321
+        r1 = #0x12345678
+    }
+    {
+        r2 = #0x00000000
+        r3 = #0x12345678
+    }
+    {
+        p2 = vcmpb.eq(r1:0, r3:2)
+    }
+    {
+        r4 = p2
+    }
+    {
+        p0 = cmp.eq(r4, #0xf0); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vcmpw.S b/tests/tcg/hexagon/test_vcmpw.S
new file mode 100644
index 0000000000..5be88d1e2e
--- /dev/null
+++ b/tests/tcg/hexagon/test_vcmpw.S
@@ -0,0 +1,30 @@
+/*
+ * Purpose: test example, verify the soundness of the vector compare words
+ * operation.
+ *
+ * Vector word comparison between 0x1234567887654321 and 0x1234567800000000
+ * should result in 0b11110000 in binary, or 0xf0 in hex.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #0x87654321
+        r1 = #0x12345678
+    }
+    {
+        r2 = #0x00000000
+        r3 = #0x12345678
+    }
+    {
+        p2 = vcmpw.eq(r1:0, r3:2)
+    }
+    {
+        r4 = p2
+    }
+    {
+        p0 = cmp.eq(r4, #0xf0); if (p0.new) jump:t pass
+        jump fail
+    }
diff --git a/tests/tcg/hexagon/test_vlsrw.S b/tests/tcg/hexagon/test_vlsrw.S
new file mode 100644
index 0000000000..912e49aa0b
--- /dev/null
+++ b/tests/tcg/hexagon/test_vlsrw.S
@@ -0,0 +1,20 @@
+/* Purpose: test the soundness of the vlsrw operation */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #0x00000001
+        r1 = #0x00000001
+    }
+    {
+        r1:0 = vlsrw(r1:0, #1)
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
index 0000000000..4ea6bd9d96
--- /dev/null
+++ b/tests/tcg/hexagon/test_vmaxh.S
@@ -0,0 +1,35 @@
+/*
+ * Purpose: test example, verify the soundness of the vrmaxh operation.
+ *
+ * The maximum between  0x0002000300010005 and 0x0003000200020007 is
+ * 0x0003000300020007.
+ *
+ *      input:  r1 = 0x00010003 r0 = 0x00010005 r3 = 0x00030002 r2 = 0x00020007
+ *     output:  r1 = 0x00030003 r0 = 0x00020007
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #65541
+        r1 = #65539
+    }
+    {
+        r2 = #131079
+        r3 = #196610
+    }
+    {
+        r1:0 = vmaxh(r1:0, r3:2)
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
index 0000000000..e5fcf2eb94
--- /dev/null
+++ b/tests/tcg/hexagon/test_vminh.S
@@ -0,0 +1,35 @@
+/*
+ * Purpose: test example, verify the soundness of the vrmaxh operation.
+ *
+ * The minimum between  0x0002000300010005 and 0x0003000200020007 is
+ * 0x0003000300020007.
+ *
+ *      input:  r1 = 0x00010003 r0 = 0x00010005 r3 = 0x00030002 r2 = 0x00020007
+ *     output:  r1 = 0x00010002 r0 = 0x00010005
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #65541
+        r1 = #65539
+    }
+    {
+        r2 = #131079
+        r3 = #196610
+    }
+    {
+        r1:0 = vminh(r1:0, r3:2)
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
index 0000000000..f02758e449
--- /dev/null
+++ b/tests/tcg/hexagon/test_vpmpyh.S
@@ -0,0 +1,28 @@
+/*
+ * Purpose: test example, verify the soundness of the vpmpyh operator.
+ *
+ * 0x01020304 vector polynomial multiplied with 0x04030201 results
+ * 0x000400060b060b04.
+ */
+
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #16909060
+        r1 = #67305985
+    }
+    {
+        r1:0 = vpmpyh(r0, r1)
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
index 0000000000..53c4a91c51
--- /dev/null
+++ b/tests/tcg/hexagon/test_vspliceb.S
@@ -0,0 +1,31 @@
+/*
+ * Purpose: test example, verify the soundness of the vspliceb operation
+ * the operation is a binary splice of two 64bit operators.
+ *
+ *  vspliceb(0xffffffffffffffff,0x0000000000000000,5) = 0x000000ffffffffff.
+ */
+    .text
+    .globl _start
+
+_start:
+    {
+        r0 = #-1
+        r1 = #-1
+    }
+    {
+        r2 = #0
+        r3 = #0
+    }
+    {
+        r5:4 = vspliceb(r1:0, r3:2, #5)
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
2.35.1


