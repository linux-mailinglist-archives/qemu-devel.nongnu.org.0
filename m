Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D05386C4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:29:39 +0200 (CEST)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjD0-0007An-UM
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-00040P-9c
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:36 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwU-0007Rn-MV
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id k16so10945436wrg.7
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xJwhKbyM174ARiKDgTM7s52QgSFnWHIJp+9TkqMSv5s=;
 b=dG/WgQzbo2TlQOCBZQoIf2+SQnj8bkJLhG6xS/HNqHlkfFg7OUpd9HtJNZMQlekP4s
 /10GHCtWH/FUNiwfYzSi/288FM4lf07KliIain96uUgK91O9KKCKRak4b38Z6Dz2JEGh
 xJmHfPXgVMtdUIlLqTuwvENSnT5mm0r0JbrPN0yuUthL7Bs9MnYL8bRovJ9xuJTGKmJT
 x5zCwG0CJojl4jtmJbnFRThK1RMtw3ACr3BDUPXdAVfulC/GqjGEUvq767lfuAaR089U
 7TkV2/hFaXn+a8wcEMhX932kUrQRcb0HXoZSB0IA+4v+kg8Q86GOOMbz4ouzUrPunBzN
 B2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJwhKbyM174ARiKDgTM7s52QgSFnWHIJp+9TkqMSv5s=;
 b=lA+e8LATkijOq/VOuS7WhOBTQBmHkmR/pTndKXffKamOB7k1JVDGR5X8+7GuI0WVyR
 Y8gGPuq9kgVvNWuj5YACShx18WUj3OQGYbSuuxqseGTBj2+OpBQPR3c6p+tXtH+C1kyR
 q9capMqkWZ9VCjnUt71f86XrL90hj8g3fSdq5JknqpoQFFmroHJXbtvXbSAw7lmYNcXl
 VynX4Ut5Y0+yBCsadY1OYY6u8KLmtx/h6TlRfJ9JREgmCyI3c2QAE8CLGDqVq0vVWf0H
 ld6QPAXJWT1fghxdk5apLExvte8m7CiUGAg8+wKL3P+Bpagrip7rNVh7cqPQzETpt+f2
 dOpA==
X-Gm-Message-State: AOAM5317zooaFPXwuzkFrhqUFLvtpDzyVK9a+GtSnkO5KuDstJj1rjUV
 85olaPTgtIQnhWF6DiPs/9ECY2awhy534g==
X-Google-Smtp-Source: ABdhPJw6TlWKEepaeW56wr/yw4GabVKQmHOVq3c/IJ4Pci9MTNtBVUsG8FEtF/C9ybMnma0IoBXmdg==
X-Received: by 2002:a5d:4302:0:b0:210:824:48ee with SMTP id
 h2-20020a5d4302000000b00210082448eemr18899223wrq.471.1653926909289; 
 Mon, 30 May 2022 09:08:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 087/117] target/arm: Use TRANS_FEAT for BFMLA
Date: Mon, 30 May 2022 17:06:38 +0100
Message-Id: <20220530160708.726466-88-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Message-id: 20220527181907.189259-85-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5aa3e477cfb..f2939fbeb97 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7568,39 +7568,19 @@ TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal,
                               a->rd, a->rn, a->rm, a->ra, sel, FPST_FPCR);
 }
 
-static bool trans_BFMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_BFMLAL_zzzw(s, a, false);
-}
-
-static bool trans_BFMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_BFMLAL_zzzw(s, a, true);
-}
+TRANS_FEAT(BFMLALB_zzzw, aa64_sve_bf16, do_BFMLAL_zzzw, a, false)
+TRANS_FEAT(BFMLALT_zzzw, aa64_sve_bf16, do_BFMLAL_zzzw, a, true)
 
 static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 {
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal_idx,
                               a->rd, a->rn, a->rm, a->ra,
                               (a->index << 1) | sel, FPST_FPCR);
 }
 
-static bool trans_BFMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_BFMLAL_zzxw(s, a, false);
-}
-
-static bool trans_BFMLALT_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_BFMLAL_zzxw(s, a, true);
-}
+TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
+TRANS_FEAT(BFMLALT_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, true)
-- 
2.25.1


