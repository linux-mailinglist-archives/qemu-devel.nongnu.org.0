Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15D538677
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:58:47 +0200 (CEST)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvij8-0002hu-JD
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvy-0003fd-Dp
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvv-0007Ht-Ng
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso3118586wma.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Fp8z/L9oNA2BFUFDrog2AzHevKjy6VYkrI1uW81LVOY=;
 b=ikv1ST/kLYzlCYDhWV3r51mPQCVEqpsD4gbhzrxbRhpDedsUXvid5NMktBLrZ9CA4z
 HLhRujnQlfQ+R5Q6xZhpgyWfTdEvUyL6HkdFDLxvD5kFT810gGvXkNSjfG3Fxef8Srqa
 452Vd+Ghfk6bvxE+FWMckmX+XbwbjAiRkqZqotMPTi1z1N8UqBiLVkvL1KLa++LduJlC
 Xuse3ZLcPPDL44Do2ctlWe+ADkimJ5xL3mvizfx2Do3euofjs+QCdjRrl7sLdBKYPf33
 jmeORVDvbgcj2cgIkjAJw2laBfcxUDjTVLP5i40VsCkdewKEZeddHTEZy/pFfy+5AUG6
 BhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fp8z/L9oNA2BFUFDrog2AzHevKjy6VYkrI1uW81LVOY=;
 b=OCBQA6WisbSq0PvoQFJtQcZfGnv8rlnD1LTzo5QtVlv6WoBPW++eA+0ZfhiC+ZGHTU
 wStvksiaFY53WMYS6dUPjb549H1Kvf3q1QytUDZKezbDUnsyDEJRjC7UNITVmfX6nNk4
 6dnX2gfec0QQhEDUtXHyh38sjka6MIgYWJByEFt4glQRKwSJVMfygdPi9M1nWEbZHJx1
 4h78vTE1QZS7HWLtrUxnqjJCdyc6r4WwnirEd/Bb4ZwFfA2/10cQNczRBTOHgKoBph8a
 O3Of9U41noEIl652ZVAZ0v8lBhN/r0WyoDlokMiqaIoStq+lpZl2nMEyZgCuEPeTdquY
 3BTQ==
X-Gm-Message-State: AOAM5303/1tTz4HZoA4TlJbHtN4MecT7XvMieM8POjpkvVhD/+Y+Ys5m
 CIrFtAn6gz9rU8ncXCJQXIO7UZK6MsBhUg==
X-Google-Smtp-Source: ABdhPJyhQ4uuR7AXu/jCXb4yE1f0q8yLWDp2I+HbrU2R27IYuMNxkzpF0OQ076bSPVH7eM+GfRZhng==
X-Received: by 2002:a05:600c:20c6:b0:397:408f:effb with SMTP id
 y6-20020a05600c20c600b00397408feffbmr19793779wmm.1.1653926872419; 
 Mon, 30 May 2022 09:07:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 053/117] target/arm: Use TRANS_FEAT for do_adr
Date: Mon, 30 May 2022 17:06:04 +0100
Message-Id: <20220530160708.726466-54-peter.maydell@linaro.org>
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
Message-id: 20220527181907.189259-51-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dac29749ce0..c8eb2c684bd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1177,25 +1177,10 @@ static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
     return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
 }
 
-static bool trans_ADR_p32(DisasContext *s, arg_rrri *a)
-{
-    return do_adr(s, a, gen_helper_sve_adr_p32);
-}
-
-static bool trans_ADR_p64(DisasContext *s, arg_rrri *a)
-{
-    return do_adr(s, a, gen_helper_sve_adr_p64);
-}
-
-static bool trans_ADR_s32(DisasContext *s, arg_rrri *a)
-{
-    return do_adr(s, a, gen_helper_sve_adr_s32);
-}
-
-static bool trans_ADR_u32(DisasContext *s, arg_rrri *a)
-{
-    return do_adr(s, a, gen_helper_sve_adr_u32);
-}
+TRANS_FEAT(ADR_p32, aa64_sve, do_adr, a, gen_helper_sve_adr_p32)
+TRANS_FEAT(ADR_p64, aa64_sve, do_adr, a, gen_helper_sve_adr_p64)
+TRANS_FEAT(ADR_s32, aa64_sve, do_adr, a, gen_helper_sve_adr_s32)
+TRANS_FEAT(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
 
 /*
  *** SVE Integer Misc - Unpredicated Group
-- 
2.25.1


