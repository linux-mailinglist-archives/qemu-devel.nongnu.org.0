Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865FB807F6
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 21:02:25 +0200 (CEST)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htzIO-00048b-Od
	for lists+qemu-devel@lfdr.de; Sat, 03 Aug 2019 15:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1htz51-0006ka-Bu
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1htz50-0007Mm-3x
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:35 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:43813)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1htz4z-0007MK-V4
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:34 -0400
Received: by mail-pl1-x641.google.com with SMTP id 4so27885291pld.10
 for <qemu-devel@nongnu.org>; Sat, 03 Aug 2019 11:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XOwe1x9jkMeobEp2gGQ1QVWfLomppnXBcfQfzlWOS/E=;
 b=dMqUYYmRfdayPFfbUWwMEx9J2DbZBKw2F4NAJoNPOwLBmqrOuFzJaZYBpEpuXKphx1
 k73GH4LZNLW8ZcfyO87kGFQQTTfXTFLE/f6gvk1z2RiesiH1K0PjhQnXIzaW3SHb/cID
 /w/DfIbV/75N84T2THH4vOYiInYakfJu9A7ElnolFK36pD1HyeS43c3PgOew1zddvEWX
 HzAcn4s9+sTMspPIHAkYjlByi0Y0pfsgypM/POeJxGLNs40YlCnb1AVJsc+MKMs4UAxx
 Aveu6pq6lBGaSaBO+2y82E3xXr7kW26UT0Un0Qe3PPlUksqIRPxlEERvvNnIzzlHH8ww
 ERrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XOwe1x9jkMeobEp2gGQ1QVWfLomppnXBcfQfzlWOS/E=;
 b=saSaKNMlZ9AdMs67TabjHunn5zoJUfGTuSKsXgnPU7Z88YNR3Lqo5vsKOl8D9cVyaG
 c/zwbnG8KJ3ert7fTIicxolPgW0HhJFgCU+CiZ4/2DfprpqqWDs23qjamwpDhPVajTLc
 sOxFF/TTLsHyUjP32dYw0YYJng4Ahr5TdS2BMwtp4v4dJQ+oanG9IGKU8V6oB3v95veB
 T6elbTDRrZ8cJheLzRpgzRLITGf3CRXgKRKcjLrCZHdDHU+ACqh5I8i6jdntQrFb951L
 ELjTnRP3JTZAEHCF5ZnqxnqRF1zs+DUsKu9Y8HVCbVXws6ubcbDnkQFA6925a0MExkDs
 uuDg==
X-Gm-Message-State: APjAAAWLAvLUJT3DbXvxVVqWLFoKrsoQRrZCowmDLXqUqBUlCcqS7HZv
 gdYW0k1U36YTUFp8xUpk3IWpP/+r82U=
X-Google-Smtp-Source: APXvYqyb1AF8sTnicyX+NAezc54dTu4e+BfaRxO4fEL/ZNln+ZX+TAvvOyDRIIAMgqa+cbIuuztDxA==
X-Received: by 2002:a17:902:b48f:: with SMTP id
 y15mr139996271plr.268.1564858112630; 
 Sat, 03 Aug 2019 11:48:32 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 03 Aug 2019 11:48:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Aug 2019 11:47:51 -0700
Message-Id: <20190803184800.8221-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v3 25/34] target/arm: Update aa64_zva_access
 for EL2
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The comment that we don't support EL2 is somewhat out of date.
Update to include checks against HCR_EL2.TDZ.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9e9d2ce99b..37c881baab 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4113,11 +4113,27 @@ static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
-    /* We don't implement EL2, so the only control on DC ZVA is the
-     * bit in the SCTLR which can prohibit access for EL0.
-     */
-    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_DZE)) {
-        return CP_ACCESS_TRAP;
+    int cur_el = arm_current_el(env);
+
+    if (cur_el < 2) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+
+        if (cur_el == 0) {
+            if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+                if (!(env->cp15.sctlr_el[2] & SCTLR_DZE)) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            } else {
+                if (!(env->cp15.sctlr_el[1] & SCTLR_DZE)) {
+                    return CP_ACCESS_TRAP;
+                }
+                if (hcr & HCR_TDZ) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            }
+        } else if (hcr & HCR_TDZ) {
+            return CP_ACCESS_TRAP_EL2;
+        }
     }
     return CP_ACCESS_OK;
 }
-- 
2.17.1


