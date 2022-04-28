Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F182051379B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:01:08 +0200 (CEST)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5dk-0004o9-2S
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jc-0005JR-FE
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ja-0006H4-5T
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e24so7060880wrc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pYrbtHSPHoRqT6k2PK2XdVtZNFu9lNkgAfpBabTOgTI=;
 b=C4C25B3odxUPJjcXTXdYfaa1/nzL7IENx7wSgv7FSQzCldHiydD1A8RhA4fXeueaxJ
 NkNuxCQ75n51J85rxuMY+AnVtJaO3aB+tJwjJE13UXosVE+LIRF3eS7nGjCDqbdQhzNB
 XNdUJdcMeV8jn4ubcVPB/jzKtziBZUzkZt0yOKyfva92fta8sztSJAsgy5OuKKHZZeTR
 fc95/cSCKNNoU53RovPqSAHOQe7Dc0oEVHOTxVbYL3P5CpAjLI7ZMbJK5S2VMXyYTYiQ
 synVrbZjHZ9wLpqbQO3gAKO5D4xrtl9H7Oo7a+j+K+r8/QKOi/liX4vlyjuT2Qk3S7QH
 nHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYrbtHSPHoRqT6k2PK2XdVtZNFu9lNkgAfpBabTOgTI=;
 b=4uFuPMw36lUI9EH71zwOzN4Zq0NTeGDwDkKvO/EY6f+DZxYzdsnaO+OC3ONdTfjmlP
 HCUOGCvW64GDB37MoVFsyLvq5+3+wD7jafugqrDKAULzNsHrkCLrs5h9p1ivigtUtCI0
 kcxKLn2+kmx3ha9FOsrdvr2MXUGTNfoI5xOF+9aoLU/tHX2YPINmoa4rn5GkIo4Gr+DH
 ieUxZJ9q9gOM4izLHMQ+MPQjNUFSBl/WlwCKIgAxPWFy4Oyf8ls1SpBVa7c1kLitkRXv
 axvdqDWv42TZvPBIKB8sGCVk6nBLTjhsgOH+U6CO3TF5JQQSrM7j/sIlXw8/amoV8k+A
 XZFQ==
X-Gm-Message-State: AOAM530cvIYnbxdVfEGiNQSEGCitXoL4REKZZlIZpop4LsYsHkQUTnqB
 1ueryiruZLtjLvN4VMeeuIWvOOo7W/oGKw==
X-Google-Smtp-Source: ABdhPJwxaY8EYJW5l84dK6N1L4ZruR6l4pu2bhN6XOnYlvDflhAV/zoW6c+mkF9AAYoPvPcBkaXu1w==
X-Received: by 2002:adf:ee81:0:b0:206:1b32:d6f2 with SMTP id
 b1-20020adfee81000000b002061b32d6f2mr26113770wro.144.1651156816871; 
 Thu, 28 Apr 2022 07:40:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/54] target/arm: Use tcg_constant in handle_{rev16,crc32}
Date: Thu, 28 Apr 2022 15:39:19 +0100
Message-Id: <20220428143958.2451229-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-id: 20220426163043.100432-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9b678cc5af6..ff08306d2bc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5372,7 +5372,7 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
     TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-    TCGv_i64 mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
+    TCGv_i64 mask = tcg_constant_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
 
     tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
     tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
@@ -5380,7 +5380,6 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
     tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
 
-    tcg_temp_free_i64(mask);
     tcg_temp_free_i64(tcg_tmp);
 }
 
@@ -5663,15 +5662,13 @@ static void handle_crc32(DisasContext *s,
     }
 
     tcg_acc = cpu_reg(s, rn);
-    tcg_bytes = tcg_const_i32(1 << sz);
+    tcg_bytes = tcg_constant_i32(1 << sz);
 
     if (crc32c) {
         gen_helper_crc32c_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
     } else {
         gen_helper_crc32_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
     }
-
-    tcg_temp_free_i32(tcg_bytes);
 }
 
 /* Data-processing (2 source)
-- 
2.25.1


