Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3234F4385C1
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:14:28 +0200 (CEST)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePHX-0007V2-9b
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuQ-0007oU-1B
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuN-0006DE-M4
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id s19so4729255wra.2
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HfZ6rYii68KhWE0NxYMgEJrFZqSlTNn66/qs8YyNLIU=;
 b=b5P2lOaZ7D/lCmlqVKbwkOKW7tKR2tt8DVqF5l9iVps6Bat/Ho1oHlEJhaDC/7/dS1
 MlkZNBXEZwNb7caPWXKS+Ag0EkuuCYuw0EzxXBvrtuQA5dJdKzDEmjdFmvr7IKnfL34s
 dWJ2JmomnAQkrMkkfDj/p5ND5pOCOJ66sTdghF2/nKBasOSA6WjkI6GUNmhJeaQGqON1
 8Y54pjhhwroegEZlnaXFXnnNP1reC8Dn4fSF0vMWZsHdDUroL8a2WZlcugoJjR1JaB4u
 YZlvJvShnLLhdIbSo9d3ERKnFaEWFV/Hu9hkpJ/DM4O7iYkjgJvw8YY36fBfGLsV0zDk
 /pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HfZ6rYii68KhWE0NxYMgEJrFZqSlTNn66/qs8YyNLIU=;
 b=NTZdO9Ydj813a+IGZ7sg5jtugxwoE3Xlx58cxNidMVr1e52pG8WRlx8gqA1a1C/Rnh
 I4+8P6i6QYN8Pdbt5pjzLmWNGw7y1NCfZmgD34mNZCm+31yFT5rTKPHxM2RLcMEA4Wub
 UVLdIwnbF8NpG/DBEJTgjypp3E9r7JQ55LSF84G8Nz/MOc4n0saIm0qZGzTIFjLhHFAO
 yu3uFQepJrvzYCyfAeAGOpWeJNDm2Orh4UHSYzWd+q4RiKYOvLNz9Dvz5KVqkiOB9HO2
 mgMaYXbj5W0bEjt9wjpgBnJCJHXhIK7GpQvS7epuSi0Abnn4U7u79NaMHhlBzj8wOemO
 VRTw==
X-Gm-Message-State: AOAM532OgEA8ohOe6PRK043moT4TtmAEMG9m6SBY6xZ2VN81yEjReKDg
 ZU78DOcrE5S8V9DgCuHcla8/TbZw6CE=
X-Google-Smtp-Source: ABdhPJzHl+dSkHrDEutBsmvOsxRXFXrwBYpTfYv81up4a8FN18pxemoVORvrAM67GePLoSo/MzzUQw==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr10855818wri.279.1635025829325; 
 Sat, 23 Oct 2021 14:50:29 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z6sm15392203wmp.1.2021.10.23.14.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:50:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/33] target/mips: Convert MSA MOVE.V opcode to decodetree
Date: Sat, 23 Oct 2021 23:47:59 +0200
Message-Id: <20211023214803.522078-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the MOVE.V opcode (Vector Move) to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  6 +++++-
 target/mips/tcg/msa_translate.c | 26 +++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index dc5e561b9dc..1bde1983de3 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -23,6 +23,7 @@
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 @elm_df             ...... .... df:6      ws:5 wd:5 ......  &msa_elm
+@elm                ...... ..........     ws:5 wd:5 ......  &msa_elm df=0
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
@@ -156,7 +157,10 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
-  COPY_S            011110 0010 ...... ..... .....  011001  @elm_df
+  {
+    MOVE_V          011110 0010111110  ..... .....  011001  @elm
+    COPY_S          011110 0010 ...... ..... .....  011001  @elm_df
+  }
   COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
   INSERT            011110 0100 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index ff5dbd99f84..b03cde964e0 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -31,7 +31,6 @@ enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -533,6 +532,26 @@ TRANS_DF_B(HADD_U,      trans_msa_3r,    gen_helper_msa_hadd_u);
 TRANS_DF_B(HSUB_S,      trans_msa_3r,    gen_helper_msa_hsub_s);
 TRANS_DF_B(HSUB_U,      trans_msa_3r,    gen_helper_msa_hsub_u);
 
+static bool trans_MOVE_V(DisasContext *ctx, arg_msa_elm *a)
+{
+    TCGv_i32 tsr;
+    TCGv_i32 tdt;
+
+    if (!check_msa_access(ctx)) {
+        return false;
+    }
+
+    tsr = tcg_const_i32(a->ws);
+    tdt = tcg_const_i32(a->wd);
+
+    gen_helper_msa_move_v(cpu_env, tdt, tsr);
+
+    tcg_temp_free_i32(tdt);
+    tcg_temp_free_i32(tsr);
+
+    return true;
+}
+
 static void gen_msa_elm_3e(DisasContext *ctx)
 {
 #define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
@@ -551,9 +570,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
         gen_helper_msa_cfcmsa(telm, cpu_env, tsr);
         gen_store_gpr(telm, dest);
         break;
-    case OPC_MOVE_V:
-        gen_helper_msa_move_v(cpu_env, tdt, tsr);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -665,7 +681,7 @@ static void gen_msa_elm(DisasContext *ctx)
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
 
     if (dfn == 0x3E) {
-        /* CTCMSA, CFCMSA, MOVE.V */
+        /* CTCMSA, CFCMSA */
         gen_msa_elm_3e(ctx);
         return;
     }
-- 
2.31.1


