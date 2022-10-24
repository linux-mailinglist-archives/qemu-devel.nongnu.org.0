Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9012760B128
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:16:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzJF-0003ig-JY; Mon, 24 Oct 2022 11:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJC-0003h1-9N
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:24:10 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJ3-0008GY-Vx
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:24:10 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 69DAF320092D;
 Mon, 24 Oct 2022 11:24:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 24 Oct 2022 11:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1666625040; x=1666711440; bh=uk
 kVloUUCbEc+Acs8bLgu4R73ehT7czNXAO7d/GlYBg=; b=VEqgT70GzNXKYp/NGZ
 MjR3gB4M90cMpfk9qdRieU16zwJ7EaHF4dBDpVee1NEy+gO0OaXFcsOCOkSYkbX7
 Pl1FsI21vWFXGLTuQYngNaNznNSzxYD3v53CMi6UbALIaxheu4HX2rKAcrMb/10p
 dmZmR/ixolVM9S5vqgXB8p/OFeDqLww1fRkUX9ZtpJPKrD0t4jIgc4zvTr75c7Td
 gCDZKC3Cqm/zCTuax50I2E8NrpGvV92jsYRziK2tRoMBxzigTnGbtnyB/HxcQ+S7
 SD/R4pcRIXkUDqrG5d7eS6EfJ3mYDqZsKkJHeJ+qyta9XfLoX+0tPsOqzlwTp5NV
 IMwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666625040; x=1666711440; bh=ukkVloUUCbEc+
 Acs8bLgu4R73ehT7czNXAO7d/GlYBg=; b=mRO8RsyFh69s10ueLN4t91O2cvU3/
 KlYspDbPJ9YfWkGNvN6vLBKR8RrTQ/8/RBIQgZARFxqp2v4M4lIZ/OGEM01Std9N
 y6JAyqCq7NRqwnqPgwO0rcfEeexCYT6XalqCSpCP3cqw5xxp+QRG7keOnIDSUncX
 0S+oMLCeUYJFhswuI7uhrFs1gD0PJWjKp7Ydpmd04EvV9w9lA//RB995q1GCOMGU
 yrbBF+JWdsR9Lulg4VZ1pHXEfeis49/5J/MqG9rPoLlmYz08HfBfwHflC67Di9QN
 9xdaN90ox1go51y1610ahyJX+5qdew8IyNtmwo+I61pfxqQhNn1IoIzLQ==
X-ME-Sender: <xms:D65WY5TS7zYZipok6GEAi7rHu_1YPQHXqfOruu7SyQsks1A500xPow>
 <xme:D65WYyy9s5uW3OdJXsVmtzguu6syS0N8cvEDbgk-ZyH0aULH_urJponk5kxAzhaB2
 wrMKycQYcqeF4Y4JnY>
X-ME-Received: <xmr:D65WY-1rbUsPjgEdinvB4jS98radKHVCsc2aD_7V59KdzjqtqZKcEudjhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
 dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:D65WYxBO7bXmuv0own6JvF1BPG3XFcDjqUQy0wwl8x6v7zo3VV0YCQ>
 <xmx:D65WYyhhML03_wRe-wvPz6arOEVj6LBsMuau2yxlTZb2bFefnq2GKQ>
 <xmx:D65WY1rqqcafNZwgCRQ8dx0Hpu_aQCOS4Yus2E0ZaaX794_RNsTmbw>
 <xmx:EK5WY1trJw-SabGNMiyQZN1hahgN52HBvkTXD4KlAWceNtw1YUO5yQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 11:23:58 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, richard.henderson@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/6] tests/tcg/mips: Add mips32 arithmatic instruction test
 cases
Date: Mon, 24 Oct 2022 16:23:46 +0100
Message-Id: <20221024152349.215135-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
References: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Those cases are delivered from MIPS internal architecture validation
tools.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 tests/tcg/mips/include/test_utils_32.h        |  75 +++++++++++
 .../tcg/mips/user/isa/mips32/arithmatic/add.c |  99 ++++++++++++++
 .../mips/user/isa/mips32/arithmatic/addi.c    |  70 ++++++++++
 .../mips/user/isa/mips32/arithmatic/addiu.c   |  90 +++++++++++++
 .../mips/user/isa/mips32/arithmatic/addu.c    | 125 ++++++++++++++++++
 .../tcg/mips/user/isa/mips32/arithmatic/div.c |  81 ++++++++++++
 .../mips/user/isa/mips32/arithmatic/divu.c    |  78 +++++++++++
 .../mips/user/isa/mips32/arithmatic/madd.c    |  79 +++++++++++
 .../mips/user/isa/mips32/arithmatic/maddu.c   |  78 +++++++++++
 .../mips/user/isa/mips32/arithmatic/msub.c    |  78 +++++++++++
 .../mips/user/isa/mips32/arithmatic/msubu.c   |  78 +++++++++++
 .../tcg/mips/user/isa/mips32/arithmatic/mul.c |  78 +++++++++++
 .../mips/user/isa/mips32/arithmatic/mult.c    |  78 +++++++++++
 .../mips/user/isa/mips32/arithmatic/multu.c   |  78 +++++++++++
 .../tcg/mips/user/isa/mips32/arithmatic/slt.c |  61 +++++++++
 .../mips/user/isa/mips32/arithmatic/slti.c    |  48 +++++++
 .../mips/user/isa/mips32/arithmatic/sltiu.c   |  48 +++++++
 .../mips/user/isa/mips32/arithmatic/sltu.c    |  61 +++++++++
 .../tcg/mips/user/isa/mips32/arithmatic/sub.c | 104 +++++++++++++++
 .../mips/user/isa/mips32/arithmatic/subu.c    | 108 +++++++++++++++
 20 files changed, 1595 insertions(+)
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/add.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addi.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addiu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/div.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/divu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/madd.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/maddu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/msub.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/msubu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/mul.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/mult.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/multu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/slt.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/slti.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sltiu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sltu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sub.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/subu.c

diff --git a/tests/tcg/mips/include/test_utils_32.h b/tests/tcg/mips/include/test_utils_32.h
index c33990c0c5..00480e3283 100644
--- a/tests/tcg/mips/include/test_utils_32.h
+++ b/tests/tcg/mips/include/test_utils_32.h
@@ -29,6 +29,81 @@
 
 #define PRINT_RESULTS 0
 
