Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911141379B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:33:04 +0200 (CEST)
Received: from localhost ([::1]:51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSihb-0002oj-7m
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidp-0008Nb-S8
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidn-00029u-MN
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id d6so40767129wrc.11
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHb17IfanSTmLS+2/xtwkgJnWlHcbTTMTVtLLMK51LM=;
 b=Gj/Fm9tPaPhll9ETWjNeNKNbCOXJqPK1qOFQ4N1L2WfndEINeUqT+Nxeu61sTHo4yD
 xq884hhOOykw2z4xLWo+QM7aetryEks4F01PFYJNQJH9L3pIfFuh5QFTt5/Uc9Vg9aLj
 ez91tAC9hNlnYOJMt7bg5v8vYRA0ZVW1vIV9B/OEpC3BiBM2bYFu8L14eHhl4NOKNztz
 NS2hiBDMeOqhIDzKYxGi3mJ8qjLhScslLpp1uoeyFi+64a+qNEmQj3SOiO1QOCK+MIWv
 pVE/dERuubmKKS/jscOqjv/jx81dr6bew3vR5dwqd8OraHQa1XazeA325bawOZ7BspdO
 rAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHb17IfanSTmLS+2/xtwkgJnWlHcbTTMTVtLLMK51LM=;
 b=LsPEZfR2bO8w2AnDkvaoeQg7XLeBYwunxq85Q9KaTKmje2LW40dEg8ZW+vLgWmPqJm
 yqPutYlACwcp0gWuxiB5qTl+Pr+IxcmpHRgB3km9Guhc9DDZs5a/n8fQ6CbrjY+gknIQ
 60n6eGR2zdswkzmqpAaWRdiiTVTApsYUNib1XiJ8SNZ91kFtgHhv+gdStZe6AJSZ60a8
 5vL07ppMaYkhT/h0h+slOPVfxFiqztO7aG2VxES8RJT8gRHcGnhI7EH1nrg9cTIiYo40
 brTyX/tFV/9Kx9iMjVJuHgjsiOH53zh3DYW96AjH5YeQUZbXHq+bdy1E3QbPoZyZYtll
 38xw==
X-Gm-Message-State: AOAM532K+CFLs3ad/VR1JuuQkIfCNHgx4cuOi3k33WDdE0Z8aidlJyED
 nGp9DF7l6LOEYH2nFXiFhSFIjg==
X-Google-Smtp-Source: ABdhPJzqcOlV5E3Tq/iy0drcX6mmtZDlpbyVEyj8bRA0cSaRrB8+Xf+6F+dlW+jD1vLiFY5El3Pb+Q==
X-Received: by 2002:adf:f24a:: with SMTP id b10mr37259167wrp.281.1632241744833; 
 Tue, 21 Sep 2021 09:29:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q7sm19841014wru.56.2021.09.21.09.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:29:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/arm: Fix coding style issues in gdbstub code in
 helper.c
Date: Tue, 21 Sep 2021 17:28:58 +0100
Message-Id: <20210921162901.17508-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921162901.17508-1-peter.maydell@linaro.org>
References: <20210921162901.17508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to move this code to a different file; fix the coding
style first so checkpatch doesn't complain.  This includes deleting
the spurious 'break' statements after returns in the
vfp_gdb_get_reg() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b210da2bc26..179038ad3da 100644
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


