Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA02DE206
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:32:50 +0100 (CET)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqE09-0005Mq-Os
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuw-00079E-Ax
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:26 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuu-000399-4d
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:26 -0500
Received: by mail-wr1-x431.google.com with SMTP id t16so1767301wra.3
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6NSRnSlmnhaO7uroZIq5QNa4woFGPYOMJTjkY2C6pnY=;
 b=ASCm8sFei1seHt7FtJAOyREzGJQFp/ZN5JfIgwE1WYv/k1L3ePnl2W9kTzjJ1JH22/
 I3qH1biEH21B+ABF0jwkWBJn3ObT/c1SH71eg71msjfvePeS4OoUgZR+BZdjO19bkbIa
 67ETD98lbhL2DB3y/wEj/LE04wSxO8MFxPVyH7nBHPaAFIJNaOhhqqSumtO19e00AfHe
 1C23MvzfC3kuAJ30KC9Eoy642E5RX8md/5Rtuykgia87jhZmke6Qhkg3brAqnMMbxLgO
 8YCxDJQ1MktnMTfZTplk9QdW18gkQuqbpcuy5deT6/KD3GICEFg197HJh4IyhmK8sZbT
 7cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6NSRnSlmnhaO7uroZIq5QNa4woFGPYOMJTjkY2C6pnY=;
 b=KIrYhNIa1nnJcikiy7r/PWTFhMlP1iOlT2AFZrUNoKlL9Zcghh8CdubnvCPEVrjJ0P
 p4pA46YmbwROAtROE/oBB4zkQpVHfWN0J0qzPD3DTlWMNlRykEwPrNL1XktMvXeq76WY
 54rJk6bIlHMDxVtfk0op3m/FT2iV1cLJQVPa2pEiCBHzBRoYUfUs3zrBt90mxju8/3i7
 OACv8PCIig2feN1QNDx0E1ZFNVSk/doKdkqAAkKUjPgUEfZQFzw2a5NDsWOJMYO1KvxV
 Oza2EdcMNFjyf7LetsN+aKSsp64qfvzs/YJsV5WdzcRtoW+tIbAS+OYQEU0/KZ8IlRT6
 HW5w==
X-Gm-Message-State: AOAM532OA1rOjJYSsb+QURegC2UJisjAOZIGbMNCiSq61fXDCar5tull
 Adaq0KRfdgZfQHs/dLPZl//H2g==
X-Google-Smtp-Source: ABdhPJx/MjkTIdE5Ra4gg3H/6bEDIbKhjhZF2+GTdhzPzCxHYYZJGNu7MgxCABNnNHNlHqvHMoqDzA==
X-Received: by 2002:adf:9d49:: with SMTP id o9mr3941424wre.413.1608290842800; 
 Fri, 18 Dec 2020 03:27:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o13sm10681961wmc.44.2020.12.18.03.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:27:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 909B31FF98;
 Fri, 18 Dec 2020 11:27:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
Date: Fri, 18 Dec 2020 11:27:07 +0000
Message-Id: <20201218112707.28348-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201218112707.28348-1-alex.bennee@linaro.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Luis Machado <luis.machado@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While GDB can work with any XML description given to it there is
special handling for SVE registers on the GDB side which makes the
users life a little better. The changes aren't that major and all the
registers save the $vg reported the same. All that changes is:

  - report org.gnu.gdb.aarch64.sve
  - use gdb nomenclature for names and types
  - minor re-ordering of the types to match reference
  - re-enable ieee_half (as we know gdb supports it now)
  - $vg is now a 64 bit int
  - check $vN and $zN aliasing in test

[NOTE: there seems a limitation on the indexing of the pseudo $vN
registers which I'm not sure if it's intentional]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Luis Machado <luis.machado@linaro.org>
---
 target/arm/gdbstub.c                        | 75 ++++++++-------------
 target/arm/helper.c                         |  2 +-
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py | 11 +++
 3 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 866595b4f1..a8fff2a3d0 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] = {
     { "uint128", 128, 'q', 'u' },
     { "int128", 128, 'q', 's' },
     /* 64 bit */
+    { "ieee_double", 64, 'd', 'f' },
     { "uint64", 64, 'd', 'u' },
     { "int64", 64, 'd', 's' },
-    { "ieee_double", 64, 'd', 'f' },
     /* 32 bit */
+    { "ieee_single", 32, 's', 'f' },
     { "uint32", 32, 's', 'u' },
     { "int32", 32, 's', 's' },
-    { "ieee_single", 32, 's', 'f' },
     /* 16 bit */
+    { "ieee_half", 16, 'h', 'f' },
     { "uint16", 16, 'h', 'u' },
     { "int16", 16, 'h', 's' },
-    /*
-     * TODO: currently there is no reliable way of telling
-     * if the remote gdb actually understands ieee_half so
-     * we don't expose it in the target description for now.
-     * { "ieee_half", 16, 'h', 'f' },
-     */
     /* bytes */
     { "uint8", 8, 'b', 'u' },
     { "int8", 8, 'b', 's' },
@@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     g_autoptr(GString) ts = g_string_new("");
-    int i, bits, reg_width = (cpu->sve_max_vq * 128);
+    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
     info->num = 0;
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
         int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "vq%d%c%c", count,
-                        vec_lanes[i].sz, vec_lanes[i].suffix);
+        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
         g_string_append_printf(s,
                                "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
                                ts->str, vec_lanes[i].gdb_type, count);
