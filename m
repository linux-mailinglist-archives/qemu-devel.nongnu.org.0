Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFEF5F4481
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:42:53 +0200 (CEST)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiCB-0007XS-SB
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgN-0007NY-5r
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:09:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgK-00008Z-Su
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:09:58 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so834144wmb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cg1QwHqN+jCY5zkl3QujLvRrL1CwHp+I/MfC8up7J2c=;
 b=jFK5fDtt4HC88zQvZFxWGESmwECbu1vu0NdcFWecU5Hj/BlRYs2pnE/zJcxja93s2E
 WD+J2vsHZgKq9KtZ8mEUZuJRra064WZAm/pJkd/fkMftkR+0Jg9FV9JThGcE48ZnSBcv
 P7CrrlzWN9ejlzscR/B/N0zIKFcFr5Kkd+I8M0QHbNC/YLBm2M3XWzi9scYM7Awj2l6s
 +eV7yhmVC4/4q/aJ3uk1gEvNkAoUY2iKSm5kMKpPCrokmbRnbLiVYK1Igz80ids5YHNH
 gK95w7sYaWS3j5RsyN0Fi08oj2mRmcIqkAgNK/g3WA+hNWfg8OPWwQRzNH7m45syr+He
 YaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cg1QwHqN+jCY5zkl3QujLvRrL1CwHp+I/MfC8up7J2c=;
 b=lIkwAswCdILNj/RDh3mFE+rRSyANzSdzLim96/xMSJ4bj8w35V/xg7G3R0yOywbS1G
 TX0hwVG2h6ghyv50ycJzor/dtLioxJgjOUUDQzz5gHK7CmI9ZIbm46YOKfBob8S3eHR/
 6WjxpDKfK9ldQefDefOa/Ff/jJtY9uvEI5ch63RLxuxDlA7zIcvvtMT9x5Ng0TAMY5q7
 hC3oc+DJ24zz3Q/xowjEOep8yIAwGrt8z4kiKCjynQrxoiZPEHZqWdxS6KTLrO0mVIjF
 ROEUuify84mg3b3NbPAiFKwtv/c/GAYdDfIbCQC7FqMc99b9lkAYwlIvfjONp4TeqBEg
 wYUw==
X-Gm-Message-State: ACrzQf2Td4cPzVJUgDHKD/N9Xe1xJkWngz7TpZh8XzJK762DNqbFWP2X
 OuxvpOUi3p3VP3NRg0XPj6z74g==
X-Google-Smtp-Source: AMsMyM4u0Pj2LY7mDU45EWWQgIyzMGTDbEGZYLXxjwPXBo4ju8tkttWvyhdxuxkqksqAVvdObeGBUg==
X-Received: by 2002:a05:600c:4e8b:b0:3b4:c8ce:be87 with SMTP id
 f11-20020a05600c4e8b00b003b4c8cebe87mr10692031wmq.157.1664888994556; 
 Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a5-20020adfeec5000000b0022e2c38f8basm10051013wrp.14.2022.10.04.06.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 527911FFD7;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Robert Henry <robhenry@microsoft.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 35/54] plugins: extend execlog to filter matches
Date: Tue,  4 Oct 2022 14:01:19 +0100
Message-Id: <20221004130138.2299307-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes the whole execlog is just two much so add the ability to
filter by instruction opcode or address.

[AJB: this shows for example

 qemu-system-aarch64 -display none -serial mon:stdio \
   -M virt -cpu max \
   -semihosting-config enable=on \
   -kernel ./tests/tcg/aarch64-softmmu/memory-sve \
   -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin -D plugin.out

the st1w SVE instruction is not instrumenting its stores.]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Cc: Robert Henry <robhenry@microsoft.com>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Message-Id: <20220929114231.583801-36-alex.bennee@linaro.org>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index a7cc44aa20..a503d44cee 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -346,7 +346,7 @@ The execlog tool traces executed instructions with memory access. It can be used
 for debugging and security analysis purposes.
 Please be aware that this will generate a lot of output.
 
-The plugin takes no argument::
+The plugin needs default argument::
 
   qemu-system-arm $(QEMU_ARGS) \
     -plugin ./contrib/plugins/libexeclog.so -d plugin
@@ -364,6 +364,13 @@ which will output an execution trace following this structure::
   0, 0xd34, 0xf9c8f000, "bl #0x10c8"
   0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
 
