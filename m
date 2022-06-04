Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9B53D8CC
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 01:14:23 +0200 (CEST)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxcyM-0004uQ-WC
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 19:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxcv4-0008KX-3B
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 19:10:58 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxcuw-0004zn-2r
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 19:10:55 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h192so3236932pgc.4
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 16:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SwpxzSVSdURXSZL6tDOTL8VJqOtYjKYsT4i+YQrSyxQ=;
 b=OTVmxmB2oatkUzmc1/AFsS0kABAwkqbsAQma65vN1fn08zKUmMwAC0x2rjHGQDFsuL
 00Ufv7UcL+tyZsNfYQhi1OzTkZ96Gieelx/XDi2cRGW+u4s10hZSwMkeShfPndimHqQU
 Uge5Hx+kaP6sU1Bkfe+KkU1zk5pN1EQBcGM4f1R70iD9cEdskNfKK21W77pRj6faPs77
 Yvg4/jqlpZthHpOqT9t+OL87K7631RNSufOoCPo8slkHTzFUwq9m6G/50dMbcOjTAT8J
 08uOQng+SfmUhOIgLDFPSITTz56Gub+OgyLo06R+enJmZBAyp/Q1s7KR+vLyJDJ7ie5i
 NiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwpxzSVSdURXSZL6tDOTL8VJqOtYjKYsT4i+YQrSyxQ=;
 b=A84qvdECx8rfdNvjC8tAbZzHfUO+bG0/I79WMdKIVScRWdjL1HGGeiROrnK1qBmaY6
 9Vu4/P8yjp8jF4LwWruDbvi5tsGNPuLvHsly8RwXgSKKisOfC9D5Nj7DxE7T/5DSLvA3
 2vsKQrDTmubJSpInD1PkS9LK5e5Jve5Zvu5ZGyP//DCw7i81RZ7ety4N9vyAU0HyOI6t
 IAGUAysMxMILSfCaxnTQPtJW3Ivh+gsvCC9bo4+uORqdvLJ26aYmF26HrvomSD2bgZEw
 7VMtBX2r0jZY9iPcGaby8C9UKGh7YP/bz6/kD/P0YdcQHq+Go2KkpIbQZmCw4jVW2RCu
 fIyA==
X-Gm-Message-State: AOAM533gws2H1G90rH1aKUeYygo4yk7KzQz/QvzXpD7Cp6h30youfq4W
 T1VduKpmegZksDChJf56wX5TnRG79U5OHA==
X-Google-Smtp-Source: ABdhPJw8ipSFgBm4Yr64bCN/wBxWyQ647KcVVad9uZZbVDP5BAjE+DTuKXk38SqBOWs2wUVsaEUAWA==
X-Received: by 2002:a63:8a4c:0:b0:3fc:5c99:a195 with SMTP id
 y73-20020a638a4c000000b003fc5c99a195mr14498737pgd.29.1654384207422; 
 Sat, 04 Jun 2022 16:10:07 -0700 (PDT)
Received: from bigtime.. ([2602:ae:1547:e101:250:b6ff:fe24:58ae])
 by smtp.gmail.com with ESMTPSA id
 184-20020a6302c1000000b003fcf1279c84sm5562151pgc.33.2022.06.04.16.10.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 16:10:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/riscv: Remove generate_exception_mtval
Date: Sat,  4 Jun 2022 23:10:03 +0000
Message-Id: <20220604231004.49990-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604231004.49990-1-richard.henderson@linaro.org>
References: <20220604231004.49990-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The function doesn't set mtval, it sets badaddr. Move the set
of badaddr directly into gen_exception_inst_addr_mis and use
generate_exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9196aa71db..6e4bbea1cd 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -228,14 +228,6 @@ static void generate_exception(DisasContext *ctx, int excp)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void generate_exception_mtval(DisasContext *ctx, int excp)
-{
-    gen_set_pc_imm(ctx, ctx->base.pc_next);
-    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
-    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
-    ctx->base.is_jmp = DISAS_NORETURN;
-}
-
 static void gen_exception_illegal(DisasContext *ctx)
 {
     tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
@@ -245,7 +237,8 @@ static void gen_exception_illegal(DisasContext *ctx)
 
 static void gen_exception_inst_addr_mis(DisasContext *ctx)
 {
-    generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
+    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
+    generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
 
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
-- 
2.34.1


