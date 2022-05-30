Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B9538685
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:06:15 +0200 (CEST)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviqN-0005fO-0H
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvn-0003UR-08
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvl-0007IS-8q
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id p19so6653014wmg.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iYyYfgP/74hMPK21rmAvsetCqMTjCc79RqrNr1rz7p8=;
 b=daH5/yzfmaqFBakzttgrYZgLNqD9TmMTqf7bSkmvyAU96N576Rzv4pjZALUkrNat8U
 ne00U66j5+WamSNKINeXd7ZFSUKLkF1M9PwMBbTZ5QSXYKxabMkB5LlzveYOgr+OPkEb
 KMrwYOQu6m/S3GMnD5lkKqAKfnmNL2+pXCEo9w5iLfuKa7sHemP1xwp9HdNYkx67cXWB
 cZC+crGWgUi0L2kkqvp1w2loGxtK2BYmBEnlC62Yy7QQwsLJalytqI7mEQvkEVxZ5GYw
 SWsJC0Ii9efF9j/6/TVQN74BA3ZKYyL46lWxuzHLPKufWz5vaShDfDxN4RD1KKI34VXc
 rDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iYyYfgP/74hMPK21rmAvsetCqMTjCc79RqrNr1rz7p8=;
 b=lOyu4eG/OcAYaJV/G9/jx657l8pAkIfrQ+FaWHbtSLZ0rwTW1Ulr3TUB45CMhJaeJT
 L9ehrspHefavYAvU+rJHvBdZlJP29UjbJ34DGKQcI+G7VuqLpNZHlWQLPdHa0iluSVcG
 sVi0Zn9+Nqtf8IG/9Rv5DOyFYe6hZLNz5Il+w/ICbxY61AtpjYZeh8NpILlZ48vNgS6T
 hvH7G2aY51Tv3jz9th+5oZPZ+/AnIcZcbQKcD0olhwyi8CcywAg/xjEjmH7IaBPDfYF4
 7OMrBysA4yIgyPSI5mzpj9/dJlYveVZ/bVgfahXIUouFkP2DMbJvAJsJrPpcHFf4H/Os
 3a2Q==
X-Gm-Message-State: AOAM531HlaKwo9YPclYCe4j2Wp76/D0bS5PbwS+pEiF9ELhBCPf4rFWe
 w79gwuubbQ3FSrV/mobJ7Lvh4SwzWHbZ4Q==
X-Google-Smtp-Source: ABdhPJzH08ghKXk0Qon1UkxkoK5lKiVfAbJdXLIrLrK/euJ1cmhTdfrFlzSY1XgeNN+Ergnbn7QU8w==
X-Received: by 2002:a05:600c:210a:b0:397:592f:6152 with SMTP id
 u10-20020a05600c210a00b00397592f6152mr19860126wml.99.1653926863749; 
 Mon, 30 May 2022 09:07:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 042/117] target/arm: Use TRANS_FEAT for do_zz_dbm
Date: Mon, 30 May 2022 17:05:53 +0100
Message-Id: <20220530160708.726466-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-40-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7938c5393e0..6fa721eca62 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2046,20 +2046,9 @@ static bool do_zz_dbm(DisasContext *s, arg_rr_dbm *a, GVecGen2iFn *gvec_fn)
     return gen_gvec_fn_zzi(s, gvec_fn, MO_64, a->rd, a->rn, imm);
 }
 
-static bool trans_AND_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_andi);
-}
-
-static bool trans_ORR_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_ori);
-}
-
-static bool trans_EOR_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_xori);
-}
+TRANS_FEAT(AND_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_andi)
+TRANS_FEAT(ORR_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_ori)
+TRANS_FEAT(EOR_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_xori)
 
 static bool trans_DUPM(DisasContext *s, arg_DUPM *a)
 {
-- 
2.25.1