+the output can be filtered to only track certain instructions or
+addresses using the `ifilter` or `afilter` options. You can stack the
+arguments if required::
+
+  qemu-system-arm $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin
+
 - contrib/plugins/cache.c
 
 Cache modelling plugin that measures the performance of a given L1 cache
diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index a5275dcc15..e659ac9cbb 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -20,6 +20,9 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 /* Store last executed instruction on each vCPU as a GString */
 GArray *last_exec;
 
+static GPtrArray *imatches;
+static GArray *amatches;
+
 /**
  * Add memory read or write information to current instruction log
  */
@@ -85,12 +88,13 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
     struct qemu_plugin_insn *insn;
-    uint64_t insn_vaddr;
-    uint32_t insn_opcode;
-    char *insn_disas;
+    bool skip = (imatches || amatches) ? true : false;
 
     size_t n = qemu_plugin_tb_n_insns(tb);
     for (size_t i = 0; i < n; i++) {
+        char *insn_disas;
+        uint64_t insn_vaddr;
+
         /*
          * `insn` is shared between translations in QEMU, copy needed data here.
          * `output` is never freed as it might be used multiple times during
@@ -99,20 +103,52 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
          * a limitation for CISC architectures.
          */
         insn = qemu_plugin_tb_get_insn(tb, i);
-        insn_vaddr = qemu_plugin_insn_vaddr(insn);
-        insn_opcode = *((uint32_t *)qemu_plugin_insn_data(insn));
         insn_disas = qemu_plugin_insn_disas(insn);
-        char *output = g_strdup_printf("0x%"PRIx64", 0x%"PRIx32", \"%s\"",
-                                       insn_vaddr, insn_opcode, insn_disas);
+        insn_vaddr = qemu_plugin_insn_vaddr(insn);
+
+        /*
+         * If we are filtering we better check out if we have any
+         * hits. The skip "latches" so we can track memory accesses
+         * after the instruction we care about.
+         */
+        if (skip && imatches) {
+            int j;
+            for (j = 0; j < imatches->len && skip; j++) {
+                char *m = g_ptr_array_index(imatches, j);
+                if (g_str_has_prefix(insn_disas, m)) {
+                    skip = false;
+                }
+            }
+        }
+
+        if (skip && amatches) {
+            int j;
+            for (j = 0; j < amatches->len && skip; j++) {
+                uint64_t v = g_array_index(amatches, uint64_t, j);
+                if (v == insn_vaddr) {
+                    skip = false;
+                }
+            }
+        }
 
-        /* Register callback on memory read or write */
-        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
-                                         QEMU_PLUGIN_CB_NO_REGS,
-                                         QEMU_PLUGIN_MEM_RW, NULL);
+        if (skip) {
+            g_free(insn_disas);
+        } else {
+            uint32_t insn_opcode;
+            insn_opcode = *((uint32_t *)qemu_plugin_insn_data(insn));
+            char *output = g_strdup_printf("0x%"PRIx64", 0x%"PRIx32", \"%s\"",
+                                           insn_vaddr, insn_opcode, insn_disas);
+
+            /* Register callback on memory read or write */
+            qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
+                                             QEMU_PLUGIN_CB_NO_REGS,
+                                             QEMU_PLUGIN_MEM_RW, NULL);
+
+            /* Register callback on instruction */
+            qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
+                                                   QEMU_PLUGIN_CB_NO_REGS, output);
+        }
 
-        /* Register callback on instruction */
-        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
-                                               QEMU_PLUGIN_CB_NO_REGS, output);
     }
 }
 
@@ -132,6 +168,25 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     }
 }
 
+/* Add a match to the array of matches */
+static void parse_insn_match(char *match)
+{
+    if (!imatches) {
+        imatches = g_ptr_array_new();
+    }
+    g_ptr_array_add(imatches, match);
+}
+
+static void parse_vaddr_match(char *match)
+{
+    uint64_t v = g_ascii_strtoull(match, NULL, 16);
+
+    if (!amatches) {
+        amatches = g_array_new(false, true, sizeof(uint64_t));
+    }
+    g_array_append_val(amatches, v);
+}
+
 /**
  * Install the plugin
  */
@@ -145,6 +200,19 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
      */
     last_exec = g_array_new(FALSE, FALSE, sizeof(GString *));
 
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "ifilter") == 0) {
+            parse_insn_match(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "afilter") == 0) {
+            parse_vaddr_match(tokens[1]);
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
+    }
+
     /* Register translation block and exit callbacks */
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.34.1


