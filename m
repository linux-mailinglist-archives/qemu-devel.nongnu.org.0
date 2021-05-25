Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DEE3906D9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:45:22 +0200 (CEST)
Received: from localhost ([::1]:48374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaBF-0004j2-CA
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYeq-0002UY-VD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYen-0006ze-1h
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so3683094wmk.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uv0XKx9aasgFUM/I68f2ipnbui+kw3ZK7CvY7aFerDQ=;
 b=FOmKeVz1+wwhuO4DwBk812tfoif2L8D6FQNv+s1x+rICn9mzT5UbRukUq4N6dcwAmo
 lQuv0WwNdefE8FIt6WkPk04dnSQAw3W8Q/kFAPziSZMaIUm/aH1+wRzLSwvPEwtFdbXq
 S9VPGkV5BY4uoXnIsVsREg3WCHGEimslcRPLmvEsbMz8PHcv7/5YwFOEwm2oSYqi92v8
 CGtjWjtm9LxJW4CI/Uu4/2FEKcYZH64UAhLyYFhcEfz1jUwXmn0842sJYqa7+J9oHSC7
 aMcXi3oNDYNLHqI6XDpJw8/ChKm0RWrxQwUQUV3YaytKGT6Lv0zHrrMjPiWy6EQlwRYB
 vgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uv0XKx9aasgFUM/I68f2ipnbui+kw3ZK7CvY7aFerDQ=;
 b=aFPtlxB4Zb6wgq6/Fk3rKXtHRkXiiVg5wNmn2ZGawleGpGxCTM9HpsEJUllonDYeMO
 Hu7l3Rs+uNRUDHndrIGUssiAXP4BxkwA8DFwiaH0cwPCnNRzQEf0LRl1MD/A9tTKukWR
 3wxV6fT7ONo3t2Hi5FK/BwWN0i3zEpWMRsBAzWmsXl7yLq/b5Z2ueYe3biyxQjqO9Kl7
 xrVqCaR9UVF3i1R8jUdR0gyjbLZi1V2mFamWRjxpBdKMZas8j4Cg2XlCEqMNDd/rvZe8
 hkkjKoJPgfOP52/b9Z7o6e5jH8YHsUhI/uuedjWJt15m5MB37HDaburwzWuGIpGTd5rl
 7OZg==
X-Gm-Message-State: AOAM5330OAjrmyS/sz+Vnbm3mDJENoHv3eQOHpT0pJvj0oFhRiDCaGZT
 FfB8S+tKQCPVoMP2t4lfyNi9oZyM/0x6H37A
X-Google-Smtp-Source: ABdhPJxkJ4eRbW6J+IdpIJyO73Xn6+QzieHGXvEvYrLIRTuA8UwgRptiWazd7t5RFtN95CMJUCVNQw==
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr4296685wmq.3.1621955263700; 
 Tue, 25 May 2021 08:07:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 099/114] target/arm: Tidy do_ldrq
Date: Tue, 25 May 2021 16:07:21 +0100
Message-Id: <20210525150736.32695-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use tcg_constant_i32 for passing the simd descriptor,
as this hashed value does not need to be freed.
Rename dofs to doff to match poff.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-78-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 54c50349aba..a213450583b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5580,13 +5580,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 {
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
-    TCGv_i32 t_desc;
-    int desc, poff;
+    int poff;
 
     /* Load the first quadword using the normal predicated load helpers.  */
-    desc = simd_desc(16, 16, zt);
-    t_desc = tcg_const_i32(desc);
-
     poff = pred_full_reg_offset(s, pg);
     if (vsz > 16) {
         /*
@@ -5611,15 +5607,14 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 
     gen_helper_gvec_mem *fn
         = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
-    fn(cpu_env, t_pg, addr, t_desc);
+    fn(cpu_env, t_pg, addr, tcg_constant_i32(simd_desc(16, 16, zt)));
 
     tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i32(t_desc);
 
     /* Replicate that first quadword.  */
     if (vsz > 16) {
-        unsigned dofs = vec_full_reg_offset(s, zt);
-        tcg_gen_gvec_dup_mem(4, dofs + 16, dofs, vsz - 16, vsz - 16);
+        int doff = vec_full_reg_offset(s, zt);
+        tcg_gen_gvec_dup_mem(4, doff + 16, doff, vsz - 16, vsz - 16);
     }
 }
 
-- 
2.20.1


