Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A265138EE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:44:41 +0200 (CEST)
Received: from localhost ([::1]:49652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6Js-0001KT-Pc
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K3-0005dJ-TH
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:47054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0006Tt-IJ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso3145324wml.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pp+MeYmQk1zNk7v2sc9vGVu3KgT0qTw/3mvI4uD1rnc=;
 b=dze3nTXIgA8490/XxNrWTRnvrxU3M8Z3w9UAPBiBClIF2QDEb1C7m91yB78CMceOrA
 4jsN4YDvGTH2z8ZjklxJNHZ8wCjg/YQ9Y35OdyqAP3VHN0+Sy/IraOZgpHMQQ4Yiout5
 Di02fuHBRxP6a7/kS2hEPJZFn3XE3KDBBwFWyQ/gVOjXDIh2jrWCl6rI59xqHTrksaCb
 fcK2DOcAVjJ+euW66NiwEtfmhmEF7fsXGy/uuK8XwAZsl2P98Hyfr57c3ZojlgC7mvwz
 Xa5AxQnHqnz00C7LHjDabHAgIYuMHtB4T9H7U0AcWNoctznDTIMcLQvrk/XueH6xvm+K
 SOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pp+MeYmQk1zNk7v2sc9vGVu3KgT0qTw/3mvI4uD1rnc=;
 b=xaTM2fTQ5agcjKS4KpcH0kI9iWouIOxcgLvrvGTtnT8/lbOvGE5QHWtmxLENZoX8JN
 eLiiCwHQLq2SuWEtoqudQI0+L08ZRhQGIHHIMRGS96i0jfAqzW593Xz0Ovm0UFGz44lP
 30Uy/m9L3M1SGbpy8i0Tzly9Jyo+2VIDegP5tHuNSHyWQoCzr3fdhH0R1L5XpAR1WhJM
 ph1QMYzC1nVYrTP5/ZDP9fu4+b7sPbYa3ijI9DdBe3yfDRGTrgqXvKq+ycMZ6X5VoJjV
 cJa+slrOZVS33Gbana0K0j9ACFVme57Wxo98RjKX2sQg7owSTd3A37cE3DNSQ0vFUE9t
 xMsg==
X-Gm-Message-State: AOAM530gRQxVs9lEDrpn4Haoh0Hk2e3l2u4z6OvdHN/DD8XdPcNPUVEt
 rc0cw02T8H0bxgIejrRITfvA+cYfJVJaxg==
X-Google-Smtp-Source: ABdhPJzYQpxpRf0hFHhOElItm0/Tiy96OY9jLv3rINtnnc0aF6a2jPYp6t7y8i8jmJZMg3tbCS2b+w==
X-Received: by 2002:a05:600c:3493:b0:38e:bbbb:26f7 with SMTP id
 a19-20020a05600c349300b0038ebbbb26f7mr31163333wmq.114.1651156844165; 
 Thu, 28 Apr 2022 07:40:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/54] target/arm: Use tcg_constant for do_brk{2,3}
Date: Thu, 28 Apr 2022 15:39:50 +0100
Message-Id: <20220428143958.2451229-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

In these cases, 't' did double-duty as zero source and
temporary destination.  Split the two uses and narrow
the scope of the temp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-47-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e812f910cec..82bf094447b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3322,7 +3322,7 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr m = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
+    TCGv_i32 desc = tcg_constant_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
@@ -3330,16 +3330,17 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
 
     if (a->s) {
-        fn_s(t, d, n, m, g, t);
+        TCGv_i32 t = tcg_temp_new_i32();
+        fn_s(t, d, n, m, g, desc);
         do_pred_flags(t);
+        tcg_temp_free_i32(t);
     } else {
-        fn(d, n, m, g, t);
+        fn(d, n, m, g, desc);
     }
     tcg_temp_free_ptr(d);
     tcg_temp_free_ptr(n);
     tcg_temp_free_ptr(m);
     tcg_temp_free_ptr(g);
-    tcg_temp_free_i32(t);
     return true;
 }
 
@@ -3356,22 +3357,23 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
     TCGv_ptr d = tcg_temp_new_ptr();
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
+    TCGv_i32 desc = tcg_constant_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
 
     if (a->s) {
-        fn_s(t, d, n, g, t);
+        TCGv_i32 t = tcg_temp_new_i32();
+        fn_s(t, d, n, g, desc);
         do_pred_flags(t);
+        tcg_temp_free_i32(t);
     } else {
-        fn(d, n, g, t);
+        fn(d, n, g, desc);
     }
     tcg_temp_free_ptr(d);
     tcg_temp_free_ptr(n);
     tcg_temp_free_ptr(g);
-    tcg_temp_free_i32(t);
     return true;
 }
 
-- 
2.25.1


