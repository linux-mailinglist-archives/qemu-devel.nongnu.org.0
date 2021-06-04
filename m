Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2590339BD53
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:35:58 +0200 (CEST)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCnd-0005J2-80
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHd-0007mT-2k
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:02:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHW-0005lY-Fo
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:02:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id a11so7945916wrt.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQtnS34z/bTDeAgJgcVIAWI8dJCWeYn70HUU46NLGbY=;
 b=H0rLFfDc/pCqx9gywa70LgA0sqr+1pwSHDZ5ngyterzlPj3IH3yrQdI5bLBbXVJJLr
 jdmc70IcuslrmQ2O7hz9DXhd3AjHVNvsxy8RcMKakr88RhbxsGmD5+cAhE/75auadcYk
 SEEufDxnaMPvUy+IRqaWWuUPhcmKVZVCf0K54lLn65Hwx+PbVo4ztol9Ed3NduddEw2+
 JyD1odli0EoBxDPM+vngFKhBQXrCS9AvMvb/SDYmxWiQbh6Qbl3L+8Zc94rhkFQmPeZx
 YRdEH3LBbcD38fj5fplHGBFOUptDDgilijaKQtsRDz1Yge4DHl2N63AmRpvPthm+OXdb
 atVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQtnS34z/bTDeAgJgcVIAWI8dJCWeYn70HUU46NLGbY=;
 b=BYnhGMpNIhk1ib0L+H84+5rXubrrjjbeDhSpMWySzGOYWBQiAQkl/KG648+dFBvvSJ
 M9mN516NxhxPwSu2GxwgAhk+x0RSM+K9jpYYFJURRzZnStIcoDb2Ev2DM59X7rMjPYSf
 F8prIRkYoWlIFRV44p7SznbsNudPCPmEC+ra0RuhhU9Mx9jeqbyBYBkQVweMjX7e+qyQ
 yRmx3VV3a3QkXreBD4Ia9kLGna+Ko55E2H5SE9D9CPi4H1zjUnO8AgYXAHb8bZoGgt3m
 +cqKSU1gn/qQ7l5UCznpvAJFqYbZqeKMfn37ZUtZxwGSNFfi5Hi420B2e55ponieHOLy
 ODSw==
X-Gm-Message-State: AOAM533AT65owVk5Bvg40e0b38DU5EwSi4wb7V+cTaQX3tL4NRXKxGn1
 Oy6E3NPtC8Xh6MJiBXSAceDDLg==
X-Google-Smtp-Source: ABdhPJxFeXOQi0NKJJPefjGea33wcnMzfjCBVdkvzknTv7zPjZz8E660Ym9vaT4QPChZhvZ9Gj6yVg==
X-Received: by 2002:a05:6000:1282:: with SMTP id
 f2mr4511680wrx.67.1622822565245; 
 Fri, 04 Jun 2021 09:02:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p1sm6127310wmc.11.2021.06.04.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A4751FFC3;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 44/99] target/arm: fixup sve_exception_el code style
 before move
Date: Fri,  4 Jun 2021 16:52:17 +0100
Message-Id: <20210604155312.15902-45-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

before moving over sve_exception_el from the helper code,
cleanup the style.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 9dd83911f2..1c69a69d5a 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -261,7 +261,8 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 }
 #endif /* TARGET_AARCH64 */
 
-/* Return the exception level to which exceptions should be taken
+/*
+ * Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
  * take care of raising that exception.
@@ -275,7 +276,8 @@ int sve_exception_el(CPUARMState *env, int el)
     if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         bool disabled = false;
 
-        /* The CPACR.ZEN controls traps to EL1:
+        /*
+         * The CPACR.ZEN controls traps to EL1:
          * 0, 2 : trap EL0 and EL1 accesses
          * 1    : trap only EL0 accesses
          * 3    : trap no accesses
@@ -301,7 +303,8 @@ int sve_exception_el(CPUARMState *env, int el)
         }
     }
 
-    /* CPTR_EL2.  Since TZ and TFP are positive,
+    /*
+     * CPTR_EL2.  Since TZ and TFP are positive,
      * they will be zero when EL2 is not present.
      */
     if (el <= 2 && arm_is_el2_enabled(env)) {
-- 
2.20.1