+#define DO_MIPS32_r(mnemonic, id, input1, input2, expect)              \
+{                                                                      \
+    uint32_t output;                                                   \
+    uint32_t expect_val = expect;                                      \
+    __asm__ volatile (                                                 \
+      "li $t1, " #input1 "\n\t"                                        \
+      "li $t2, " #input2 "\n\t"                                        \
+      #mnemonic " $t0, $t1, $t2\n\t"                                   \
+      "sw $t0, 0(%0)\n\t"                                              \
+      :                                                                \
+      : "r" (&output)                                                  \
+      : "t0", "t1", "t2", "memory"                                     \
+    );                                                                 \
+    check_single_insn_32(id, &pass_count, &fail_count, 1, &expect_val, &output); \
+}
+
+#define DO_MIPS32_i(mnemonic, id, imm, input1, expect)                 \
+{                                                                      \
+    uint32_t output;                                                   \
+    uint32_t expect_val = expect;                                      \
+    __asm__ volatile (                                                 \
+      "li $t1, " #input1 "\n\t"                                        \
+      #mnemonic " $t0, $t1, " #imm "\n\t"                              \
+      "sw $t0, 0(%0)\n\t"                                              \
+      :                                                                \
+      : "r" (&output)                                                  \
+      : "t0", "t1", "memory"                                           \
+    );                                                                 \
+    check_single_insn_32(id, &pass_count, &fail_count, 1, &expect_val, &output); \
+}
+
+#define DO_MIPS32_r2_s(mnemonic, id, hi, lo, input1, input2, expect_hi, expect_lo) \
+{                                                                      \
+    uint32_t output[2];                                                \
+    uint32_t expect_val[2] = {expect_lo, expect_hi};                   \
+    __asm__ volatile (                                                 \
+      ".set noreorder \n\t"                                            \
+      "li $t0, " #hi "\n\t"                                            \
+      "mthi $t0       \n\t"                                            \
+      "li $t0, " #lo "\n\t"                                            \
+      "mtlo $t0       \n\t"                                            \
+      "li $t0, " #input1 "\n\t"                                        \
+      "li $t1, " #input2 "\n\t"                                        \
+      #mnemonic " $t0, $t1 \n\t"                                       \
+      "mfhi $t0       \n\t"                                            \
+      "sw $t0, 4(%0)\n\t"                                              \
+      "mflo $t0       \n\t"                                            \
+      "sw $t0, 0(%0)\n\t"                                              \
+      ".set reorder \n\t"                                              \
+      :                                                                \
+      : "r" (&output)                                                  \
+      : "t0", "t1", "hi", "lo", "memory"                              \
+    );                                                                 \
+    check_single_insn_32(id, &pass_count, &fail_count, 2, expect_val, output); \
+}
+
+static inline void check_single_insn_32(int id, int *pass, int *fail, int cnt,
+                                        uint32_t *expect, uint32_t *actual)
+{
+    int i;
+
+    if (memcmp(expect, actual, 4 * cnt) == 0) {
+        (*pass)++;
+        printf("Case %d pass:\n", id);
+        for (i = 0; i < cnt; i++) {
+            printf("    [%d]: actual: 0x%08x, expect: 0x%08x\n", i, actual[i], expect[i]);
+        }
+    } else {
+        (*fail)++;
+        printf("Case %d fail:\n", id);
+        for (i = 0; i < cnt; i++) {
+            printf("    [%d]: actual: 0x%08x, expect: 0x%08x\n", i, actual[i], expect[i]);
+        }
+    }
+}
 
 static inline int32_t check_results_32(const char *instruction_name,
                                        const uint32_t test_count,
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/add.c b/tests/tcg/mips/user/isa/mips32/arithmatic/add.c
new file mode 100644
index 0000000000..2e1d380c90
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/add.c
@@ -0,0 +1,99 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r(add, 0, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r(add, 1, 0x00000001, 0x00000001, 0x00000002);
+    DO_MIPS32_r(add, 2, 0x00000002, 0x00000003, 0x00000005);
+    DO_MIPS32_r(add, 3, 0x00000004, 0x00000007, 0x0000000B);
+    DO_MIPS32_r(add, 4, 0x00000008, 0x0000000F, 0x00000017);
+    DO_MIPS32_r(add, 5, 0x00000010, 0x0000001F, 0x0000002F);
+    DO_MIPS32_r(add, 6, 0x00000020, 0x0000003F, 0x0000005F);
+    DO_MIPS32_r(add, 7, 0x00000040, 0x0000007F, 0x000000BF);
+    DO_MIPS32_r(add, 8, 0x00000080, 0x000000FF, 0x0000017F);
+    DO_MIPS32_r(add, 9, 0x00000100, 0x000001FF, 0x000002FF);
+    DO_MIPS32_r(add, 10, 0x00000200, 0x000003FF, 0x000005FF);
+    DO_MIPS32_r(add, 11, 0x00000400, 0x000007FF, 0x00000BFF);
+    DO_MIPS32_r(add, 12, 0x00000800, 0x00000FFF, 0x000017FF);
+    DO_MIPS32_r(add, 13, 0x00001000, 0x00001FFF, 0x00002FFF);
+    DO_MIPS32_r(add, 14, 0x00002000, 0x00003FFF, 0x00005FFF);
+    DO_MIPS32_r(add, 15, 0x00004000, 0x00007FFF, 0x0000BFFF);
+    DO_MIPS32_r(add, 16, 0x00008000, 0x0000FFFF, 0x00017FFF);
+    DO_MIPS32_r(add, 17, 0x00010000, 0x0001FFFF, 0x0002FFFF);
+    DO_MIPS32_r(add, 18, 0x00020000, 0x0003FFFF, 0x0005FFFF);
+    DO_MIPS32_r(add, 19, 0x00040000, 0x0007FFFF, 0x000BFFFF);
+    DO_MIPS32_r(add, 20, 0x00080000, 0x000FFFFF, 0x0017FFFF);
+    DO_MIPS32_r(add, 21, 0x00100000, 0x001FFFFF, 0x002FFFFF);
+    DO_MIPS32_r(add, 22, 0x00200000, 0x003FFFFF, 0x005FFFFF);
+    DO_MIPS32_r(add, 23, 0x00400000, 0x007FFFFF, 0x00BFFFFF);
+    DO_MIPS32_r(add, 24, 0x00800000, 0x00FFFFFF, 0x017FFFFF);
+    DO_MIPS32_r(add, 25, 0x01000000, 0x01FFFFFF, 0x02FFFFFF);
+    DO_MIPS32_r(add, 26, 0x02000000, 0x03FFFFFF, 0x05FFFFFF);
+    DO_MIPS32_r(add, 27, 0x04000000, 0x07FFFFFF, 0x0BFFFFFF);
+    DO_MIPS32_r(add, 28, 0x08000000, 0x0FFFFFFF, 0x17FFFFFF);
+    DO_MIPS32_r(add, 29, 0x10000000, 0x1FFFFFFF, 0x2FFFFFFF);
+    DO_MIPS32_r(add, 30, 0x20000000, 0x3FFFFFFF, 0x5FFFFFFF);
+    DO_MIPS32_r(add, 31, 0x00000000, 0x00000001, 0x00000001);
+    DO_MIPS32_r(add, 32, 0x80000001, 0xFFFFFFFF, 0x80000000);
+    DO_MIPS32_r(add, 33, 0xC0000003, 0x7FFFFFFD, 0x40000000);
+    DO_MIPS32_r(add, 34, 0xE0000007, 0x3FFFFFF9, 0x20000000);
+    DO_MIPS32_r(add, 35, 0xF000000F, 0x1FFFFFF1, 0x10000000);
+    DO_MIPS32_r(add, 36, 0xF800001F, 0x0FFFFFE1, 0x08000000);
+    DO_MIPS32_r(add, 37, 0xFC00003F, 0x07FFFFC1, 0x04000000);
+    DO_MIPS32_r(add, 38, 0xFE00007F, 0x03FFFF81, 0x02000000);
+    DO_MIPS32_r(add, 39, 0xFF0000FF, 0x01FFFF01, 0x01000000);
+    DO_MIPS32_r(add, 40, 0xFF8001FF, 0x00FFFE01, 0x00800000);
+    DO_MIPS32_r(add, 41, 0xFFC003FF, 0x007FFC01, 0x00400000);
+    DO_MIPS32_r(add, 42, 0xFFE007FF, 0x003FF801, 0x00200000);
+    DO_MIPS32_r(add, 43, 0xFFF00FFF, 0x001FF001, 0x00100000);
+    DO_MIPS32_r(add, 44, 0xFFF81FFF, 0x000FE001, 0x00080000);
+    DO_MIPS32_r(add, 45, 0xFFFC3FFF, 0x0007C001, 0x00040000);
+    DO_MIPS32_r(add, 46, 0xFFFE7FFF, 0x00038001, 0x00020000);
+    DO_MIPS32_r(add, 47, 0xFFFFFFFF, 0x00010001, 0x00010000);
+    DO_MIPS32_r(add, 48, 0xFFFFFFFF, 0x00018001, 0x00018000);
+    DO_MIPS32_r(add, 49, 0xFFFE7FFF, 0x00024001, 0x0000C000);
+    DO_MIPS32_r(add, 50, 0xFFFC3FFF, 0x00042001, 0x00006000);
+    DO_MIPS32_r(add, 51, 0xFFF81FFF, 0x00081001, 0x00003000);
+    DO_MIPS32_r(add, 52, 0xFFF00FFF, 0x00100801, 0x00001800);
+    DO_MIPS32_r(add, 53, 0xFFE007FF, 0x00200401, 0x00000C00);
+    DO_MIPS32_r(add, 54, 0xFFC003FF, 0x00400201, 0x00000600);
+    DO_MIPS32_r(add, 55, 0xFF8001FF, 0x00800101, 0x00000300);
+    DO_MIPS32_r(add, 56, 0xFF0000FF, 0x01000081, 0x00000180);
+    DO_MIPS32_r(add, 57, 0xFE00007F, 0x02000041, 0x000000C0);
+    DO_MIPS32_r(add, 58, 0xFC00003F, 0x04000021, 0x00000060);
+    DO_MIPS32_r(add, 59, 0xF800001F, 0x08000011, 0x00000030);
+    DO_MIPS32_r(add, 60, 0xF000000F, 0x10000009, 0x00000018);
+    DO_MIPS32_r(add, 61, 0xE0000007, 0x20000005, 0x0000000C);
+    DO_MIPS32_r(add, 62, 0xC0000003, 0x40000003, 0x00000006);
+    DO_MIPS32_r(add, 63, 0x00000000, 0x55555555, 0x55555555);
+    DO_MIPS32_r(add, 64, 0x15555555, 0x55555555, 0x6AAAAAAA);
+    DO_MIPS32_r(add, 65, 0xAAAAAAAA, 0x55555555, 0xFFFFFFFF);
+    DO_MIPS32_r(add, 66, 0xFFFFFFFF, 0x55555555, 0x55555554);
+    DO_MIPS32_r(add, 67, 0xAAAAAAAA, 0x00000000, 0xAAAAAAAA);
+    DO_MIPS32_r(add, 68, 0xAAAAAAAA, 0x55555555, 0xFFFFFFFF);
+    DO_MIPS32_r(add, 69, 0xAAAAAAAA, 0x2AAAAAAA, 0xD5555554);
+    DO_MIPS32_r(add, 70, 0xAAAAAAAA, 0xFFFFFFFF, 0xAAAAAAA9);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/addi.c b/tests/tcg/mips/user/isa/mips32/arithmatic/addi.c
new file mode 100644
index 0000000000..c032e4d9e5
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/addi.c
@@ -0,0 +1,70 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_i(addi, 0, 0x0000, 0x00000000, 0x00000000);
+    DO_MIPS32_i(addi, 1, 0x0001, 0x00000001, 0x00000002);
+    DO_MIPS32_i(addi, 2, 0x0003, 0x00000002, 0x00000005);
+    DO_MIPS32_i(addi, 3, 0x0007, 0x00000004, 0x0000000B);
+    DO_MIPS32_i(addi, 4, 0x000F, 0x00000008, 0x00000017);
+    DO_MIPS32_i(addi, 5, 0x001F, 0x00000010, 0x0000002F);
+    DO_MIPS32_i(addi, 6, 0x003F, 0x00000020, 0x0000005F);
+    DO_MIPS32_i(addi, 7, 0x007F, 0x00000040, 0x000000BF);
+    DO_MIPS32_i(addi, 8, 0x00FF, 0x00000080, 0x0000017F);
+    DO_MIPS32_i(addi, 9, 0x01FF, 0x00000100, 0x000002FF);
+    DO_MIPS32_i(addi, 10, 0x03FF, 0x00000200, 0x000005FF);
+    DO_MIPS32_i(addi, 11, 0x07FF, 0x00000400, 0x00000BFF);
+    DO_MIPS32_i(addi, 12, 0x0FFF, 0x00000800, 0x000017FF);
+    DO_MIPS32_i(addi, 13, 0x1FFF, 0x00001000, 0x00002FFF);
+    DO_MIPS32_i(addi, 14, 0x3FFF, 0x00002000, 0x00005FFF);
+    DO_MIPS32_i(addi, 15, 0x7FFF, 0x00004000, 0x0000BFFF);
+    DO_MIPS32_i(addi, 16, 0xFFFF, 0x00008000, 0x00007FFF);
+    DO_MIPS32_i(addi, 17, 0x0001, 0x00000000, 0x00000001);
+    DO_MIPS32_i(addi, 18, 0xFFFF, 0x80000001, 0x80000000);
+    DO_MIPS32_i(addi, 19, 0xFFFD, 0xC0000003, 0xC0000000);
+    DO_MIPS32_i(addi, 20, 0xFFF9, 0xE0000007, 0xE0000000);
+    DO_MIPS32_i(addi, 21, 0xFFF1, 0xF000000F, 0xF0000000);
+    DO_MIPS32_i(addi, 22, 0xFFE1, 0xF800001F, 0xF8000000);
+    DO_MIPS32_i(addi, 23, 0xFFC1, 0xFC00003F, 0xFC000000);
+    DO_MIPS32_i(addi, 24, 0xFF81, 0xFE00007F, 0xFE000000);
+    DO_MIPS32_i(addi, 25, 0xFF01, 0xFF0000FF, 0xFF000000);
+    DO_MIPS32_i(addi, 26, 0xFE01, 0xFF8001FF, 0xFF800000);
+    DO_MIPS32_i(addi, 27, 0xFC01, 0xFFC003FF, 0xFFC00000);
+    DO_MIPS32_i(addi, 28, 0xF801, 0xFFE007FF, 0xFFE00000);
+    DO_MIPS32_i(addi, 29, 0xF001, 0xFFF00FFF, 0xFFF00000);
+    DO_MIPS32_i(addi, 30, 0xE001, 0xFFF81FFF, 0xFFF80000);
+    DO_MIPS32_i(addi, 31, 0xC001, 0xFFFC3FFF, 0xFFFC0000);
+    DO_MIPS32_i(addi, 32, 0x8001, 0xFFFE7FFF, 0xFFFE0000);
+    DO_MIPS32_i(addi, 33, 0x0001, 0xFFFFFFFF, 0x00000000);
+    DO_MIPS32_i(addi, 34, 0x5555, 0x00000000, 0x00005555);
+    DO_MIPS32_i(addi, 35, 0x5555, 0x55555555, 0x5555AAAA);
+    DO_MIPS32_i(addi, 36, 0x5555, 0xAAAAAAAA, 0xAAAAFFFF);
+    DO_MIPS32_i(addi, 37, 0x5555, 0xFFFFFFFF, 0x00005554);
+    DO_MIPS32_i(addi, 38, 0x0000, 0xAAAAAAAA, 0xAAAAAAAA);
+    DO_MIPS32_i(addi, 39, 0x5555, 0xAAAAAAAA, 0xAAAAFFFF);
+    DO_MIPS32_i(addi, 40, 0xAAAA, 0xAAAAAAAA, 0xAAAA5554);
+    DO_MIPS32_i(addi, 41, 0xFFFF, 0xAAAAAAAA, 0xAAAAAAA9);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/addiu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/addiu.c
new file mode 100644
index 0000000000..cdc2ebc932
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/addiu.c
@@ -0,0 +1,90 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_i(addiu, 0, 0x0000, 0x00000000, 0x00000000);
+    DO_MIPS32_i(addiu, 1, 0x0001, 0x00000001, 0x00000002);
+    DO_MIPS32_i(addiu, 2, 0x0003, 0x00000002, 0x00000005);
+    DO_MIPS32_i(addiu, 3, 0x0007, 0x00000004, 0x0000000B);
+    DO_MIPS32_i(addiu, 4, 0x000F, 0x00000008, 0x00000017);
+    DO_MIPS32_i(addiu, 5, 0x001F, 0x00000010, 0x0000002F);
+    DO_MIPS32_i(addiu, 6, 0x003F, 0x00000020, 0x0000005F);
+    DO_MIPS32_i(addiu, 7, 0x007F, 0x00000040, 0x000000BF);
+    DO_MIPS32_i(addiu, 8, 0x00FF, 0x00000080, 0x0000017F);
+    DO_MIPS32_i(addiu, 9, 0x01FF, 0x00000100, 0x000002FF);
+    DO_MIPS32_i(addiu, 10, 0x03FF, 0x00000200, 0x000005FF);
+    DO_MIPS32_i(addiu, 11, 0x07FF, 0x00000400, 0x00000BFF);
+    DO_MIPS32_i(addiu, 12, 0x0FFF, 0x00000800, 0x000017FF);
+    DO_MIPS32_i(addiu, 13, 0x1FFF, 0x00001000, 0x00002FFF);
+    DO_MIPS32_i(addiu, 14, 0x3FFF, 0x00002000, 0x00005FFF);
+    DO_MIPS32_i(addiu, 15, 0x7FFF, 0x00004000, 0x0000BFFF);
+    DO_MIPS32_i(addiu, 16, -1, 0x00008000, 0x00007FFF);
+    DO_MIPS32_i(addiu, 17, 0x0001, 0x00000000, 0x00000001);
+    DO_MIPS32_i(addiu, 18, -1, 0x80000001, 0x80000000);
+    DO_MIPS32_i(addiu, 19, -3, 0xC0000003, 0xC0000000);
+    DO_MIPS32_i(addiu, 20, -7, 0xE0000007, 0xE0000000);
+    DO_MIPS32_i(addiu, 21, -15, 0xF000000F, 0xF0000000);
+    DO_MIPS32_i(addiu, 22, -31, 0xF800001F, 0xF8000000);
+    DO_MIPS32_i(addiu, 23, -63, 0xFC00003F, 0xFC000000);
+    DO_MIPS32_i(addiu, 24, -127, 0xFE00007F, 0xFE000000);
+    DO_MIPS32_i(addiu, 25, -255, 0xFF0000FF, 0xFF000000);
+    DO_MIPS32_i(addiu, 26, -511, 0xFF8001FF, 0xFF800000);
+    DO_MIPS32_i(addiu, 27, -1023, 0xFFC003FF, 0xFFC00000);
+    DO_MIPS32_i(addiu, 28, -2047, 0xFFE007FF, 0xFFE00000);
+    DO_MIPS32_i(addiu, 29, -4095, 0xFFF00FFF, 0xFFF00000);
+    DO_MIPS32_i(addiu, 30, -8191, 0xFFF81FFF, 0xFFF80000);
+    DO_MIPS32_i(addiu, 31, 0xC001, 0xFFFC3FFF, 0xFFFC0000);
+    DO_MIPS32_i(addiu, 32, 0x8001, 0xFFFE7FFF, 0xFFFE0000);
+    DO_MIPS32_i(addiu, 33, 0x0001, 0xFFFFFFFF, 0x00000000);
+    DO_MIPS32_i(addiu, 34, 0x5555, 0x00000000, 0x00005555);
+    DO_MIPS32_i(addiu, 35, 0x5555, 0x55555555, 0x5555AAAA);
+    DO_MIPS32_i(addiu, 36, 0x5555, 0xAAAAAAAA, 0xAAAAFFFF);
+    DO_MIPS32_i(addiu, 37, 0x5555, 0xFFFFFFFF, 0x00005554);
+    DO_MIPS32_i(addiu, 38, 0x0000, 0xAAAAAAAA, 0xAAAAAAAA);
+    DO_MIPS32_i(addiu, 39, 0x5555, 0xAAAAAAAA, 0xAAAAFFFF);
+    DO_MIPS32_i(addiu, 40, 0xAAAA, 0xAAAAAAAA, 0xAAAA5554);
+    DO_MIPS32_i(addiu, 41, -1, 0xAAAAAAAA, 0xAAAAAAA9);
+    DO_MIPS32_i(addiu, 42, 0x0001, 0x7FFFFFFF, 0x80000000);
+    DO_MIPS32_i(addiu, 43, 0x7FFF, 0x7FFFFFFF, 0x80007FFE);
+    DO_MIPS32_i(addiu, 44, -1, 0x80000000, 0x7FFFFFFF);
+    DO_MIPS32_i(addiu, 45, 0x8000, 0x80000000, 0x7FFF8000);
+    DO_MIPS32_i(addiu, 46, 0x555F, 0x7FFFAAAA, 0x80000009);
+    DO_MIPS32_i(addiu, 47, 0xAAAA, 0x7FFF5555, 0x7FFEFFFF);
+    DO_MIPS32_i(addiu, 48, 0x0002, 0x7FFFFFFF, 0x80000001);
+    DO_MIPS32_i(addiu, 49, 0x0004, 0x7FFFFFFF, 0x80000003);
+    DO_MIPS32_i(addiu, 50, 0x0008, 0x7FFFFFFF, 0x80000007);
+    DO_MIPS32_i(addiu, 51, 0x0010, 0x7FFFFFFF, 0x8000000F);
+    DO_MIPS32_i(addiu, 52, 0x0020, 0x7FFFFFFF, 0x8000001F);
+    DO_MIPS32_i(addiu, 53, 0x0040, 0x7FFFFFFF, 0x8000003F);
+    DO_MIPS32_i(addiu, 54, 0x0080, 0x7FFFFFFF, 0x8000007F);
+    DO_MIPS32_i(addiu, 55, 0x0100, 0x7FFFFFFF, 0x800000FF);
+    DO_MIPS32_i(addiu, 56, 0x0200, 0x7FFFFFFF, 0x800001FF);
+    DO_MIPS32_i(addiu, 57, 0x0400, 0x7FFFFFFF, 0x800003FF);
+    DO_MIPS32_i(addiu, 58, 0x0800, 0x7FFFFFFF, 0x800007FF);
+    DO_MIPS32_i(addiu, 59, 0x1000, 0x7FFFFFFF, 0x80000FFF);
+    DO_MIPS32_i(addiu, 60, 0x2000, 0x7FFFFFFF, 0x80001FFF);
+    DO_MIPS32_i(addiu, 61, 0x4000, 0x7FFFFFFF, 0x80003FFF);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/addu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/addu.c
new file mode 100644
index 0000000000..062999edd6
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/addu.c
@@ -0,0 +1,125 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r(addu, 0, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r(addu, 1, 0x00000001, 0x00000001, 0x00000002);
+    DO_MIPS32_r(addu, 2, 0x00000002, 0x00000003, 0x00000005);
+    DO_MIPS32_r(addu, 3, 0x00000004, 0x00000007, 0x0000000B);
+    DO_MIPS32_r(addu, 4, 0x00000008, 0x0000000F, 0x00000017);
+    DO_MIPS32_r(addu, 5, 0x00000010, 0x0000001F, 0x0000002F);
+    DO_MIPS32_r(addu, 6, 0x00000020, 0x0000003F, 0x0000005F);
+    DO_MIPS32_r(addu, 7, 0x00000040, 0x0000007F, 0x000000BF);
+    DO_MIPS32_r(addu, 8, 0x00000080, 0x000000FF, 0x0000017F);
+    DO_MIPS32_r(addu, 9, 0x00000100, 0x000001FF, 0x000002FF);
+    DO_MIPS32_r(addu, 10, 0x00000200, 0x000003FF, 0x000005FF);
+    DO_MIPS32_r(addu, 11, 0x00000400, 0x000007FF, 0x00000BFF);
+    DO_MIPS32_r(addu, 12, 0x00000800, 0x00000FFF, 0x000017FF);
+    DO_MIPS32_r(addu, 13, 0x00001000, 0x00001FFF, 0x00002FFF);
+    DO_MIPS32_r(addu, 14, 0x00002000, 0x00003FFF, 0x00005FFF);
+    DO_MIPS32_r(addu, 15, 0x00004000, 0x00007FFF, 0x0000BFFF);
+    DO_MIPS32_r(addu, 16, 0x00008000, 0x0000FFFF, 0x00017FFF);
+    DO_MIPS32_r(addu, 17, 0x00010000, 0x0001FFFF, 0x0002FFFF);
+    DO_MIPS32_r(addu, 18, 0x00020000, 0x0003FFFF, 0x0005FFFF);
+    DO_MIPS32_r(addu, 19, 0x00040000, 0x0007FFFF, 0x000BFFFF);
+    DO_MIPS32_r(addu, 20, 0x00080000, 0x000FFFFF, 0x0017FFFF);
+    DO_MIPS32_r(addu, 21, 0x00100000, 0x001FFFFF, 0x002FFFFF);
+    DO_MIPS32_r(addu, 22, 0x00200000, 0x003FFFFF, 0x005FFFFF);
+    DO_MIPS32_r(addu, 23, 0x00400000, 0x007FFFFF, 0x00BFFFFF);
+    DO_MIPS32_r(addu, 24, 0x00800000, 0x00FFFFFF, 0x017FFFFF);
+    DO_MIPS32_r(addu, 25, 0x01000000, 0x01FFFFFF, 0x02FFFFFF);
+    DO_MIPS32_r(addu, 26, 0x02000000, 0x03FFFFFF, 0x05FFFFFF);
+    DO_MIPS32_r(addu, 27, 0x04000000, 0x07FFFFFF, 0x0BFFFFFF);
+    DO_MIPS32_r(addu, 28, 0x08000000, 0x0FFFFFFF, 0x17FFFFFF);
+    DO_MIPS32_r(addu, 29, 0x10000000, 0x1FFFFFFF, 0x2FFFFFFF);
+    DO_MIPS32_r(addu, 30, 0x20000000, 0x3FFFFFFF, 0x5FFFFFFF);
+    DO_MIPS32_r(addu, 31, 0x40000000, 0x7FFFFFFF, 0xBFFFFFFF);
+    DO_MIPS32_r(addu, 32, 0x80000000, 0xFFFFFFFF, 0x7FFFFFFF);
+    DO_MIPS32_r(addu, 33, 0x00000000, 0x00000001, 0x00000001);
+    DO_MIPS32_r(addu, 34, 0x80000001, 0xFFFFFFFF, 0x80000000);
+    DO_MIPS32_r(addu, 35, 0xC0000003, 0x7FFFFFFD, 0x40000000);
+    DO_MIPS32_r(addu, 36, 0xE0000007, 0x3FFFFFF9, 0x20000000);
+    DO_MIPS32_r(addu, 37, 0xF000000F, 0x1FFFFFF1, 0x10000000);
+    DO_MIPS32_r(addu, 38, 0xF800001F, 0x0FFFFFE1, 0x08000000);
+    DO_MIPS32_r(addu, 39, 0xFC00003F, 0x07FFFFC1, 0x04000000);
+    DO_MIPS32_r(addu, 40, 0xFE00007F, 0x03FFFF81, 0x02000000);
+    DO_MIPS32_r(addu, 41, 0xFF0000FF, 0x01FFFF01, 0x01000000);
+    DO_MIPS32_r(addu, 42, 0xFF8001FF, 0x00FFFE01, 0x00800000);
+    DO_MIPS32_r(addu, 43, 0xFFC003FF, 0x007FFC01, 0x00400000);
+    DO_MIPS32_r(addu, 44, 0xFFE007FF, 0x003FF801, 0x00200000);
+    DO_MIPS32_r(addu, 45, 0xFFF00FFF, 0x001FF001, 0x00100000);
+    DO_MIPS32_r(addu, 46, 0xFFF81FFF, 0x000FE001, 0x00080000);
+    DO_MIPS32_r(addu, 47, 0xFFFC3FFF, 0x0007C001, 0x00040000);
+    DO_MIPS32_r(addu, 48, 0xFFFE7FFF, 0x00038001, 0x00020000);
+    DO_MIPS32_r(addu, 49, 0xFFFFFFFF, 0x00010001, 0x00010000);
+    DO_MIPS32_r(addu, 50, 0xFFFFFFFF, 0x00018001, 0x00018000);
+    DO_MIPS32_r(addu, 51, 0xFFFE7FFF, 0x00024001, 0x0000C000);
+    DO_MIPS32_r(addu, 52, 0xFFFC3FFF, 0x00042001, 0x00006000);
+    DO_MIPS32_r(addu, 53, 0xFFF81FFF, 0x00081001, 0x00003000);
+    DO_MIPS32_r(addu, 54, 0xFFF00FFF, 0x00100801, 0x00001800);
+    DO_MIPS32_r(addu, 55, 0xFFE007FF, 0x00200401, 0x00000C00);
+    DO_MIPS32_r(addu, 56, 0xFFC003FF, 0x00400201, 0x00000600);
+    DO_MIPS32_r(addu, 57, 0xFF8001FF, 0x00800101, 0x00000300);
+    DO_MIPS32_r(addu, 58, 0xFF0000FF, 0x01000081, 0x00000180);
+    DO_MIPS32_r(addu, 59, 0xFE00007F, 0x02000041, 0x000000C0);
+    DO_MIPS32_r(addu, 60, 0xFC00003F, 0x04000021, 0x00000060);
+    DO_MIPS32_r(addu, 61, 0xF800001F, 0x08000011, 0x00000030);
+    DO_MIPS32_r(addu, 62, 0xF000000F, 0x10000009, 0x00000018);
+    DO_MIPS32_r(addu, 63, 0xE0000007, 0x20000005, 0x0000000C);
+    DO_MIPS32_r(addu, 64, 0xC0000003, 0x40000003, 0x00000006);
+    DO_MIPS32_r(addu, 65, 0x80000001, 0x80000001, 0x00000002);
+    DO_MIPS32_r(addu, 66, 0x00000000, 0x55555555, 0x55555555);
+    DO_MIPS32_r(addu, 67, 0x15555555, 0x55555555, 0x6AAAAAAA);
+    DO_MIPS32_r(addu, 68, 0xAAAAAAAA, 0x55555555, 0xFFFFFFFF);
+    DO_MIPS32_r(addu, 69, 0xFFFFFFFF, 0x55555555, 0x55555554);
+    DO_MIPS32_r(addu, 70, 0xAAAAAAAA, 0x00000000, 0xAAAAAAAA);
+    DO_MIPS32_r(addu, 71, 0xAAAAAAAA, 0x55555555, 0xFFFFFFFF);
+    DO_MIPS32_r(addu, 72, 0xAAAAAAAA, 0x2AAAAAAA, 0xD5555554);
+    DO_MIPS32_r(addu, 73, 0xAAAAAAAA, 0xFFFFFFFF, 0xAAAAAAA9);
+    DO_MIPS32_r(addu, 74, 0x7FFFFFFF, 0x00000001, 0x80000000);
+    DO_MIPS32_r(addu, 75, 0x7FFFFFFF, 0x7FFFFFFF, 0xFFFFFFFE);
+    DO_MIPS32_r(addu, 76, 0x80000000, 0xFFFFFFFF, 0x7FFFFFFF);
+    DO_MIPS32_r(addu, 77, 0x80000000, 0x80000000, 0x00000000);
+    DO_MIPS32_r(addu, 78, 0x7FFFFFFF, 0x00000001, 0x80000000);
+    DO_MIPS32_r(addu, 79, 0x7FFFFFFF, 0x00007FFF, 0x80007FFE);
+    DO_MIPS32_r(addu, 80, 0x80000000, 0x0000FFFF, 0x8000FFFF);
+    DO_MIPS32_r(addu, 81, 0x80000000, 0x00008000, 0x80008000);
+    DO_MIPS32_r(addu, 82, 0x7FFFAAAA, 0x0000555F, 0x80000009);
+    DO_MIPS32_r(addu, 83, 0x7FFF5555, 0x0000AAAA, 0x7FFFFFFF);
+    DO_MIPS32_r(addu, 84, 0x7FFFFFFF, 0x00000002, 0x80000001);
+    DO_MIPS32_r(addu, 85, 0x7FFFFFFF, 0x00000004, 0x80000003);
+    DO_MIPS32_r(addu, 86, 0x7FFFFFFF, 0x00000008, 0x80000007);
+    DO_MIPS32_r(addu, 87, 0x7FFFFFFF, 0x00000010, 0x8000000F);
+    DO_MIPS32_r(addu, 88, 0x7FFFFFFF, 0x00000020, 0x8000001F);
+    DO_MIPS32_r(addu, 89, 0x7FFFFFFF, 0x00000040, 0x8000003F);
+    DO_MIPS32_r(addu, 90, 0x7FFFFFFF, 0x00000080, 0x8000007F);
+    DO_MIPS32_r(addu, 91, 0x7FFFFFFF, 0x00000100, 0x800000FF);
+    DO_MIPS32_r(addu, 92, 0x7FFFFFFF, 0x00000200, 0x800001FF);
+    DO_MIPS32_r(addu, 93, 0x7FFFFFFF, 0x00000400, 0x800003FF);
+    DO_MIPS32_r(addu, 94, 0x7FFFFFFF, 0x00000800, 0x800007FF);
+    DO_MIPS32_r(addu, 95, 0x7FFFFFFF, 0x00001000, 0x80000FFF);
+    DO_MIPS32_r(addu, 96, 0x7FFFFFFF, 0x00002000, 0x80001FFF);
+    DO_MIPS32_r(addu, 97, 0x7FFFFFFF, 0x00004000, 0x80003FFF);
+    DO_MIPS32_r(addu, 98, 0x7FFFFFFF, 0x00001000, 0x80003FFF);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/div.c b/tests/tcg/mips/user/isa/mips32/arithmatic/div.c
new file mode 100644
index 0000000000..5eafca326e
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/div.c
@@ -0,0 +1,81 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r2_s(div, 0, 0, 0, 0x00000000, 0xFFFFFFFF, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(div, 1, 0, 0, 0x80000001, 0x00000001, 0x00000000, 0x80000001);
+    DO_MIPS32_r2_s(div, 2, 0, 0, 0x40000002, 0x00000003, 0x00000000, 0x15555556);
+    DO_MIPS32_r2_s(div, 3, 0, 0, 0x20000004, 0x00000007, 0x00000001, 0x04924925);
+    DO_MIPS32_r2_s(div, 4, 0, 0, 0x10000008, 0x0000000F, 0x00000009, 0x01111111);
+    DO_MIPS32_r2_s(div, 5, 0, 0, 0x88000010, 0x0000001F, 0xFFFFFFF3, 0xFC210843);
+    DO_MIPS32_r2_s(div, 6, 0, 0, 0x44000020, 0x0000003F, 0x00000025, 0x01145145);
+    DO_MIPS32_r2_s(div, 7, 0, 0, 0x22000040, 0x0000007F, 0x00000052, 0x00448912);
+    DO_MIPS32_r2_s(div, 8, 0, 0, 0x11000080, 0x000000FF, 0x00000091, 0x00111111);
+    DO_MIPS32_r2_s(div, 9, 0, 0, 0x80800100, 0x000001FF, 0xFFFFFF11, 0xFFC02011);
+    DO_MIPS32_r2_s(div, 10, 0, 0, 0x40400200, 0x000003FF, 0x00000205, 0x00101405);
+    DO_MIPS32_r2_s(div, 11, 0, 0, 0x20200400, 0x000007FF, 0x00000081, 0x00040481);
+    DO_MIPS32_r2_s(div, 12, 0, 0, 0x10100800, 0x00000FFF, 0x00000910, 0x00010110);
+    DO_MIPS32_r2_s(div, 13, 0, 0, 0x80081000, 0x00001FFF, 0xFFFFF021, 0xFFFC0021);
+    DO_MIPS32_r2_s(div, 14, 0, 0, 0x40042000, 0x00003FFF, 0x00002014, 0x00010014);
+    DO_MIPS32_r2_s(div, 15, 0, 0, 0x20024000, 0x00007FFF, 0x00000005, 0x00004005);
+    DO_MIPS32_r2_s(div, 16, 0, 0, 0x10018000, 0x0000FFFF, 0x00009001, 0x00001001);
+    DO_MIPS32_r2_s(div, 17, 0, 0, 0x80018000, 0x0001FFFF, 0xFFFF4001, 0xFFFFC001);
+    DO_MIPS32_r2_s(div, 18, 0, 0, 0x40024000, 0x0003FFFF, 0x00025000, 0x00001000);
+    DO_MIPS32_r2_s(div, 19, 0, 0, 0x20042000, 0x0007FFFF, 0x00042400, 0x00000400);
+    DO_MIPS32_r2_s(div, 20, 0, 0, 0x10081000, 0x000FFFFF, 0x00081100, 0x00000100);
+    DO_MIPS32_r2_s(div, 21, 0, 0, 0x80100800, 0x001FFFFF, 0xFFF00401, 0xFFFFFC01);
+    DO_MIPS32_r2_s(div, 22, 0, 0, 0x40200400, 0x003FFFFF, 0x00200500, 0x00000100);
+    DO_MIPS32_r2_s(div, 23, 0, 0, 0x20400200, 0x007FFFFF, 0x00400240, 0x00000040);
+    DO_MIPS32_r2_s(div, 24, 0, 0, 0x10800100, 0x00FFFFFF, 0x00800110, 0x00000010);
+    DO_MIPS32_r2_s(div, 25, 0, 0, 0x81000080, 0x01FFFFFF, 0xFF000041, 0xFFFFFFC1);
+    DO_MIPS32_r2_s(div, 26, 0, 0, 0x42000040, 0x03FFFFFF, 0x02000050, 0x00000010);
+    DO_MIPS32_r2_s(div, 27, 0, 0, 0x24000020, 0x07FFFFFF, 0x04000024, 0x00000004);
+    DO_MIPS32_r2_s(div, 28, 0, 0, 0x18000010, 0x0FFFFFFF, 0x08000011, 0x00000001);
+    DO_MIPS32_r2_s(div, 29, 0, 0, 0x90000008, 0x1FFFFFFF, 0xF0000005, 0xFFFFFFFD);
+    DO_MIPS32_r2_s(div, 30, 0, 0, 0x60000004, 0x3FFFFFFF, 0x20000005, 0x00000001);
+    DO_MIPS32_r2_s(div, 31, 0, 0, 0x60000002, 0x7FFFFFFF, 0x60000002, 0x00000000);
+    DO_MIPS32_r2_s(div, 32, 0, 0, 0x90000001, 0xFFFFFFFF, 0x00000000, 0x6FFFFFFF);
+    DO_MIPS32_r2_s(div, 33, 0, 0, 0x00000000, 0x55555555, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(div, 34, 0, 0, 0x55555555, 0x55555555, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(div, 35, 0, 0, 0xAAAAAAAA, 0x55555555, 0xFFFFFFFF, 0xFFFFFFFF);
+    DO_MIPS32_r2_s(div, 36, 0, 0, 0xFFFFFFFF, 0x55555555, 0xFFFFFFFF, 0x00000000);
+    DO_MIPS32_r2_s(div, 37, 0, 0, 0xAAAAAAAA, 0x00000001, 0x00000000, 0xAAAAAAAA);
+    DO_MIPS32_r2_s(div, 38, 0, 0, 0xAAAAAAAA, 0x55555555, 0xFFFFFFFF, 0xFFFFFFFF);
+    DO_MIPS32_r2_s(div, 39, 0, 0, 0xAAAAAAAA, 0xAAAAAAAA, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(div, 40, 0, 0, 0xAAAAAAAA, 0xFFFFFFFF, 0x00000000, 0x55555556);
+    DO_MIPS32_r2_s(div, 41, 0, 0, 0x7FFFFFFF, 0x7FFFFFFF, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(div, 42, 0, 0, 0x7FFFFFFF, 0x80000000, 0x7FFFFFFF, 0x00000000);
+    DO_MIPS32_r2_s(div, 43, 0, 0, 0x7FFFFFFF, 0xFFFFFFFF, 0x00000000, 0x80000001);
+    DO_MIPS32_r2_s(div, 44, 0, 0, 0x80000000, 0x7FFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
+    DO_MIPS32_r2_s(div, 45, 0, 0, 0x80000000, 0x80000000, 0x00000000, 0x00000001);
+#if 0
+    /* Disabled until we find a way to disable assembler trap */
+    DO_MIPS32_r2_s(div, 46, 0, 0, 0x80000000, 0xFFFFFFFF, 0x00000000, 0x80000000);
+#endif
+    DO_MIPS32_r2_s(div, 47, 0, 0, 0xFFFFFFFF, 0x7FFFFFFF, 0xFFFFFFFF, 0x00000000);
+    DO_MIPS32_r2_s(div, 48, 0, 0, 0xFFFFFFFF, 0x80000000, 0xFFFFFFFF, 0x00000000);
+    DO_MIPS32_r2_s(div, 49, 0, 0, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000000, 0x00000001);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/divu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/divu.c
new file mode 100644
index 0000000000..172e8af693
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/divu.c
@@ -0,0 +1,78 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r2_s(divu, 0, 0, 0, 0x00000000, 0xFFFFFFFF, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(divu, 1, 0, 0, 0x80000001, 0x00000001, 0x00000000, 0x80000001);
+    DO_MIPS32_r2_s(divu, 2, 0, 0, 0x40000002, 0x00000003, 0x00000000, 0x15555556);
+    DO_MIPS32_r2_s(divu, 3, 0, 0, 0x20000004, 0x00000007, 0x00000001, 0x04924925);
+    DO_MIPS32_r2_s(divu, 4, 0, 0, 0x10000008, 0x0000000F, 0x00000009, 0x01111111);
+    DO_MIPS32_r2_s(divu, 5, 0, 0, 0x88000010, 0x0000001F, 0x00000016, 0x046318C6);
+    DO_MIPS32_r2_s(divu, 6, 0, 0, 0x44000020, 0x0000003F, 0x00000025, 0x01145145);
+    DO_MIPS32_r2_s(divu, 7, 0, 0, 0x22000040, 0x0000007F, 0x00000052, 0x00448912);
+    DO_MIPS32_r2_s(divu, 8, 0, 0, 0x11000080, 0x000000FF, 0x00000091, 0x00111111);
+    DO_MIPS32_r2_s(divu, 9, 0, 0, 0x80800100, 0x000001FF, 0x00000130, 0x00406030);
+    DO_MIPS32_r2_s(divu, 10, 0, 0, 0x40400200, 0x000003FF, 0x00000205, 0x00101405);
+    DO_MIPS32_r2_s(divu, 11, 0, 0, 0x20200400, 0x000007FF, 0x00000081, 0x00040481);
+    DO_MIPS32_r2_s(divu, 12, 0, 0, 0x10100800, 0x00000FFF, 0x00000910, 0x00010110);
+    DO_MIPS32_r2_s(divu, 13, 0, 0, 0x80081000, 0x00001FFF, 0x00001060, 0x00040060);
+    DO_MIPS32_r2_s(divu, 14, 0, 0, 0x40042000, 0x00003FFF, 0x00002014, 0x00010014);
+    DO_MIPS32_r2_s(divu, 15, 0, 0, 0x20024000, 0x00007FFF, 0x00000005, 0x00004005);
+    DO_MIPS32_r2_s(divu, 16, 0, 0, 0x10018000, 0x0000FFFF, 0x00009001, 0x00001001);
+    DO_MIPS32_r2_s(divu, 17, 0, 0, 0x80018000, 0x0001FFFF, 0x0001C000, 0x00004000);
+    DO_MIPS32_r2_s(divu, 18, 0, 0, 0x40024000, 0x0003FFFF, 0x00025000, 0x00001000);
+    DO_MIPS32_r2_s(divu, 19, 0, 0, 0x20042000, 0x0007FFFF, 0x00042400, 0x00000400);
+    DO_MIPS32_r2_s(divu, 20, 0, 0, 0x10081000, 0x000FFFFF, 0x00081100, 0x00000100);
+    DO_MIPS32_r2_s(divu, 21, 0, 0, 0x80100800, 0x001FFFFF, 0x00100C00, 0x00000400);
+    DO_MIPS32_r2_s(divu, 22, 0, 0, 0x40200400, 0x003FFFFF, 0x00200500, 0x00000100);
+    DO_MIPS32_r2_s(divu, 23, 0, 0, 0x20400200, 0x007FFFFF, 0x00400240, 0x00000040);
+    DO_MIPS32_r2_s(divu, 24, 0, 0, 0x10800100, 0x00FFFFFF, 0x00800110, 0x00000010);
+    DO_MIPS32_r2_s(divu, 25, 0, 0, 0x81000080, 0x01FFFFFF, 0x010000C0, 0x00000040);
+    DO_MIPS32_r2_s(divu, 26, 0, 0, 0x42000040, 0x03FFFFFF, 0x02000050, 0x00000010);
+    DO_MIPS32_r2_s(divu, 27, 0, 0, 0x24000020, 0x07FFFFFF, 0x04000024, 0x00000004);
+    DO_MIPS32_r2_s(divu, 28, 0, 0, 0x18000010, 0x0FFFFFFF, 0x08000011, 0x00000001);
+    DO_MIPS32_r2_s(divu, 29, 0, 0, 0x90000008, 0x1FFFFFFF, 0x1000000C, 0x00000004);
+    DO_MIPS32_r2_s(divu, 30, 0, 0, 0x60000004, 0x3FFFFFFF, 0x20000005, 0x00000001);
+    DO_MIPS32_r2_s(divu, 31, 0, 0, 0x60000002, 0x7FFFFFFF, 0x60000002, 0x00000000);
+    DO_MIPS32_r2_s(divu, 32, 0, 0, 0x90000001, 0xFFFFFFFF, 0x90000001, 0x00000000);
+    DO_MIPS32_r2_s(divu, 33, 0, 0, 0x00000000, 0x55555555, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(divu, 34, 0, 0, 0x55555555, 0x55555555, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(divu, 35, 0, 0, 0xAAAAAAAA, 0x55555555, 0x00000000, 0x00000002);
+    DO_MIPS32_r2_s(divu, 36, 0, 0, 0xFFFFFFFF, 0x55555555, 0x00000000, 0x00000003);
+    DO_MIPS32_r2_s(divu, 37, 0, 0, 0xAAAAAAAA, 0x00000001, 0x00000000, 0xAAAAAAAA);
+    DO_MIPS32_r2_s(divu, 38, 0, 0, 0xAAAAAAAA, 0x55555555, 0x00000000, 0x00000002);
+    DO_MIPS32_r2_s(divu, 39, 0, 0, 0xAAAAAAAA, 0xAAAAAAAA, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(divu, 40, 0, 0, 0xAAAAAAAA, 0xFFFFFFFF, 0xAAAAAAAA, 0x00000000);
+    DO_MIPS32_r2_s(divu, 41, 0, 0, 0x7FFFFFFF, 0x7FFFFFFF, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(divu, 42, 0, 0, 0x7FFFFFFF, 0x80000000, 0x7FFFFFFF, 0x00000000);
+    DO_MIPS32_r2_s(divu, 43, 0, 0, 0x7FFFFFFF, 0xFFFFFFFF, 0x7FFFFFFF, 0x00000000);
+    DO_MIPS32_r2_s(divu, 44, 0, 0, 0x80000000, 0x7FFFFFFF, 0x00000001, 0x00000001);
+    DO_MIPS32_r2_s(divu, 45, 0, 0, 0x80000000, 0x80000000, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(divu, 46, 0, 0, 0x80000000, 0xFFFFFFFF, 0x80000000, 0x00000000);
+    DO_MIPS32_r2_s(divu, 47, 0, 0, 0xFFFFFFFF, 0x7FFFFFFF, 0x00000001, 0x00000002);
+    DO_MIPS32_r2_s(divu, 48, 0, 0, 0xFFFFFFFF, 0x80000000, 0x7FFFFFFF, 0x00000001);
+    DO_MIPS32_r2_s(divu, 49, 0, 0, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000000, 0x00000001);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/madd.c b/tests/tcg/mips/user/isa/mips32/arithmatic/madd.c
new file mode 100644
index 0000000000..7f047f76d9
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/madd.c
@@ -0,0 +1,79 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r2_s(divu, 0, 0, 0, 0x00000000, 0xFFFFFFFF, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(madd, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(madd, 1, 0x00000000, 0x00000000, 0x00000001, 0x00000001, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(madd, 2, 0x00000000, 0x00000001, 0x00000002, 0x00000003, 0x00000000, 0x00000007);
+    DO_MIPS32_r2_s(madd, 3, 0x00000000, 0x00000007, 0x00000004, 0x00000007, 0x00000000, 0x00000023);
+    DO_MIPS32_r2_s(madd, 4, 0x00000000, 0x00000023, 0x00000008, 0x0000000F, 0x00000000, 0x0000009b);
+    DO_MIPS32_r2_s(madd, 5, 0x00000000, 0x0000009b, 0x00000010, 0x0000001F, 0x00000000, 0x0000028b);
+    DO_MIPS32_r2_s(madd, 6, 0x00000000, 0x0000028b, 0x00000020, 0x0000003F, 0x00000000, 0x00000a6b);
+    DO_MIPS32_r2_s(madd, 7, 0x00000000, 0x00000a6b, 0x00000040, 0x0000007F, 0x00000000, 0x00002a2b);
+    DO_MIPS32_r2_s(madd, 8, 0x00000000, 0x00002a2b, 0x00000080, 0x000000FF, 0x00000000, 0x0000a9ab);
+    DO_MIPS32_r2_s(madd, 9, 0x00000000, 0x0000a9ab, 0x00000100, 0x000001FF, 0x00000000, 0x0002a8ab);
+    DO_MIPS32_r2_s(madd, 10, 0x00000000, 0x0002a8ab, 0x00000200, 0x000003FF, 0x00000000, 0x000aa6ab);
+    DO_MIPS32_r2_s(madd, 11, 0x00000000, 0x000aa6ab, 0x00000400, 0x000007FF, 0x00000000, 0x002aa2ab);
+    DO_MIPS32_r2_s(madd, 12, 0x00000000, 0x002aa2ab, 0x00000800, 0x00000FFF, 0x00000000, 0x00aa9aab);
+    DO_MIPS32_r2_s(madd, 13, 0x00000000, 0x00aa9aab, 0x00001000, 0x00001FFF, 0x00000000, 0x02aa8aab);
+    DO_MIPS32_r2_s(madd, 14, 0x00000000, 0x02aa8aab, 0x00002000, 0x00003FFF, 0x00000000, 0x0aaa6aab);
+    DO_MIPS32_r2_s(madd, 15, 0x00000000, 0x0aaa6aab, 0x00004000, 0x00007FFF, 0x00000000, 0x2aaa2aab);
+    DO_MIPS32_r2_s(madd, 16, 0x00000000, 0x2aaa2aab, 0x00008000, 0x0000FFFF, 0x00000000, 0xaaa9aaab);
+    DO_MIPS32_r2_s(madd, 17, 0x00000000, 0xaaa9aaab, 0x00010000, 0x0001FFFF, 0x00000002, 0xaaa8aaab);
+    DO_MIPS32_r2_s(madd, 18, 0x00000002, 0xaaa8aaab, 0x00020000, 0x0003FFFF, 0x0000000a, 0xAAA6AAAB);
+    DO_MIPS32_r2_s(madd, 19, 0x0000000a, 0xAAA6AAAB, 0x00040000, 0x0007FFFF, 0x0000002A, 0xAAA2AAAB);
+    DO_MIPS32_r2_s(madd, 20, 0x0000002A, 0xAAA2AAAB, 0x00080000, 0x000FFFFF, 0x000000AA, 0xAA9AAAAB);
+    DO_MIPS32_r2_s(madd, 21, 0x000000AA, 0xAA9AAAAB, 0x00100000, 0x001FFFFF, 0x000002AA, 0xAA8AAAAB);
+    DO_MIPS32_r2_s(madd, 22, 0x000002AA, 0xAA8AAAAB, 0x00200000, 0x003FFFFF, 0x00000AAA, 0xAA6AAAAB);
+    DO_MIPS32_r2_s(madd, 23, 0x00000AAA, 0xAA6AAAAB, 0x00400000, 0x007FFFFF, 0x00002AAA, 0xAA2AAAAB);
+    DO_MIPS32_r2_s(madd, 24, 0x00002AAA, 0xAA2AAAAB, 0x00800000, 0x00FFFFFF, 0x0000AAAA, 0xA9AAAAAB);
+    DO_MIPS32_r2_s(madd, 25, 0x0000AAAA, 0xA9AAAAAB, 0x01000000, 0x01FFFFFF, 0x0002AAAA, 0xA8AAAAAB);
+    DO_MIPS32_r2_s(madd, 26, 0x0002AAAA, 0xA8AAAAAB, 0x02000000, 0x03FFFFFF, 0x000AAAAA, 0xA6AAAAAB);
+    DO_MIPS32_r2_s(madd, 27, 0x000AAAAA, 0xA6AAAAAB, 0x04000000, 0x07FFFFFF, 0x002AAAAA, 0xA2AAAAAB);
+    DO_MIPS32_r2_s(madd, 28, 0x002AAAAA, 0xA2AAAAAB, 0x08000000, 0x0FFFFFFF, 0x00AAAAAA, 0x9AAAAAAB);
+    DO_MIPS32_r2_s(madd, 29, 0x00AAAAAA, 0x9AAAAAAB, 0x10000000, 0x1FFFFFFF, 0x02AAAAAA, 0x8AAAAAAB);
+    DO_MIPS32_r2_s(madd, 30, 0x02AAAAAA, 0x8AAAAAAB, 0x20000000, 0x3FFFFFFF, 0x0AAAAAAA, 0x6AAAAAAB);
+    DO_MIPS32_r2_s(madd, 31, 0x0AAAAAAA, 0x6AAAAAAB, 0x40000000, 0x7FFFFFFF, 0x2AAAAAAA, 0x2AAAAAAB);
+    DO_MIPS32_r2_s(madd, 32, 0x2AAAAAAA, 0x2AAAAAAB, 0x80000000, 0xFFFFFFFF, 0x2AAAAAAA, 0xAAAAAAAB);
+    DO_MIPS32_r2_s(madd, 33, 0x00000000, 0x00000000, 0x00000000, 0x55555555, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(madd, 34, 0x00000000, 0x00000000, 0x55555555, 0x55555555, 0x1C71C71C, 0x38E38E39);
+    DO_MIPS32_r2_s(madd, 35, 0x1C71C71C, 0x38E38E39, 0xAAAAAAAA, 0x55555555, 0xFFFFFFFF, 0xAAAAAAAB);
+    DO_MIPS32_r2_s(madd, 36, 0xFFFFFFFF, 0xAAAAAAAB, 0xFFFFFFFF, 0x55555555, 0xFFFFFFFF, 0x55555556);
+    DO_MIPS32_r2_s(madd, 37, 0xFFFFFFFF, 0x55555556, 0xAAAAAAAA, 0x00000000, 0xFFFFFFFF, 0x55555556);
+    DO_MIPS32_r2_s(madd, 38, 0xFFFFFFFF, 0x55555556, 0xAAAAAAAA, 0x55555555, 0xe38e38e2, 0xc71c71c8);
+    DO_MIPS32_r2_s(madd, 39, 0xe38e38e2, 0xc71c71c8, 0xAAAAAAAA, 0xAAAAAAAA, 0xffffffff, 0xaaaaaaac);
+    DO_MIPS32_r2_s(madd, 40, 0xffffffff, 0xaaaaaaac, 0xAAAAAAAA, 0xFFFFFFFF, 0x00000000, 0x00000002);
+    DO_MIPS32_r2_s(madd, 41, 0x00000000, 0x00000000, 0x7FFFFFFF, 0x7FFFFFFF, 0x3FFFFFFF, 0x00000001);
+    DO_MIPS32_r2_s(madd, 42, 0x3FFFFFFF, 0x00000001, 0x7FFFFFFF, 0x80000000, 0xffffffff, 0x80000001);
+    DO_MIPS32_r2_s(madd, 43, 0xffffffff, 0x80000001, 0x7FFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000002);
+    DO_MIPS32_r2_s(madd, 44, 0xFFFFFFFF, 0x00000002, 0x80000000, 0x7FFFFFFF, 0xbfffffff, 0x80000002);
+    DO_MIPS32_r2_s(madd, 45, 0xbfffffff, 0x80000002, 0x80000000, 0x80000000, 0xffffffff, 0x80000002);
+    DO_MIPS32_r2_s(madd, 46, 0xffffffff, 0x80000002, 0x80000000, 0xFFFFFFFF, 0x00000000, 0x00000002);
+    DO_MIPS32_r2_s(madd, 47, 0x00000000, 0x00000002, 0xFFFFFFFF, 0x7FFFFFFF, 0xFFFFFFFF, 0x80000003);
+    DO_MIPS32_r2_s(madd, 48, 0xFFFFFFFF, 0x80000003, 0xFFFFFFFF, 0x80000000, 0x00000000, 0x00000003);
+    DO_MIPS32_r2_s(madd, 49, 0x00000000, 0x00000003, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000000, 0x00000004);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/maddu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/maddu.c
new file mode 100644
index 0000000000..8073841b33
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/maddu.c
@@ -0,0 +1,78 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r2_s(maddu, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(maddu, 1, 0x00000000, 0x00000000, 0x00000001, 0x00000001, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(maddu, 2, 0x00000000, 0x00000001, 0x00000002, 0x00000003, 0x00000000, 0x00000007);
+    DO_MIPS32_r2_s(maddu, 3, 0x00000000, 0x00000007, 0x00000004, 0x00000007, 0x00000000, 0x00000023);
+    DO_MIPS32_r2_s(maddu, 4, 0x00000000, 0x00000023, 0x00000008, 0x0000000F, 0x00000000, 0x0000009b);
+    DO_MIPS32_r2_s(maddu, 5, 0x00000000, 0x0000009b, 0x00000010, 0x0000001F, 0x00000000, 0x0000028b);
+    DO_MIPS32_r2_s(maddu, 6, 0x00000000, 0x0000028b, 0x00000020, 0x0000003F, 0x00000000, 0x00000a6b);
+    DO_MIPS32_r2_s(maddu, 7, 0x00000000, 0x00000a6b, 0x00000040, 0x0000007F, 0x00000000, 0x00002a2b);
+    DO_MIPS32_r2_s(maddu, 8, 0x00000000, 0x00002a2b, 0x00000080, 0x000000FF, 0x00000000, 0x0000a9ab);
+    DO_MIPS32_r2_s(maddu, 9, 0x00000000, 0x0000a9ab, 0x00000100, 0x000001FF, 0x00000000, 0x0002a8ab);
+    DO_MIPS32_r2_s(maddu, 10, 0x00000000, 0x0002a8ab, 0x00000200, 0x000003FF, 0x00000000, 0x000aa6ab);
+    DO_MIPS32_r2_s(maddu, 11, 0x00000000, 0x000aa6ab, 0x00000400, 0x000007FF, 0x00000000, 0x002aa2ab);
+    DO_MIPS32_r2_s(maddu, 12, 0x00000000, 0x002aa2ab, 0x00000800, 0x00000FFF, 0x00000000, 0x00aa9aab);
+    DO_MIPS32_r2_s(maddu, 13, 0x00000000, 0x00aa9aab, 0x00001000, 0x00001FFF, 0x00000000, 0x02aa8aab);
+    DO_MIPS32_r2_s(maddu, 14, 0x00000000, 0x02aa8aab, 0x00002000, 0x00003FFF, 0x00000000, 0x0aaa6aab);
+    DO_MIPS32_r2_s(maddu, 15, 0x00000000, 0x0aaa6aab, 0x00004000, 0x00007FFF, 0x00000000, 0x2aaa2aab);
+    DO_MIPS32_r2_s(maddu, 16, 0x00000000, 0x2aaa2aab, 0x00008000, 0x0000FFFF, 0x00000000, 0xaaa9aaab);
+    DO_MIPS32_r2_s(maddu, 17, 0x00000000, 0xaaa9aaab, 0x00010000, 0x0001FFFF, 0x00000002, 0xaaa8aaab);
+    DO_MIPS32_r2_s(maddu, 18, 0x00000002, 0xaaa8aaab, 0x00020000, 0x0003FFFF, 0x0000000a, 0xAAA6AAAB);
+    DO_MIPS32_r2_s(maddu, 19, 0x0000000a, 0xAAA6AAAB, 0x00040000, 0x0007FFFF, 0x0000002A, 0xAAA2AAAB);
+    DO_MIPS32_r2_s(maddu, 20, 0x0000002A, 0xAAA2AAAB, 0x00080000, 0x000FFFFF, 0x000000AA, 0xAA9AAAAB);
+    DO_MIPS32_r2_s(maddu, 21, 0x000000AA, 0xAA9AAAAB, 0x00100000, 0x001FFFFF, 0x000002AA, 0xAA8AAAAB);
+    DO_MIPS32_r2_s(maddu, 22, 0x000002AA, 0xAA8AAAAB, 0x00200000, 0x003FFFFF, 0x00000AAA, 0xAA6AAAAB);
+    DO_MIPS32_r2_s(maddu, 23, 0x00000AAA, 0xAA6AAAAB, 0x00400000, 0x007FFFFF, 0x00002AAA, 0xAA2AAAAB);
+    DO_MIPS32_r2_s(maddu, 24, 0x00002AAA, 0xAA2AAAAB, 0x00800000, 0x00FFFFFF, 0x0000AAAA, 0xA9AAAAAB);
+    DO_MIPS32_r2_s(maddu, 25, 0x0000AAAA, 0xA9AAAAAB, 0x01000000, 0x01FFFFFF, 0x0002AAAA, 0xA8AAAAAB);
+    DO_MIPS32_r2_s(maddu, 26, 0x0002AAAA, 0xA8AAAAAB, 0x02000000, 0x03FFFFFF, 0x000AAAAA, 0xA6AAAAAB);
+    DO_MIPS32_r2_s(maddu, 27, 0x000AAAAA, 0xA6AAAAAB, 0x04000000, 0x07FFFFFF, 0x002AAAAA, 0xA2AAAAAB);
+    DO_MIPS32_r2_s(maddu, 28, 0x002AAAAA, 0xA2AAAAAB, 0x08000000, 0x0FFFFFFF, 0x00AAAAAA, 0x9AAAAAAB);
+    DO_MIPS32_r2_s(maddu, 29, 0x00AAAAAA, 0x9AAAAAAB, 0x10000000, 0x1FFFFFFF, 0x02AAAAAA, 0x8AAAAAAB);
+    DO_MIPS32_r2_s(maddu, 30, 0x02AAAAAA, 0x8AAAAAAB, 0x20000000, 0x3FFFFFFF, 0x0AAAAAAA, 0x6AAAAAAB);
+    DO_MIPS32_r2_s(maddu, 31, 0x0AAAAAAA, 0x6AAAAAAB, 0x40000000, 0x7FFFFFFF, 0x2AAAAAAA, 0x2AAAAAAB);
+    DO_MIPS32_r2_s(maddu, 32, 0x2AAAAAAA, 0x2AAAAAAB, 0x80000000, 0xFFFFFFFF, 0xAAAAAAA9, 0xAAAAAAAB);
+    DO_MIPS32_r2_s(maddu, 33, 0x00000000, 0x00000000, 0x00000000, 0x55555555, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(maddu, 34, 0x00000000, 0x00000000, 0x55555555, 0x55555555, 0x1C71C71C, 0x38E38E39);
+    DO_MIPS32_r2_s(maddu, 35, 0x1C71C71C, 0x38E38E39, 0xAAAAAAAA, 0x55555555, 0x55555554, 0xaaaaaaab);
+    DO_MIPS32_r2_s(maddu, 36, 0x55555554, 0xaaaaaaab, 0xFFFFFFFF, 0x55555555, 0xaaaaaaa9, 0x55555556);
+    DO_MIPS32_r2_s(maddu, 37, 0xaaaaaaa9, 0x55555556, 0xAAAAAAAA, 0x00000000, 0xaaaaaaa9, 0x55555556);
+    DO_MIPS32_r2_s(maddu, 38, 0xaaaaaaa9, 0x55555556, 0xAAAAAAAA, 0x55555555, 0xe38e38e1, 0xc71c71c8);
+    DO_MIPS32_r2_s(maddu, 39, 0xe38e38e1, 0xc71c71c8, 0xAAAAAAAA, 0xAAAAAAAA, 0x55555552, 0xaaaaaaac);
+    DO_MIPS32_r2_s(maddu, 40, 0x55555552, 0xaaaaaaac, 0xAAAAAAAA, 0xFFFFFFFF, 0xfffffffc, 0x00000002);
+    DO_MIPS32_r2_s(maddu, 41, 0x00000000, 0x00000000, 0x7FFFFFFF, 0x7FFFFFFF, 0x3fffffff, 0x00000001);
+    DO_MIPS32_r2_s(maddu, 42, 0x3fffffff, 0x00000001, 0x7FFFFFFF, 0x80000000, 0x7ffffffe, 0x80000001);
+    DO_MIPS32_r2_s(maddu, 43, 0x7ffffffe, 0x80000001, 0x7FFFFFFF, 0xFFFFFFFF, 0xfffffffd, 0x00000002);
+    DO_MIPS32_r2_s(maddu, 44, 0xfffffffd, 0x00000002, 0x80000000, 0x7FFFFFFF, 0x3ffffffc, 0x80000002);
+    DO_MIPS32_r2_s(maddu, 45, 0x3ffffffc, 0x80000002, 0x80000000, 0x80000000, 0x7ffffffc, 0x80000002);
+    DO_MIPS32_r2_s(maddu, 46, 0x7ffffffc, 0x80000002, 0x80000000, 0xFFFFFFFF, 0xfffffffc, 0x00000002);
+    DO_MIPS32_r2_s(maddu, 47, 0xfffffffc, 0x00000002, 0xFFFFFFFF, 0x7FFFFFFF, 0x7ffffffa, 0x80000003);
+    DO_MIPS32_r2_s(maddu, 48, 0x7ffffffa, 0x80000003, 0xFFFFFFFF, 0x80000000, 0xfffffffa, 0x00000003);
+    DO_MIPS32_r2_s(maddu, 49, 0xfffffffa, 0x00000003, 0xFFFFFFFF, 0xFFFFFFFF, 0xfffffff8, 0x00000004);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/msub.c b/tests/tcg/mips/user/isa/mips32/arithmatic/msub.c
new file mode 100644
index 0000000000..36387cbdf8
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/msub.c
@@ -0,0 +1,78 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r2_s(msub, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(msub, 1, 0x00000000, 0x00000000, 0x00000001, 0x00000001, 0xffffffff, 0xffffffff);
+    DO_MIPS32_r2_s(msub, 2, 0xffffffff, 0xffffffff, 0x00000002, 0x00000003, 0xffffffff, 0xfffffff9);
+    DO_MIPS32_r2_s(msub, 3, 0xffffffff, 0xfffffff9, 0x00000004, 0x00000007, 0xffffffff, 0xffffffdd);
+    DO_MIPS32_r2_s(msub, 4, 0xffffffff, 0xffffffdd, 0x00000008, 0x0000000F, 0xffffffff, 0xffffff65);
+    DO_MIPS32_r2_s(msub, 5, 0xffffffff, 0xffffff65, 0x00000010, 0x0000001F, 0xffffffff, 0xfffffd75);
+    DO_MIPS32_r2_s(msub, 6, 0xffffffff, 0xfffffd75, 0x00000020, 0x0000003F, 0xffffffff, 0xfffff595);
+    DO_MIPS32_r2_s(msub, 7, 0xffffffff, 0xfffff595, 0x00000040, 0x0000007F, 0xffffffff, 0xffffd5d5);
+    DO_MIPS32_r2_s(msub, 8, 0xffffffff, 0xffffd5d5, 0x00000080, 0x000000FF, 0xffffffff, 0xffff5655);
+    DO_MIPS32_r2_s(msub, 9, 0xffffffff, 0xffff5655, 0x00000100, 0x000001FF, 0xffffffff, 0xfffd5755);
+    DO_MIPS32_r2_s(msub, 10, 0xffffffff, 0xfffd5755, 0x00000200, 0x000003FF, 0xffffffff, 0xfff55955);
+    DO_MIPS32_r2_s(msub, 11, 0xffffffff, 0xfff55955, 0x00000400, 0x000007FF, 0xffffffff, 0xffd55d55);
+    DO_MIPS32_r2_s(msub, 12, 0xffffffff, 0xffd55d55, 0x00000800, 0x00000FFF, 0xffffffff, 0xff556555);
+    DO_MIPS32_r2_s(msub, 13, 0xffffffff, 0xff556555, 0x00001000, 0x00001FFF, 0xffffffff, 0xfd557555);
+    DO_MIPS32_r2_s(msub, 14, 0xffffffff, 0xfd557555, 0x00002000, 0x00003FFF, 0xffffffff, 0xf5559555);
+    DO_MIPS32_r2_s(msub, 15, 0xffffffff, 0xf5559555, 0x00004000, 0x00007FFF, 0xffffffff, 0xd555d555);
+    DO_MIPS32_r2_s(msub, 16, 0xffffffff, 0xd555d555, 0x00008000, 0x0000FFFF, 0xffffffff, 0x55565555);
+    DO_MIPS32_r2_s(msub, 17, 0xffffffff, 0x55565555, 0x00010000, 0x0001FFFF, 0xfffffffd, 0x55575555);
+    DO_MIPS32_r2_s(msub, 18, 0xfffffffd, 0x55575555, 0x00020000, 0x0003FFFF, 0xfffffff5, 0x55595555);
+    DO_MIPS32_r2_s(msub, 19, 0xfffffff5, 0x55595555, 0x00040000, 0x0007FFFF, 0xffffffd5, 0x555d5555);
+    DO_MIPS32_r2_s(msub, 20, 0xffffffd5, 0x555d5555, 0x00080000, 0x000FFFFF, 0xffffff55, 0x55655555);
+    DO_MIPS32_r2_s(msub, 21, 0xffffff55, 0x55655555, 0x00100000, 0x001FFFFF, 0xfffffd55, 0x55755555);
+    DO_MIPS32_r2_s(msub, 22, 0xfffffd55, 0x55755555, 0x00200000, 0x003FFFFF, 0xfffff555, 0x55955555);
+    DO_MIPS32_r2_s(msub, 23, 0xfffff555, 0x55955555, 0x00400000, 0x007FFFFF, 0xffffd555, 0x55d55555);
+    DO_MIPS32_r2_s(msub, 24, 0xffffd555, 0x55d55555, 0x00800000, 0x00FFFFFF, 0xffff5555, 0x56555555);
+    DO_MIPS32_r2_s(msub, 25, 0xffff5555, 0x56555555, 0x01000000, 0x01FFFFFF, 0xfffd5555, 0x57555555);
+    DO_MIPS32_r2_s(msub, 26, 0xfffd5555, 0x57555555, 0x02000000, 0x03FFFFFF, 0xfff55555, 0x59555555);
+    DO_MIPS32_r2_s(msub, 27, 0xfff55555, 0x59555555, 0x04000000, 0x07FFFFFF, 0xffd55555, 0x5d555555);
+    DO_MIPS32_r2_s(msub, 28, 0xffd55555, 0x5d555555, 0x08000000, 0x0FFFFFFF, 0xff555555, 0x65555555);
+    DO_MIPS32_r2_s(msub, 29, 0xff555555, 0x65555555, 0x10000000, 0x1FFFFFFF, 0xfd555555, 0x75555555);
+    DO_MIPS32_r2_s(msub, 30, 0xfd555555, 0x75555555, 0x20000000, 0x3FFFFFFF, 0xf5555555, 0x95555555);
+    DO_MIPS32_r2_s(msub, 31, 0xf5555555, 0x95555555, 0x40000000, 0x7FFFFFFF, 0xd5555555, 0xd5555555);
+    DO_MIPS32_r2_s(msub, 32, 0xd5555555, 0xd5555555, 0x80000000, 0xFFFFFFFF, 0xd5555555, 0x55555555);
+    DO_MIPS32_r2_s(msub, 33, 0x00000000, 0x00000000, 0x00000000, 0x55555555, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(msub, 34, 0x00000000, 0x00000000, 0x55555555, 0x55555555, 0xe38e38e3, 0xc71c71c7);
+    DO_MIPS32_r2_s(msub, 35, 0xe38e38e3, 0xc71c71c7, 0xAAAAAAAA, 0x55555555, 0x00000000, 0x55555555);
+    DO_MIPS32_r2_s(msub, 36, 0x00000000, 0x55555555, 0xFFFFFFFF, 0x55555555, 0x00000000, 0xaaaaaaaa);
+    DO_MIPS32_r2_s(msub, 37, 0x00000000, 0xaaaaaaaa, 0xAAAAAAAA, 0x00000000, 0x00000000, 0xaaaaaaaa);
+    DO_MIPS32_r2_s(msub, 38, 0x00000000, 0xaaaaaaaa, 0xAAAAAAAA, 0x55555555, 0x1c71c71d, 0x38e38e38);
+    DO_MIPS32_r2_s(msub, 39, 0x1c71c71d, 0x38e38e38, 0xAAAAAAAA, 0xAAAAAAAA, 0x00000000, 0x55555554);
+    DO_MIPS32_r2_s(msub, 40, 0x00000000, 0x55555554, 0xAAAAAAAA, 0xFFFFFFFF, 0xffffffff, 0xfffffffe);
+    DO_MIPS32_r2_s(msub, 41, 0x00000000, 0x00000000, 0x7FFFFFFF, 0x7FFFFFFF, 0xc0000000, 0xffffffff);
+    DO_MIPS32_r2_s(msub, 42, 0xc0000000, 0xffffffff, 0x7FFFFFFF, 0x80000000, 0x00000000, 0x7fffffff);
+    DO_MIPS32_r2_s(msub, 43, 0x00000000, 0x7fffffff, 0x7FFFFFFF, 0xFFFFFFFF, 0x00000000, 0xfffffffe);
+    DO_MIPS32_r2_s(msub, 44, 0x00000000, 0xfffffffe, 0x80000000, 0x7FFFFFFF, 0x40000000, 0x7ffffffe);
+    DO_MIPS32_r2_s(msub, 45, 0x40000000, 0x7ffffffe, 0x80000000, 0x80000000, 0x00000000, 0x7ffffffe);
+    DO_MIPS32_r2_s(msub, 46, 0x00000000, 0x7ffffffe, 0x80000000, 0xFFFFFFFF, 0xffffffff, 0xfffffffe);
+    DO_MIPS32_r2_s(msub, 47, 0xffffffff, 0xfffffffe, 0xFFFFFFFF, 0x7FFFFFFF, 0x00000000, 0x7ffffffd);
+    DO_MIPS32_r2_s(msub, 48, 0x00000000, 0x7ffffffd, 0xFFFFFFFF, 0x80000000, 0xffffffff, 0xfffffffd);
+    DO_MIPS32_r2_s(msub, 49, 0xffffffff, 0xfffffffd, 0xFFFFFFFF, 0xFFFFFFFF, 0xffffffff, 0xfffffffc);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/msubu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/msubu.c
new file mode 100644
index 0000000000..d20065d0b2
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/msubu.c
@@ -0,0 +1,78 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r2_s(msubu, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(msubu, 1, 0x00000000, 0x00000000, 0x00000001, 0x00000001, 0xffffffff, 0xffffffff);
+    DO_MIPS32_r2_s(msubu, 2, 0xffffffff, 0xffffffff, 0x00000002, 0x00000003, 0xffffffff, 0xfffffff9);
+    DO_MIPS32_r2_s(msubu, 3, 0xffffffff, 0xfffffff9, 0x00000004, 0x00000007, 0xffffffff, 0xffffffdd);
+    DO_MIPS32_r2_s(msubu, 4, 0xffffffff, 0xffffffdd, 0x00000008, 0x0000000F, 0xffffffff, 0xffffff65);
+    DO_MIPS32_r2_s(msubu, 5, 0xffffffff, 0xffffff65, 0x00000010, 0x0000001F, 0xffffffff, 0xfffffd75);
+    DO_MIPS32_r2_s(msubu, 6, 0xffffffff, 0xfffffd75, 0x00000020, 0x0000003F, 0xffffffff, 0xfffff595);
+    DO_MIPS32_r2_s(msubu, 7, 0xffffffff, 0xfffff595, 0x00000040, 0x0000007F, 0xffffffff, 0xffffd5d5);
+    DO_MIPS32_r2_s(msubu, 8, 0xffffffff, 0xffffd5d5, 0x00000080, 0x000000FF, 0xffffffff, 0xffff5655);
+    DO_MIPS32_r2_s(msubu, 9, 0xffffffff, 0xffff5655, 0x00000100, 0x000001FF, 0xffffffff, 0xfffd5755);
+    DO_MIPS32_r2_s(msubu, 10, 0xffffffff, 0xfffd5755, 0x00000200, 0x000003FF, 0xffffffff, 0xfff55955);
+    DO_MIPS32_r2_s(msubu, 11, 0xffffffff, 0xfff55955, 0x00000400, 0x000007FF, 0xffffffff, 0xffd55d55);
+    DO_MIPS32_r2_s(msubu, 12, 0xffffffff, 0xffd55d55, 0x00000800, 0x00000FFF, 0xffffffff, 0xff556555);
+    DO_MIPS32_r2_s(msubu, 13, 0xffffffff, 0xff556555, 0x00001000, 0x00001FFF, 0xffffffff, 0xfd557555);
+    DO_MIPS32_r2_s(msubu, 14, 0xffffffff, 0xfd557555, 0x00002000, 0x00003FFF, 0xffffffff, 0xf5559555);
+    DO_MIPS32_r2_s(msubu, 15, 0xffffffff, 0xf5559555, 0x00004000, 0x00007FFF, 0xffffffff, 0xd555d555);
+    DO_MIPS32_r2_s(msubu, 16, 0xffffffff, 0xd555d555, 0x00008000, 0x0000FFFF, 0xffffffff, 0x55565555);
+    DO_MIPS32_r2_s(msubu, 17, 0xffffffff, 0x55565555, 0x00010000, 0x0001FFFF, 0xfffffffd, 0x55575555);
+    DO_MIPS32_r2_s(msubu, 18, 0xfffffffd, 0x55575555, 0x00020000, 0x0003FFFF, 0xfffffff5, 0x55595555);
+    DO_MIPS32_r2_s(msubu, 19, 0xfffffff5, 0x55595555, 0x00040000, 0x0007FFFF, 0xffffffd5, 0x555d5555);
+    DO_MIPS32_r2_s(msubu, 20, 0xffffffd5, 0x555d5555, 0x00080000, 0x000FFFFF, 0xffffff55, 0x55655555);
+    DO_MIPS32_r2_s(msubu, 21, 0xffffff55, 0x55655555, 0x00100000, 0x001FFFFF, 0xfffffd55, 0x55755555);
+    DO_MIPS32_r2_s(msubu, 22, 0xfffffd55, 0x55755555, 0x00200000, 0x003FFFFF, 0xfffff555, 0x55955555);
+    DO_MIPS32_r2_s(msubu, 23, 0xfffff555, 0x55955555, 0x00400000, 0x007FFFFF, 0xffffd555, 0x55d55555);
+    DO_MIPS32_r2_s(msubu, 24, 0xffffd555, 0x55d55555, 0x00800000, 0x00FFFFFF, 0xffff5555, 0x56555555);
+    DO_MIPS32_r2_s(msubu, 25, 0xffff5555, 0x56555555, 0x01000000, 0x01FFFFFF, 0xfffd5555, 0x57555555);
+    DO_MIPS32_r2_s(msubu, 26, 0xfffd5555, 0x57555555, 0x02000000, 0x03FFFFFF, 0xfff55555, 0x59555555);
+    DO_MIPS32_r2_s(msubu, 27, 0xfff55555, 0x59555555, 0x04000000, 0x07FFFFFF, 0xffd55555, 0x5d555555);
+    DO_MIPS32_r2_s(msubu, 28, 0xffd55555, 0x5d555555, 0x08000000, 0x0FFFFFFF, 0xff555555, 0x65555555);
+    DO_MIPS32_r2_s(msubu, 29, 0xff555555, 0x65555555, 0x10000000, 0x1FFFFFFF, 0xfd555555, 0x75555555);
+    DO_MIPS32_r2_s(msubu, 30, 0xfd555555, 0x75555555, 0x20000000, 0x3FFFFFFF, 0xf5555555, 0x95555555);
+    DO_MIPS32_r2_s(msubu, 31, 0xf5555555, 0x95555555, 0x40000000, 0x7FFFFFFF, 0xd5555555, 0xd5555555);
+    DO_MIPS32_r2_s(msubu, 32, 0xd5555555, 0xd5555555, 0x80000000, 0xFFFFFFFF, 0x55555556, 0x55555555);
+    DO_MIPS32_r2_s(msubu, 33, 0x00000000, 0x00000000, 0x00000000, 0x55555555, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(msubu, 34, 0x00000000, 0x00000000, 0x55555555, 0x55555555, 0xe38e38e3, 0xc71c71c7);
+    DO_MIPS32_r2_s(msubu, 35, 0xe38e38e3, 0xc71c71c7, 0xAAAAAAAA, 0x55555555, 0xaaaaaaab, 0x55555555);
+    DO_MIPS32_r2_s(msubu, 36, 0xaaaaaaab, 0x55555555, 0xFFFFFFFF, 0x55555555, 0x55555556, 0xaaaaaaaa);
+    DO_MIPS32_r2_s(msubu, 37, 0x55555556, 0xaaaaaaaa, 0xAAAAAAAA, 0x00000000, 0x55555556, 0xaaaaaaaa);
+    DO_MIPS32_r2_s(msubu, 38, 0x55555556, 0xaaaaaaaa, 0xAAAAAAAA, 0x55555555, 0x1c71c71e, 0x38e38e38);
+    DO_MIPS32_r2_s(msubu, 39, 0x1c71c71e, 0x38e38e38, 0xAAAAAAAA, 0xAAAAAAAA, 0xaaaaaaad, 0x55555554);
+    DO_MIPS32_r2_s(msubu, 40, 0xaaaaaaad, 0x55555554, 0xAAAAAAAA, 0xFFFFFFFF, 0x00000003, 0xfffffffe);
+    DO_MIPS32_r2_s(msubu, 41, 0x00000000, 0x00000000, 0x7FFFFFFF, 0x7FFFFFFF, 0xc0000000, 0xffffffff);
+    DO_MIPS32_r2_s(msubu, 42, 0xc0000000, 0xffffffff, 0x7FFFFFFF, 0x80000000, 0x80000001, 0x7fffffff);
+    DO_MIPS32_r2_s(msubu, 43, 0x80000001, 0x7fffffff, 0x7FFFFFFF, 0xFFFFFFFF, 0x00000002, 0xfffffffe);
+    DO_MIPS32_r2_s(msubu, 44, 0x00000002, 0xfffffffe, 0x80000000, 0x7FFFFFFF, 0xc0000003, 0x7ffffffe);
+    DO_MIPS32_r2_s(msubu, 45, 0xc0000003, 0x7ffffffe, 0x80000000, 0x80000000, 0x80000003, 0x7ffffffe);
+    DO_MIPS32_r2_s(msubu, 46, 0x80000003, 0x7ffffffe, 0x80000000, 0xFFFFFFFF, 0x00000003, 0xfffffffe);
+    DO_MIPS32_r2_s(msubu, 47, 0x00000003, 0xfffffffe, 0xFFFFFFFF, 0x7FFFFFFF, 0x80000005, 0x7ffffffd);
+    DO_MIPS32_r2_s(msubu, 48, 0x80000005, 0x7ffffffd, 0xFFFFFFFF, 0x80000000, 0x00000005, 0xfffffffd);
+    DO_MIPS32_r2_s(msubu, 49, 0x00000005, 0xfffffffd, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000007, 0xfffffffc);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/mul.c b/tests/tcg/mips/user/isa/mips32/arithmatic/mul.c
new file mode 100644
index 0000000000..ab74a14545
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/mul.c
@@ -0,0 +1,78 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r(mul, 0, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r(mul, 1, 0x00000001, 0x00000001, 0x00000001);
+    DO_MIPS32_r(mul, 2, 0x00000002, 0x00000003, 0x00000006);
+    DO_MIPS32_r(mul, 3, 0x00000004, 0x00000007, 0x0000001C);
+    DO_MIPS32_r(mul, 4, 0x00000008, 0x0000000F, 0x00000078);
+    DO_MIPS32_r(mul, 5, 0x00000010, 0x0000001F, 0x000001F0);
+    DO_MIPS32_r(mul, 6, 0x00000020, 0x0000003F, 0x000007E0);
+    DO_MIPS32_r(mul, 7, 0x00000040, 0x0000007F, 0x00001FC0);
+    DO_MIPS32_r(mul, 8, 0x00000080, 0x000000FF, 0x00007F80);
+    DO_MIPS32_r(mul, 9, 0x00000100, 0x000001FF, 0x0001FF00);
+    DO_MIPS32_r(mul, 10, 0x00000200, 0x000003FF, 0x0007FE00);
+    DO_MIPS32_r(mul, 11, 0x00000400, 0x000007FF, 0x001FFC00);
+    DO_MIPS32_r(mul, 12, 0x00000800, 0x00000FFF, 0x007FF800);
+    DO_MIPS32_r(mul, 13, 0x00001000, 0x00001FFF, 0x01FFF000);
+    DO_MIPS32_r(mul, 14, 0x00002000, 0x00003FFF, 0x07FFE000);
+    DO_MIPS32_r(mul, 15, 0x00004000, 0x00007FFF, 0x1FFFC000);
+    DO_MIPS32_r(mul, 16, 0x00008000, 0x0000FFFF, 0x7FFF8000);
+    DO_MIPS32_r(mul, 17, 0x00010000, 0x0001FFFF, 0xFFFF0000);
+    DO_MIPS32_r(mul, 18, 0x00020000, 0x0003FFFF, 0xFFFE0000);
+    DO_MIPS32_r(mul, 19, 0x00040000, 0x0007FFFF, 0xFFFC0000);
+    DO_MIPS32_r(mul, 20, 0x00080000, 0x000FFFFF, 0xFFF80000);
+    DO_MIPS32_r(mul, 21, 0x00100000, 0x001FFFFF, 0xFFF00000);
+    DO_MIPS32_r(mul, 22, 0x00200000, 0x003FFFFF, 0xFFE00000);
+    DO_MIPS32_r(mul, 23, 0x00400000, 0x007FFFFF, 0xFFC00000);
+    DO_MIPS32_r(mul, 24, 0x00800000, 0x00FFFFFF, 0xFF800000);
+    DO_MIPS32_r(mul, 25, 0x01000000, 0x01FFFFFF, 0xFF000000);
+    DO_MIPS32_r(mul, 26, 0x02000000, 0x03FFFFFF, 0xFE000000);
+    DO_MIPS32_r(mul, 27, 0x04000000, 0x07FFFFFF, 0xFC000000);
+    DO_MIPS32_r(mul, 28, 0x08000000, 0x0FFFFFFF, 0xF8000000);
+    DO_MIPS32_r(mul, 29, 0x10000000, 0x1FFFFFFF, 0xF0000000);
+    DO_MIPS32_r(mul, 30, 0x20000000, 0x3FFFFFFF, 0xE0000000);
+    DO_MIPS32_r(mul, 31, 0x40000000, 0x7FFFFFFF, 0xC0000000);
+    DO_MIPS32_r(mul, 32, 0x80000000, 0xFFFFFFFF, 0x80000000);
+    DO_MIPS32_r(mul, 33, 0x00000000, 0x55555555, 0x00000000);
+    DO_MIPS32_r(mul, 34, 0x55555555, 0x55555555, 0x38E38E39);
+    DO_MIPS32_r(mul, 35, 0xAAAAAAAA, 0x55555555, 0x71C71C72);
+    DO_MIPS32_r(mul, 36, 0xFFFFFFFF, 0x55555555, 0xAAAAAAAB);
+    DO_MIPS32_r(mul, 37, 0xAAAAAAAA, 0x00000000, 0x00000000);
+    DO_MIPS32_r(mul, 38, 0xAAAAAAAA, 0x55555555, 0x71C71C72);
+    DO_MIPS32_r(mul, 39, 0xAAAAAAAA, 0xAAAAAAAA, 0xE38E38E4);
+    DO_MIPS32_r(mul, 40, 0xAAAAAAAA, 0xFFFFFFFF, 0x55555556);
+    DO_MIPS32_r(mul, 41, 0x7FFFFFFF, 0x7FFFFFFF, 0x00000001);
+    DO_MIPS32_r(mul, 42, 0x7FFFFFFF, 0x80000000, 0x80000000);
+    DO_MIPS32_r(mul, 43, 0x7FFFFFFF, 0xFFFFFFFF, 0x80000001);
+    DO_MIPS32_r(mul, 44, 0x80000000, 0x7FFFFFFF, 0x80000000);
+    DO_MIPS32_r(mul, 45, 0x80000000, 0x80000000, 0x00000000);
+    DO_MIPS32_r(mul, 46, 0x80000000, 0xFFFFFFFF, 0x80000000);
+    DO_MIPS32_r(mul, 47, 0xFFFFFFFF, 0x7FFFFFFF, 0x80000001);
+    DO_MIPS32_r(mul, 48, 0xFFFFFFFF, 0x80000000, 0x80000000);
+    DO_MIPS32_r(mul, 49, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000001);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/mult.c b/tests/tcg/mips/user/isa/mips32/arithmatic/mult.c
new file mode 100644
index 0000000000..8ac7b2c1b8
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/mult.c
@@ -0,0 +1,78 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r2_s(mult, 0, 0, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(mult, 1, 0, 0, 0x00000001, 0x00000001, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(mult, 2, 0, 0, 0x00000002, 0x00000003, 0x00000000, 0x00000006);
+    DO_MIPS32_r2_s(mult, 3, 0, 0, 0x00000004, 0x00000007, 0x00000000, 0x0000001C);
+    DO_MIPS32_r2_s(mult, 4, 0, 0, 0x00000008, 0x0000000F, 0x00000000, 0x00000078);
+    DO_MIPS32_r2_s(mult, 5, 0, 0, 0x00000010, 0x0000001F, 0x00000000, 0x000001F0);
+    DO_MIPS32_r2_s(mult, 6, 0, 0, 0x00000020, 0x0000003F, 0x00000000, 0x000007E0);
+    DO_MIPS32_r2_s(mult, 7, 0, 0, 0x00000040, 0x0000007F, 0x00000000, 0x00001FC0);
+    DO_MIPS32_r2_s(mult, 8, 0, 0, 0x00000080, 0x000000FF, 0x00000000, 0x00007F80);
+    DO_MIPS32_r2_s(mult, 9, 0, 0, 0x00000100, 0x000001FF, 0x00000000, 0x0001FF00);
+    DO_MIPS32_r2_s(mult, 10, 0, 0, 0x00000200, 0x000003FF, 0x00000000, 0x0007FE00);
+    DO_MIPS32_r2_s(mult, 11, 0, 0, 0x00000400, 0x000007FF, 0x00000000, 0x001FFC00);
+    DO_MIPS32_r2_s(mult, 12, 0, 0, 0x00000800, 0x00000FFF, 0x00000000, 0x007FF800);
+    DO_MIPS32_r2_s(mult, 13, 0, 0, 0x00001000, 0x00001FFF, 0x00000000, 0x01FFF000);
+    DO_MIPS32_r2_s(mult, 14, 0, 0, 0x00002000, 0x00003FFF, 0x00000000, 0x07FFE000);
+    DO_MIPS32_r2_s(mult, 15, 0, 0, 0x00004000, 0x00007FFF, 0x00000000, 0x1FFFC000);
+    DO_MIPS32_r2_s(mult, 16, 0, 0, 0x00008000, 0x0000FFFF, 0x00000000, 0x7FFF8000);
+    DO_MIPS32_r2_s(mult, 17, 0, 0, 0x00010000, 0x0001FFFF, 0x00000001, 0xFFFF0000);
+    DO_MIPS32_r2_s(mult, 18, 0, 0, 0x00020000, 0x0003FFFF, 0x00000007, 0xFFFE0000);
+    DO_MIPS32_r2_s(mult, 19, 0, 0, 0x00040000, 0x0007FFFF, 0x0000001F, 0xFFFC0000);
+    DO_MIPS32_r2_s(mult, 20, 0, 0, 0x00080000, 0x000FFFFF, 0x0000007F, 0xFFF80000);
+    DO_MIPS32_r2_s(mult, 21, 0, 0, 0x00100000, 0x001FFFFF, 0x000001FF, 0xFFF00000);
+    DO_MIPS32_r2_s(mult, 22, 0, 0, 0x00200000, 0x003FFFFF, 0x000007FF, 0xFFE00000);
+    DO_MIPS32_r2_s(mult, 23, 0, 0, 0x00400000, 0x007FFFFF, 0x00001FFF, 0xFFC00000);
+    DO_MIPS32_r2_s(mult, 24, 0, 0, 0x00800000, 0x00FFFFFF, 0x00007FFF, 0xFF800000);
+    DO_MIPS32_r2_s(mult, 25, 0, 0, 0x01000000, 0x01FFFFFF, 0x0001FFFF, 0xFF000000);
+    DO_MIPS32_r2_s(mult, 26, 0, 0, 0x02000000, 0x03FFFFFF, 0x0007FFFF, 0xFE000000);
+    DO_MIPS32_r2_s(mult, 27, 0, 0, 0x04000000, 0x07FFFFFF, 0x001FFFFF, 0xFC000000);
+    DO_MIPS32_r2_s(mult, 28, 0, 0, 0x08000000, 0x0FFFFFFF, 0x007FFFFF, 0xF8000000);
+    DO_MIPS32_r2_s(mult, 29, 0, 0, 0x10000000, 0x1FFFFFFF, 0x01FFFFFF, 0xF0000000);
+    DO_MIPS32_r2_s(mult, 30, 0, 0, 0x20000000, 0x3FFFFFFF, 0x07FFFFFF, 0xE0000000);
+    DO_MIPS32_r2_s(mult, 31, 0, 0, 0x40000000, 0x7FFFFFFF, 0x1FFFFFFF, 0xC0000000);
+    DO_MIPS32_r2_s(mult, 32, 0, 0, 0x80000000, 0xFFFFFFFF, 0x00000000, 0x80000000);
+    DO_MIPS32_r2_s(mult, 33, 0, 0, 0x00000000, 0x55555555, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(mult, 34, 0, 0, 0x55555555, 0x55555555, 0x1C71C71C, 0x38E38E39);
+    DO_MIPS32_r2_s(mult, 35, 0, 0, 0xAAAAAAAA, 0x55555555, 0xE38E38E3, 0x71C71C72);
+    DO_MIPS32_r2_s(mult, 36, 0, 0, 0xFFFFFFFF, 0x55555555, 0xFFFFFFFF, 0xAAAAAAAB);
+    DO_MIPS32_r2_s(mult, 37, 0, 0, 0xAAAAAAAA, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(mult, 38, 0, 0, 0xAAAAAAAA, 0x55555555, 0xE38E38E3, 0x71C71C72);
+    DO_MIPS32_r2_s(mult, 39, 0, 0, 0xAAAAAAAA, 0xAAAAAAAA, 0x1C71C71C, 0xE38E38E4);
+    DO_MIPS32_r2_s(mult, 40, 0, 0, 0xAAAAAAAA, 0xFFFFFFFF, 0x00000000, 0x55555556);
+    DO_MIPS32_r2_s(mult, 41, 0, 0, 0x7FFFFFFF, 0x7FFFFFFF, 0x3FFFFFFF, 0x00000001);
+    DO_MIPS32_r2_s(mult, 42, 0, 0, 0x7FFFFFFF, 0x80000000, 0xC0000000, 0x80000000);
+    DO_MIPS32_r2_s(mult, 43, 0, 0, 0x7FFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x80000001);
+    DO_MIPS32_r2_s(mult, 44, 0, 0, 0x80000000, 0x7FFFFFFF, 0xC0000000, 0x80000000);
+    DO_MIPS32_r2_s(mult, 45, 0, 0, 0x80000000, 0x80000000, 0x40000000, 0x00000000);
+    DO_MIPS32_r2_s(mult, 46, 0, 0, 0x80000000, 0xFFFFFFFF, 0x00000000, 0x80000000);
+    DO_MIPS32_r2_s(mult, 47, 0, 0, 0xFFFFFFFF, 0x7FFFFFFF, 0xFFFFFFFF, 0x80000001);
+    DO_MIPS32_r2_s(mult, 48, 0, 0, 0xFFFFFFFF, 0x80000000, 0x00000000, 0x80000000);
+    DO_MIPS32_r2_s(mult, 49, 0, 0, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000000, 0x00000001);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/multu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/multu.c
new file mode 100644
index 0000000000..eeafbd2d50
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/multu.c
@@ -0,0 +1,78 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r2_s(multu, 0, 0, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(multu, 1, 0, 0, 0x00000001, 0x00000001, 0x00000000, 0x00000001);
+    DO_MIPS32_r2_s(multu, 2, 0, 0, 0x00000002, 0x00000003, 0x00000000, 0x00000006);
+    DO_MIPS32_r2_s(multu, 3, 0, 0, 0x00000004, 0x00000007, 0x00000000, 0x0000001C);
+    DO_MIPS32_r2_s(multu, 4, 0, 0, 0x00000008, 0x0000000F, 0x00000000, 0x00000078);
+    DO_MIPS32_r2_s(multu, 5, 0, 0, 0x00000010, 0x0000001F, 0x00000000, 0x000001F0);
+    DO_MIPS32_r2_s(multu, 6, 0, 0, 0x00000020, 0x0000003F, 0x00000000, 0x000007E0);
+    DO_MIPS32_r2_s(multu, 7, 0, 0, 0x00000040, 0x0000007F, 0x00000000, 0x00001FC0);
+    DO_MIPS32_r2_s(multu, 8, 0, 0, 0x00000080, 0x000000FF, 0x00000000, 0x00007F80);
+    DO_MIPS32_r2_s(multu, 9, 0, 0, 0x00000100, 0x000001FF, 0x00000000, 0x0001FF00);
+    DO_MIPS32_r2_s(multu, 10, 0, 0, 0x00000200, 0x000003FF, 0x00000000, 0x0007FE00);
+    DO_MIPS32_r2_s(multu, 11, 0, 0, 0x00000400, 0x000007FF, 0x00000000, 0x001FFC00);
+    DO_MIPS32_r2_s(multu, 12, 0, 0, 0x00000800, 0x00000FFF, 0x00000000, 0x007FF800);
+    DO_MIPS32_r2_s(multu, 13, 0, 0, 0x00001000, 0x00001FFF, 0x00000000, 0x01FFF000);
+    DO_MIPS32_r2_s(multu, 14, 0, 0, 0x00002000, 0x00003FFF, 0x00000000, 0x07FFE000);
+    DO_MIPS32_r2_s(multu, 15, 0, 0, 0x00004000, 0x00007FFF, 0x00000000, 0x1FFFC000);
+    DO_MIPS32_r2_s(multu, 16, 0, 0, 0x00008000, 0x0000FFFF, 0x00000000, 0x7FFF8000);
+    DO_MIPS32_r2_s(multu, 17, 0, 0, 0x00010000, 0x0001FFFF, 0x00000001, 0xFFFF0000);
+    DO_MIPS32_r2_s(multu, 18, 0, 0, 0x00020000, 0x0003FFFF, 0x00000007, 0xFFFE0000);
+    DO_MIPS32_r2_s(multu, 19, 0, 0, 0x00040000, 0x0007FFFF, 0x0000001F, 0xFFFC0000);
+    DO_MIPS32_r2_s(multu, 20, 0, 0, 0x00080000, 0x000FFFFF, 0x0000007F, 0xFFF80000);
+    DO_MIPS32_r2_s(multu, 21, 0, 0, 0x00100000, 0x001FFFFF, 0x000001FF, 0xFFF00000);
+    DO_MIPS32_r2_s(multu, 22, 0, 0, 0x00200000, 0x003FFFFF, 0x000007FF, 0xFFE00000);
+    DO_MIPS32_r2_s(multu, 23, 0, 0, 0x00400000, 0x007FFFFF, 0x00001FFF, 0xFFC00000);
+    DO_MIPS32_r2_s(multu, 24, 0, 0, 0x00800000, 0x00FFFFFF, 0x00007FFF, 0xFF800000);
+    DO_MIPS32_r2_s(multu, 25, 0, 0, 0x01000000, 0x01FFFFFF, 0x0001FFFF, 0xFF000000);
+    DO_MIPS32_r2_s(multu, 26, 0, 0, 0x02000000, 0x03FFFFFF, 0x0007FFFF, 0xFE000000);
+    DO_MIPS32_r2_s(multu, 27, 0, 0, 0x04000000, 0x07FFFFFF, 0x001FFFFF, 0xFC000000);
+    DO_MIPS32_r2_s(multu, 28, 0, 0, 0x08000000, 0x0FFFFFFF, 0x007FFFFF, 0xF8000000);
+    DO_MIPS32_r2_s(multu, 29, 0, 0, 0x10000000, 0x1FFFFFFF, 0x01FFFFFF, 0xF0000000);
+    DO_MIPS32_r2_s(multu, 30, 0, 0, 0x20000000, 0x3FFFFFFF, 0x07FFFFFF, 0xE0000000);
+    DO_MIPS32_r2_s(multu, 31, 0, 0, 0x40000000, 0x7FFFFFFF, 0x1FFFFFFF, 0xC0000000);
+    DO_MIPS32_r2_s(multu, 32, 0, 0, 0x80000000, 0xFFFFFFFF, 0x7FFFFFFF, 0x80000000);
+    DO_MIPS32_r2_s(multu, 33, 0, 0, 0x00000000, 0x55555555, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(multu, 34, 0, 0, 0x55555555, 0x55555555, 0x1C71C71C, 0x38E38E39);
+    DO_MIPS32_r2_s(multu, 35, 0, 0, 0xAAAAAAAA, 0x55555555, 0x38E38E38, 0x71C71C72);
+    DO_MIPS32_r2_s(multu, 36, 0, 0, 0xFFFFFFFF, 0x55555555, 0x55555554, 0xAAAAAAAB);
+    DO_MIPS32_r2_s(multu, 37, 0, 0, 0xAAAAAAAA, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r2_s(multu, 38, 0, 0, 0xAAAAAAAA, 0x55555555, 0x38E38E38, 0x71C71C72);
+    DO_MIPS32_r2_s(multu, 39, 0, 0, 0xAAAAAAAA, 0xAAAAAAAA, 0x71C71C70, 0xE38E38E4);
+    DO_MIPS32_r2_s(multu, 40, 0, 0, 0xAAAAAAAA, 0xFFFFFFFF, 0xAAAAAAA9, 0x55555556);
+    DO_MIPS32_r2_s(multu, 41, 0, 0, 0x7FFFFFFF, 0x7FFFFFFF, 0x3FFFFFFF, 0x00000001);
+    DO_MIPS32_r2_s(multu, 42, 0, 0, 0x7FFFFFFF, 0x80000000, 0x3FFFFFFF, 0x80000000);
+    DO_MIPS32_r2_s(multu, 43, 0, 0, 0x7FFFFFFF, 0xFFFFFFFF, 0x7FFFFFFE, 0x80000001);
+    DO_MIPS32_r2_s(multu, 44, 0, 0, 0x80000000, 0x7FFFFFFF, 0x3FFFFFFF, 0x80000000);
+    DO_MIPS32_r2_s(multu, 45, 0, 0, 0x80000000, 0x80000000, 0x40000000, 0x00000000);
+    DO_MIPS32_r2_s(multu, 46, 0, 0, 0x80000000, 0xFFFFFFFF, 0x7FFFFFFF, 0x80000000);
+    DO_MIPS32_r2_s(multu, 47, 0, 0, 0xFFFFFFFF, 0x7FFFFFFF, 0x7FFFFFFE, 0x80000001);
+    DO_MIPS32_r2_s(multu, 48, 0, 0, 0xFFFFFFFF, 0x80000000, 0x7FFFFFFF, 0x80000000);
+    DO_MIPS32_r2_s(multu, 49, 0, 0, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFE, 0x00000001);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/slt.c b/tests/tcg/mips/user/isa/mips32/arithmatic/slt.c
new file mode 100644
index 0000000000..74f22c365e
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/slt.c
@@ -0,0 +1,61 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r(slt, 0, 0x00000000, 0x00000000, 0);
+    DO_MIPS32_r(slt, 1, 0x00000001, 0x00000001, 0);
+    DO_MIPS32_r(slt, 2, 0x00000002, 0x00000003, 1);
+    DO_MIPS32_r(slt, 3, 0x00000005, 0x00000007, 1);
+    DO_MIPS32_r(slt, 4, 0x0000000B, 0x0000000F, 1);
+    DO_MIPS32_r(slt, 5, 0x00000017, 0x0000001F, 1);
+    DO_MIPS32_r(slt, 6, 0x0000002F, 0x0000003F, 1);
+    DO_MIPS32_r(slt, 7, 0x0000005F, 0x0000007F, 1);
+    DO_MIPS32_r(slt, 8, 0x000000BF, 0x000000FF, 1);
+    DO_MIPS32_r(slt, 9, 0x0000017F, 0x000001FF, 1);
+    DO_MIPS32_r(slt, 10, 0x000002FF, 0x000003FF, 1);
+    DO_MIPS32_r(slt, 11, 0x000005FF, 0x000007FF, 1);
+    DO_MIPS32_r(slt, 12, 0x00000BFF, 0x00000FFF, 1);
+    DO_MIPS32_r(slt, 13, 0x000017FF, 0x00001FFF, 1);
+    DO_MIPS32_r(slt, 14, 0x00002FFF, 0x00003FFF, 1);
+    DO_MIPS32_r(slt, 15, 0x00005FFF, 0x00007FFF, 1);
+    DO_MIPS32_r(slt, 16, 0x0000BFFF, 0x0000FFFF, 1);
+    DO_MIPS32_r(slt, 17, 0x00017FFF, 0x0001FFFF, 1);
+    DO_MIPS32_r(slt, 18, 0x0002FFFF, 0x0003FFFF, 1);
+    DO_MIPS32_r(slt, 19, 0x0005FFFF, 0x0007FFFF, 1);
+    DO_MIPS32_r(slt, 20, 0x000BFFFF, 0x000FFFFF, 1);
+    DO_MIPS32_r(slt, 21, 0x0017FFFF, 0x001FFFFF, 1);
+    DO_MIPS32_r(slt, 22, 0x002FFFFF, 0x003FFFFF, 1);
+    DO_MIPS32_r(slt, 23, 0x005FFFFF, 0x007FFFFF, 1);
+    DO_MIPS32_r(slt, 24, 0x00BFFFFF, 0x00FFFFFF, 1);
+    DO_MIPS32_r(slt, 25, 0x017FFFFF, 0x01FFFFFF, 1);
+    DO_MIPS32_r(slt, 26, 0x02FFFFFF, 0x03FFFFFF, 1);
+    DO_MIPS32_r(slt, 27, 0x05FFFFFF, 0x07FFFFFF, 1);
+    DO_MIPS32_r(slt, 28, 0x0BFFFFFF, 0x0FFFFFFF, 1);
+    DO_MIPS32_r(slt, 29, 0x17FFFFFF, 0x1FFFFFFF, 1);
+    DO_MIPS32_r(slt, 30, 0x2FFFFFFF, 0x3FFFFFFF, 1);
+    DO_MIPS32_r(slt, 31, 0x5FFFFFFF, 0x7FFFFFFF, 1);
+    DO_MIPS32_r(slt, 32, 0xBFFFFFFF, 0xFFFFFFFF, 1);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/slti.c b/tests/tcg/mips/user/isa/mips32/arithmatic/slti.c
new file mode 100644
index 0000000000..823af3e4d4
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/slti.c
@@ -0,0 +1,48 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_i(slti, 0, 0x0000, 0x00000000, 0);
+    DO_MIPS32_i(slti, 1, 0x0001, 0x00000001, 0);
+    DO_MIPS32_i(slti, 2, 0x0003, 0x00000002, 1);
+    DO_MIPS32_i(slti, 3, 0x0007, 0x00000005, 1);
+    DO_MIPS32_i(slti, 4, 0x000F, 0x0000000B, 1);
+    DO_MIPS32_i(slti, 5, 0x001F, 0x00000017, 1);
+    DO_MIPS32_i(slti, 6, 0x003F, 0x0000002F, 1);
+    DO_MIPS32_i(slti, 7, 0x007F, 0x0000005F, 1);
+    DO_MIPS32_i(slti, 8, 0x00FF, 0x000000BF, 1);
+    DO_MIPS32_i(slti, 9, 0x01FF, 0x0000017F, 1);
+    DO_MIPS32_i(slti, 10, 0x03FF, 0x000002FF, 1);
+    DO_MIPS32_i(slti, 11, 0x07FF, 0x000005FF, 1);
+    DO_MIPS32_i(slti, 12, 0x0FFF, 0x00000BFF, 1);
+    DO_MIPS32_i(slti, 13, 0x1FFF, 0x000017FF, 1);
+    DO_MIPS32_i(slti, 14, 0x3FFF, 0x00002FFF, 1);
+    DO_MIPS32_i(slti, 15, 0x7FFF, 0x00005FFF, 1);
+    DO_MIPS32_i(slti, 16, 0xFFFF, 0x0000BFFF, 0);
+    DO_MIPS32_i(slti, 17, 0xFFFF, 0x7FFFFFFF, 0);
+    DO_MIPS32_i(slti, 18, 0x8000, 0x7FFFFFFF, 0);
+    DO_MIPS32_i(slti, 19, 0x5555, 0x00000000, 1);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/sltiu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/sltiu.c
new file mode 100644
index 0000000000..5644d4d1c1
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/sltiu.c
@@ -0,0 +1,48 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_i(sltiu, 0, 0x0000, 0x00000000, 0);
+    DO_MIPS32_i(sltiu, 1, 0x0001, 0x00000001, 0);
+    DO_MIPS32_i(sltiu, 2, 0x0003, 0x00000002, 1);
+    DO_MIPS32_i(sltiu, 3, 0x0007, 0x00000005, 1);
+    DO_MIPS32_i(sltiu, 4, 0x000F, 0x0000000B, 1);
+    DO_MIPS32_i(sltiu, 5, 0x001F, 0x00000017, 1);
+    DO_MIPS32_i(sltiu, 6, 0x003F, 0x0000002F, 1);
+    DO_MIPS32_i(sltiu, 7, 0x007F, 0x0000005F, 1);
+    DO_MIPS32_i(sltiu, 8, 0x00FF, 0x000000BF, 1);
+    DO_MIPS32_i(sltiu, 9, 0x01FF, 0x0000017F, 1);
+    DO_MIPS32_i(sltiu, 10, 0x03FF, 0x000002FF, 1);
+    DO_MIPS32_i(sltiu, 11, 0x07FF, 0x000005FF, 1);
+    DO_MIPS32_i(sltiu, 12, 0x0FFF, 0x00000BFF, 1);
+    DO_MIPS32_i(sltiu, 13, 0x1FFF, 0x000017FF, 1);
+    DO_MIPS32_i(sltiu, 14, 0x3FFF, 0x00002FFF, 1);
+    DO_MIPS32_i(sltiu, 15, 0x7FFF, 0x00005FFF, 1);
+    DO_MIPS32_i(sltiu, 16, 0xFFFF, 0x0000BFFF, 1);
+    DO_MIPS32_i(sltiu, 17, 0x5555, 0x00000000, 1);
+    DO_MIPS32_i(sltiu, 18, 0xFFFF, 0x7FFFFFFF, 1);
+    DO_MIPS32_i(sltiu, 19, 0x8000, 0x7FFFFFFF, 1);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/sltu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/sltu.c
new file mode 100644
index 0000000000..bba246626e
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/sltu.c
@@ -0,0 +1,61 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r(sltu, 0, 0x00000000, 0x00000000, 0);
+    DO_MIPS32_r(sltu, 1, 0x00000001, 0x00000001, 0);
+    DO_MIPS32_r(sltu, 2, 0x00000002, 0x00000003, 1);
+    DO_MIPS32_r(sltu, 3, 0x00000005, 0x00000007, 1);
+    DO_MIPS32_r(sltu, 4, 0x0000000B, 0x0000000F, 1);
+    DO_MIPS32_r(sltu, 5, 0x00000017, 0x0000001F, 1);
+    DO_MIPS32_r(sltu, 6, 0x0000002F, 0x0000003F, 1);
+    DO_MIPS32_r(sltu, 7, 0x0000005F, 0x0000007F, 1);
+    DO_MIPS32_r(sltu, 8, 0x000000BF, 0x000000FF, 1);
+    DO_MIPS32_r(sltu, 9, 0x0000017F, 0x000001FF, 1);
+    DO_MIPS32_r(sltu, 10, 0x000002FF, 0x000003FF, 1);
+    DO_MIPS32_r(sltu, 11, 0x000005FF, 0x000007FF, 1);
+    DO_MIPS32_r(sltu, 12, 0x00000BFF, 0x00000FFF, 1);
+    DO_MIPS32_r(sltu, 13, 0x000017FF, 0x00001FFF, 1);
+    DO_MIPS32_r(sltu, 14, 0x00002FFF, 0x00003FFF, 1);
+    DO_MIPS32_r(sltu, 15, 0x00005FFF, 0x00007FFF, 1);
+    DO_MIPS32_r(sltu, 16, 0x0000BFFF, 0x0000FFFF, 1);
+    DO_MIPS32_r(sltu, 17, 0x00017FFF, 0x0001FFFF, 1);
+    DO_MIPS32_r(sltu, 18, 0x0002FFFF, 0x0003FFFF, 1);
+    DO_MIPS32_r(sltu, 19, 0x0005FFFF, 0x0007FFFF, 1);
+    DO_MIPS32_r(sltu, 20, 0x000BFFFF, 0x000FFFFF, 1);
+    DO_MIPS32_r(sltu, 21, 0x0017FFFF, 0x001FFFFF, 1);
+    DO_MIPS32_r(sltu, 22, 0x002FFFFF, 0x003FFFFF, 1);
+    DO_MIPS32_r(sltu, 23, 0x005FFFFF, 0x007FFFFF, 1);
+    DO_MIPS32_r(sltu, 24, 0x00BFFFFF, 0x00FFFFFF, 1);
+    DO_MIPS32_r(sltu, 25, 0x017FFFFF, 0x01FFFFFF, 1);
+    DO_MIPS32_r(sltu, 26, 0x02FFFFFF, 0x03FFFFFF, 1);
+    DO_MIPS32_r(sltu, 27, 0x05FFFFFF, 0x07FFFFFF, 1);
+    DO_MIPS32_r(sltu, 28, 0x0BFFFFFF, 0x0FFFFFFF, 1);
+    DO_MIPS32_r(sltu, 29, 0x17FFFFFF, 0x1FFFFFFF, 1);
+    DO_MIPS32_r(sltu, 30, 0x2FFFFFFF, 0x3FFFFFFF, 1);
+    DO_MIPS32_r(sltu, 31, 0x5FFFFFFF, 0x7FFFFFFF, 1);
+    DO_MIPS32_r(sltu, 32, 0xBFFFFFFF, 0xFFFFFFFF, 1);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/sub.c b/tests/tcg/mips/user/isa/mips32/arithmatic/sub.c
new file mode 100644
index 0000000000..86f747c2e7
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/sub.c
@@ -0,0 +1,104 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r(sub, 0, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r(sub, 1, 0x00000001, 0x00000001, 0x00000000);
+    DO_MIPS32_r(sub, 2, 0x00000002, 0x00000003, 0xFFFFFFFF);
+    DO_MIPS32_r(sub, 3, 0x00000004, 0x00000006, 0xFFFFFFFE);
+    DO_MIPS32_r(sub, 4, 0x00000008, 0x0000000C, 0xFFFFFFFC);
+    DO_MIPS32_r(sub, 5, 0x00000010, 0x00000018, 0xFFFFFFF8);
+    DO_MIPS32_r(sub, 6, 0x00000020, 0x00000030, 0xFFFFFFF0);
+    DO_MIPS32_r(sub, 7, 0x00000040, 0x00000060, 0xFFFFFFE0);
+    DO_MIPS32_r(sub, 8, 0x00000080, 0x000000C0, 0xFFFFFFC0);
+    DO_MIPS32_r(sub, 9, 0x00000100, 0x00000180, 0xFFFFFF80);
+    DO_MIPS32_r(sub, 10, 0x00000200, 0x00000300, 0xFFFFFF00);
+    DO_MIPS32_r(sub, 11, 0x00000400, 0x00000600, 0xFFFFFE00);
+    DO_MIPS32_r(sub, 12, 0x00000800, 0x00000C00, 0xFFFFFC00);
+    DO_MIPS32_r(sub, 13, 0x00001000, 0x00001800, 0xFFFFF800);
+    DO_MIPS32_r(sub, 14, 0x00002000, 0x00003000, 0xFFFFF000);
+    DO_MIPS32_r(sub, 15, 0x00004000, 0x00006000, 0xFFFFE000);
+    DO_MIPS32_r(sub, 16, 0x00008000, 0x0000C000, 0xFFFFC000);
+    DO_MIPS32_r(sub, 17, 0x00010000, 0x00018000, 0xFFFF8000);
+    DO_MIPS32_r(sub, 18, 0x00020000, 0x00030000, 0xFFFF0000);
+    DO_MIPS32_r(sub, 19, 0x00040000, 0x00060000, 0xFFFE0000);
+    DO_MIPS32_r(sub, 20, 0x00080000, 0x000C0000, 0xFFFC0000);
+    DO_MIPS32_r(sub, 21, 0x00100000, 0x00180000, 0xFFF80000);
+    DO_MIPS32_r(sub, 22, 0x00200000, 0x00300000, 0xFFF00000);
+    DO_MIPS32_r(sub, 23, 0x00400000, 0x00600000, 0xFFE00000);
+    DO_MIPS32_r(sub, 24, 0x00800000, 0x00C00000, 0xFFC00000);
+    DO_MIPS32_r(sub, 25, 0x01000000, 0x01800000, 0xFF800000);
+    DO_MIPS32_r(sub, 26, 0x02000000, 0x03000000, 0xFF000000);
+    DO_MIPS32_r(sub, 27, 0x04000000, 0x06000000, 0xFE000000);
+    DO_MIPS32_r(sub, 28, 0x08000000, 0x0C000000, 0xFC000000);
+    DO_MIPS32_r(sub, 29, 0x10000000, 0x18000000, 0xF8000000);
+    DO_MIPS32_r(sub, 30, 0x20000000, 0x30000000, 0xF0000000);
+    DO_MIPS32_r(sub, 31, 0x40000000, 0x60000000, 0xE0000000);
+    DO_MIPS32_r(sub, 32, 0x80000000, 0xC0000000, 0xC0000000);
+    DO_MIPS32_r(sub, 33, 0x00000000, 0x80000000, 0x80000000);
+    DO_MIPS32_r(sub, 34, 0x80000001, 0x80000001, 0x00000000);
+    DO_MIPS32_r(sub, 35, 0xC0000003, 0x40000002, 0x80000001);
+    DO_MIPS32_r(sub, 36, 0xE0000007, 0x20000004, 0xC0000003);
+    DO_MIPS32_r(sub, 37, 0xF000000F, 0x10000008, 0xE0000007);
+    DO_MIPS32_r(sub, 38, 0xF800001F, 0x08000010, 0xF000000F);
+    DO_MIPS32_r(sub, 39, 0xFC00003F, 0x04000020, 0xF800001F);
+    DO_MIPS32_r(sub, 40, 0xFE00007F, 0x02000040, 0xFC00003F);
+    DO_MIPS32_r(sub, 41, 0xFF0000FF, 0x01000080, 0xFE00007F);
+    DO_MIPS32_r(sub, 42, 0xFF8001FF, 0x00800100, 0xFF0000FF);
+    DO_MIPS32_r(sub, 43, 0xFFC003FF, 0x00400200, 0xFF8001FF);
+    DO_MIPS32_r(sub, 44, 0xFFE007FF, 0x00200400, 0xFFC003FF);
+    DO_MIPS32_r(sub, 45, 0xFFF00FFF, 0x00100800, 0xFFE007FF);
+    DO_MIPS32_r(sub, 46, 0xFFF81FFF, 0x00081000, 0xFFF00FFF);
+    DO_MIPS32_r(sub, 47, 0xFFFC3FFF, 0x00042000, 0xFFF81FFF);
+    DO_MIPS32_r(sub, 48, 0xFFFE7FFF, 0x00024000, 0xFFFC3FFF);
+    DO_MIPS32_r(sub, 49, 0xFFFFFFFF, 0x00018000, 0xFFFE7FFF);
+    DO_MIPS32_r(sub, 50, 0xFFFFFFFF, 0x00000000, 0xFFFFFFFF);
+    DO_MIPS32_r(sub, 51, 0xFFFFFFFF, 0x00018000, 0xFFFE7FFF);
+    DO_MIPS32_r(sub, 52, 0xFFFE7FFF, 0x0003C000, 0xFFFABFFF);
+    DO_MIPS32_r(sub, 53, 0xFFFC3FFF, 0x0007E000, 0xFFF45FFF);
+    DO_MIPS32_r(sub, 54, 0xFFF81FFF, 0x000FF000, 0xFFE82FFF);
+    DO_MIPS32_r(sub, 55, 0xFFF00FFF, 0x001FF800, 0xFFD017FF);
+    DO_MIPS32_r(sub, 56, 0xFFE007FF, 0x003FFC00, 0xFFA00BFF);
+    DO_MIPS32_r(sub, 57, 0xFFC003FF, 0x007FFE00, 0xFF4005FF);
+    DO_MIPS32_r(sub, 58, 0xFF8001FF, 0x00FFFF00, 0xFE8002FF);
+    DO_MIPS32_r(sub, 59, 0xFF0000FF, 0x01FFFF80, 0xFD00017F);
+    DO_MIPS32_r(sub, 60, 0xFE00007F, 0x03FFFFC0, 0xFA0000BF);
+    DO_MIPS32_r(sub, 61, 0xFC00003F, 0x07FFFFE0, 0xF400005F);
+    DO_MIPS32_r(sub, 62, 0xF800001F, 0x0FFFFFF0, 0xE800002F);
+    DO_MIPS32_r(sub, 63, 0xF000000F, 0x1FFFFFF8, 0xD0000017);
+    DO_MIPS32_r(sub, 64, 0xE0000007, 0x3FFFFFFC, 0xA000000B);
+    DO_MIPS32_r(sub, 65, 0xC0000003, 0x7FFFFFFE, 0x40000005);
+    DO_MIPS32_r(sub, 66, 0x80000001, 0xFFFFFFFF, 0x80000002);
+    DO_MIPS32_r(sub, 67, 0x00000000, 0xFFFFFFFF, 0x00000001);
+    DO_MIPS32_r(sub, 68, 0x00000000, 0x55555555, 0xAAAAAAAB);
+    DO_MIPS32_r(sub, 69, 0x55555555, 0x55555555, 0x00000000);
+    DO_MIPS32_r(sub, 70, 0xAAAAAAAA, 0x15555555, 0x95555555);
+    DO_MIPS32_r(sub, 71, 0xFFFFFFFF, 0x55555555, 0xAAAAAAAA);
+    DO_MIPS32_r(sub, 72, 0xAAAAAAAA, 0x00000000, 0xAAAAAAAA);
+    DO_MIPS32_r(sub, 73, 0xAAAAAAAA, 0x15555555, 0x95555555);
+    DO_MIPS32_r(sub, 74, 0xAAAAAAAA, 0xAAAAAAAA, 0x00000000);
+    DO_MIPS32_r(sub, 75, 0xAAAAAAAA, 0xFFFFFFFF, 0xAAAAAAAB);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/mips/user/isa/mips32/arithmatic/subu.c b/tests/tcg/mips/user/isa/mips32/arithmatic/subu.c
new file mode 100644
index 0000000000..fe1df6a71e
--- /dev/null
+++ b/tests/tcg/mips/user/isa/mips32/arithmatic/subu.c
@@ -0,0 +1,108 @@
+/*
+ * MIPS instruction test case
+ *
+ *  Copyright (c) 2022 Jiaxun Yang
+ *
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/test_utils_32.h"
+
+int main(void)
+{
+    int ret = 0;
+    int pass_count = 0;
+    int fail_count = 0;
+
+    DO_MIPS32_r(subu, 0, 0x00000000, 0x00000000, 0x00000000);
+    DO_MIPS32_r(subu, 1, 0x00000001, 0x00000001, 0x00000000);
+    DO_MIPS32_r(subu, 2, 0x00000002, 0x00000003, 0xFFFFFFFF);
+    DO_MIPS32_r(subu, 3, 0x00000004, 0x00000006, 0xFFFFFFFE);
+    DO_MIPS32_r(subu, 4, 0x00000008, 0x0000000C, 0xFFFFFFFC);
+    DO_MIPS32_r(subu, 5, 0x00000010, 0x00000018, 0xFFFFFFF8);
+    DO_MIPS32_r(subu, 6, 0x00000020, 0x00000030, 0xFFFFFFF0);
+    DO_MIPS32_r(subu, 7, 0x00000040, 0x00000060, 0xFFFFFFE0);
+    DO_MIPS32_r(subu, 8, 0x00000080, 0x000000C0, 0xFFFFFFC0);
+    DO_MIPS32_r(subu, 9, 0x00000100, 0x00000180, 0xFFFFFF80);
+    DO_MIPS32_r(subu, 10, 0x00000200, 0x00000300, 0xFFFFFF00);
+    DO_MIPS32_r(subu, 11, 0x00000400, 0x00000600, 0xFFFFFE00);
+    DO_MIPS32_r(subu, 12, 0x00000800, 0x00000C00, 0xFFFFFC00);
+    DO_MIPS32_r(subu, 13, 0x00001000, 0x00001800, 0xFFFFF800);
+    DO_MIPS32_r(subu, 14, 0x00002000, 0x00003000, 0xFFFFF000);
+    DO_MIPS32_r(subu, 15, 0x00004000, 0x00006000, 0xFFFFE000);
+    DO_MIPS32_r(subu, 16, 0x00008000, 0x0000C000, 0xFFFFC000);
+    DO_MIPS32_r(subu, 17, 0x00010000, 0x00018000, 0xFFFF8000);
+    DO_MIPS32_r(subu, 18, 0x00020000, 0x00030000, 0xFFFF0000);
+    DO_MIPS32_r(subu, 19, 0x00040000, 0x00060000, 0xFFFE0000);
+    DO_MIPS32_r(subu, 20, 0x00080000, 0x000C0000, 0xFFFC0000);
+    DO_MIPS32_r(subu, 21, 0x00100000, 0x00180000, 0xFFF80000);
+    DO_MIPS32_r(subu, 22, 0x00200000, 0x00300000, 0xFFF00000);
+    DO_MIPS32_r(subu, 23, 0x00400000, 0x00600000, 0xFFE00000);
+    DO_MIPS32_r(subu, 24, 0x00800000, 0x00C00000, 0xFFC00000);
+    DO_MIPS32_r(subu, 25, 0x01000000, 0x01800000, 0xFF800000);
+    DO_MIPS32_r(subu, 26, 0x02000000, 0x03000000, 0xFF000000);
+    DO_MIPS32_r(subu, 27, 0x04000000, 0x06000000, 0xFE000000);
+    DO_MIPS32_r(subu, 28, 0x08000000, 0x0C000000, 0xFC000000);
+    DO_MIPS32_r(subu, 29, 0x10000000, 0x18000000, 0xF8000000);
+    DO_MIPS32_r(subu, 30, 0x20000000, 0x30000000, 0xF0000000);
+    DO_MIPS32_r(subu, 31, 0x40000000, 0x60000000, 0xE0000000);
+    DO_MIPS32_r(subu, 32, 0x80000000, 0xC0000000, 0xC0000000);
+    DO_MIPS32_r(subu, 33, 0x00000000, 0x80000000, 0x80000000);
+    DO_MIPS32_r(subu, 34, 0x80000001, 0x80000001, 0x00000000);
+    DO_MIPS32_r(subu, 35, 0xC0000003, 0x40000002, 0x80000001);
+    DO_MIPS32_r(subu, 36, 0xE0000007, 0x20000004, 0xC0000003);
+    DO_MIPS32_r(subu, 37, 0xF000000F, 0x10000008, 0xE0000007);
+    DO_MIPS32_r(subu, 38, 0xF800001F, 0x08000010, 0xF000000F);
+    DO_MIPS32_r(subu, 39, 0xFC00003F, 0x04000020, 0xF800001F);
+    DO_MIPS32_r(subu, 40, 0xFE00007F, 0x02000040, 0xFC00003F);
+    DO_MIPS32_r(subu, 41, 0xFF0000FF, 0x01000080, 0xFE00007F);
+    DO_MIPS32_r(subu, 42, 0xFF8001FF, 0x00800100, 0xFF0000FF);
+    DO_MIPS32_r(subu, 43, 0xFFC003FF, 0x00400200, 0xFF8001FF);
+    DO_MIPS32_r(subu, 44, 0xFFE007FF, 0x00200400, 0xFFC003FF);
+    DO_MIPS32_r(subu, 45, 0xFFF00FFF, 0x00100800, 0xFFE007FF);
+    DO_MIPS32_r(subu, 46, 0xFFF81FFF, 0x00081000, 0xFFF00FFF);
+    DO_MIPS32_r(subu, 47, 0xFFFC3FFF, 0x00042000, 0xFFF81FFF);
+    DO_MIPS32_r(subu, 48, 0xFFFE7FFF, 0x00024000, 0xFFFC3FFF);
+    DO_MIPS32_r(subu, 49, 0xFFFFFFFF, 0x00018000, 0xFFFE7FFF);
+    DO_MIPS32_r(subu, 50, 0xFFFFFFFF, 0x00000000, 0xFFFFFFFF);
+    DO_MIPS32_r(subu, 51, 0xFFFFFFFF, 0x00018000, 0xFFFE7FFF);
+    DO_MIPS32_r(subu, 52, 0xFFFE7FFF, 0x0003C000, 0xFFFABFFF);
+    DO_MIPS32_r(subu, 53, 0xFFFC3FFF, 0x0007E000, 0xFFF45FFF);
+    DO_MIPS32_r(subu, 54, 0xFFF81FFF, 0x000FF000, 0xFFE82FFF);
+    DO_MIPS32_r(subu, 55, 0xFFF00FFF, 0x001FF800, 0xFFD017FF);
+    DO_MIPS32_r(subu, 56, 0xFFE007FF, 0x003FFC00, 0xFFA00BFF);
+    DO_MIPS32_r(subu, 57, 0xFFC003FF, 0x007FFE00, 0xFF4005FF);
+    DO_MIPS32_r(subu, 58, 0xFF8001FF, 0x00FFFF00, 0xFE8002FF);
+    DO_MIPS32_r(subu, 59, 0xFF0000FF, 0x01FFFF80, 0xFD00017F);
+    DO_MIPS32_r(subu, 60, 0xFE00007F, 0x03FFFFC0, 0xFA0000BF);
+    DO_MIPS32_r(subu, 61, 0xFC00003F, 0x07FFFFE0, 0xF400005F);
+    DO_MIPS32_r(subu, 62, 0xF800001F, 0x0FFFFFF0, 0xE800002F);
+    DO_MIPS32_r(subu, 63, 0xF000000F, 0x1FFFFFF8, 0xD0000017);
+    DO_MIPS32_r(subu, 64, 0xE0000007, 0x3FFFFFFC, 0xA000000B);
+    DO_MIPS32_r(subu, 65, 0xC0000003, 0x7FFFFFFE, 0x40000005);
+    DO_MIPS32_r(subu, 66, 0x80000001, 0xFFFFFFFF, 0x80000002);
+    DO_MIPS32_r(subu, 67, 0x00000000, 0xFFFFFFFF, 0x00000001);
+    DO_MIPS32_r(subu, 68, 0x00000000, 0x55555555, 0xAAAAAAAB);
+    DO_MIPS32_r(subu, 69, 0x55555555, 0x55555555, 0x00000000);
+    DO_MIPS32_r(subu, 70, 0xAAAAAAAA, 0x55555555, 0x55555555);
+    DO_MIPS32_r(subu, 71, 0xFFFFFFFF, 0x55555555, 0xAAAAAAAA);
+    DO_MIPS32_r(subu, 72, 0xAAAAAAAA, 0x00000000, 0xAAAAAAAA);
+    DO_MIPS32_r(subu, 73, 0xAAAAAAAA, 0x55555555, 0x55555555);
+    DO_MIPS32_r(subu, 74, 0xAAAAAAAA, 0xAAAAAAAA, 0x00000000);
+    DO_MIPS32_r(subu, 75, 0xAAAAAAAA, 0xFFFFFFFF, 0xAAAAAAAB);
+    DO_MIPS32_r(subu, 76, 0x7FFFFFFF, 0xFFFFFFFF, 0x80000000);
+    DO_MIPS32_r(subu, 77, 0x7FFFFFFF, 0x80000000, 0xFFFFFFFF);
+    DO_MIPS32_r(subu, 78, 0x80000000, 0x00000001, 0x7FFFFFFF);
+    DO_MIPS32_r(subu, 79, 0x80000000, 0x7FFFFFFF, 0x00000001);
+
+    printf("%s: PASS: %d, FAIL: %d\n", __FILE__, pass_count, fail_count);
+
+    if (fail_count) {
+        ret = -1;
+    }
+
+    return ret;
+}
-- 
2.34.1


