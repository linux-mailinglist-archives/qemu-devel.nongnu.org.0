Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B744E5683FE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:48:27 +0200 (CEST)
Received: from localhost ([::1]:54166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91dx-0004tI-RR
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M2-0006lA-Ug
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:51 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M1-0000mw-Cq
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:50 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 3so3606658pfx.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
 b=n2hNMV3ts2wFxtT24y+x4xXHsfW308Op6TfP7lT4JO/GiK5FErs+ji73c80l6fHUyv
 Mdk/U+oobIb3pIbkZvTb52ybSO7aWGaE3IWjkhCvxOxBfw55pzU+vOB8HuZivaeyM3TY
 kyczvzj1yDEn4q+NCaDqfPkkv5lvE4tj9cXP/IuLDA0Y80HEjjrgG0AXLAE3MUi2JMLt
 Vc+Sx/HjhBBH0SjHrPUdsV9Cu+laH1skrHGDO8/WEcDU1EaFkBGFJQ5emb5YD95XrTCJ
 9bHJXh+9pMVdaMmddDwFHdfw+PvkPEf0GJ3jVsjy4bKeqQr+xYkkNbZ+MRzWLrfdw8x5
 ptVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
 b=dj6NZvlhuPAy9b1dPCjSirzM6jp0Q4bx8wG7Aatn6ubUFEaK2SnsI4uB0aWX+B1ztm
 WjyrAdSB6lZvSPL9ZVVkk2mZmnUVrx4x6on11Wh8DsV327AMA6t4QL8Lhi98qCruDmjz
 pNa9GCPyOcZ/LCERlW3GeEvsKDSnFnFGiEXhdgGtgKrpa4bE3smbvYZd6sPk9/Um6zW/
 AhvN+NHJy465pKY1By0fMKKdJFOMrE5uWSNDNvIidUFytyyCDB7vtDX2M+COoHO4IFlK
 dUOZ4MDo/fvN/1nhU5rtKKXLxrGW6069ucOkzDbThLCHpC4xOWgP5WXKVd+wxSGFFfqZ
 XHFQ==
X-Gm-Message-State: AJIora+BBndSv3Ua9lHHieXzrB9u1jAUFQaoJAxZp4t80eXVf9PvLqcC
 wES3BypIfCbF9QDt/suHecTxxvAkPpOJisxs
X-Google-Smtp-Source: AGRyM1voeRLRaptu3oH6bRrTVn9ThnJi3+iUTA0R2cOX24nj/5RdYNBswGVi3j2BU0K3J9L8IiXlAQ==
X-Received: by 2002:a63:4b17:0:b0:412:83cf:ecaf with SMTP id
 y23-20020a634b17000000b0041283cfecafmr4827391pga.105.1657095947553; 
 Wed, 06 Jul 2022 01:25:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 33/45] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Wed,  6 Jul 2022 13:53:59 +0530
Message-Id: <20220706082411.1664825-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1


