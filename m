Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5F570580
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:24:47 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuL8-0000WB-Ni
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvk-0006iA-R7
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvd-0002pv-69
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id v16so7100738wrd.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9bCQOBJQUNrEYM6NaGyKlOsHHz/7cHH58vaKjgHSLV8=;
 b=F8FJT9RaQ7WvNLn0W/5wE34FSH144WQ5YQ/znspJVUix52rVL9KGXDCgugnLgqX+nd
 PPOV7quuyNX9vSPsDSCQBsmNeV5PX7Ml+Z04QF3ha5yJu34dbVjop2WHvtefV6juTavX
 4kN84UfZInQtbsDdvqPdpUof6BbjBCtP4Emk+ZEZYGbLdFHodO7eLbAKxkrb5FV4ncyi
 F7vP9Ynm0BEdM4KLHZMHEm6gCWozr5j+ml960sBdzspU7ysX63yRhrkuqdpuEXx+Gljy
 we6IlTI/J2JuQu+VsXqMDEv5mGYFnoZqaM37GxDx3x2DOmDJytm1jba47CgfnXy1HtSY
 pDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bCQOBJQUNrEYM6NaGyKlOsHHz/7cHH58vaKjgHSLV8=;
 b=xitxA1llF+egPlytyyWS53QCdD3JCtEpUX8DITtGjpNoaG7DxRYs/Nkm/hhbcWPlLp
 72EZXltePSA6Fb7/HF9FUVVogJz1Z6W4/7ufcOQjAhN9eAzr5UIP26sdR25jwV0qAAJ7
 rWMc5ChfW7h8Hj0nFlnRQfZFkyDRXrmBGKCUNPfa7rLAHfbAw+WZo/h7YDPCzk84i/Ji
 xnZVYFhtZ+O9pIu6yUQLMhAqcS5TpQaI/5K+ePBK2r9I4G3aSfnsBj5Vg1kIH4bHQH1R
 uATsDVuEtgZdYYAX9I6FqmLuAs8hLnG3oteGDEwrFa7pzpu8Oh1HW1wCfFREHModbUwV
 yuhw==
X-Gm-Message-State: AJIora/eoQACyoxiXwWEph43Kog/njhMXhgkv75rhiYl9ayouaSKaDk1
 ZgptnhtfsM2KM+S9sD10JkF1zhD5FlaWYQ==
X-Google-Smtp-Source: AGRyM1utdngGgCVCEq0lIHJBGz/1ueoPaAnuwVMi8GdT1IGB/p14oMHwph9wo9nn5Nr3wV1hfpvmpA==
X-Received: by 2002:adf:f3c7:0:b0:21d:9349:7a5 with SMTP id
 g7-20020adff3c7000000b0021d934907a5mr14682599wrp.23.1657547900857; 
 Mon, 11 Jul 2022 06:58:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/45] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Mon, 11 Jul 2022 14:57:39 +0100
Message-Id: <20220711135750.765803-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-35-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index f7ef36cd9fa..9875d609a91 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,15 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
+            /*
+             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
+             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
+             */
+            if (FIELD_EX64(env->svcr, SVCR, SM)) {
+                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
+                arm_rebuild_hflags(env);
+                arm_reset_sve_state(env);
+            }
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
-- 
2.25.1


