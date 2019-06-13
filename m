Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9B744B62
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 20:56:01 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbUtD-0000P8-VV
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 14:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53861)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlL-0004Ao-3N
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 12:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlG-0003R1-Ub
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 12:39:42 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54955)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlG-0002th-EU
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 12:39:38 -0400
Received: by mail-wm1-x343.google.com with SMTP id g135so10907184wme.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GypQohw7qsarAznVOv5kE9/Dbn/Co/pX/VNOWPFpp1I=;
 b=sGwPa0qYAx8A3PpngQfWVGz9mpF2j5DJeqqZlaQDceXHmUrCWs0Ze3fU1qmS9l4n7A
 kTFM/1NN6L0MtjIZxLFsRUYS1gb/TAOD2dsFDVvtxO2JGHGZiHgooKrpO7aYgq8migQG
 9lG45rv8vDoHxr0JukA5MD9vXd4VrEQ+uYbgNdbRpdIlpKGD/6Bey1hpkh6NQ/Sak+Vh
 UFawEztJLs1YtlAYeypyjcUTFqBCLkPPx4llNvaIxLPhXYpVhoYkFvta/BYbjTD8SxmG
 4+zGkIGtrOPnSDIT/J/P+JdRGQWi76EmOk8rzwf0IqUy8VFh2yY78zTV/4mgSLZtAkXA
 fZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GypQohw7qsarAznVOv5kE9/Dbn/Co/pX/VNOWPFpp1I=;
 b=rYQ6L+alloObqBb0ckJqg6KPwXaosWkJTXoE6PmE4JoiejulbZ2wPKh/wOw/0SPth9
 RbG8rbKQRYbT5SL7I6LXYHEX1Vu9xzGZaq4aOHgaSyIS4cgIfHrg7lIOdZnqsOThbcAe
 1Xr7kYjDpLfKZbVFo7XGSmHJ48QLJ7wJPI/eQ2Cq/2ibLeQbktCSVTXApBruOusfIpaO
 SGUavEy7O6x1pMVQsdXK9Gq/gmEyLJAnnPKyG4hQ/t16Wow9wUrYnJwpN4FkJ6wcdk1Q
 mM18N9Y48xWaA5EL/U+eMXA4kXroxwM35m7z0ccpoya5tlYiznSaQ9DOW3RLQnZ6wA9C
 bVgA==
X-Gm-Message-State: APjAAAUzyZoEF5n6rFRzQdU8W0JlJjZNuFnZLknIcL5fP7oC2lz2kile
 Slyf/oZsHWKqP5MLWJcRr9YZow==
X-Google-Smtp-Source: APXvYqz3ugYljxhcVQIjfL9Awt5oXUt7a+TmclsI0uMlwSugA78s7zSj4M0goKaJcaF3GEi4y4R00g==
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr4127692wme.86.1560443971105; 
 Thu, 13 Jun 2019 09:39:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:16 +0100
Message-Id: <20190613163917.28589-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 11/12] target/arm: Stop using deprecated
 functions in NEON_2RM_VCVT_F32_F16
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove some old constructns from NEON_2RM_VCVT_F16_F32 code:
 * don't use CPU_F0s
 * don't use tcg_gen_st_f32

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2ba620ac1e1..8f124a953b6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1542,8 +1542,6 @@ static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
     return ret;
 }
 
-#define tcg_gen_st_f32 tcg_gen_st_i32
-
 #define ARM_CP_RW_BIT   (1 << 20)
 
 /* Include the VFP decoder */
@@ -6460,20 +6458,18 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     tmp = neon_load_reg(rm, 0);
                     tmp2 = neon_load_reg(rm, 1);
                     tcg_gen_ext16u_i32(tmp3, tmp);
-                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 0));
-                    tcg_gen_shri_i32(tmp3, tmp, 16);
-                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 1));
-                    tcg_temp_free_i32(tmp);
+                    gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
+                    neon_store_reg(rd, 0, tmp3);
+                    tcg_gen_shri_i32(tmp, tmp, 16);
+                    gen_helper_vfp_fcvt_f16_to_f32(tmp, tmp, fpst, ahp);
+                    neon_store_reg(rd, 1, tmp);
+                    tmp3 = tcg_temp_new_i32();
                     tcg_gen_ext16u_i32(tmp3, tmp2);
-                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 2));
-                    tcg_gen_shri_i32(tmp3, tmp2, 16);
-                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 3));
-                    tcg_temp_free_i32(tmp2);
-                    tcg_temp_free_i32(tmp3);
+                    gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
+                    neon_store_reg(rd, 2, tmp3);
+                    tcg_gen_shri_i32(tmp2, tmp2, 16);
+                    gen_helper_vfp_fcvt_f16_to_f32(tmp2, tmp2, fpst, ahp);
+                    neon_store_reg(rd, 3, tmp2);
                     tcg_temp_free_i32(ahp);
                     tcg_temp_free_ptr(fpst);
                     break;
-- 
2.20.1


