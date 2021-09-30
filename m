Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ABA41DD75
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:29:06 +0200 (CEST)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxzd-0001Th-Pw
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjP-0000Hx-Pa
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjN-000426-4T
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:18 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d26so10653518wrb.6
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fiYS5FCgMGXDlrIgAMDa81IO9f4zjGQxiSsB7/2wRaE=;
 b=rZfqMY/Lollarl/7PGVlJsMc/jAu6+ralbtVrOWwq+WQByPMLo9pRjp5gWLgtEtEed
 1u4mYmU9H6bYIRzgi/oNks/hYRDt9M8/GpujQN59TA0BacXA6MPqg+HdiIxCXwrrTPtW
 hGC/8agv0FfHuz0GxrLP9JSsIiorTWFMVBAFjBWPtqiz/g1RaN7ZTk7yY5zmMIUD34Vf
 O39qetCaGc8YluFKoN03vwya2LBVvq4F6ZSO01urRHAvml/IKy+ymoRCbmyQwgXXixzA
 0wuGCCVKYAUNbGHZdiI9K61DFgOkICY94X0/lDefWkG3vw0JU9ZuyhvEg9rjmRkcmBz6
 drBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fiYS5FCgMGXDlrIgAMDa81IO9f4zjGQxiSsB7/2wRaE=;
 b=JIfOa5uICc41IYA+0UNDewgJFMgxzlzuG4sMwXBduPuYx14NG6ewQv1kOGV10ovjmO
 EUT5M6yzTMZIsPBIdwyd5AOV8m225tg+auM86aIJgtjtNTGtGfGAxIQ65fRO7Bft5oFW
 0yO8x4FRe1wtMMdrHtSvYTvgGf3qm6g90HFfBa5xo3Af3t5M3ncaK6ZgRH7jlQnh07LM
 kEVR0OaW7y6TopXI+K2mCYF4KurvapHIU0Pi6v+6MzHKraK42LkWvEIsPyM6YCQ/2UVy
 YltOnnCamTaSj1B4lIcOrRzIVvQykZxJutQeddboj2CZ+pe3R0X15qn7Zza6JwV8G583
 8Sbg==
X-Gm-Message-State: AOAM530Ywb0OEygqEwwhhr94Ow8m+8ziv/Pv1j4EVJjOOad5mZzmzq/U
 dtONDtj0Le3p1MVRETfGToquIGZvsTfvEA==
X-Google-Smtp-Source: ABdhPJzRd07/U2p2cdkc12aO/xY/v29TDCBhxIfv2nTQTr7z9HqS28Zvw1bFVRcbE9iJ9kDOS4dCgg==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr7051047wrq.138.1633014734659; 
 Thu, 30 Sep 2021 08:12:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/22] target/arm: Fix coding style issues in gdbstub code in
 helper.c
Date: Thu, 30 Sep 2021 16:11:52 +0100
Message-Id: <20210930151201.9407-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to move this code to a different file; fix the coding
style first so checkpatch doesn't complain.  This includes deleting
the spurious 'break' statements after returns in the
vfp_gdb_get_reg() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210921162901.17508-3-peter.maydell@linaro.org
---
 target/arm/helper.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 62742214473..84bba9a2244 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -72,9 +72,12 @@ static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
         }
     }
     switch (reg - nregs) {
-    case 0: return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]); break;
-    case 1: return gdb_get_reg32(buf, vfp_get_fpscr(env)); break;
-    case 2: return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]); break;
+    case 0:
+        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
+    case 1:
+        return gdb_get_reg32(buf, vfp_get_fpscr(env));
+    case 2:
+        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]);
     }
     return 0;
 }
@@ -98,9 +101,15 @@ static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
         }
     }
     switch (reg - nregs) {
-    case 0: env->vfp.xregs[ARM_VFP_FPSID] = ldl_p(buf); return 4;
-    case 1: vfp_set_fpscr(env, ldl_p(buf)); return 4;
-    case 2: env->vfp.xregs[ARM_VFP_FPEXC] = ldl_p(buf) & (1 << 30); return 4;
+    case 0:
+        env->vfp.xregs[ARM_VFP_FPSID] = ldl_p(buf);
+        return 4;
+    case 1:
+        vfp_set_fpscr(env, ldl_p(buf));
+        return 4;
+    case 2:
+        env->vfp.xregs[ARM_VFP_FPEXC] = ldl_p(buf) & (1 << 30);
+        return 4;
     }
     return 0;
 }
@@ -119,7 +128,7 @@ static int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
         return gdb_get_reg32(buf, vfp_get_fpsr(env));
     case 33:
         /* FPCR */
-        return gdb_get_reg32(buf,vfp_get_fpcr(env));
+        return gdb_get_reg32(buf, vfp_get_fpcr(env));
     default:
         return 0;
     }
-- 
2.20.1


