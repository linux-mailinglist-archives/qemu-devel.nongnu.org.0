Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABBD53865D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:52:11 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvick-0006zP-J7
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvy-0003fc-Bc
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvv-0007KQ-NV
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so6713288wmz.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aP12OH8l+mHHRjmOLnxcEBe1h6XZ+QuRnUPcFQro5/w=;
 b=je+hyHvSaQ8MyHYVYhx9sVD8znlrsIimPy3HsouUcOdnBg9IQ7nz6vKFFfOITsOpAz
 1+IBEwHnf4+7f8i/dcp6xixEMWLgHKXXH7Av9zKE3Jb0MMRNSwLzxrcr98Y7TitlqEM4
 FnykuZb5Sxzx09OB9RdvYrtgyGExQal014rH0DxV6Uc0gUnUHL6YupBl1d1GLxOlppwz
 hvZtUOOkRjyi2qhpxS9bdZ3N3WHlIVQjloXqSOhl60YU/8cUikeBpGEFV3VjoJAqenn6
 cDANpDnho/PAOjsFdoGkykhsbUfWCIH+YetXxHnDjSFooRXlGrwNuUlx1q0Eu+KBtxVH
 crWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aP12OH8l+mHHRjmOLnxcEBe1h6XZ+QuRnUPcFQro5/w=;
 b=fjLTPOzCTHyuE8raqczgRRAFMfI2tFqpCDZLqeDSrqXlZSnNVwrU9EMxLWds+qPZen
 Pi5mf2tJ/nHmERM2rvqsVk/DNImUwQxHl7XR7JQcFT/w5rZMpjkV++t1TQCqk0r3Vd28
 Mbr5HkA5CEwOypEqvFmZByRYXCgi8wE+MiaEmC1EGeSm6yE96ccOs+e0EgWz1VKsYlhJ
 W4aE1LyrDCOPD7IVdNgMeLdxMCvzPaS5KmvZpMaXj7XeAEX4YEz+HITiVNwuMt2vYzFZ
 0/v9dxpQd9sztT/Fan6HQLakPj3lEU8o1coFg6CB5NjQtFxaqs2Jlsa1iF52ZyXJEptz
 hNgg==
X-Gm-Message-State: AOAM530cUcCAs7DKWYPyqAYoMiJODFziKlbj+3My9HnEsL8OT6W5EFMV
 q9LjyTHnj4EWUAMrzfoVq+NSvdZ/caHHqg==
X-Google-Smtp-Source: ABdhPJz/Uw0vSdQ1cwCrvvqPC5QfbsJdJk7sheP94y2Wtomk83eXdtqjcb2cFwVVWsf+kNmJgLXwJw==
X-Received: by 2002:a7b:c1d9:0:b0:397:335d:4d9f with SMTP id
 a25-20020a7bc1d9000000b00397335d4d9fmr20041265wmj.55.1653926871635; 
 Mon, 30 May 2022 09:07:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 052/117] target/arm: Use TRANS_FEAT for do_index
Date: Mon, 30 May 2022 17:06:03 +0100
Message-Id: <20220530160708.726466-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Message-id: 20220527181907.189259-50-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 44c23429232..dac29749ce0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1126,33 +1126,14 @@ static bool do_index(DisasContext *s, int esz, int rd,
     return true;
 }
 
-static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
-{
-    TCGv_i64 start = tcg_constant_i64(a->imm1);
-    TCGv_i64 incr = tcg_constant_i64(a->imm2);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
-{
-    TCGv_i64 start = tcg_constant_i64(a->imm);
-    TCGv_i64 incr = cpu_reg(s, a->rm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
-{
-    TCGv_i64 start = cpu_reg(s, a->rn);
-    TCGv_i64 incr = tcg_constant_i64(a->imm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a)
-{
-    TCGv_i64 start = cpu_reg(s, a->rn);
-    TCGv_i64 incr = cpu_reg(s, a->rm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
+TRANS_FEAT(INDEX_ii, aa64_sve, do_index, a->esz, a->rd,
+           tcg_constant_i64(a->imm1), tcg_constant_i64(a->imm2))
+TRANS_FEAT(INDEX_ir, aa64_sve, do_index, a->esz, a->rd,
+           tcg_constant_i64(a->imm), cpu_reg(s, a->rm))
+TRANS_FEAT(INDEX_ri, aa64_sve, do_index, a->esz, a->rd,
+           cpu_reg(s, a->rn), tcg_constant_i64(a->imm))
+TRANS_FEAT(INDEX_rr, aa64_sve, do_index, a->esz, a->rd,
+           cpu_reg(s, a->rn), cpu_reg(s, a->rm))
 
 /*
  *** SVE Stack Allocation Group
-- 
2.25.1


