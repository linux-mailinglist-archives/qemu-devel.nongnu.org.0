Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F213F75AF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:14:11 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsjA-0000Kh-8t
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZp-00031f-CO
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:22 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZn-0002wE-UN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso3639189wmj.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i06r5piwhUzlfYEDel4YDW/Tf1grhwbEJWrNwUENspo=;
 b=HFPg8K8tNG/pEdg2C2XruUsYRgEGWxvgFyZlEwqpGunsAd+7sFj757K9KCIgqGu/ro
 BCkKGH35QFAyoDkR0+WqwL4K70h1inWmwz4xnZRz5LfPsg1IeRYJ5L3av7KO1W6Ol/1w
 p2f5sDcwMmDwKeRonLoNyKqNFqbVzIjBNslnRn7FcVi0WYFk+054fPOkoGaPAeiTVRaM
 K2Eo/v0dLyjaLnsDssuOc3VJEPwaY439t+CYq9EBBXEjqSH24CiM6EX+hy889455ipo3
 e8QgR69hb7IdLW3qa2azA0YSrO2PIkn7aLFepsm6hit+k6JTAB1BxjElCc+UJ4MHYxSF
 z5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i06r5piwhUzlfYEDel4YDW/Tf1grhwbEJWrNwUENspo=;
 b=Lbg2lNMM2zzZ2i7+rr1MKtAylfvB31fhAEaiKHge58iFEpEqRU2tPvpMJ6GluKpsKy
 TH6mTm6RUAZyxS6O5aC6TgKKE+wCdTvgLEKuWIf2PFOOPi151UbFXjQAM+f/ipRSztZY
 lFzxM9GDTUD5TAqnN1YrnE4EZBEg7NTvhfT6TIlfYEAxiVIyGdH+vn6pdqDuTbHu1n7K
 QoiFXdQWwyQNznx11z42LBNHNg8l4hF4KsLMnotFp8HldbzfKfDvVj3fLWf2CWxA5V5T
 WIq0rpvNedCu+i8hJprRwCYy3IvxRwdhBcxpsUjC8Fa82o0qbZSsP+gB6wu+4p2tPVGg
 KXhw==
X-Gm-Message-State: AOAM531uZJ2+5k8dYaFG3BjZbzRS3h1PoyuzrzHXt/3Yj6Et8yO1D3EE
 jYE5NNur+XSkwoJcvDT4T3ttUq82rB4=
X-Google-Smtp-Source: ABdhPJxcuWFB1hQbdf3Zneam/wbf851XVjTa8733htc0QqBvlOXgJ9HZUv6YAp8AYF0tiLXpEn/oJA==
X-Received: by 2002:a05:600c:4f91:: with SMTP id
 n17mr9042416wmq.54.1629896658554; 
 Wed, 25 Aug 2021 06:04:18 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f17sm5347640wmq.17.2021.08.25.06.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:04:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/28] target/mips: Store CP0_Config0 in DisasContext
Date: Wed, 25 Aug 2021 15:02:10 +0200
Message-Id: <20210825130211.1542338-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most TCG helpers only have access to a DisasContext pointer,
not CPUMIPSState. Store a copy of CPUMIPSState::CP0_Config0
in DisasContext so we can access it from TCG helpers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210818164321.2474534-5-f4bug@amsat.org>
---
 target/mips/tcg/translate.h | 1 +
 target/mips/tcg/translate.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index eac01a81182..4b4fa2c207e 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -18,6 +18,7 @@ typedef struct DisasContext {
     target_ulong page_start;
     uint32_t opcode;
     uint64_t insn_flags;
+    int32_t CP0_Config0;
     int32_t CP0_Config1;
     int32_t CP0_Config2;
     int32_t CP0_Config3;
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 40cb1fc9508..ac97f5f6f0f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15979,6 +15979,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
     ctx->saved_pc = -1;
     ctx->insn_flags = env->insn_flags;
+    ctx->CP0_Config0 = env->CP0_Config0;
     ctx->CP0_Config1 = env->CP0_Config1;
     ctx->CP0_Config2 = env->CP0_Config2;
     ctx->CP0_Config3 = env->CP0_Config3;
-- 
2.31.1


