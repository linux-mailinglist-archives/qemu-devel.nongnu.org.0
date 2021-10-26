Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E31A43B075
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:47:07 +0200 (CEST)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJz0-0008Ar-70
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhu-0001fl-1Q
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhr-0004fE-PS
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id u18so14915337wrg.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TKAhaqUZkEkOPDX3ZodBC29pmC1lvQH92Rx59LD9Vfk=;
 b=V780SdvD2otuCojzNNz2PylO+FLSUN28n/QsWX9Zc3l7O8i8u3PEzePNtWvebpDLDw
 HrTgKtQGmDcfURjJEOJ2XlbrSdUyJMGHhr24dtgfHI4eUo9cCFb5C39M0NwzW+yZHVxM
 plNDDbGaCSuiXXZ14Nuio9/63TopXwGK29gZseznus6Fi/Uov216gZ0rJJmhOO1qeqER
 HIhfIftF6suXWKibniHjbDiFOAqo+I4bCmIBGf7ZX5gw1YCnclQbW1nu0xkF0LMosimu
 4MELXE0IkYGElA4giaw/3uY7UKU6KjLZd/eRUmSTg+COFi7cryOrku1pE+XVSiC0jm7A
 eGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TKAhaqUZkEkOPDX3ZodBC29pmC1lvQH92Rx59LD9Vfk=;
 b=lslRuAsFCf5JW1SZsiXB+wUFn81pC603PtcTmj1Q1SZ+xIP1EVxPbR5pbQiNhAP7r7
 9FWGKAXLVpC3y/v0YG1hmQOnPqdDWMS8WcQZJ+xN+y2Y3VZHQ17nN1Cq3ExgD1IjneYv
 osRJHJbPCVgmPBcp7B90vamT99Tl/5xmA6tJkoWbMk1TPsFzq3u27f/f5QB1AJ1EMP3r
 urRO/2hMkTcX9eJhJeYyfpey80EnId9E5EhaMOsLHvjAM0TVwUfLhWDuExxTRlmfD489
 IDTQs598QD6hvt23ABMZGY4ZYdZbOzZz5O6S1Aal1ude3YhPLK9yyPQ+THR2K1d1O01N
 bV/g==
X-Gm-Message-State: AOAM530YWApPQhRT2bThQsQxt2ncGtrXbt8aV72cM3WTgKuL58NaP5YG
 LTmzHjnMI7c2QBrokP7nceX1pQ==
X-Google-Smtp-Source: ABdhPJyipWmv/nSk5N5C6ddhKaRpZrrF1wfyT2JMOYcWxKAlduwwRXuFof9psOY1LbbXG5m7ePx+0w==
X-Received: by 2002:a05:6000:11ce:: with SMTP id
 i14mr14442031wrx.102.1635244162466; 
 Tue, 26 Oct 2021 03:29:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 3sm200368wms.5.2021.10.26.03.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63ED31FFB4;
 Tue, 26 Oct 2021 11:22:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 19/28] tests/plugins: extend the insn plugin to track
 opcode sizes
Date: Tue, 26 Oct 2021 11:22:25 +0100
Message-Id: <20211026102234.3961636-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly a convenience feature for identifying frontends that do
multiple repeat loads so I can test changes to the instruction
tracking interface.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/insn.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index 0f6a1938c1..d229fdc001 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -18,6 +18,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
 static uint64_t insn_count;
 static bool do_inline;
+static bool do_size;
+static GArray *sizes;
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
@@ -49,13 +51,35 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
                 insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS,
                 GUINT_TO_POINTER(vaddr));
         }
+
+        if (do_size) {
+            size_t sz = qemu_plugin_insn_size(insn);
+            if (sz > sizes->len) {
+                g_array_set_size(sizes, sz);
+            }
+            unsigned long *cnt = &g_array_index(sizes, unsigned long, sz);
+            (*cnt)++;
+        }
     }
 }
 
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
-    g_autofree gchar *out = g_strdup_printf("insns: %" PRIu64 "\n", insn_count);
-    qemu_plugin_outs(out);
+    g_autoptr(GString) out = g_string_new(NULL);
+
+    if (do_size) {
+        int i;
+        for (i = 0; i <= sizes->len; i++) {
+            unsigned long *cnt = &g_array_index(sizes, unsigned long, i);
+            if (*cnt) {
+                g_string_append_printf(out,
+                                       "len %d bytes: %ld insns\n", i, *cnt);
+            }
+        }
+    } else {
+        g_string_append_printf(out, "insns: %" PRIu64 "\n", insn_count);
+    }
+    qemu_plugin_outs(out->str);
 }
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
@@ -70,12 +94,21 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                 fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
                 return -1;
             }
+        } else if (g_strcmp0(tokens[0], "sizes") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_size)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
 
+    if (do_size) {
+        sizes = g_array_new(true, true, sizeof(unsigned long));
+    }
+
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
     return 0;
-- 
2.30.2


