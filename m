Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CDE44E6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 09:53:29 +0200 (CEST)
Received: from localhost ([::1]:57196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNuPY-0006HI-Rb
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 03:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtpv-0004ZH-OU
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 03:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtpt-00079x-QO
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 03:16:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43954)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNtpt-00078s-J6
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 03:16:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id c2so1006745wrr.10
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 00:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=izcvnlZHMqS1wnwvRoAGn568i0xGsOfYRGzh3VU8ggs=;
 b=UTy4r7Hb1Xz0ZxD1U6F2Nif6vTifO7lOlI8a/vrzSZ4WESlv3QMLhZ7el3YS9Gjs6U
 NERUe9H0YYGnsZ87p+mhVjjHjETIMlExqhEeFxJtkU3+eD6sNW8VfSSKT/Y95EoZQ+CD
 BhMjZT9gFeGaYIRNlI+5Azz+vQZVDqfsorjtAwlICfXB9sAVu/lix8JI9Z4/3vb3/6yd
 1ZypXJy4y1UD5X0ql675Lt2egMPhlKSCVCGtmueyzrIFBG7tkNv5EmGyBWhkVc59YUSD
 1X7YWP9Zm52IAvlIuJeYbMqaHOmUc6iRugBZArWEY0gz23NyWzvckTJ1/ReTyjnP8N8W
 rHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=izcvnlZHMqS1wnwvRoAGn568i0xGsOfYRGzh3VU8ggs=;
 b=TeWWWNTtzfiRaN1Y6G3keT0ynOll+GLH9Mup/pJHLYgD7S5EJafch7S7cERWNtNxYz
 PnlSS7n/7d+XLDFFposHs5RKujUEuAB0qAV23UaW17uoi+X7pZtbwcs3HauEcd54x86D
 Ptb4Pe+N7amZhhgJuptOG0aT9R3h7K6PztyzqrP0CIETRtB9/wlhPla1aP9Tr+mLYQqy
 j4yUFi7xvhAMXq+YQfO79/L4Wihk8cjxgjpCtFE1qujkEoCovfQKdOW+/KRluqpzJ8OE
 Jiko4Fqz4httPmZAYefJH8jW7m0Dfs9LgQxR1YDOJMGxHTNOB428m5K3ajL6lWCKa5A9
 VZxQ==
X-Gm-Message-State: APjAAAWAdSlmsM1VAzx0mlT6tmNjT+Y9xmvE2gwiAtevnHzcDo+BdbI2
 MvC1GCip0QcysCwAb9HAi/XY3w==
X-Google-Smtp-Source: APXvYqzM1LjL7ue6GP6ow9PgFkDjlmlGqcrZYae0h6dYhZN/V/a5AWWl0WmQRo2xGfTwOscNzA6WjA==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr1455405wrv.92.1571987796251;
 Fri, 25 Oct 2019 00:16:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k8sm2557850wrg.15.2019.10.25.00.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:16:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ECF491FFD8;
 Fri, 25 Oct 2019 07:37:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 66/73] tests/plugin: add instruction execution breakdown
Date: Fri, 25 Oct 2019 07:37:06 +0100
Message-Id: <20191025063713.23374-67-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org>
References: <20191025063713.23374-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This gives a break down of instruction classes and individual
instruction types.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/tests/plugin/Makefile b/tests/plugin/Makefile
index e74940eaac5..3656429d46b 100644
--- a/tests/plugin/Makefile
+++ b/tests/plugin/Makefile
@@ -11,6 +11,7 @@ NAMES += empty
 NAMES += insn
 NAMES += mem
 NAMES += hotblocks
