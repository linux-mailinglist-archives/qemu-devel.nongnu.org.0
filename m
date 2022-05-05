Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11E951BCB0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:01:40 +0200 (CEST)
Received: from localhost ([::1]:46528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYIm-0000uA-26
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWp-0005Dk-3t
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWn-0003LF-3g
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id v12so5207350wrv.10
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Gw9AdCbfVxgEkULN3gOVJuvRjbon3y1ncll8PnUnHtE=;
 b=qrO23VvpfEVqJBPfTqjwby9GcLUy69XScSBYWWNiWvediHZGS6byvTuIdh3GaZpLG9
 G6j939US0o0ydbliFK23KmTA4fd3d8s7EL1WENVwQORQKA5uOwl5lC2cg40iUjezhGjl
 gss3J2ybRBIxZ26tPOtFhqzifYn06G9XY6tFaxByv3miGIVK+6dAymTppwkHWKH/YjP2
 NeUQ+dpANnD8mgogvFBYg8fonAPNwhyHKMj4ov8a1CD5dAzw8xItekt03+U6eof9FjEz
 Gmvtv74JMZKs7lXhH00UAsC1S0L/+CTwLvB2KPQO/cTiEtZmwGf9wXiGf0GX8ElffYNm
 qmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gw9AdCbfVxgEkULN3gOVJuvRjbon3y1ncll8PnUnHtE=;
 b=llHFiUVllbcfzqVgkUfJBJKQxE7a41X+t4AL0HPUqU7lN4lEHrGDPik3IllxuMMQ0L
 17EFD1N8Ge4PsM1BiIkVcgz8R2KVQkpMAllT/bdmueZhxzqgMvUf6JlCNHYrhHRuXEm7
 d6UjKK5YMPjTr+A8ChahedAjlTVX1YnlXq/DH3ipmmnfEkdKUExyqaSa2jt/dQRsPNcL
 iJbghE5az82fWdEMsHgi3YlGF61BYEp9VlWFF5BrkJY2zUpvUL6ducYz+1bVdrhPMl79
 1UhX5+A2Gg6jvVocdvmGqCjKbWyBK3eHzk4GP2fdt54JtiqRwavaE+bbyK4PEinzAxNJ
 uWlg==
X-Gm-Message-State: AOAM533dt6zxGiF1WxJuBUychWnBB3iak2xA1UIndZz+qwoizXLhNfy+
 WExw12ow3ZxtPfexCUM45yB3pWN0J+Tf7Q==
X-Google-Smtp-Source: ABdhPJwu0DSwwhty/Usi3/17XZzn2MoSaKcBEHO8MnGWO2O1h1kmZOOya0e2IrCDcQMkfTA21QOUKg==
X-Received: by 2002:adf:c64c:0:b0:20a:79c7:4bf2 with SMTP id
 u12-20020adfc64c000000b0020a79c74bf2mr19535617wrg.587.1651741923086; 
 Thu, 05 May 2022 02:12:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] target/arm: Hoist computation of key in
 add_cpreg_to_hashtable
Date: Thu,  5 May 2022 10:11:38 +0100
Message-Id: <20220505091147.2657652-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Move the computation of key to the top of the function.
Hoist the resolution of cp as well, as an input to the
computation of key.

This will be required by a subsequent patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 49 +++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d92fd23445b..cbc873e3e60 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8509,8 +8509,34 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     ARMCPRegInfo *r2;
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
+    int cp = r->cp;
     size_t name_len;
 
+    switch (state) {
+    case ARM_CP_STATE_AA32:
+        /* We assume it is a cp15 register if the .cp field is left unset. */
+        if (cp == 0 && r->state == ARM_CP_STATE_BOTH) {
+            cp = 15;
+        }
+        key = ENCODE_CP_REG(cp, is64, ns, r->crn, crm, opc1, opc2);
+        break;
+    case ARM_CP_STATE_AA64:
+        /*
+         * To allow abbreviation of ARMCPRegInfo definitions, we treat
+         * cp == 0 as equivalent to the value for "standard guest-visible
+         * sysreg".  STATE_BOTH definitions are also always "standard sysreg"
+         * in their AArch64 view (the .cp value may be non-zero for the
+         * benefit of the AArch32 view).
+         */
+        if (cp == 0 || r->state == ARM_CP_STATE_BOTH) {
+            cp = CP_REG_ARM64_SYSREG_CP;
+        }
+        key = ENCODE_AA64_CP_REG(cp, r->crn, crm, r->opc0, opc1, opc2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8554,12 +8580,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
 
         if (r->state == ARM_CP_STATE_BOTH) {
-            /* We assume it is a cp15 register if the .cp field is left unset.
-             */
-            if (r2->cp == 0) {
-                r2->cp = 15;
-            }
-
 #if HOST_BIG_ENDIAN
             if (r2->fieldoffset) {
                 r2->fieldoffset += sizeof(uint32_t);
@@ -8567,22 +8587,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 #endif
         }
     }
-    if (state == ARM_CP_STATE_AA64) {
-        /* To allow abbreviation of ARMCPRegInfo
-         * definitions, we treat cp == 0 as equivalent to
-         * the value for "standard guest-visible sysreg".
-         * STATE_BOTH definitions are also always "standard
-         * sysreg" in their AArch64 view (the .cp value may
-         * be non-zero for the benefit of the AArch32 view).
-         */
-        if (r->cp == 0 || r->state == ARM_CP_STATE_BOTH) {
-            r2->cp = CP_REG_ARM64_SYSREG_CP;
-        }
-        key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
-                                 r2->opc0, opc1, opc2);
-    } else {
-        key = ENCODE_CP_REG(r2->cp, is64, ns, r2->crn, crm, opc1, opc2);
-    }
     if (opaque) {
         r2->opaque = opaque;
     }
@@ -8593,6 +8597,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     /* Make sure reginfo passed to helpers for wildcarded regs
      * has the correct crm/opc1/opc2 for this reg, not CP_ANY:
      */
+    r2->cp = cp;
     r2->crm = crm;
     r2->opc1 = opc1;
     r2->opc2 = opc2;
-- 
2.25.1


