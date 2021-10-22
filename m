Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9166143753F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:07:42 +0200 (CEST)
Received: from localhost ([::1]:53928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrSb-0008Rt-Rf
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdrRE-0006q8-81
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:06:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdrRB-00059s-Uh
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:06:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 84-20020a1c0457000000b003232b0f78f8so2834834wme.0
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQrJ14mdqhvYV5+ImzRfNnyvnL5jhONPouFr5OP3Q0g=;
 b=X+kndcvw2NbSt2SFbnRbzLhr0C2QSMWFcVDU20bf28Py7eujAoGmb2ZoX+LI4/ShZO
 3toAv3414PSmobpFi2+oXTIjVOqvhHDrtIsK1XLIaNc3IJow4q7eoDSTBvB/dFDUzheA
 TZ2k5fLaDPOIlQ/K9jN+cpZh5GyJzT28MpDPdNhXq90Fkmca6HJeqR3R/bb5dwRY1Yhe
 5mJ1avTHS8eSfRmceDEM86O0y0EYUvMj130TtTO9DQwK4G22p0N69NCaeimG7GK4v9dO
 bQLPdqxa0iN8sRUlbNrU9SynS5X6fynJGdje0a9jx/lt7egsTUK3Us9UCGmFpQN4rtAX
 xFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQrJ14mdqhvYV5+ImzRfNnyvnL5jhONPouFr5OP3Q0g=;
 b=qpEscnXOOFzipMVAySh4q3+gswU118EEHZAjsCkW1xpT10KbFEUW70laR6CH+vhEJX
 ykDo8A28HNFfSqFoFl/Eo/9xuPodlbMOBy2Wy5f4Scv5KPgWnN8uXq9kAqnOX47GMJJr
 5loyOq3aYaxXt7WkeyIpcwqon3pHwLQ0YwKazfcqoAaxUP/rQd9oj7qLYG+AbjyXG5O3
 QVWplvyZAsK50jQ9xAjGd2cn3pq5SkKDlu06kUJhOXLe8GHDOsUFeixJx4zAAC09Aqyk
 ygYvMBj00D3rc4ENimISuEKdTYDG1NaVrOWjKmHH5sjI58gqTnbGTq1E5hC+VCntBTtx
 vt7w==
X-Gm-Message-State: AOAM5329cFcW5FqKxEnjbLqjXcq87up1jrt9uvFVfmFcPEdqexOdY4qR
 KR4zBMjL9MY/mekJfJ0YR+vL6A==
X-Google-Smtp-Source: ABdhPJyS6aai5bsKO9D9pIBQwf2NviZK7RqUVvOYj2pc5QXJ2km9rIRcIla6kdQ8clw2tYU04wBYYw==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr26951703wmi.115.1634897168049; 
 Fri, 22 Oct 2021 03:06:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q7sm7576010wrs.73.2021.10.22.03.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 03:06:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4633E1FF96;
 Fri, 22 Oct 2021 11:06:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] plugins: try and make plugin_insn_append more ergonomic
Date: Fri, 22 Oct 2021 11:05:57 +0100
Message-Id: <20211022100557.240412-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we make the assumption that the guest frontend loads all
op code bytes sequentially. This mostly holds up for regular fixed
encodings but some architectures like s390x like to re-read the
instruction which causes weirdness to occur. Rather than changing the
frontends make the plugin API a little more ergonomic and able to
handle the re-read case.

Stuff will still get strange if we read ahead of the opcode but so far
no front ends have done that and this patch asserts the case so we can
catch it early if they do.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/plugin-gen.h | 12 ++++++++++--
 include/qemu/plugin.h     |  7 +++++--
 accel/tcg/plugin-gen.c    |  3 +--
 accel/tcg/translator.c    |  2 +-
 4 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index b1b72b5d90..f92f169739 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -27,13 +27,21 @@ void plugin_gen_insn_end(void);
 void plugin_gen_disable_mem_helpers(void);
 void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info);
 
-static inline void plugin_insn_append(const void *from, size_t size)
+static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
 {
     struct qemu_plugin_insn *insn = tcg_ctx->plugin_insn;
+    abi_ptr off;
 
     if (insn == NULL) {
         return;
     }
+    off = pc - insn->vaddr;
+    if (off < insn->data->len) {
+        g_byte_array_set_size(insn->data, off);
+    } else if (off > insn->data->len) {
+        /* we have an unexpected gap */
+        g_assert_not_reached();
+    }
 
     insn->data = g_byte_array_append(insn->data, from, size);
 }
@@ -62,7 +70,7 @@ static inline void plugin_gen_disable_mem_helpers(void)
 static inline void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info)
 { }
 
-static inline void plugin_insn_append(const void *from, size_t size)
+static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
 { }
 
 #endif /* CONFIG_PLUGIN */
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index b3172b147f..145f8a221a 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -163,10 +163,12 @@ struct qemu_plugin_tb {
 
 /**
  * qemu_plugin_tb_insn_get(): get next plugin record for translation.
- *
+ * @tb: the internal tb context
+ * @pc: address of instruction
  */
 static inline
-struct qemu_plugin_insn *qemu_plugin_tb_insn_get(struct qemu_plugin_tb *tb)
+struct qemu_plugin_insn *qemu_plugin_tb_insn_get(struct qemu_plugin_tb *tb,
+                                                 uint64_t pc)
 {
     struct qemu_plugin_insn *insn;
     int i, j;
@@ -179,6 +181,7 @@ struct qemu_plugin_insn *qemu_plugin_tb_insn_get(struct qemu_plugin_tb *tb)
     g_byte_array_set_size(insn->data, 0);
     insn->calls_helpers = false;
     insn->mem_helper = false;
+    insn->vaddr = pc;
 
     for (i = 0; i < PLUGIN_N_CB_TYPES; i++) {
         for (j = 0; j < PLUGIN_N_CB_SUBTYPES; j++) {
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 61be64b78c..22d95fe1c3 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -876,9 +876,8 @@ void plugin_gen_insn_start(CPUState *cpu, const DisasContextBase *db)
     struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
     struct qemu_plugin_insn *pinsn;
 
-    pinsn = qemu_plugin_tb_insn_get(ptb);
+    pinsn = qemu_plugin_tb_insn_get(ptb, db->pc_next);
     tcg_ctx->plugin_insn = pinsn;
-    pinsn->vaddr = db->pc_next;
     plugin_gen_empty_callback(PLUGIN_GEN_FROM_INSN);
 
     /*
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 390bd9db0a..f06c314266 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -169,7 +169,7 @@ static inline void translator_maybe_page_protect(DisasContextBase *dcbase,
         if (do_swap) {                                                  \
             ret = swap_fn(ret);                                         \
         }                                                               \
-        plugin_insn_append(&ret, sizeof(ret));                          \
+        plugin_insn_append(pc, &ret, sizeof(ret));                      \
         return ret;                                                     \
     }
 
-- 
2.30.2


