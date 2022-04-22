Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C783F50B603
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:17:12 +0200 (CEST)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrHj-0005Vw-R3
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAR-0005dc-Cv
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAP-0002zZ-Tk
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id b19so10282612wrh.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=B02wNUQWPbSndWLw/MyCz76UBwGsg2MrYi8CgBL9/W0=;
 b=VI8kYcVgKhiY8f8DOPY+6th2FfzdCM3llZ9LIzXFeRzPYASoGMUxCqvekXmInkQ3jl
 RuDU/qkC+gADu2xZaO+p22YKzfHdqRJl1HjCBToNW6MUslh06P9Tryhp6oog2azFcI0m
 9dQUT7/4LYUnjMp3GjnVYVi1VcK49ym4gGkbt1o5kSRS52PrrulwYtoPRgAul3GRgccs
 VG/+BJmynfYNt2SgfiMX7IYX2idC5T7zpDZuB+y1R9m9ReKO3hlMVxjcW1S0LM4QGZ7D
 ldjBjojdEySo3S/IcnTMInlw5UErKNr8QGL5DfABzWcvoua4OAf4svJGaGeJtJJNJOA+
 /FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B02wNUQWPbSndWLw/MyCz76UBwGsg2MrYi8CgBL9/W0=;
 b=urqyIcErjJnHsoqMglvXZD5rZ5aATQrJLzmr3S9HASA4Huyz2eyRcb7IuW9gHrve/6
 FzEff2nTEAs4a/tLGb0k9shlboQIsWf1VN7uyvANZpC6+2rKuIOBmJPpp+sU6dZD2e34
 IFdm8z1/Bgf7JqxI58sCNv9qcYMcy7uSbrhAsAAKxYOV9rtGlPVW9Tgvnk0V5QFEhwHz
 X7qTH/G1UbeWo42FoAT2U8pxWK2q4Tp2swW+tIqSdOCikY5BbhX2TbzM8/z2XntIzYgX
 HwVdmui6WGCtBRIqafsISfhhVahb/HFi7HAHCUGVN+Vjdz9zpesH+DHRfA9SwweKx0t2
 yAmA==
X-Gm-Message-State: AOAM530Ht4pDviChKjqVD5HXi7Of2FOykBhsY8qWktW5faA4QPSb9CY0
 eDsBVEF6WlILwxilUTy/7sKuYrbik2/xaQ==
X-Google-Smtp-Source: ABdhPJy+jacT3FJjxbGF0nXC/RfqDA5bMOOw2na1WQm0IpVEOPrzjc3riIihJcLhb/0gMdGlfOUDZw==
X-Received: by 2002:a5d:49c1:0:b0:20a:a65b:4648 with SMTP id
 t1-20020a5d49c1000000b0020aa65b4648mr3074559wrs.707.1650621932558; 
 Fri, 22 Apr 2022 03:05:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 60/61] target/arm: Use tcg_constant_i32 in translate.h
Date: Fri, 22 Apr 2022 11:04:31 +0100
Message-Id: <20220422100432.2288247-61-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 050d80f6f90..6f0ebdc88e5 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -332,16 +332,9 @@ static inline void gen_ss_advance(DisasContext *s)
 static inline void gen_exception(int excp, uint32_t syndrome,
                                  uint32_t target_el)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
-    TCGv_i32 tcg_el = tcg_const_i32(target_el);
-
-    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
-                                       tcg_syn, tcg_el);
-
-    tcg_temp_free_i32(tcg_el);
-    tcg_temp_free_i32(tcg_syn);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
+                                       tcg_constant_i32(syndrome),
+                                       tcg_constant_i32(target_el));
 }
 
 /* Generate an architectural singlestep exception */
-- 
2.25.1


