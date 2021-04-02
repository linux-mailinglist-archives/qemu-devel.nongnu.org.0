Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A93530E4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:48:52 +0200 (CEST)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSRet-0001Gy-6m
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYs-0000h2-KB
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:38 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYq-0007nh-B8
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:38 -0400
Received: by mail-pl1-x636.google.com with SMTP id d8so3014491plh.11
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h30NLvQUFSmWb89iN67sfFCqk9/Ie+AiL5gYJeDwQgI=;
 b=mvKDcsa+ubRDjIzCpdjgbvNJ7KgkuYPaMr0XT3/wlRqu1+xhZrYaGqmhzuv2hC9cvf
 oa/zNPuz6l/qng8uNE3yUkt41VCd1NpA4mRzSqHImRXBx3llE5/srTTcifq3WyPj/JAk
 sbzUg9O4CGBMZ50A0rntuH1lGNKjSV1+6nUmTY/dYiSPQxt6XpoOljfrVMx9/Rs4DTGu
 1sGQxo9rI8we7eo/N6lSnkh87OU6ne5IW7UOcgcLsT1cD+64E35t/u3C0759iArPI9xs
 zrdt+zvA9IFmsL4ZVuFoVr1ohdIfankKKf/4KFkn0xn2OFdJHzX5m/EQ11o6yPwst4pB
 GjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h30NLvQUFSmWb89iN67sfFCqk9/Ie+AiL5gYJeDwQgI=;
 b=r+tFs8Zr9QXObPCJlKTUzA8KDQhCQq5d0QGD0ZsUMPBv3PwmNx1Zf754d7uD+aFHs+
 0gry/y0WmA9HYB0h86DprHKjpE7ZUdbGo4e9xROCdPyaYkXf2W4QmHr7VUTD7T4zGOqM
 bYy5bwdWpBVjUxrn0C9K4jjleRh3pK3k/6NaiBI9e2iO+w/drCZYFVIGFMv18DBDDARB
 HFgbCwX7GjDG15hGZTOFZCdctPXrg0u8EY4L4W7Y25fcruAWY9uMFinw3DmwW/NVPFGK
 q3NNCxbjjffVmTr+0Et8Iw8430z7I9U/bQ/2Agr6QZ3Js9Bg6a26qVqzJFlbgrHUkM3n
 l0Zg==
X-Gm-Message-State: AOAM531klVmjJ4wC1CembLDdK9EQZP3zdO5WMlZ0G6Y62XrVhK7uSIpM
 dP0pWuQY3S11E3zLAmW1Qdljuofgv7MhoQ==
X-Google-Smtp-Source: ABdhPJy8hWsVg50A8Aaw3atJ9NbAq+TTkVxJkTTbfmjIhS5irATJnywoB6nfGMh/Fh3oYdu11DaIlw==
X-Received: by 2002:a17:902:d895:b029:e6:f007:5bc with SMTP id
 b21-20020a170902d895b02900e6f00705bcmr14154463plz.76.1617399754796; 
 Fri, 02 Apr 2021 14:42:34 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/11] target/arm: Remove log2_esize parameter to
 gen_mte_checkN
Date: Fri,  2 Apr 2021 14:42:17 -0700
Message-Id: <20210402214217.422585-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The log2_esize parameter is not used except trivially.
Drop the parameter and the deferral to gen_mte_check1.

This fixes a bug in that the parameters as documented
in the header file were the reverse from those in the
implementation.  Which meant that translate-sve.c was
passing the parameters in the wrong order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  2 +-
 target/arm/translate-a64.c | 15 +++++++--------
 target/arm/translate-sve.c |  4 ++--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 3668b671dd..868d355048 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -44,7 +44,7 @@ TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int count, int log2_esize);
+                        bool tag_checked, int size);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a68d5dd5d1..f35a5e8174 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -295,9 +295,9 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
  * For MTE, check multiple logical sequential accesses.
  */
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int log2_esize, int total_size)
+                        bool tag_checked, int size)
 {
-    if (tag_checked && s->mte_active[0] && total_size != (1 << log2_esize)) {
+    if (tag_checked && s->mte_active[0]) {
         TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
@@ -306,7 +306,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
@@ -315,7 +315,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
 
         return ret;
     }
-    return gen_mte_check1(s, addr, is_write, tag_checked, log2_esize);
+    return clean_data_tbi(s, addr);
 }
 
 typedef struct DisasCompare64 {
@@ -2965,8 +2965,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     }
 
     clean_addr = gen_mte_checkN(s, dirty_addr, !is_load,
-                                (wback || rn != 31) && !set_tag,
-                                size, 2 << size);
+                                (wback || rn != 31) && !set_tag, 2 << size);
 
     if (is_vector) {
         if (is_load) {
@@ -3713,7 +3712,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * promote consecutive little-endian elements below.
      */
     clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
-                                size, total);
+                                total);
 
     /*
      * Consecutive little-endian elements from a single register
@@ -3866,7 +3865,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     tcg_rn = cpu_reg_sp(s, rn);
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
-                                scale, total);
+                                total);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5179c1f836..584c4d047c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4264,7 +4264,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
     tcg_temp_free_i64(dirty_addr);
 
     /*
@@ -4352,7 +4352,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
     tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
-- 
2.25.1


