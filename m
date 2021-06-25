Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5EC3B40F8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:56:29 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiZY-0000aN-8K
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4o-0006rR-UO
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:42 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4n-0002Hd-BX
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so5389379wmb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g6g9WN+eC+yVfOp2XuA0nXSJN4HI3/lxTp05miFPo38=;
 b=RJ1i1pTd+Y9T1+cvaBJ2YIZeaHyyy9BMGJ3sTAxfT6G7Kh4b2530dqoz8Sp+tbLK4E
 eqZvHONr98ynmF8bh/m0i7kFxnooptyzEoJ2otC5dmyTzER9OjTdOS0wao7XldAQL6bS
 Xn8iozDENDR4la5PDUY+kMDbdKJOYkvFRS+UNH916glFtJ4O2JOJTCYrF+utwCfeZWlq
 w9058GFXw8WzJe1Jv8sUArv+UM3Kn6BlZ1gQLsQ7kSDvRcpEYmclwKiUKDXPvw6yevWE
 z2+t7HeygN1TYcdjGNzYjDLIS1G0idIKMe/GfvaeiiMeEqjYmAUa/WIQojkrGmdqbpj/
 cKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g6g9WN+eC+yVfOp2XuA0nXSJN4HI3/lxTp05miFPo38=;
 b=RuF1F391+FCC0i/pozbgQ+qrY8I1bONIbJJzdCOY6CLBRyJgCqQIjB/eQtQ5IZgVDj
 lxw52mDh0r1NGo6GpVB9ZxkSERMlLxgSHojhJ+4v3lv72JnXIJtXLNmMaLz0fGkFC8sJ
 RHfVxv3fmPsrxcGv5IjQjRwQTm8ExitGHIdz6VPbdW4qz9rBv/S2xhHjTTTaXH13QgbW
 VJ3nJwuXjqd2QTqcfo4+tUA0lmh1LMeb8RZ3iGauD67xIwdaAfnlxqp0q/5F01B3SR5f
 A8R549x2AJmd0IU5/7l1ZSyQnBKrO1IdbjaG/YYIjRZPM4Khgjh8b2qYhRzuAfvQiWNQ
 g0hg==
X-Gm-Message-State: AOAM531+mJar0qyLURetRJ5Aq93PvEROcK7/mUDhCsgYw29iNtkFblIt
 eYfjzjJNa0kWJtQ5f+fVlllJXletuS7HfA==
X-Google-Smtp-Source: ABdhPJxWNbnnAfRkqnxPsNDQENJFjLPuTyXG/hfe9fpMnPMjpNcYxW2WKzJYYX74/ZwA6uIZOGHLJg==
X-Received: by 2002:a7b:c446:: with SMTP id l6mr9676847wmi.171.1624613079851; 
 Fri, 25 Jun 2021 02:24:39 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e3sm5600587wro.26.2021.06.25.02.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] target/mips: Remove pointless gen_msa()
Date: Fri, 25 Jun 2021 11:23:28 +0200
Message-Id: <20210625092329.1529100-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only trans_MSA() calls gen_msa(), inline it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174636.2902654-2-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index b0df4f85dfe..9df4497c886 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -2162,7 +2162,7 @@ static void gen_msa_vec(DisasContext *ctx)
     }
 }
 
-static void gen_msa(DisasContext *ctx)
+static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
     uint32_t opcode = ctx->opcode;
 
@@ -2258,11 +2258,6 @@ static void gen_msa(DisasContext *ctx)
         gen_reserved_instruction(ctx);
         break;
     }
-}
-
-static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
-{
-    gen_msa(ctx);
 
     return true;
 }
-- 
2.31.1


