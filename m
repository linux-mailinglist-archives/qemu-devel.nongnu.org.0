Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A350B5F4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:13:22 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrE1-0007tw-Re
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAL-0005aO-AJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:30 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAJ-0002wm-NO
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q7so2682417wrm.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Qx1JjAG3lYRZ0uJz1kolQCY/eQ8GjTyEi5vBbytSLK0=;
 b=iP9ToNzIPeJFtMRcC9Y5TYJ0M08wbS+1GNabsx2ZWrteJ0gwbkYp6VkbPjVjCmcA2N
 m8QGTMU2CEh7my8VRMKWPd2/geokc69dnMwXRfqHamWMsBHM8VQz48k8PoTjhUKvLJGf
 OvUmKUuUcN9VJuzdTCgmdDN0a15sRFtt64jYU5qYNIKhg4dfBn0HUf2LRxSsMcfqTcXc
 JCnizLGCKu3+Fpf5Y9i3YCcBRykaX87Ld4xu20zZRZ83m07ZhKBm80f5F6KmPEvqeQe6
 hgZ6z7MdApdBJRBPZHfIcnkh6fIn3z2h3ETgNVLwKPMZDaTD3um/LqUKOSsQd+6SpVJz
 z3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qx1JjAG3lYRZ0uJz1kolQCY/eQ8GjTyEi5vBbytSLK0=;
 b=KJ1dnNG2zaw9ResRBTnu72Uf8ToT+nBHO48KSOL/3VkCujicypxMmS/iv93c6Sf9PV
 jPQ/k+s0837kMdMMPWAnDqWpXXjZHNqkcBtI01iYS6CzBkEW1MmGEcO6+X1E797GfmQk
 JsX1amq6B/p0UV8/claofMfxnL59URK0BAbvzsTRIq8RcqpYMS+gOK5M4euuFjanKyrK
 1ply+mfGWZA8QlsMRtS9wRHGPq1FuzvWJmu++FeDy5vblQRC6gO2q53JV3d4Xjg2h+ff
 mQP/gCJyh6b+pOUMlPqnkID04At0nlcbw2HjmkBEURFlnNYTJ2xSHct85NfoKjCCjW//
 2qJg==
X-Gm-Message-State: AOAM532nhgg7WfBXz7zD3ASWgN5aKv3mxIm23OoxIOzIx4ZAkPKhh5fI
 yicfPPyKOnPRzZdewSxnBDrbYodQVphfiA==
X-Google-Smtp-Source: ABdhPJxSQhQcTsyIBLjETj5a4PawTp/p6sFOqkOneAJd+j/X3kGTnJR8ScRRlCTe376WY7QFY7uwNA==
X-Received: by 2002:adf:ed8f:0:b0:207:ac33:801f with SMTP id
 c15-20020adfed8f000000b00207ac33801fmr2981950wro.453.1650621926405; 
 Fri, 22 Apr 2022 03:05:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 55/61] target/arm: Simplify aa32 DISAS_WFI
Date: Fri, 22 Apr 2022 11:04:26 +0100
Message-Id: <20220422100432.2288247-56-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

The length of the previous insn may be computed from
the difference of start and end addresses.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 086dc0d3b15..d09692c125b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9870,18 +9870,14 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-        {
-            TCGv_i32 tmp = tcg_const_i32((dc->thumb &&
-                                          !(dc->insn & (1U << 31))) ? 2 : 4);
-
-            gen_helper_wfi(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
-            /* The helper doesn't necessarily throw an exception, but we
+            gen_helper_wfi(cpu_env,
+                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            /*
+             * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
              */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        }
         case DISAS_WFE:
             gen_helper_wfe(cpu_env);
             break;
-- 
2.25.1


