Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655F5386D6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:36:46 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjJt-0002Sm-CA
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwd-00047m-Jg
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-0007Mz-6Y
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id s24so7959084wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZyjefK2N6kk1K8g0EnZkJnhroFFyabcGZiimwzhqkyg=;
 b=gulOOUI4LgCXEVrz8aUiu+K/Wf5wf+hw9653NLlp/3D9BNdBcmTcdGRaUoX63SNOQE
 PKrwWWqtcaQDikXJJxugya/h/OWVRcfNEg4EoW4TEL5qheMBuXsI1m0IdhMHM7EGfIBz
 zega2XyJGE+jLNOYJI5eKUxys/NNDTpZhXEI0aFzruoperxnlvmwkRTT+6miFX1u6UuQ
 Or39n67ds+F3KrjFn+9zVlkP8yyD0AREOAaAIlO/0MlSkAHXLA+RiGjZPmNYmAQOOtDf
 MxfnxcRxVZkGL10ly0DMroc7A44uu/+d3uROQ8/YsLCVM8pBRNCTyNXGnLBJrlpWolfi
 IMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZyjefK2N6kk1K8g0EnZkJnhroFFyabcGZiimwzhqkyg=;
 b=OpTNagp5NSj/tMDvG3RuDVbDquofc1BcBLkuZh0dIw7IHGIfHconmYylvVP1RqJ6Hy
 tSZSUjsuksqUPRavEdGNx5VGjM3jgyBcLEXT/oMnb2R+ClzBxLevWQsRcOMNh9bGbJyg
 gvm09u7oBYhwqcldv6BRhYX/MnjUynz0WdKhksufJOdwN9FUUyU6Xj1WHkkduf8zjZGv
 h97N9Oo51M2au9jvfe5PbJLi1jAi/9koD3/v9HQxiMLp+8IYjXl5pg/bx7CNAs/9NUaP
 tli28ss9lD9i/qV+N/oW6pdT/0lBqrWgiGnprsDzYkJN8SfNQVddomSkg/vbEs0y3ZB2
 0/zQ==
X-Gm-Message-State: AOAM533iz7n7jBiwlzrOiudQ/7YjLSWSQvz1/JXfYvR6bMzdY6CLyghd
 v/9oEVGffSQeSYTiSDWZ6++P3M35KZOWUg==
X-Google-Smtp-Source: ABdhPJxHr925eWq1LMNvv0+8/jYRu6Q0X0Phwj1WK7rcgSOR2NUuuDzKtVUJtYVOtgXP2wFSrpfV+A==
X-Received: by 2002:a5d:5888:0:b0:20c:d66e:a637 with SMTP id
 n8-20020a5d5888000000b0020cd66ea637mr47145177wrf.215.1653926913689; 
 Mon, 30 May 2022 09:08:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 093/117] target/arm: Use TRANS_FEAT for do_reduce
Date: Mon, 30 May 2022 17:06:44 +0100
Message-Id: <20220530160708.726466-94-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Message-id: 20220527181907.189259-91-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0d71072f837..4a9ecd5e72d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3609,15 +3609,11 @@ static bool do_reduce(DisasContext *s, arg_rpr_esz *a,
 }
 
 #define DO_VPZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)                \
-{                                                                        \
-    static gen_helper_fp_reduce * const fns[4] = {                       \
-        NULL, gen_helper_sve_##name##_h,                                 \
-        gen_helper_sve_##name##_s,                                       \
-        gen_helper_sve_##name##_d,                                       \
+    static gen_helper_fp_reduce * const name##_fns[4] = {                \
+        NULL,                      gen_helper_sve_##name##_h,            \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,            \
     };                                                                   \
-    return do_reduce(s, a, fns[a->esz]);                                 \
-}
+    TRANS_FEAT(NAME, aa64_sve, do_reduce, a, name##_fns[a->esz])
 
 DO_VPZ(FADDV, faddv)
 DO_VPZ(FMINNMV, fminnmv)
@@ -3625,6 +3621,8 @@ DO_VPZ(FMAXNMV, fmaxnmv)
 DO_VPZ(FMINV, fminv)
 DO_VPZ(FMAXV, fmaxv)
 
+#undef DO_VPZ
+
 /*
  *** SVE Floating Point Unary Operations - Unpredicated Group
  */
-- 
2.25.1


