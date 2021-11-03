Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322DD4446F6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:21:17 +0100 (CET)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJwq-000807-AK
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoH-0005YH-I4
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoF-00074n-UN
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id d24so4719183wra.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwxpI2bFznxmZpBb5VRsZbQtkWT+77Twu4jSfg8KH/E=;
 b=f/1RijjtCRik+SvSTXx2n1YdCb9lq6UIdewCxVrB3+nk56rI3V53n0n8QG0mP3ud1t
 rIXW1az/TPrKLALQP78tQ79evB/W/9Yy4KBBniallDUs9KcAmo7KBeYmOiuUOiPTRh0/
 Lu5iK0WXjwHFoh4ZGpjQES4UyWWYQ+tPt5F6F2NSAoWMlOR6KC8zeVUMMhscfFD/BK1R
 TjOUrMvChFIq9MADeGM0w9GpblaBVlYzUVqXZMzI6OWOweBmifUcSxwDl33CFz8ZqLxm
 U2PEWUh4fx58Rlofu6je0Y4Xml/MXFOW35XH6w9e3MnJxDJdxG0dkCT4YfkGeDVvS4nK
 5+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwxpI2bFznxmZpBb5VRsZbQtkWT+77Twu4jSfg8KH/E=;
 b=DKsUVlbu/XJv5/bJxPk7lj3gja8xh/0aImJlxTCtFoz0JnKq33PrplWilIXU4dVd/z
 LDnxtPZUCJkx6vnIUNYWY+qme9co87zNWg4WUjLX19MbaVV/JA6pvdcYJkXXc/4lRn06
 /p8mPAj/IOgvmXxrzSRzCABHkWEFEy84YbVpVTdlL7w1ytBkNe0MJPHvVt1OpBPX1C7+
 wxsFSrNsMXOqyJD7AYVouitBNm9Rgq1oCgjXUU5VpWg52aBU1PSN+fi4Wk42JE0PkoFk
 TEvmhxgIxMdt9A/UIlpCc9cE6d475qexMyxvVxEurtPauLvzvkdBZ7Snj+Zw3/TTc1xb
 BAag==
X-Gm-Message-State: AOAM532tnZmLuHC/pxlIDK/mLaG2V/Ztws6Tk5D9Ageefx+c11BObWmF
 ih4LjyMIUhielHo62Jcfd1rv5A==
X-Google-Smtp-Source: ABdhPJxsv2dIJLkKG6WNwzVr/NNmwYkkrpgKOEIiScIm6lRLqPMg0vicc91P+sVBvmBr/Vd4wuOC8Q==
X-Received: by 2002:adf:a1d4:: with SMTP id v20mr15931221wrv.190.1635959542286; 
 Wed, 03 Nov 2021 10:12:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g5sm3115553wrd.59.2021.11.03.10.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA9721FFB1;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/21] plugins: try and make plugin_insn_append more ergonomic
Date: Wed,  3 Nov 2021 17:05:54 +0000
Message-Id: <20211103170558.717981-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211026102234.3961636-21-alex.bennee@linaro.org>

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


