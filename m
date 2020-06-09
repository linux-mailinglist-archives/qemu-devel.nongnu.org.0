Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0601F40FC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 18:34:29 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jihCm-0003Pn-Ko
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 12:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jih7H-00060W-5i
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:28:47 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jih7F-00017m-Vs
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:28:46 -0400
Received: by mail-wr1-x433.google.com with SMTP id e1so22047186wrt.5
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bNpt1BpofhtYBwm3Tfw6OCLr57L4XWG7RV5bc+pnr5I=;
 b=hIX7P3Jtn7Q+R2fe/nBEPqSz8cmlA+4PpKWKaqbirkLccSRmrIg+M8b+sPNP51PD3n
 81qwPcgCuOGU8qJMLYnWIL0bpiS0wi6lG/d27u/Zd9O4p9HXNoJKbDHWmHM1Q8EPiogO
 dz9S9ggXMtt8oHivIJqdulTfGgfL4+Rcr0CxLAdTizTBSyIMkMxrDsSn6z0uH+34pFgZ
 fCUr99nxXCU44IvsFnGGM6xbwUBQtmHLhL1mqy8ZH6FCoJ9JedVLZnF+D+GKaygaE22+
 4BlThyzwdxwYhHORehk2ITDOcMo4Ebq1p/anIFLlRBFrMsHQRBAQJmET39RFZpXch5Ww
 l8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bNpt1BpofhtYBwm3Tfw6OCLr57L4XWG7RV5bc+pnr5I=;
 b=DGCxi6SIFkmy/j+MlgP54zjPPOHeVIB1BLVee+GJcHBTOm5cSDu3VVcU/KM5VzDf7P
 LwcRLPRkWXhWXwnt4NAUBH6ChbgVD+qaEnp4SxbQm0FUOt+8O+dnZgVWmwUSeBPrJG6U
 BidIlr34PzJrpV4PTP+nmVP3xTLxZQ0ZIb0fHv6Iu84KuZTZW5iuwsG4Jvr5Wzzo8kb3
 +2jUp2JuKcw+mP35uiCgN0Lu43KG3vJ80hNEpwJGCyC0DcjDlkV/GlO/MyPXQ6Do2+xV
 Bm2HiJATPDfIDg0N+RO8sC6cVi7Y9gr1v2x95JmyKxYbfsDPgOFMjkolhFTU9UtWyRS4
 P5qg==
X-Gm-Message-State: AOAM530OywR3PYCW8hnTt3ifUuzfomaDOUKaSS+dvjKmJFEmlgB1L+5W
 xo2XSgA3y8hP50TS3loUKhWUo16l
X-Google-Smtp-Source: ABdhPJwUYUXjvDXlV31z+R34p/m+C65GOBOQkRYA441jKLMK4TMpqBAcVlSV+wjqdlHQBKqRDAxlrA==
X-Received: by 2002:adf:82cf:: with SMTP id 73mr5140593wrc.382.1591720124539; 
 Tue, 09 Jun 2020 09:28:44 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 23sm3643598wmo.18.2020.06.09.09.28.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 09:28:44 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 07/20] target/mips: fpu: Remove now unused macro FLOAT_BINOP
Date: Tue,  9 Jun 2020 18:28:25 +0200
Message-Id: <1591720118-7378-8-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591720118-7378-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1591720118-7378-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wr1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.qemu.devel@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After demacroing <ADD|SUB|MUL|DIV>.<D|S|PS>, this macro is not
needed anymore.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200518200920.17344-6-aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 2759c99..a3a3968 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1170,45 +1170,6 @@ FLOAT_CLASS(class_d, 64)
 #undef FLOAT_CLASS
 
 /* binary operations */
-#define FLOAT_BINOP(name)                                          \
-uint64_t helper_float_ ## name ## _d(CPUMIPSState *env,            \
-                                     uint64_t fdt0, uint64_t fdt1) \
-{                                                                  \
-    uint64_t dt2;                                                  \
-                                                                   \
-    dt2 = float64_ ## name(fdt0, fdt1, &env->active_fpu.fp_status);\
-    update_fcr31(env, GETPC());                                    \
-    return dt2;                                                    \
-}                                                                  \
-                                                                   \
-uint32_t helper_float_ ## name ## _s(CPUMIPSState *env,            \
-                                     uint32_t fst0, uint32_t fst1) \
-{                                                                  \
-    uint32_t wt2;                                                  \
-                                                                   \
-    wt2 = float32_ ## name(fst0, fst1, &env->active_fpu.fp_status);\
-    update_fcr31(env, GETPC());                                    \
-    return wt2;                                                    \
-}                                                                  \
-                                                                   \
-uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,           \
-                                      uint64_t fdt0,               \
-                                      uint64_t fdt1)               \
-{                                                                  \
-    uint32_t fst0 = fdt0 & 0XFFFFFFFF;                             \
-    uint32_t fsth0 = fdt0 >> 32;                                   \
-    uint32_t fst1 = fdt1 & 0XFFFFFFFF;                             \
-    uint32_t fsth1 = fdt1 >> 32;                                   \
-    uint32_t wt2;                                                  \
-    uint32_t wth2;                                                 \
-                                                                   \
-    wt2 = float32_ ## name(fst0, fst1, &env->active_fpu.fp_status);     \
-    wth2 = float32_ ## name(fsth0, fsth1, &env->active_fpu.fp_status);  \
-    update_fcr31(env, GETPC());                                    \
-    return ((uint64_t)wth2 << 32) | wt2;                           \
-}
-
-#undef FLOAT_BINOP
 
 uint64_t helper_float_add_d(CPUMIPSState *env,
                             uint64_t fdt0, uint64_t fdt1)
-- 
2.7.4


