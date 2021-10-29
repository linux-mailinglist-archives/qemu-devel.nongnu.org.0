Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8FD43F663
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:58:56 +0200 (CEST)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJyh-00017s-Om
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaL-0003tl-SY
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:45 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaK-0007wV-8y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:45 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 83so8682014pgc.8
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYLWr1uKuQzUUVrza4V+n6K/acOPuYl97jiAhjg0Z5M=;
 b=NoLtYvxOsNQbRV1c6QgIjIU2YAS3+dVhcFYFz+DXEWtXDmcteEqQR9MsWHnv/YijUM
 Y9d60P9ijksENO7P1eoO1gkThzR8/hepfF22O9vwXfJOiR6/7gkIgQXKqwMWEgXcmd8e
 FtSCZV+lL9/vYGKol3yVwkoIchNI5+owT5wkzRp/TU1v0mO+C13Vs5nIoJFMGNtGDkdG
 10n/2IgX1Yf7Wk0GtSZ+DwL3ZTZUJrUTBg5eM9GhoWVSrBDvHu+iCgxGIwc32Wmixqb4
 1bGZSpnP1ju5/CmDJ21NmcUgkZKTuciDHz+XFZhZ27h5moR8V5XKEC+kC+TIjiMPuUBM
 pivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYLWr1uKuQzUUVrza4V+n6K/acOPuYl97jiAhjg0Z5M=;
 b=H2gJTvNOC4fIisSzx98+RN83scKMzuvXHmEEVUd6DPpoN+YzgjWpiB1XHzQBhw8Z+Z
 BaFAVySM8e6HVg78T0ZWVaEaC5pWszBD5Tx0Dkx0ET1CAMP3Jl8vRhR8uKx/ixkFo2HH
 Dh7uRuyawnsEQ4aCgP/8Mbrj0sJumu/iWZpiUUjHR0XE/s7zS4RHFFEZ4psbC0MHWenU
 RVb91aueXpg1DGvujvTLVydR5C7Qr65sxUemnfvgeqTtoTopn3pAsmBg+otDZgDPh92k
 k8m7IWBd+A3bAoQI6L3/ZOVBAjs2XZXkHdoIw4sMvlCUOzYSki2Vaq7Bc9c2srod5jFE
 v70g==
X-Gm-Message-State: AOAM533Me6jb5EVEBXhmXlMqJ035/yuV/pmW86p4mRnUeA0S1MrUAe4k
 Pl5Y7o6A8MQkRN5IbKaWQWJqzYAhuxRmzw==
X-Google-Smtp-Source: ABdhPJxiZSgaldvn2PK0FmcSi1nnrTIQ9fArI5NBXf/JO8NJcsrg+/bU+MxH3NjMqNNwSoePD0uWhw==
X-Received: by 2002:aa7:8d44:0:b0:47b:ee6c:5ca4 with SMTP id
 s4-20020aa78d44000000b0047bee6c5ca4mr8588846pfe.49.1635482022939; 
 Thu, 28 Oct 2021 21:33:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/60] tcg/optimize: Drop nb_oargs, nb_iargs locals
Date: Thu, 28 Oct 2021 21:32:43 -0700
Message-Id: <20211029043329.1518029-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than try to keep these up-to-date across folding,
re-read nb_oargs at the end, after re-reading the opcode.

A couple of asserts need dropping, but that will take care
of itself as we split the function further.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 74b9aa025a..77cdffaaef 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -675,7 +675,6 @@ void tcg_optimize(TCGContext *s)
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
         uint64_t z_mask, partmask, affected, tmp;
-        int nb_oargs, nb_iargs;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def;
 
@@ -686,10 +685,8 @@ void tcg_optimize(TCGContext *s)
         }
 
         def = &tcg_op_defs[opc];
-        nb_oargs = def->nb_oargs;
-        nb_iargs = def->nb_iargs;
-        init_arguments(&ctx, op, nb_oargs + nb_iargs);
-        copy_propagate(&ctx, op, nb_oargs, nb_iargs);
+        init_arguments(&ctx, op, def->nb_oargs + def->nb_iargs);
+        copy_propagate(&ctx, op, def->nb_oargs, def->nb_iargs);
 
         /* For commutative operations make constant second argument */
         switch (opc) {
@@ -1063,7 +1060,7 @@ void tcg_optimize(TCGContext *s)
 
         CASE_OP_32_64(qemu_ld):
             {
-                MemOpIdx oi = op->args[nb_oargs + nb_iargs];
+                MemOpIdx oi = op->args[def->nb_oargs + def->nb_iargs];
                 MemOp mop = get_memop(oi);
                 if (!(mop & MO_SIGN)) {
                     z_mask = (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - 1;
@@ -1122,12 +1119,10 @@ void tcg_optimize(TCGContext *s)
         }
 
         if (partmask == 0) {
-            tcg_debug_assert(nb_oargs == 1);
             tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
             continue;
         }
         if (affected == 0) {
-            tcg_debug_assert(nb_oargs == 1);
             tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
             continue;
         }
@@ -1202,7 +1197,6 @@ void tcg_optimize(TCGContext *s)
             } else if (args_are_copies(op->args[1], op->args[2])) {
                 op->opc = INDEX_op_dup_vec;
                 TCGOP_VECE(op) = MO_32;
-                nb_iargs = 1;
             }
             break;
 
@@ -1371,7 +1365,6 @@ void tcg_optimize(TCGContext *s)
                 op->opc = opc = (opc == INDEX_op_movcond_i32
                                  ? INDEX_op_setcond_i32
                                  : INDEX_op_setcond_i64);
-                nb_iargs = 2;
             }
             break;
 
@@ -1579,6 +1572,7 @@ void tcg_optimize(TCGContext *s)
         if (def->flags & TCG_OPF_BB_END) {
             memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
         } else {
+            int nb_oargs = def->nb_oargs;
             for (i = 0; i < nb_oargs; i++) {
                 reset_temp(op->args[i]);
                 /* Save the corresponding known-zero bits mask for the
-- 
2.25.1


