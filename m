Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2E5386AE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:18:55 +0200 (CEST)
Received: from localhost ([::1]:58312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj2c-0004ih-5P
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwS-0003w8-9k
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwP-0007Ju-NR
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l188-20020a1c25c5000000b003978df8a1e2so4642191wml.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qKmMP3ntWm8SMPbCv9q+yK+oS7ObuX4ggX/H2tpCZds=;
 b=HvDcFVUcMoTCfk+bQZfN9v0SczcVQw7FFa+SppuhqNo7U4eEkDeUShvJmtUZvONhf4
 BqW2FI2OCbLD0izFCq/DrJJU09W9+VgLsaowruqWFY1BUwwzF0xcD+EDqeDJ5Wc3YT6E
 v98LhhuuFis5gRsxX0f+YJGTR3pyGQPH76Xaok0YztcRdR9EmoKngtumh6PLuKurCWLD
 DAj+UOBdUeI+7g7+Do24psCxAJ+m2CQQfmi3/JNJjOTfZuR4Q17/cDKv5x0MLFfG3ngn
 5Av6seykhWUGRVGWd+dr4MxjahrSVBVDXoMSlwkidtD/5BS+NlTN21xmhwMlvS2eG3hx
 tocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKmMP3ntWm8SMPbCv9q+yK+oS7ObuX4ggX/H2tpCZds=;
 b=hQFweYN1mK/6lc0nmhpKx4fiGagX6HjIpS4OJRTJmAZrGAHKRkZSDRTpLz9VYgXc4K
 EwnlSYHSoRG2AzC2aSNCJIFZfEos56+9y8022herSHUkWiSJFBvSLvOLJJJjzxcffhwb
 AW6SgVqDX/uo0cw6Iqb+82osKFIn16EVG3Yopq18m6R2NeoTW15XjtMtFWrEcOqtnb5L
 nCtIfq2z1kobjy0iidCklS8ZFSipp4acYKoah5w+8UrUuGFLeTos1t1loiqq1wxB/YL8
 DVlN0pwCRNubV5KbUoByIZLSG7l5PrAHqVKuQSElqQlL42VjnjZxMqUCqtr26DjWUsbh
 CauA==
X-Gm-Message-State: AOAM5309dvVZTINGsM2UzkyGxYzRrf925bnQfei2V21x0fY4FvfaJfeL
 tvMO2zQFg5pMpGl08MNPSy7F+VwpY9oKyA==
X-Google-Smtp-Source: ABdhPJyDW3W9CkPgddJ4fSUEUh3OHDqDrin62FIZpBVA21NN9KuzSUEi3zacZPWPNXAvCjsNwB0wzA==
X-Received: by 2002:a05:600c:257:b0:397:4106:5150 with SMTP id
 23-20020a05600c025700b0039741065150mr19560335wmj.163.1653926901835; 
 Mon, 30 May 2022 09:08:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 077/117] target/arm: Use TRANS_FEAT for ADD_zzi
Date: Mon, 30 May 2022 17:06:28 +0100
Message-Id: <20220530160708.726466-78-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Message-id: 20220527181907.189259-75-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 83980f5ee6b..6b2f235e4a7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3254,10 +3254,7 @@ static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a)
     return true;
 }
 
-static bool trans_ADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return gen_gvec_fn_arg_zzi(s, tcg_gen_gvec_addi, a);
-}
+TRANS_FEAT(ADD_zzi, aa64_sve, gen_gvec_fn_arg_zzi, tcg_gen_gvec_addi, a)
 
 static bool trans_SUB_zzi(DisasContext *s, arg_rri_esz *a)
 {
-- 
2.25.1


