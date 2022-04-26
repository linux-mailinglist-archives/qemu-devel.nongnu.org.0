Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7A510365
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:34:31 +0200 (CEST)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njO90-0000Eq-3r
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5g-0002xf-Mn
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5c-0003oB-PM
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so2997430pji.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r3b3ObwAEyrWfeTyyB3wAvvyfGkoSxU0Tc73xuh3JPA=;
 b=T5UF6ut86Vd93T18BYTyEz0bV7ZOqvRiyb1VPLEb88eOU5PLT5ohWSPf0Em2AOv0EZ
 BID89Xjd+12zYp/LwY1vzz51VakT48j+U6RQc98uuaLVvRGrzI1pJaMgoOQw9g6YhM+g
 IYZhr1svIZflSM7/aadlHZvHZpXvTsdQZB5ueT/L/02xJKN8UEbrvBMCMjk62JJmMiSm
 Xg17Vgk79ASx3dLKGQmu5wMnJ+LKioMNgAftN/NsE308pNYjStUe5qDxve2r83p1tLDl
 /7WT4TGJA+GGBcqZymYTCC/gLFAAZEYbwGetcfaqduDn/UtHe8pXUj/WBA/O0kMKP1qY
 92rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r3b3ObwAEyrWfeTyyB3wAvvyfGkoSxU0Tc73xuh3JPA=;
 b=WfAHmQ5CyGKVpUdXDKmTSqUBsSD3+hQ/1ag0nrRrx08uGTOLbWW66Z9v4h98Cmnzkt
 m4IyznA8Iz7z7RsIjcmF/mZcNVKgxyEIRDtubNsFXb2xq+NFKolrMq9LJ2lsJ50gzmsS
 P7KhGFSmi5ww+HQMV8IUKITMdT6iDmfWy9wC17JSj3k0EYEEGqxRjtzyvWAp6NUhesj0
 WRfBFd8upc+UHMe8vsFGpFnL+sxPUC4OF04pY4rC3DcdLlVkOyQsKQwWKaHbQJWnivht
 e013j/+FxlX27Vm+72JwY/GR/agjP4BObsX3LxpruIP/wtqhhwPet/EnQLqdQ968jM2Z
 g31A==
X-Gm-Message-State: AOAM533BQ1S2+k9260BnFFULS6F4G7WOATfmpVo9X2V/Ri3KeAGhQ5jY
 EgIhFo8c6TkEnZiY9/jsvtyw4Xw2nFfaAw==
X-Google-Smtp-Source: ABdhPJzYrcAoE944lf+SzcoV5LDVqwz/vqTpqUtRTREjv6lxySRbqztKdxzxW6HEhcy2p6huVO9P7Q==
X-Received: by 2002:a17:90a:f2ce:b0:1d9:a18f:87f3 with SMTP id
 gt14-20020a17090af2ce00b001d9a18f87f3mr7251685pjb.213.1650990658969; 
 Tue, 26 Apr 2022 09:30:58 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/47] target/arm: Use tcg_constant in shift_reg_imm
Date: Tue, 26 Apr 2022 09:30:09 -0700
Message-Id: <20220426163043.100432-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 537eebbf1d..3de2b27cc7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4678,11 +4678,7 @@ static void shift_reg_imm(TCGv_i64 dst, TCGv_i64 src, int sf,
     if (shift_i == 0) {
         tcg_gen_mov_i64(dst, src);
     } else {
-        TCGv_i64 shift_const;
-
-        shift_const = tcg_const_i64(shift_i);
-        shift_reg(dst, src, sf, shift_type, shift_const);
-        tcg_temp_free_i64(shift_const);
+        shift_reg(dst, src, sf, shift_type, tcg_constant_i64(shift_i));
     }
 }
 
-- 
2.34.1