+NAMES += howvec
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
diff --git a/tests/plugin/howvec.c b/tests/plugin/howvec.c
new file mode 100644
index 00000000000..58fa675e348
--- /dev/null
+++ b/tests/plugin/howvec.c
@@ -0,0 +1,352 @@
+/*
+ * Copyright (C) 2019, Alex Bennée <alex.bennee@linaro.org>
+ *
+ * How vectorised is this code?
+ *
+ * Attempt to measure the amount of vectorisation that has been done
+ * on some code by counting classes of instruction.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#include <inttypes.h>
+#include <assert.h>
+#include <stdlib.h>
+#include <inttypes.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+
+typedef enum {
+    COUNT_CLASS,
+    COUNT_INDIVIDUAL,
+    COUNT_NONE
+} CountType;
+
+static int limit = 50;
+static bool do_inline;
+static bool verbose;
+
+static GMutex lock;
+static GHashTable *insns;
+
+typedef struct {
+    const char *class;
+    const char *opt;
+    uint32_t mask;
+    uint32_t pattern;
+    CountType what;
+    uint64_t count;
+} InsnClassExecCount;
+
+typedef struct {
+    char *insn;
+    uint32_t opcode;
+    uint64_t count;
+    InsnClassExecCount *class;
+} InsnExecCount;
+
+/*
+ * Matchers for classes of instructions, order is important.
+ *
+ * Your most precise match must be before looser matches. If no match
+ * is found in the table we can create an individual entry.
+ *
+ * 31..28 27..24 23..20 19..16 15..12 11..8 7..4 3..0
+ */
+static InsnClassExecCount aarch64_insn_classes[] = {
+    /* "Reserved"" */
+    { "  UDEF",              "udef",   0xffff0000, 0x00000000, COUNT_NONE},
+    { "  SVE",               "sve",    0x1e000000, 0x04000000, COUNT_CLASS},
+    { "Reserved",            "res",    0x1e000000, 0x00000000, COUNT_CLASS},
+    /* Data Processing Immediate */
+    { "  PCrel addr",        "pcrel",  0x1f000000, 0x10000000, COUNT_CLASS},
+    { "  Add/Sub (imm,tags)","asit",   0x1f800000, 0x11800000, COUNT_CLASS},
+    { "  Add/Sub (imm)",     "asi",    0x1f000000, 0x11000000, COUNT_CLASS},
+    { "  Logical (imm)",     "logi",   0x1f800000, 0x12000000, COUNT_CLASS},
+    { "  Move Wide (imm)",   "movwi",  0x1f800000, 0x12800000, COUNT_CLASS},
+    { "  Bitfield",          "bitf",   0x1f800000, 0x13000000, COUNT_CLASS},
+    { "  Extract",           "extr",   0x1f800000, 0x13800000, COUNT_CLASS},
+    { "Data Proc Imm",       "dpri",   0x1c000000, 0x10000000, COUNT_CLASS},
+    /* Branches */
+    { "  Cond Branch (imm)", "cndb",   0xfe000000, 0x54000000, COUNT_CLASS},
+    { "  Exception Gen",     "excp",   0xff000000, 0xd4000000, COUNT_CLASS},
+    { "    NOP",             "nop",    0xffffffff, 0xd503201f, COUNT_NONE},
+    { "  Hints",             "hint",   0xfffff000, 0xd5032000, COUNT_CLASS},
+    { "  Barriers",          "barr",   0xfffff000, 0xd5033000, COUNT_CLASS},
+    { "  PSTATE",            "psta",   0xfff8f000, 0xd5004000, COUNT_CLASS},
+    { "  System Insn",       "sins",   0xffd80000, 0xd5080000, COUNT_CLASS},
+    { "  System Reg",        "sreg",   0xffd00000, 0xd5100000, COUNT_CLASS},
+    { "  Branch (reg)",      "breg",   0xfe000000, 0xd6000000, COUNT_CLASS},
+    { "  Branch (imm)",      "bimm",   0x7c000000, 0x14000000, COUNT_CLASS},
+    { "  Cmp & Branch",      "cmpb",   0x7e000000, 0x34000000, COUNT_CLASS},
+    { "  Tst & Branch",      "tstb",   0x7e000000, 0x36000000, COUNT_CLASS},
+    { "Branches",            "branch", 0x1c000000, 0x14000000, COUNT_CLASS},
+    /* Loads and Stores */
+    { "  AdvSimd ldstmult",  "advlsm", 0xbfbf0000, 0x0c000000, COUNT_CLASS},
+    { "  AdvSimd ldstmult++","advlsmp",0xbfb00000, 0x0c800000, COUNT_CLASS},
+    { "  AdvSimd ldst",      "advlss", 0xbf9f0000, 0x0d000000, COUNT_CLASS},
+    { "  AdvSimd ldst++",    "advlssp",0xbf800000, 0x0d800000, COUNT_CLASS},
+    { "  ldst excl",         "ldstx",  0x3f000000, 0x08000000, COUNT_CLASS},
+    { "    Prefetch",        "prfm",   0xff000000, 0xd8000000, COUNT_CLASS},
+    { "  Load Reg (lit)",    "ldlit",  0x1b000000, 0x18000000, COUNT_CLASS},
+    { "  ldst noalloc pair", "ldstnap",0x3b800000, 0x28000000, COUNT_CLASS},
+    { "  ldst pair",         "ldstp",  0x38000000, 0x28000000, COUNT_CLASS},
+    { "  ldst reg",          "ldstr",  0x3b200000, 0x38000000, COUNT_CLASS},
+    { "  Atomic ldst",       "atomic", 0x3b200c00, 0x38200000, COUNT_CLASS},
+    { "  ldst reg (reg off)","ldstro", 0x3b200b00, 0x38200800, COUNT_CLASS},
+    { "  ldst reg (pac)",    "ldstpa", 0x3b200200, 0x38200800, COUNT_CLASS},
+    { "  ldst reg (imm)",    "ldsti",  0x3b000000, 0x39000000, COUNT_CLASS},
+    { "Loads & Stores",      "ldst",   0x0a000000, 0x08000000, COUNT_CLASS},
+    /* Data Processing Register */
+    { "Data Proc Reg",       "dprr",   0x0e000000, 0x0a000000, COUNT_CLASS},
+    /* Scalar FP */
+    { "Scalar FP ",          "fpsimd", 0x0e000000, 0x0e000000, COUNT_CLASS},
+    /* Unclassified */
+    { "Unclassified",        "unclas", 0x00000000, 0x00000000, COUNT_CLASS},
+};
+
+static InsnClassExecCount sparc32_insn_classes[] = {
+    { "Call",                "call",   0xc0000000, 0x40000000, COUNT_CLASS},
+    { "Branch ICond",        "bcc",    0xc1c00000, 0x00800000, COUNT_CLASS},
+    { "Branch Fcond",        "fbcc",   0xc1c00000, 0x01800000, COUNT_CLASS},
+    { "SetHi",               "sethi",  0xc1c00000, 0x01000000, COUNT_CLASS},
+    { "FPU ALU",             "fpu",    0xc1f00000, 0x81a00000, COUNT_CLASS},
+    { "ALU",                 "alu",    0xc0000000, 0x80000000, COUNT_CLASS},
+    { "Load/Store",          "ldst",   0xc0000000, 0xc0000000, COUNT_CLASS},
+    /* Unclassified */
+    { "Unclassified",        "unclas", 0x00000000, 0x00000000, COUNT_INDIVIDUAL},
+};
+
+static InsnClassExecCount sparc64_insn_classes[] = {
+    { "SetHi & Branches",     "op0",   0xc0000000, 0x00000000, COUNT_CLASS},
+    { "Call",                 "op1",   0xc0000000, 0x40000000, COUNT_CLASS},
+    { "Arith/Logical/Move",   "op2",   0xc0000000, 0x80000000, COUNT_CLASS},
+    { "Arith/Logical/Move",   "op3",   0xc0000000, 0xc0000000, COUNT_CLASS},
+    /* Unclassified */
+    { "Unclassified",        "unclas", 0x00000000, 0x00000000, COUNT_INDIVIDUAL},
+};
+
+/* Default matcher for currently unclassified architectures */
+static InsnClassExecCount default_insn_classes[] = {
+    { "Unclassified",        "unclas", 0x00000000, 0x00000000, COUNT_INDIVIDUAL},
+};
+
+typedef struct {
+    const char *qemu_target;
+    InsnClassExecCount *table;
+    int table_sz;
+} ClassSelector;
+
+static ClassSelector class_tables[] =
+{
+    { "aarch64", aarch64_insn_classes, ARRAY_SIZE(aarch64_insn_classes) },
+    { "sparc",   sparc32_insn_classes, ARRAY_SIZE(sparc32_insn_classes) },
+    { "sparc64", sparc64_insn_classes, ARRAY_SIZE(sparc64_insn_classes) },
+    { NULL, default_insn_classes, ARRAY_SIZE(default_insn_classes) },
+};
+
+static InsnClassExecCount *class_table;
+static int class_table_sz;
+
+static gint cmp_exec_count(gconstpointer a, gconstpointer b)
+{
+    InsnExecCount *ea = (InsnExecCount *) a;
+    InsnExecCount *eb = (InsnExecCount *) b;
+    return ea->count > eb->count ? -1 : 1;
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    g_autoptr(GString) report = g_string_new("Instruction Classes:\n");
+    int i;
+    GList *counts;
+    InsnClassExecCount *class = NULL;
+
+    for (i = 0; i < class_table_sz; i++) {
+        class = &class_table[i];
+        switch (class->what) {
+        case COUNT_CLASS:
+            if (class->count || verbose) {
+                g_string_append_printf(report, "Class: %-24s\t(%ld hits)\n",
+                                       class->class,
+                                       class->count);
+            }
+            break;
+        case COUNT_INDIVIDUAL:
+            g_string_append_printf(report, "Class: %-24s\tcounted individually\n",
+                                   class->class);
+            break;
+        case COUNT_NONE:
+            g_string_append_printf(report, "Class: %-24s\tnot counted\n",
+                                   class->class);
+            break;
+        default:
+            break;
+        }
+    }
+
+    counts = g_hash_table_get_values(insns);
+    if (counts && g_list_next(counts)) {
+        GList *it;
+
+        g_string_append_printf(report,"Individual Instructions:\n");
+
+        it = g_list_sort(counts, cmp_exec_count);
+
+        for (i = 0; i < limit && it->next; i++, it = it->next) {
+            InsnExecCount *rec = (InsnExecCount *) it->data;
+            g_string_append_printf(report, "Instr: %-24s\t(%ld hits)\t(op=%#08x/%s)\n",
+                                   rec->insn,
+                                   rec->count,
+                                   rec->opcode,
+                                   rec->class ?
+                                   rec->class->class : "un-categorised");
+        }
+        g_list_free(it);
+    }
+
+    qemu_plugin_outs(report->str);
+}
+
+static void plugin_init(void)
+{
+    insns = g_hash_table_new(NULL, g_direct_equal);
+}
+
+static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
+{
+    uint64_t *count = (uint64_t *) udata;
+    (*count)++;
+}
+
+static uint64_t * find_counter(struct qemu_plugin_insn *insn)
+{
+    int i;
+    uint64_t *cnt = NULL;
+    uint32_t opcode;
+    InsnClassExecCount *class = NULL;
+
+    /*
+     * We only match the first 32 bits of the instruction which is
+     * fine for most RISCs but a bit limiting for CISC architectures.
+     * They would probably benefit from a more tailored plugin.
+     * However we can fall back to individual instruction counting.
+     */
+    opcode = *((uint32_t *)qemu_plugin_insn_data(insn));
+
+    for (i = 0; !cnt && i < class_table_sz; i++) {
+        class = &class_table[i];
+        uint32_t masked_bits = opcode & class->mask;
+        if (masked_bits == class->pattern) {
+            break;
+        }
+    }
+
+    g_assert(class);
+
+    switch (class->what) {
+    case COUNT_NONE:
+        return NULL;
+    case COUNT_CLASS:
+        return &class->count;
+    case COUNT_INDIVIDUAL:
+    {
+        InsnExecCount *icount;
+
+        g_mutex_lock(&lock);
+        icount = (InsnExecCount *) g_hash_table_lookup(insns,
+                                                       GUINT_TO_POINTER(opcode));
+
+        if (!icount) {
+            icount = g_new0(InsnExecCount, 1);
+            icount->opcode = opcode;
+            icount->insn = qemu_plugin_insn_disas(insn);
+            icount->class = class;
+
+            g_hash_table_insert(insns, GUINT_TO_POINTER(opcode),
+                                (gpointer) icount);
+        }
+        g_mutex_unlock(&lock);
+
+        return &icount->count;
+    }
+    default:
+        g_assert_not_reached();
+    }
+
+    return NULL;
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n = qemu_plugin_tb_n_insns(tb);
+    size_t i;
+
+    for (i = 0; i < n; i++) {
+        uint64_t *cnt;
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+        cnt = find_counter(insn);
+
+        if (cnt) {
+            if (do_inline) {
+                qemu_plugin_register_vcpu_insn_exec_inline(
+                    insn, QEMU_PLUGIN_INLINE_ADD_U64, cnt, 1);
+            } else {
+                qemu_plugin_register_vcpu_insn_exec_cb(
+                    insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS, cnt);
+            }
+        }
+    }
+}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv)
+{
+    int i;
+
+    /* Select a class table appropriate to the guest architecture */
+    for (i = 0; i < ARRAY_SIZE(class_tables); i++) {
+        ClassSelector *entry = &class_tables[i];
+        if (!entry->qemu_target ||
+            strcmp(entry->qemu_target, info->target_name) == 0) {
+            class_table = entry->table;
+            class_table_sz = entry->table_sz;
+            break;
+        }
+    }
+
+    for (i = 0; i < argc; i++) {
+        char *p = argv[i];
+        if (strcmp(p, "inline") == 0) {
+            do_inline = true;
+        } else if (strcmp(p, "verbose") == 0) {
+            verbose = true;
+        } else {
+            int j;
+            CountType type = COUNT_INDIVIDUAL;
+            if (*p == '!') {
+                type = COUNT_NONE;
+                p++;
+            }
+            for (j = 0; j < class_table_sz; j++) {
+                if (strcmp(p, class_table[j].opt) == 0) {
+                    class_table[j].what = type;
+                    break;
+                }
+            }
+        }
+    }
+
+    plugin_init();
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
-- 
2.20.1


