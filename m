Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20041366045
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:37:32 +0200 (CEST)
Received: from localhost ([::1]:46148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwBf-0003Xq-7b
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9H-0002GJ-Ok
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9G-0001vw-7S
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso10905127wmq.2
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLCiOBvYe9uou2qKsybkRDArrM3VCschSDNYIP+mEg4=;
 b=UXpm50Kat3ML+nILUcSgIGazeHQ7BgpZrdbwOlr4Wan5vb4HfrhEY47zN+KMMSfbSH
 wZwk+lzDiElOgFUTvDqMFrh/U7KB3I7lHYNNguAAQjwut3K3EtY+e81cpkeyD3Gg9mBp
 z6+gK2z/fTr1JKtItPn7UllvuIdL1jEm0IBb3LtDjXk1ySfMlUd2NhxU2X0b06ER1Hdb
 OwqmQmcPn9Sz963TL8tmuvc9OSJpS5GINqNzKZVuAHCoYY+s/jpkVUzYQmQmXfWayzsc
 bhtP4ThagbwkeQEZOkFWNcyBEIbNdF24jBF0C1vATOzbuFeN4goDI3kmnG+lx8z3it0t
 bGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qLCiOBvYe9uou2qKsybkRDArrM3VCschSDNYIP+mEg4=;
 b=a85YuHs1LaotYGVh2vGKuU+tmUMgJ+9TvRRU0p7DBSudUJWC888Y+4ocjzrHsRyVx2
 ZvVT2SnvaoGAK/JY4PZ4m8ygKWOFfP0/vUhLHbv7EtnpWZrysTktOtzi+L4tB7YuTeYd
 EyoTXGvKnesiqO2jfo86tuABWgh1YzbfTQ+TLBkOKVkd49cISHnqhAsDfxfxBz/cdqmM
 o+es+kJDbmbyAx21TE2Bt9oAPLfE22J1K+CXiV3oW+/0S4PwMfjTWAISbp82Q+hZ5C5Q
 5+veLnJD1GZjtdPK0o1jOrshgPBtubXuBgq4r+tLz5Q5R844M8uQlwIAjTWtyr3b3lv/
 yX6Q==
X-Gm-Message-State: AOAM533kgW0NZK1VFYfsyvDz2luFJ7eyo3qFbV5yUm1QlpIGDrVeHhRX
 ytJI8x9EcEM4q6Ftdlw4Xzdmc1QpB0mvNg==
X-Google-Smtp-Source: ABdhPJxJldn4Rhtn7ZdT+/3BSZXXI22427rLDpLi0bQzl6lhAGKbjZ9pnylyhRUHraNncqL6cI28Vg==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr5972311wmc.93.1618947300467; 
 Tue, 20 Apr 2021 12:35:00 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q7sm15939006wrr.62.2021.04.20.12.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:34:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/mips: Remove duplicated check_cp0_enabled() calls
 in gen_cp0()
Date: Tue, 20 Apr 2021 21:34:49 +0200
Message-Id: <20210420193453.1913810-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210420193453.1913810-1-f4bug@amsat.org>
References: <20210420193453.1913810-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already check for CP0 enabled at the beginning of gen_cp0(),
no need to check it again after.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5dad75cdf37..9acca6ef045 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -9477,7 +9477,6 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         opn = "mthc0";
         break;
     case OPC_MFTR:
-        check_cp0_enabled(ctx);
         if (rd == 0) {
             /* Treat as NOP. */
             return;
@@ -9487,7 +9486,6 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         opn = "mftr";
         break;
     case OPC_MTTR:
-        check_cp0_enabled(ctx);
         gen_mttr(env, ctx, rd, rt, (ctx->opcode >> 5) & 1,
                  ctx->opcode & 0x7, (ctx->opcode >> 4) & 1);
         opn = "mttr";
-- 
2.26.3


