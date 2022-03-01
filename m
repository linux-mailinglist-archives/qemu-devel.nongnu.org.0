Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFDA4C983B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:17:44 +0100 (CET)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAoQ-0002JA-U4
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXc-0001JG-DA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:20 -0500
Received: from [2607:f8b0:4864:20::102d] (port=51158
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXZ-0004yq-AY
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:19 -0500
Received: by mail-pj1-x102d.google.com with SMTP id m22so97653pja.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
 b=sBO36gXviA0Dkd1Weoc5SQH5qIidteDHrXdZvzNSh04ezoQXqD3irIVtzPo0aiDabp
 Zqcl6sdxJrcV6Zia6zLj7h4AyxU4p35rGc6UgJZ/6MecQgHArxvLhX4MeH6tekIZxzsM
 AmdAeeRJNJdHdDqtjUfg+MHgbiVaITH1X+Ta6DJJq/saUj08WLcxFBNj2bDFdb8l66H4
 jHd+0z3RVeO+hgd1i0cnj/ROz365/Aj001f8RVNYC8UfbGXDhJI/1O+X+Ohe2GCV/Sjo
 PyouSQUCjy+CjzDTwTfeXNuVpB90pSJxRUgOT3Jc1NPaa6VDXBL5+JAAnjswxZ+kJQFj
 kinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
 b=E670566mrefUCDFYe3AN6yNh1KfbNIsVzb1sqp9uJFJi9rMk3csf9nz17RJR2sjJj0
 jVFsg8jLTsai0lITajKzyaAkE3ylGpBgX8dMLoWG+2tivCkMpzEjhphSNYH8ntlMTYV7
 gi/ZxOQVRIG0qA1/7NcHO5JKKUPWk7mRdMRn6pIjncqBZMKfsH+oMfVPwc/HW83+YgQp
 EZuKriyLH1URTcrQCsUOd1zsou3n1P8xlQuecgrucVay7cVbLMmOAlR656RzSB25nxjQ
 mNrWrcOj95RL6klax5A3KbMqWTSNrqZBLpvZsAIqShZ+qwVaGv8XS/Xa7G8x89oGuThf
 xysQ==
X-Gm-Message-State: AOAM53393WaNNIEdgGHCWjP7H9aaeAWZLdMfNwJtK5NGNyN/DBstQptO
 lzydgrao2Rcr+1d4lhyBTvun6GxR/xWUig==
X-Google-Smtp-Source: ABdhPJzl+Xfe3pUBDjpVmZd+C+BA1tI2FPwW4ojS6nrsqJPaGXzyQE6J+SM1oK2oReCv0dPo0RhKzw==
X-Received: by 2002:a17:90b:3503:b0:1bc:5d68:e7a2 with SMTP id
 ls3-20020a17090b350300b001bc5d68e7a2mr24014517pjb.29.1646172015667; 
 Tue, 01 Mar 2022 14:00:15 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/18] target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
Date: Tue,  1 Mar 2022 11:59:48 -1000
Message-Id: <20220301215958.157011-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original A.a revision of the AArch64 ARM required that we
force-extend the addresses in these registers from 49 bits.
This language has been loosened via a combination of IMPLEMENTATION
DEFINED and CONSTRAINTED UNPREDICTABLE to allow consideration of
the entire aligned address.

This means that we do not have to consider whether or not FEAT_LVA
is enabled, and decide from which bit an address might need to be
extended.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c002100979..2eff30d18c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6423,11 +6423,18 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     int i = ri->crm;
 
-    /* Bits [63:49] are hardwired to the value of bit [48]; that is, the
-     * register reads and behaves as if values written are sign extended.
+    /*
      * Bits [1:0] are RES0.
+     *
+     * It is IMPLEMENTATION DEFINED whether [63:49] ([63:53] with FEAT_LVA)
+     * are hardwired to the value of bit [48] ([52] with FEAT_LVA), or if
+     * they contain the value written.  It is CONSTRAINED UNPREDICTABLE
+     * whether the RESS bits are ignored when comparing an address.
+     *
+     * Therefore we are allowed to compare the entire register, which lets
+     * us avoid considering whether or not FEAT_LVA is actually enabled.
      */
-    value = sextract64(value, 0, 49) & ~3ULL;
+    value &= ~3ULL;
 
     raw_write(env, ri, value);
     hw_watchpoint_update(cpu, i);
@@ -6473,10 +6480,19 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     case 0: /* unlinked address match */
     case 1: /* linked address match */
     {
-        /* Bits [63:49] are hardwired to the value of bit [48]; that is,
-         * we behave as if the register was sign extended. Bits [1:0] are
-         * RES0. The BAS field is used to allow setting breakpoints on 16
-         * bit wide instructions; it is CONSTRAINED UNPREDICTABLE whether
+        /*
+         * Bits [1:0] are RES0.
+         *
+         * It is IMPLEMENTATION DEFINED whether bits [63:49]
+         * ([63:53] for FEAT_LVA) are hardwired to a copy of the sign bit
+         * of the VA field ([48] or [52] for FEAT_LVA), or whether the
+         * value is read as written.  It is CONSTRAINED UNPREDICTABLE
+         * whether the RESS bits are ignored when comparing an address.
+         * Therefore we are allowed to compare the entire register, which
+         * lets us avoid considering whether FEAT_LVA is actually enabled.
+         *
+         * The BAS field is used to allow setting breakpoints on 16-bit
+         * wide instructions; it is CONSTRAINED UNPREDICTABLE whether
          * a bp will fire if the addresses covered by the bp and the addresses
          * covered by the insn overlap but the insn doesn't start at the
          * start of the bp address range. We choose to require the insn and
@@ -6489,7 +6505,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
          * See also figure D2-3 in the v8 ARM ARM (DDI0487A.c).
          */
         int bas = extract64(bcr, 5, 4);
-        addr = sextract64(bvr, 0, 49) & ~3ULL;
+        addr = bvr & ~3ULL;
         if (bas == 0) {
             return;
         }
-- 
2.25.1


