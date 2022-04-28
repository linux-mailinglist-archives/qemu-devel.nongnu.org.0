Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9602551386E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:33:05 +0200 (CEST)
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk68e-0007L6-Cd
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jx-0005am-ID
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0006R9-Hg
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w4so7051052wrg.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SVkrV+CBXhWBrCy9Zq19WOSCWdtPtKtxLX4SDqypx/s=;
 b=Pq+pMLXE+n3ymLjCMvYYbcRgy7LcuwFF8No13R0v7zeb1iR6bElbrNDnSwIkHYlbQf
 XnteJlRr+J/wtzfgL4glzR3WLw6McfmwGFpbo1eKdP8B9J+QDlUpmmuHhftr7SC1M7lK
 c/cJBdTcnkPhixIROV22RrujPijbtyYjQeItv5FWlfQnEtlSE42kvkIAo+gUGoh1ddDd
 ohudV1mxgt1zEzGPpY4/MAb0f+FXWMY40+lVPRoxZqr8ecovIGY4dL6i9+ciZ5iCRpQe
 1IbNIzyNAi9EIUttz48D7U7IDBr53dR6yI3sdb922FJxYaHAx9WzfOBXZqdYO3DkUeAs
 qmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SVkrV+CBXhWBrCy9Zq19WOSCWdtPtKtxLX4SDqypx/s=;
 b=iYlH2vzye6L2SOzJYrqRpWmMguTcOZpGvqwgpAe2OA224sRgmNwdEK5IBdmxjx72HD
 sI7V95ou17h5pXRYMQuYt+zGc0j6+KEh9sriWz2RTCC0vwV8LY/GdXewO6WWzaGnxO1d
 dtSEdkTuARSvZfHCXckHSgZvifzTodNBP4/5JKF9QtkXrFgIB+IG+sjnk0owTqOqERF9
 XSTWCS/wKgFtF1DSrlaGuyRbuMnUJYWX/mm67OzC4JVIXDCQ8vnlQKR19GEpct2oqlmk
 x1oasz/HlPpluXhlh+/6qJY9ish991lssWjHCjsR+FrKLPya6+vCh6MM3c5B0yxALO0M
 fiCg==
X-Gm-Message-State: AOAM532VgVuB4csz/ezGIpUAGOp5YBlu1qZovrt32gogY/HPHjzQl+sj
 mhItDH+rLRpngr8KonqHMQoSLxVyBLR+Wg==
X-Google-Smtp-Source: ABdhPJzpcdN3tP1Jip4SwBCRZ8HDlR9fOuJ9vu8JdcU6t3ESQbE7lcLwWIqcTvYqG35KaEg49iJs+A==
X-Received: by 2002:a05:6000:1863:b0:20a:f4f9:a6a with SMTP id
 d3-20020a056000186300b0020af4f90a6amr4131221wri.619.1651156833759; 
 Thu, 28 Apr 2022 07:40:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/54] target/arm: Use tcg_constant in CLRM, DLS, WLS, LE
Date: Thu, 28 Apr 2022 15:39:37 +0100
Message-Id: <20220428143958.2451229-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Message-id: 20220426163043.100432-34-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e0469da0a16..0e9fde25897 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8257,7 +8257,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
     s->eci_handled = true;
 
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     for (i = 0; i < 15; i++) {
         if (extract32(a->list, i, 1)) {
             /* Clear R[i] */
@@ -8269,11 +8269,8 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
          * Clear APSR (by calling the MSR helper with the same argument
          * as for "MSR APSR_nzcvqg, Rn": mask = 0b1100, SYSM=0)
          */
-        TCGv_i32 maskreg = tcg_const_i32(0xc << 8);
-        gen_helper_v7m_msr(cpu_env, maskreg, zero);
-        tcg_temp_free_i32(maskreg);
+        gen_helper_v7m_msr(cpu_env, tcg_constant_i32(0xc00), zero);
     }
-    tcg_temp_free_i32(zero);
     clear_eci_state(s);
     return true;
 }
@@ -8416,8 +8413,7 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
     store_reg(s, 14, tmp);
     if (a->size != 4) {
         /* DLSTP: set FPSCR.LTPSIZE */
-        tmp = tcg_const_i32(a->size);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(a->size), v7m.ltpsize);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     }
     return true;
@@ -8482,8 +8478,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          */
         bool ok = vfp_access_check(s);
         assert(ok);
-        tmp = tcg_const_i32(a->size);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(a->size), v7m.ltpsize);
         /*
          * LTPSIZE updated, but MVE_NO_PRED will always be the same thing (0)
          * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
@@ -8609,8 +8604,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
     gen_set_label(loopend);
     if (a->tp) {
         /* Exits from tail-pred loops must reset LTPSIZE to 4 */
-        tmp = tcg_const_i32(4);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
     gen_jmp_tb(s, s->base.pc_next, 1);
-- 
2.25.1


