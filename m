Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE75137BA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:06:42 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5j7-0005YN-OP
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0005b7-U8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jw-0006SV-P5
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k2so7089256wrd.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VNRZt6mItSjZ53cGg10+blholLCXICCt6FP97H6jTw8=;
 b=fxsWOwajCTa7V31Do4MFO/sE2kk8OBWqJR3PMBnvz4JTBDcr1tjPEfjBUSzAdF8t/w
 Cu5EgbbSpuygx5hehXeKe+bSmAK6fyYHFUhqmYUKj9BYtkbmAMbyyHCKRLCFczLb1R7W
 omcAfdBFIVdmTzMjPEQoAAcZ/WJGAe9nq8Y+4BowlAvjTeN2pOLl9cDDkIS4dr0ZwnWf
 HC2TDOgp7Gn4CiAg1ieHjZhiB5NF0XxRj7CesBK4Y48Bm+FYM5OFETUOU6QellxVRt8j
 Urf5RCUYe5NY2wW6q10idbQtVKxlx96z3gVXPS68iAJlohz2/2ZVX4u5zWPLf51bJmPt
 BMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VNRZt6mItSjZ53cGg10+blholLCXICCt6FP97H6jTw8=;
 b=lsvtPOwVPUq1WPBzu5ESeqPlU5uCrcKolwR+LxpcdAiHP2v7iB9wg7vCCqru0a4OMk
 nS20MFGsOespkPisQfdAGhZxr8jTqRJJCTcjz4p8LqZe2X4JfPZk25YHma7IyVMN6uYI
 r3wMBhkihkC7n162am/tKsTB26trM0fHANc505ve+iTKGMUfFrtAGz4xNa+Znw0mI9aF
 J/XFhrnR23hRYua5UcMjAjCPiFzfOZmKFkun3HTpNtyuDIrkEvTyDR4N2drl1rOGqlWY
 IJYfyGRVRuMTqSH3cwn/ubUgNkOuvGVP6bRTZ4E47wRHr/Kb2k7hHmT7joFazAFZMMhU
 IFkg==
X-Gm-Message-State: AOAM530aJhmTJnmTwXH6ddsAnVB/LAQq0+1ND58mpMRMGJOlPJpEuh5n
 cQhL1lQJALULIM45yTaCXfOn3+TfnmCZ4w==
X-Google-Smtp-Source: ABdhPJx9lXaPyDWjgYy2DbRBd+Q4ofNreyb4ckrJXvc5LuuutyhmBchtCMvJpwjYdhdz3rfixk97zw==
X-Received: by 2002:a05:6000:86:b0:20a:d7be:e09b with SMTP id
 m6-20020a056000008600b0020ad7bee09bmr18932776wrx.398.1651156839372; 
 Thu, 28 Apr 2022 07:40:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/54] target/arm: Use tcg_constant in do_clast_scalar
Date: Thu, 28 Apr 2022 15:39:44 +0100
Message-Id: <20220428143958.2451229-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-id: 20220426163043.100432-41-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c3d3f301c99..7a39ed0c062 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2926,7 +2926,7 @@ static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
                             bool before, TCGv_i64 reg_val)
 {
     TCGv_i32 last = tcg_temp_new_i32();
-    TCGv_i64 ele, cmp, zero;
+    TCGv_i64 ele, cmp;
 
     find_last_active(s, last, esz, pg);
 
@@ -2946,10 +2946,9 @@ static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
     ele = load_last_active(s, last, rm, esz);
     tcg_temp_free_i32(last);
 
-    zero = tcg_const_i64(0);
-    tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, zero, ele, reg_val);
+    tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, tcg_constant_i64(0),
+                        ele, reg_val);
 
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i64(cmp);
     tcg_temp_free_i64(ele);
 }
-- 
2.25.1


