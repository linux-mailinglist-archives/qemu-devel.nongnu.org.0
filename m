Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C55606335
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:35:21 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWdM-0007yI-T3
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:35:13 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWWF-0002wp-GO
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZJ-0001au-Pi
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:23:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYy-00013i-8z
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j7so34137331wrr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/Mtkmedf+4E4gXxJIPDJOU9Xjw/x7DGKKan8I+smfhM=;
 b=RC6QCfCgkRpz97j9SGrN4vfjPqztdLjApCGAA88EzqrLxrNuoVywBRhQ7vBuTzO8Hp
 dIacHIsqY1w+fmrJnZojKQvseLoIeoBPiadRO7sJmGPweVBZwkmo180ocklRL2SwBImE
 MgCnlAQrw1p/e08KTtsqYGxQrEQoqqPnpkzU1pGBKSmF62lBQQiwEDnanw6tIWBRlPwa
 1JDXwigGuRI9+Ng7jfhZ0QJQXmpdrHDjxckLiMuRn17vWL5MJPue+LgOr4cxyFss6tA0
 rkSc3hBKdyN2oz5VUtBGP39D2BOAOfVkeQsNUXv/k3s6IOzJBoQ3pEEacPOEYPATs/gR
 /nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Mtkmedf+4E4gXxJIPDJOU9Xjw/x7DGKKan8I+smfhM=;
 b=I18wLTsxkEjMIs8hay3LJe0Srrc8A7uF69xoMOGAmTQT2FvSOtVjRzIbvZTsVzSLvh
 y4tb1cw3n+wxxu5azUBWzU9EMfoeQzsW5BEEvzoCf6EFJM+FI1B2a/9RImNAZ/ktqrNB
 K0h39MGcojxEB15g7i3M+sOglIb+mc7X/8j6kgC58u/agKvGq3pxJkidbSgCBCbBGFeD
 C79WJn/uFTf7TN5dBtmtXpbo/8DgT089dTm80CXr3+e7xFD58rhBNqoi8U+dCo1vBGCg
 aDCRQ1JuJ7yTCIozfwSJyaY23/gc+U7SAeIi7PuLDckT1Rsj1GLtQl60jgJ24fmiRPua
 PGIg==
X-Gm-Message-State: ACrzQf1Rx5NHrhrEv/WgSnJi2/SwcfEV1VAWZLt9iIjNecmq10X+W4oP
 yqaPZH/E+qDNiLug+F2Ga+zSBfbIVCKJEA==
X-Google-Smtp-Source: AMsMyM6pYBcWeA+pfeM/Ul/ZtLdq9cH/0B6ig0PflcfB/kXDjNX571bkshOdqIstvFEAMnKv/sfIug==
X-Received: by 2002:a5d:64e4:0:b0:22e:3d49:91e0 with SMTP id
 g4-20020a5d64e4000000b0022e3d4991e0mr8035848wri.87.1666268528521; 
 Thu, 20 Oct 2022 05:22:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/24] target/arm: Introduce curr_insn_len
Date: Thu, 20 Oct 2022 13:21:37 +0100
Message-Id: <20221020122146.3177980-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

A simple helper to retrieve the length of the current insn.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221020030641.2066807-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086f..90bf7c57fc6 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d090..94cc1e4b775 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2f72afe019a..5752b7af5cb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6650,7 +6650,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9812,8 +9812,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.25.1


