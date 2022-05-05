Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1751BD0A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:18:10 +0200 (CEST)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYYj-0003tB-IU
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWl-00057t-6e
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWj-0003I5-FZ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso4684163wme.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LaJS8axx1oTqwF/wDMx3/UUoY2E8r+rcnLggrj6DlFM=;
 b=WFDioX9AumiSFIPoJhI4z+r4amQuCBCyNKnkmLTxHeYIJSwTuYtlw3s4Q3zumXQFkP
 ghzpYJ2W28Fc+lNV7QVp5vdOXL9CIAQ+wVZNbAVhw1uRvKdE/L1Nj/LUIjBIvI2sn4y4
 ptGGkQgTpJV3mxGS+fXFC8w1phRRICq4kVRrDukcEcgdGbSg4r067MBvqBbk2l1oWlj7
 36AncHjzkB2r8EUREub2j5BzA+8wKEZkwnJTAAv1DhJ02oX3HyyDEzkYtcnsX7072BcL
 FKlM2N+vpjDe2Mg6ii65mkqJChx63kKxBl1ispNKFKBEjtxSYY7LjomJ8MZP/U01/juZ
 XRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LaJS8axx1oTqwF/wDMx3/UUoY2E8r+rcnLggrj6DlFM=;
 b=UsiQFrxpVCtBhPOplw7NbxLCgoeYYiIy6K8wlbbQCJhMwHh0RScGLZuvhHiCSigJPK
 WeugNrBSRqOZeFluhU/etumWAld3JLwUdtlsKmMDxj+ZCIdzXOAmmU+98MNyx9fhCHkg
 XwA3lt+Qs4Tws4BuR4s5t6A6mK90qeellYRYXG/G+sSnX7IKfAusfSjyMHt992fmqcaV
 oKLsDMTmDHrW/Dr3oY0X4FAqjwe//WI1Oin4xlZmEAjUBscCbuALX7UOtWrtpC8Xbk2O
 BTBRzC2GM4c//GetvIA9yUt2zr5QZJVt0uHlkkT2B9dlg8mchAkEdRXfi/xaDlKRN3yl
 CinA==
X-Gm-Message-State: AOAM532agpDATwDF1TMgN6FUA2Rp8OThB8172MDD5ZJ2bNhf6TL8qtRA
 bM2yrkLZx0ZZdMWlDC3RskQwtHww/LFjDQ==
X-Google-Smtp-Source: ABdhPJzXEWElt++ova98RIBEmGuR/5a2BN1/LSJGOJAT9ezNBYSFdVSTIQrL7vbuFG/PRdllecqH1Q==
X-Received: by 2002:a05:600c:3b93:b0:394:57c8:5901 with SMTP id
 n19-20020a05600c3b9300b0039457c85901mr3608947wms.77.1651741919930; 
 Thu, 05 May 2022 02:11:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] target/arm: Name CPSecureState type
Date: Thu,  5 May 2022 10:11:34 +0100
Message-Id: <20220505091147.2657652-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Give this enum a name and use in ARMCPRegInfo and add_cpreg_to_hashtable.
Add the enumerator ARM_CP_SECSTATE_BOTH to clarify how 0
is handled in define_one_arm_cp_reg_with_opaque.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220501055028.646596-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 7 ++++---
 target/arm/helper.c | 7 +++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 4179a8cdd5a..73984549d25 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -131,10 +131,11 @@ typedef enum {
  * registered entry will only have one to identify whether the entry is secure
  * or non-secure.
  */
-enum {
+typedef enum {
+    ARM_CP_SECSTATE_BOTH = 0,       /* define one cpreg for each secstate */
     ARM_CP_SECSTATE_S =   (1 << 0), /* bit[0]: Secure state register */
     ARM_CP_SECSTATE_NS =  (1 << 1), /* bit[1]: Non-secure state register */
-};
+} CPSecureState;
 
 /*
  * Access rights:
@@ -266,7 +267,7 @@ struct ARMCPRegInfo {
     /* Access rights: PL*_[RW] */
     CPAccessRights access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
-    int secure;
+    CPSecureState secure;
     /*
      * The opaque pointer passed to define_arm_cp_regs_with_opaque() when
      * this register was defined: can be used to hand data through to the
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d560a6a6a92..50ad2e3e37b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8502,7 +8502,8 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 }
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
-                                   void *opaque, CPState state, int secstate,
+                                   void *opaque, CPState state,
+                                   CPSecureState secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
@@ -8785,7 +8786,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                                                    r->secure, crm, opc1, opc2,
                                                    r->name);
                             break;
-                        default:
+                        case ARM_CP_SECSTATE_BOTH:
                             name = g_strdup_printf("%s_S", r->name);
                             add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                    ARM_CP_SECSTATE_S,
@@ -8795,6 +8796,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                                                    ARM_CP_SECSTATE_NS,
                                                    crm, opc1, opc2, r->name);
                             break;
+                        default:
+                            g_assert_not_reached();
                         }
                     } else {
                         /* AArch64 registers get mapped to non-secure instance
-- 
2.25.1