@@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
-    for (bits = 128; bits >= 8; bits /= 2) {
-        int count = reg_width / bits;
-        g_string_append_printf(s, "<union id=\"vq%dn\">", count);
-        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-            if (vec_lanes[i].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%d%c%c\"/>",
-                                       vec_lanes[i].suffix,
-                                       count,
-                                       vec_lanes[i].sz, vec_lanes[i].suffix);
+    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
+        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
+            if (vec_lanes[j].size == bits) {
+                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
+                                       vec_lanes[j].suffix,
+                                       vec_lanes[j].sz, vec_lanes[j].suffix);
             }
         }
         g_string_append(s, "</union>");
     }
     /* And now the final union of unions */
-    g_string_append(s, "<union id=\"vq\">");
-    for (bits = 128; bits >= 8; bits /= 2) {
-        int count = reg_width / bits;
-        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-            if (vec_lanes[i].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%dn\"/>",
-                                       vec_lanes[i].sz, count);
-                break;
-            }
-        }
+    g_string_append(s, "<union id=\"svev\">");
+    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
+                               suf[i], suf[i]);
     }
     g_string_append(s, "</union>");
 
+    /* Finally the sve prefix type */
+    g_string_append_printf(s,
+                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
+                           reg_width / 8);
+
     /* Then define each register in parts for each vq */
     for (i = 0; i < 32; i++) {
         g_string_append_printf(s,
                                "<reg name=\"z%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"vq\"/>",
+                               " regnum=\"%d\" type=\"svev\"/>",
                                i, reg_width, base_reg++);
         info->num++;
     }
@@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
                            " regnum=\"%d\" group=\"float\""
                            " type=\"int\"/>", base_reg++);
     info->num += 2;
-    /*
-     * Predicate registers aren't so big they are worth splitting up
-     * but we do need to define a type to hold the array of quad
-     * references.
-     */
-    g_string_append_printf(s,
-                           "<vector id=\"vqp\" type=\"uint16\" count=\"%d\"/>",
-                           cpu->sve_max_vq);
+
     for (i = 0; i < 16; i++) {
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"vqp\"/>",
+                               " regnum=\"%d\" type=\"svep\"/>",
                                i, cpu->sve_max_vq * 16, base_reg++);
         info->num++;
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
-                           " type=\"vqp\"/>",
+                           " type=\"svep\"/>",
                            cpu->sve_max_vq * 16, base_reg++);
     g_string_append_printf(s,
                            "<reg name=\"vg\" bitsize=\"64\""
-                           " regnum=\"%d\" group=\"vector\""
-                           " type=\"uint32\"/>",
+                           " regnum=\"%d\" type=\"int\"/>",
                            base_reg++);
     info->num += 2;
     g_string_append_printf(s, "</feature>");
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b8bcd6903..8633b3eef6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
         int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
-        return gdb_get_reg32(buf, vq * 2);
+        return gdb_get_reg64(buf, vq * 2);
     }
     default:
         /* gdbstub asked for something out our range */
diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
index 972cf73c31..f8cdab2e14 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
@@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
         except gdb.error:
             report(False, "checking zregs (out of range)")
 
+        # check the v pseudo regs - I'm not sure if them capping out
+        # at [15] is intentional though.
+        try:
+            for i in range(0, 16):
+                val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
+                val_v = gdb.parse_and_eval("$v0.b.u[%d]" % i)
+                report(int(val_z) == int(val_v),
+                       "v0.b.u[%d] == z0.b.u[%d]" % (i, i))
+        except gdb.error:
+            report(False, "checking vregs (out of range)")
+
 
 def run_test():
     "Run through the tests one by one"
-- 
2.20.1


