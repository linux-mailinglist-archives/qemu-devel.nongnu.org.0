Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A68513733
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:45:02 +0200 (CEST)
Received: from localhost ([::1]:51234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5O9-0005oE-Mh
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JV-00055H-Nd
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JU-0006E7-76
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id v12so7060050wrv.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=35IhVqQKMSt2M2ExCXvzSKgvNQo69e7VSbjXaXkjCBk=;
 b=IVIDFNfycoxIUtqMnOgXxJzD++3H7e2okzjMJUXan/nC/ITESKj1zGv+kpZ/6rMhZI
 ku0B0dQNt+xXHC8pN03gEMw93SN0FRLZE+6IOjQSFZOGaPnqFHpzm242zfdPhH0bfm/Y
 lUGfYAZILQO7hAXtOS+dSGJfohDocoiNvRA5CQ5wrMbaLU9KjlGaMCFQfF06OdLrpOTJ
 p0LfBpjx2XptAT5HkuMGowKxkXSQLUUzNKKx4KJp3v+fg4nocATnrEfb8q0QXUBsCPsA
 GnKEGxWXjrG7XIx+652wdcNjwpSQlsJykv6iv061RMH8QSyh2jiuGu1tPP7fZICuou9r
 T7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35IhVqQKMSt2M2ExCXvzSKgvNQo69e7VSbjXaXkjCBk=;
 b=EFnwWNYVXrLkuJcUJ0upQn+j3yJdws8kZF9VrrWGwUpzCAKaD3n6SlvIa5jgq4DdKq
 AwLjsI4kEeb3Bc9/mSkPvHoIVQLQuRLCF0wRaJ3MB4AlNqq/BFYkfQZSDNgCXfenbDXp
 q02Guq+e2DMJwfLmzu6oGEDhMybzmrgNIiq58ecpo1O8KJkEcWZeUwUUzg2Efwl6N6cd
 xQrG53pbxWtPyaQKZifxr3Mq9FosO03lz3NLa4kZ+XqIVWoCdNzp0ckPnjnskgPiHXlb
 aJ8inYq1BlElIM4gVrd+mGljDmPvCIwDnLC3rfL9Ndn4FT1UntB8sIrFoeWABDC0nSSz
 50fA==
X-Gm-Message-State: AOAM531fE0xRENBK9CC1+at5exmyCoQFnK8wBJjse1gzSaaT7BLYaSeH
 QBM9EsDOibNs7NwYYbMDD0phKWoZsLBgeQ==
X-Google-Smtp-Source: ABdhPJxIULhzJRr0v40Cisx5o4fanqTdLaLIdyDrtLayyAlgEKwitYc/qf/H/c5uSZYc7jz26lWpsg==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr14514603wrw.231.1651156810899; 
 Thu, 28 Apr 2022 07:40:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/54] target/arm: Use tcg_constant in gen_compare_and_swap_pair
Date: Thu, 28 Apr 2022 15:39:12 +0100
Message-Id: <20220428143958.2451229-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 68e3b5c1f80..af6844b4b60 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2523,7 +2523,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         tcg_temp_free_i64(cmp);
     } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 tcg_rs = tcg_const_i32(rs);
+            TCGv_i32 tcg_rs = tcg_constant_i32(rs);
             if (s->be_data == MO_LE) {
                 gen_helper_casp_le_parallel(cpu_env, tcg_rs,
                                             clean_addr, t1, t2);
@@ -2531,7 +2531,6 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
                 gen_helper_casp_be_parallel(cpu_env, tcg_rs,
                                             clean_addr, t1, t2);
             }
-            tcg_temp_free_i32(tcg_rs);
         } else {
             gen_helper_exit_atomic(cpu_env);
             s->base.is_jmp = DISAS_NORETURN;
@@ -2542,7 +2541,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         TCGv_i64 a2 = tcg_temp_new_i64();
         TCGv_i64 c1 = tcg_temp_new_i64();
         TCGv_i64 c2 = tcg_temp_new_i64();
-        TCGv_i64 zero = tcg_const_i64(0);
+        TCGv_i64 zero = tcg_constant_i64(0);
 
         /* Load the two words, in memory order.  */
         tcg_gen_qemu_ld_i64(d1, clean_addr, memidx,
@@ -2563,7 +2562,6 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         tcg_temp_free_i64(a2);
         tcg_temp_free_i64(c1);
         tcg_temp_free_i64(c2);
-        tcg_temp_free_i64(zero);
 
         /* Write back the data from memory to Rs.  */
         tcg_gen_mov_i64(s1, d1);
-- 
2.25.1


